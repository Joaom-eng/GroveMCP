local md = dofile(arg[1] or 'moonloader/lib/mcp_chat_markdown.lua')
local function plain(lines)
    local output = {}
    for _, line in ipairs(lines) do
        local parts = {}
        for _, part in ipairs(line) do parts[#parts+1] = part.text end
        output[#output+1] = table.concat(parts)
    end
    return table.concat(output,'\n')
end
local parsed = md.parse('Vida do CJ: **100**.')
assert(plain(parsed) == 'Vida do CJ: 100.')
assert(parsed[1][2].style == 'strong' and parsed[1][2].text == '100')
assert(plain(md.parse('**aberto e `incompleto')) == '**aberto e `incompleto')
assert(plain(md.parse('`**literal**` e \\*asterisco\\*')) == '**literal** e *asterisco*')
assert(plain(md.parse('# Título\n- item\n1. outro')) == 'Título\n• item\n1. outro')
assert(plain(md.parse('```lua\n  a = "**literal**"\n\n```\nfim')) == '  a = "**literal**"\n\nfim')
assert(plain(md.parse('```lua\nx = 1')) == 'x = 1')
local function chars(s)
    local _, n = s:gsub('[^\128-\191]', '')
    return n
end
local rows = md.layout(md.parse('ação **100**.'), 5, chars)
assert(plain(rows) == 'ação \n100.', plain(rows))
assert(plain(md.layout(md.parse('áéíóú'), 2, chars)) == 'áé\níó\nú')
assert(plain(md.layout(md.parse('100% do CJ\n\nfim'), 100, chars)) == '100% do CJ\n\nfim')

-- Exercise the drawing contract with the installed ImGui method signatures.
local drawn, measured = {}, 0
local fake = {Col = {Text = 1}}
function fake.ImVec2(x,y) return {x=x,y=y} end
function fake.ImVec4(...) return {...} end
function fake.GetContentRegionAvail() return {x=100} end
function fake.GetTextLineHeight() return 14 end
function fake.GetCursorScreenPos() return {x=0,y=0} end
function fake.GetStyleColorVec4(c) return {1,1,1,1} end
function fake.GetColorU32(c)
    assert(type(c) == 'table', 'Pass color vectors: numeric enum can select packed-color overload')
    return c
end
function fake.CalcTextSize(s) measured=measured+1; return {x=chars(s)} end
function fake.GetWindowDrawList()
    return {AddText=function(_, pos, color, text) drawn[#drawn+1]=text end}
end
function fake.Dummy(size) assert(size.y >= 14) end
local cache = md.draw(fake, 'Vida: **100%**.', nil)
assert(not table.concat(drawn):find('**',1,true))
assert(table.concat(drawn):find('100%',1,true))
local reused = md.draw(fake, 'Vida: **100%**.', cache)
assert(reused == cache)
print('Markdown parser, UTF-8 wrapping, code literals and drawing contract: OK')
