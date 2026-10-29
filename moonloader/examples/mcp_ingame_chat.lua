--[[ GroveMCP licensing notices

MIT License

Copyright (c) 2026 GroveMCP contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

]]

script_name('MCP In-game Chat Experimental')
script_author('McpServer project')
script_description('F7 opens a dedicated local Codex session through an ImGui chat panel.')
script_properties('work-in-pause')

local imgui, bit = require 'imgui', require 'bit'
local markdown = require 'mcp_chat_markdown'
local messageLayout = setmetatable({}, {__mode = 'k'})
local ffi = require 'ffi'
ffi.cdef[[uint32_t __stdcall GetTickCount(void);]]
local visible = imgui.ImBool(false)
local input = imgui.ImBuffer('', 4096)
local history, pending, action = {}, nil, nil
local mailbox, counter, status, errorText = nil, 0, {}, nil
local usage = {}
local focus, scroll, lastRead = false, false, 0
local closed = false
local function clock() return tonumber(ffi.C.GetTickCount()) end
local function readJson(path)
    local file = io.open(path, 'rb')
    if not file then return nil end
    local text = file:read(262145); file:close()
    if not text or #text > 262144 then return nil end
    local ok, value = pcall(decodeJson, text)
    if ok and type(value) == 'table' then return value end
