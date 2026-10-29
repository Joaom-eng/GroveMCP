-- Small, passive Markdown renderer for the installed MoonImGui API.
-- Code remains text: no evaluation, HTML rendering or URL execution.
local M = {}

local function push(spans, text, style)
    if text == '' then return end
    local previous = spans[#spans]
    if previous and previous.style == style then previous.text = previous.text .. text
    else spans[#spans + 1] = {text = text, style = style} end
end

local function inline(text, spans, base)
    local i = 1
    while i <= #text do
        local c, pair = text:sub(i,i), text:sub(i,i+1)
        if c == '\\' and text:sub(i+1,i+1):match('[*_`\\]') then
            push(spans, text:sub(i+1,i+1), base); i = i + 2
        elseif c == '`' or pair == '**' or pair == '__' then
            local marker = c == '`' and '`' or pair
            local finish = text:find(marker, i + #marker, true)
            if finish and finish > i + #marker then
                local content = text:sub(i + #marker, finish - 1)
                if marker == '`' then push(spans, content, 'code')
                else inline(content, spans, 'strong') end
                i = finish + #marker
            else push(spans, marker, base); i = i + #marker end
        else
            push(spans, c, base); i = i + 1
        end
    end
end

function M.parse(text)
    local lines, fence = {}, nil
    text = tostring(text):gsub('\r\n','\n'):gsub('\r','\n')
    for line in (text .. '\n'):gmatch('(.-)\n') do
        local marker = line:match('^%s*(```+)') or line:match('^%s*(~~~+)')
        if fence then
            if marker and marker:sub(1,1) == fence:sub(1,1) and #marker >= #fence
                and line:match('^%s*' .. marker .. '%s*$') then fence = nil
            else lines[#lines+1] = {{text = line, style = 'code'}} end
        elseif marker then fence = marker
        else
            local spans, base = {}, 'normal'
            local heading = line:match('^%s*#+%s+(.+)$')
            if heading then line, base = heading, 'heading'
            else line = line:gsub('^(%s*)[-*+]%s+', '%1• ') end
            inline(line, spans, base)
            lines[#lines+1] = spans
        end
    end
    return lines
end

local function characters(text)
    local i = 1
    return function()
        if i > #text then return end
        local b = text:byte(i)
        local size = b < 128 and 1 or b < 224 and 2 or b < 240 and 3 or 4
        local char = text:sub(i, i + size - 1)
        i = i + size
        return char
    end
end

-- Build visual rows once per text/width. A word can cross style boundaries,
-- so punctuation after **100** stays with the number when wrapping.
function M.layout(lines, width, measure)
    local rows, row, used = {}, {}, 0
    width = math.max(1, width)
    local function newline()
        rows[#rows+1] = row; row, used = {}, 0
    end
    local function emit(text, style, size)
        push(row, text, style); used = used + size
    end
    for _, spans in ipairs(lines) do
        local groups, group, whitespace = {}, {}, nil
        for _, span in ipairs(spans) do
            for char in characters(span.text) do
                local space = char:match('%s') ~= nil
                if whitespace ~= nil and space ~= whitespace then
                    groups[#groups+1] = {parts = group, space = whitespace}; group = {}
                end
                whitespace = space
                push(group, char == '\t' and '    ' or char, span.style)
            end
        end
        if #group > 0 then groups[#groups+1] = {parts = group, space = whitespace} end
        for _, word in ipairs(groups) do
            local size = 0
            for _, part in ipairs(word.parts) do size = size + measure(part.text) end
            if used > 0 and used + size > width then newline() end
            -- Skip a space that itself overflowed, but preserve code indentation.
            if not (word.space and used == 0 and size > width) then
                for _, part in ipairs(word.parts) do
                    if size <= width then emit(part.text, part.style, measure(part.text))
                    else
                        for char in characters(part.text) do
                            local charWidth = measure(char)
                            if used > 0 and used + charWidth > width then newline() end
                            emit(char, part.style, charWidth)
                        end
                    end
                end
            end
        end
        newline()
    end
    return rows
end

function M.draw(imgui, text, cached)
    local width = math.max(1, imgui.GetContentRegionAvail().x)
    local height = imgui.GetTextLineHeight()
    if not cached or cached.text ~= text or cached.width ~= width or cached.height ~= height then
        cached = {text = text, width = width, height = height,
            rows = M.layout(M.parse(text), width, function(s) return imgui.CalcTextSize(s).x end)}
    end
    local origin, draw = imgui.GetCursorScreenPos(), imgui.GetWindowDrawList()
    local colors = {
        -- MoonImGui can resolve a numeric enum as the packed-color overload,
        -- making Col.Text (0) fully transparent. Pass an explicit color vector.
        normal = imgui.GetColorU32(imgui.GetStyleColorVec4(imgui.Col.Text)),
        strong = imgui.GetColorU32(imgui.ImVec4(.65,.9,1,1)),
        heading = imgui.GetColorU32(imgui.ImVec4(.65,.9,1,1)),
        code = imgui.GetColorU32(imgui.ImVec4(1,.84,.5,1))
    }
    local advance = height + 2
    for index, row in ipairs(cached.rows) do
        local x, y = origin.x, origin.y + (index-1)*advance
        for _, part in ipairs(row) do
            local color = colors[part.style] or colors.normal
            draw:AddText(imgui.ImVec2(x,y), color, part.text)
            if part.style == 'strong' or part.style == 'heading' then
                draw:AddText(imgui.ImVec2(x+.45,y), color, part.text)
            end
            x = x + imgui.CalcTextSize(part.text).x
        end
    end
    imgui.Dummy(imgui.ImVec2(width, math.max(height, #cached.rows*advance)))
    return cached
end

return M
