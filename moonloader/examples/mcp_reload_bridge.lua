script_name('MCP Reload Bridge')
script_properties('work-in-pause')

function main()
    -- Give the worker time to acknowledge this maintenance script first.
    wait(250)
    local worker = script.find('MCP Bridge')
    if worker ~= nil then
        worker:reload()
        print('MCP Reload Bridge: requested worker reload.')
    else
        print('MCP Reload Bridge: worker not found.')
    end
end