end
local function append(role, text)
    history[#history + 1] = {role = role, text = tostring(text):sub(1,32000)}
    while #history > 24 do table.remove(history, 1) end
    scroll = true
end
local function saveUI()
    local state = {history = history, pending = pending}
    local encoded = encodeJson(state)
    while #encoded > 160000 and #history > 2 do
        table.remove(history,1); encoded = encodeJson(state)
    end
    local file = io.open(mailbox .. '/ui_state.json', 'wb')
    if file then file:write(encoded); file:close() end
end
local function online()
    return type(status.heartbeat) == 'number' and math.abs(os.time() - status.heartbeat) <= 6
end
local function submit(text)
    if pending then errorText = 'Aguarde a resposta atual ou cancele.'; return end
    if not online() then errorText = 'Relay local desconectado. A mensagem não foi enviada.'; return end
    text = text:match('^%s*(.-)%s*$')
    if text == '' then return end
    if #text > 4095 then errorText = 'Mensagem muito longa (máximo 4095 bytes).'; return end
    counter = counter + 1
    local id = string.format('%u_%d_%d', clock(), thisScript().id, counter)
    local destination = mailbox .. '/requests/' .. id .. '.json'
    local temporary = destination .. '.tmp'
    local file, err = io.open(temporary, 'wb')
    if not file then errorText = tostring(err); return end
    local ok = file:write(encodeJson({id = id, text = text, created_at = os.time()}))
    file:close()
    if not ok then os.remove(temporary); errorText = 'Falha ao gravar mensagem.'; return end
    local renamed, renameError = os.rename(temporary, destination)
    if not renamed then errorText = tostring(renameError); return end
    pending, errorText = id, nil
    append('Você', text)
    input.v = ''
    saveUI()
end

imgui.ShowCursor = true
imgui.LockPlayer = true
imgui.DisableInput = false
imgui.RenderInMenu = false
local flags = bit.bor(imgui.WindowFlags.NoCollapse, imgui.WindowFlags.NoSavedSettings)
local function textWrapped(text)
    imgui.PushTextWrapPos(0)
    imgui.TextUnformatted(text)
    imgui.PopTextWrapPos()
end
local function usageBar(key, title, width)
    local window = usage.windows and usage.windows[key]
    local used = type(window) == 'table' and tonumber(window.used_percent) or nil
    local stale = usage.state ~= 'ok' or not usage.updated_at or os.time() - usage.updated_at > 180
    local label = title .. ': indisponível'
    if used then label = string.format('%s: %.0f%% usado%s', title, used, stale and ' *' or '') end
    imgui.ProgressBar(used and math.max(0, math.min(1, used/100)) or 0, imgui.ImVec2(width,18), label)
    if imgui.IsItemHovered() then
        imgui.BeginTooltip()
        imgui.TextUnformatted('Uso da conta inteira. Atualização a cada 60 segundos.')
        if stale and used then imgui.TextUnformatted('* Último valor conhecido; atualização indisponível ou antiga.') end
        if usage.updated_at then
            imgui.TextUnformatted('Consultado: ' .. os.date('%d/%m %H:%M:%S', usage.updated_at))
        end
        if type(window) == 'table' and window.resets_at then
            imgui.TextUnformatted('Renova: ' .. os.date('%d/%m %H:%M', window.resets_at))
        end
        imgui.EndTooltip()
    end
end
function imgui.BeforeDrawFrame()
    -- Fullscreen GTA can hide the Windows cursor even while mouse input works.
    -- Draw it in ImGui's own final overlay instead of relying on the OS cursor.
    imgui.GetIO().MouseDrawCursor = true
end
function imgui.OnDrawFrame()
    if not visible.v then return end
    local w,h = getScreenResolution()
    imgui.SetNextWindowSize(imgui.ImVec2(math.min(680,w-40), math.min(510,h-50)), imgui.Cond.FirstUseEver)
    imgui.SetNextWindowPos(imgui.ImVec2(w/2,h/2), imgui.Cond.FirstUseEver, imgui.ImVec2(.5,.5))
    imgui.Begin('MCP Chat experimental — F7', visible, flags)
    imgui.TextColored(online() and imgui.ImVec4(.4,1,.6,1) or imgui.ImVec4(1,.5,.4,1),
        online() and 'Codex local conectado' or 'Relay desconectado')
    textWrapped('Sessão própria do Codex, com o MCP do GTA. Este painel não envia para o chat do desktop.')
    if status.model then imgui.TextUnformatted('Modelo: ' .. status.model) end
    local barWidth = math.max(1, (imgui.GetContentRegionAvail().x - 10)/2)
    usageBar('five_hour', '5h', barWidth)
    imgui.SameLine(0,10)
    usageBar('weekly', 'Semanal', barWidth)
    imgui.Separator()
    imgui.BeginChild('history', imgui.ImVec2(0,-115), true)
    if #history == 0 then
        textWrapped('Digite, por exemplo: "Qual é a vida atual do CJ? Consulte o jogo pelo MCP."')
    end
    for _, message in ipairs(history) do
        imgui.TextColored(message.role == 'Você' and imgui.ImVec4(.6,.85,1,1) or imgui.ImVec4(.6,1,.7,1), message.role)
        if message.role == 'Codex' then
            messageLayout[message] = markdown.draw(imgui, message.text, messageLayout[message])
        else textWrapped(message.text) end
        imgui.Separator()
    end
    if scroll then imgui.SetScrollHere(1); scroll = false end
    imgui.EndChild()
    if pending then textWrapped(status.detail or 'Aguardando resposta...') end
    if errorText then imgui.TextColored(imgui.ImVec4(1,.5,.4,1), errorText) end
    if focus then imgui.SetKeyboardFocusHere(); focus = false end
    local enter = imgui.InputText('##message', input, imgui.InputTextFlags.EnterReturnsTrue)
    imgui.SameLine()
    if imgui.Button('Enviar') or enter then action = {kind = 'send', text = tostring(input.v)}; focus = true end
    if pending then
        imgui.SameLine()
        if imgui.Button('Cancelar') then action = {kind = 'cancel'} end
    end
    imgui.End()
end
function onExitScript()
    closed = true
    imgui.Process = false
    visible.v = false
    -- MoonImGui's cursor thread normally restores this after Process turns off;
    -- also release explicitly because the Lua state itself is now unloading.
    showCursor(false, true)
end
function main()
    local game = getWorkingDirectory():gsub('[/\\]moonloader[/\\]?$', '')
    mailbox = game .. '/mcp_scripts/chat'
    createDirectory(mailbox)
    createDirectory(mailbox .. '/requests')
    createDirectory(mailbox .. '/responses')
    local saved = readJson(mailbox .. '/ui_state.json')
    if saved then
        if type(saved.history) == 'table' then history = saved.history end
        if type(saved.pending) == 'string' and saved.pending:match('^[%w_-]+$') then pending = saved.pending end
    end
    print('MCP In-game Chat: ready; F7 opens the panel. Dedicated Codex session.')
    printStringNow('~g~MCP Chat experimental pronto.~n~~w~F7 abre o painel.', 6000)
    while not closed do
        wait(0)
        if isKeyJustPressed(0x76) and not isPauseMenuActive() then
            visible.v = not visible.v; focus = visible.v
        end
        imgui.Process = visible.v
        if action then
            local request = action; action = nil
            if request.kind == 'send' then submit(request.text)
            elseif request.kind == 'cancel' and pending then
                local file = io.open(mailbox .. '/cancel_' .. pending, 'wb')
                if file then file:close() end
            end
        end
        if (clock() - lastRead) % 4294967296 >= 250 then
            lastRead = clock()
            status = readJson(mailbox .. '/status.json') or {}
            usage = readJson(mailbox .. '/usage.json') or {}
            if pending then
                local response = readJson(mailbox .. '/responses/' .. pending .. '.json')
                if response and response.id == pending and response.state ~= 'running' then
                    if response.state == 'done' then append('Codex', response.text or '')
                    else append('Sistema', response.detail or response.state) end
                    pending = nil
                    saveUI()
                    if not visible.v then printStringNow('~g~MCP Chat: resposta recebida. F7 para ler.', 4000) end
                end
            end
        end
    end
end
