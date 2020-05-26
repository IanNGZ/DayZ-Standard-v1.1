
-- SCOREBOARD
shownText = {}
 
    shownText["name"] = "Name"
    shownText["murders"] = "Murders"
    shownText["zombieskilled"] = "Zombies killed:"
    shownText["alivetime"] = "Alivetime"
    shownText["headshots"] =  "Headshots"
    shownText["blood"] =  "Blood"
    shownText["temperature"] =  "Temperature"
    shownText["humanity"] =  "Humanity"
    shownText["banditskilled"] =  "Bandits killed:"
    shownText["players"] =  "Players:"


gameplayVariables = {}

-- PING CHECK    

    gameplayVariables["ping"] = 600 -- Checks if ping is over the set amount. DEFAULT: 600
    
-- ZOMBIE DAMAGE
    gameplayVariables["zombiedamage"] = math.random(400,900) -- Damage done by zombies - DEFAULT: math.random(400,900), for consistent damage, remove math.random(400,900) and insert value (EXAMPLE: 1000)
    
    gameplayVariables["enablenight"] = false -- Whether or not the night should be darker - DEFAULT: true - SET TO false to disable - remember you need to set it in editor_server.lua too.
    
addCommandHandler( "a", function ()
    getLocalPlayer()
    setElementPosition( getLocalPlayer(), -1397.3450927734, -105.20162200928, 14.1484375)
    -- body
end)
