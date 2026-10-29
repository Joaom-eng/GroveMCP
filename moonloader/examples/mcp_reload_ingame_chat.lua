script_name('MCP Reload In-game Chat')
script_properties('work-in-pause')

function main()
    wait(250)
    local panel = script.find('MCP In-game Chat Experimental')
    if panel then panel:reload() end
end
