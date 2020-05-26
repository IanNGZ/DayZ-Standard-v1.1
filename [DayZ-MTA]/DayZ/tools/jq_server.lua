local root = getRootElement()
 
addEventHandler("onPlayerLogin", root,
    function()
        triggerClientEvent ( "onRollMessageStart", getRootElement(), getPlayerName(source).." #FFA500está logado!",255,255,255, "join")
    end
)