function getThisFunction()
    return debug.getinfo(2, "f").func
end

function createLobbyGui(missionName)
    local gui = {}
    gui.window = guiCreateWindow(0.25, 0.25, 0.5, 0.5, " ", true)
    
    gui.message = guiCreateEdit(0.027, 0.8, 0.65, 0.1, "", true, gui.window)
    
    gui.messages = guiCreateGridList(0.027, 0.1, 0.65, 0.65, true, gui.window)
    guiGridListAddColumn(gui.messages, "Mensagens", 0.93)
    
    gui.playerList = guiCreateGridList(0.7, 0.1, 0.27, 0.8, true, gui.window)
    guiGridListAddColumn(gui.playerList, "Players", 0.93)
    
    addEvent(missionName, true)
    addEventHandler(missionName, localPlayer, function(data)
        if data.type == "message" and data.message then
            local totalMessages = guiGridListGetRowCount(gui.messages)
            if totalMessages + 1 > 17 then
                guiGridListRemoveRow(gui.messages, 0)
            end
            guiGridListAddRow(gui.messages, data.message)
        end
    end)

    return gui
end

local gui = createLobbyGui("corrida")