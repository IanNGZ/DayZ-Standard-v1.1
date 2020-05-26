--[[
#---------------------------------------------------------------#
----*            DayZ MTA Script jq_client.lua                *----
----* This Script is owned by Marwin, you are not allowed to use or own it.
----* Owner: Marwin W., Germany, Lower Saxony, Otterndorf
----* Skype: xxmavxx96
----*                                                        *----
#---------------------------------------------------------------#
]]

theTexts = {}
theTextTimer = {}
function startRollMessage(text, r, g, b)
    if #theTexts == 4 then
        destroyTextItem()
    end
    table.insert(theTexts,{text,r,g,b})
    checkTimers()
end
addEvent("onRollMessageStart", true)
addEventHandler("onRollMessageStart", getLocalPlayer(), startRollMessage)

function startRollMessage2(head,text, r, g, b)
    if #theTexts == 4 then
        destroyTextItem()
    end
    table.insert(theTexts,{text,r,g,b})
    checkTimers()
end
addEvent("displayClientInfo", true)
addEventHandler("displayClientInfo", getLocalPlayer(), startRollMessage2)

function destroyTextItem ()
    table.remove(theTexts,1)
end

function checkTimers ()
    if isTimer(theTextTimer["destroy"]) then
        killTimer(theTextTimer["destroy"])
    end
    theTextTimer["destroy"] = setTimer(destroyTextItem,4000,4)
end

--Draw Part
local screenWidth, screenHeight = guiGetScreenSize()
local boxSpace = dxGetFontHeight(1,"default-bold")+dxGetFontHeight(1,"default-bold")*0.3

addEventHandler("onClientRender", getRootElement(), 
    function()
		if getElementData(localPlayer,"logedin") == true then
        for id, value in pairs(theTexts) do
                if #theTexts == 4 or #theTexts == 2 then
                    r2,g2,b2 = 19,19,19
                    if id == 1 or id == 3 then
                        r2,g2,b2 = 55,55,55
                    end
                elseif #theTexts == 3 or #theTexts == 1 then
                    r2,g2,b2 = 55,55,55
                    if id == 1 or id == 3 then
                        r2,g2,b2 = 19,19,19
                    end
                end
                if type(value[1]) == "string" then
                    dxDrawColorText(string.gsub(value[1], "#%x%x%x%x%x%x", ""), screenWidth*0.3, screenHeight-id*boxSpace, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(0, 0, 0, 255), 1, "default-bold", "left", "left")
                    dxDrawColorText(string.gsub(value[1], "#%x%x%x%x%x%x", ""), screenWidth*0.3, screenHeight-id*boxSpace, screenWidth*0.7, screenHeight-(id-1)*boxSpace, tocolor(value[2], value[3], value[4], id == #theTexts and 240 or 140), 1, "default-bold", "left", "left")
                end
        end
    end
end
)

addCommandHandler("pos", function()
    player = getLocalPlayer();
    local x,y,z = getElementPosition(player)
    outputChatBox(x .. ", " .. y .. ", " .. z )
end)

function killz() 
    player = getLocalPlayer()
    setElementData(player, "blood", -100)  
 end  
 addCommandHandler("kill", killz) 

