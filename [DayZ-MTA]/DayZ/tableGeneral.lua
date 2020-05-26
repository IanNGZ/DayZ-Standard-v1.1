--Inventario-------------------------------------------
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------

inventoryItems = {
["Weapons"] = {
["Primary Weapon"] = {
	--Item, spaceOccupedOnInventory
    {"Ak-47",3},
    {"G36-KV",3},
    {"M4A1",3},
    {"AWP",3},
    {"Sawn-Off-Shotgun",3},
    {"Lee-Enfield",3},
    --{"Heat-Seeking RPG",5},
    --{"M136 Rocket Launcher",5},
},

["Secondary Weapon"] = {
    {"M1911",2},
    {"M9-SD",2},
    {"Desert-Eagle",2},
    {"PDW",3},
    {"Winchester-1866",2},
    {"Sawn-Off-Shotgun",1},
    {"SPAZ-12-Combat-Shotgun",2},
    {"Satchel",2},
    {"Hunting-Knife",2},
    {"Hatchet",2},
    {"Golf-Club",2},
    {"Baseball-Bat",2},
},

["Specially Weapon"] = {
    {"Parachute",1},
    {"Tear Gas",1},
    {"Grenade",1},
    {"Binoculars",1}
},

},
["Ammo"] = {
    {'4,5 mm',0.025}, 
    {'5,56 mm',0.085},
    {'7,62 mm',0.090},
    {'9,19 mm',0.085},
    {'11.5 mm',0.085},
    {'22,2 mm',0.1},
    --{"M136 Rocket",2},
},


["Food"] = {
{"Water Bottle",1},
{"Pasta Can",1},
{"Beans Can",1},
{"Burger",1},
{"Pizza",1},
{"Soda Bottle",1},
{"Milk",1},
{"Cooked Meat",1},
},

["Items"] = {
{"Wood Pile",2},
{"Bandage",1,"Bandage yourself"},
{"Roadflare",1,"Place"},
{"Empty Gas Canister",2},
{"Full Gas Canister",2},
{"Medic Kit",2,"Use"},
{"Heat Pack",1,"Use"},
{"Painkiller",1,"Use"},
{"Morphine",1,"Use"},
{"Blood Bag",1,"Blood Bag"},
{"Blood Bag (Empty)",1,"Blood Bag (Empty)"},
{"Transfusion Kit",1,"Transfusion"},
{"Wire Fence",1,"Build a wire fence"},
{"Raw Meat",1},
{"Tire",2},
{"Engine",5},
{"Tank Parts",3},
{"Tent",3,"Pitch a tent"},
{"Armadilha de Urso",1,"Colocar armadilha"},
{"Ghillie Suit",1,"Put clothes on"},
{"Female Standart",1,"Put clothes on"},
{"Survivor Clothing",1,"Put clothes on"},
{"Survivor Clothing(Medic)",1,"Put clothes on"},
{"Survivor Clothing(Military)",1,"Put clothes on"},
{"Survivor Clothing(Green)",1,"Put clothes on"},
{"Survivor Clothing(Purple)",1,"Put clothes on"},
{"Jill Clothing",1,"Put clothes on"},
{"Jill Army",1,"Put clothes on"},
{"Bandit[F]",1,"Put clothes on"},
{"Bandit[F]II",1,"Put clothes on"},
{"Bandit[F]III",1,"Put clothes on"},
{"Female Militar",1,"Put clothes on"},
{"Rebel[F]",1,"Put clothes on"},
{"Empty Water Bottle",1,"Fill bottle up"}, 
{"Empty Soda Cans",1},
{"Scruffy Burgers",1},
{"Assault Pack (ACU)",1},
{"Alice Pack",1},
{"Czech Backpack",1},
{"Coyote Backpack",1},
{"Mountain Backpack",1},
--{"Drybag(Yellow)",1},
},

["Toolbelt"] = {
{"Night Vision Goggles",1},
{"Infrared Goggles",1},
{"Map",1},
{"Box of Matches",1,"Make a Fire"},
{"Watch",1},
{"GPS",1},
{"Toolbox",1},
{"Radio Device",1},
},
}


--Player-------------------------------------------
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------

spawnPositions = {

{2641.92578125,-1483.3525390625,843.6318359375},
{1693.166015625,-1367.2060546875,1480.5087890625},
{482.2216796875,-1748.2822265625,789.9482421875},
{-2074.9130859375,-2213.6337890625,1147.3984375},
{-2814.3427734375,-633.0986328125,1061.2663574219},
{-2477.1982421875,1014.876953125,1402.7299804688},
{-2463.78125,2594.626953125,867.08312988281},
{-1753.58203125,2145.451171875,717.24426269531},
{-298.10546875,971.0703125,854.58544921875},
{38.0078125,2761.0322265625,1599.6186523438},
{1607.2470703125,2319.2529296875,1200.2548828125},
{2443.173828125,1626.2451171875,1242.1044921875},
{2673.6513671875,773.5029296875,1144.5377197266},
{2576.408203125,-41.1181640625,1046.85546875},
}

 playerDataTable = {
{"alivetime"},
{"skin"},
{"MAX_Slots"},
{"bandit"},
{"blood"},
{"Jill Army"},
{"food"},
{"thirst"},
{"temperature"},
{"currentweapon_1"},
{"currentweapon_2"},
{"currentweapon_3"},
{"bleeding"},
{"brokenbone"},
{"pain"},
{"Jill Clothing"},
{"cold"},
{"infection"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},
{"Wood Pile"},
{"Bandage"},
{"Water Bottle"},
{"Pasta Can"},
{"Beans Can"},
{"Burger"},
{"Box of Matches"},
{"Survivor Clothing(Medic)"},
{"Blood Bag"},
{"Blood Bag (Empty)"},
{"Transfusion Kit"},
{"Survivor Clothing(Military)"},
{"Survivor Clothing(Green)"},
{"Rebel[F]"},
{"Bandit[F]"},
{"Bandit[F]II"},
{"Bandit[F]III"},
{"Female Militar"},
{"Survivor Clothing(Purple)"},
{"Female Standart"},
{"Pizza"},
{"Morphine"},
{"Soda Bottle"},
{"Empty Gas Canister"},
{"Full Gas Canister"},
{"Armadilha de Urso"},
{"Roadflare"},
{"Milk"},
{"Watch"},
{"Medic Kit"},
{"Heat Pack"},
--{"TEC-9"},
--{"M136 Rocket Launcher"},
{"Blood Bag"},
{"GPS"},
{"Mountain Backpack"},
{"Map"},
{"Toolbox"},
{"Wire Fence"},
{"Tire"},
{"Engine"},
{"Tank Parts"},
--{"M136 Rocket"},
--{"Heat-Seeking RPG"},
{"Infrared Goggles"},
{"Night Vision Goggles"},
{"Tent"},
{"Raw Meat"},
{"Cooked Meat"},
{"Ghillie Suit"},
{"Civilian Clothing"},
{"Survivor Clothing"},
{"Painkiller"},
{"Empty Water Bottle"},
{"Empty Soda Cans"},
{"Scruffy Burgers"},
{"Drybag(Yellow)"},


--weapons

{"Ak-47"},
{"G36-KV"},
{"M4A1"},
{"AWP"},
{"M1911"},
{"M9-SD"},
{"Desert-Eagle"},
{"PDW"},
{"Winchester-1866"},
{"Sawn-Off-Shotgun"},
{"SPAZ-12-Combat-Shotgun"},
{"Lee-Enfield"},

--other weapons
{"Parachute"},
{"Satchel"},
{"Tear-Gas"},
{"Grenade"},
{"Hunting-Knife"},
{"Hatchet"},
{"Binoculars"},
{"Baseball-Bat"},
{"Shovel"},
{"Golf-Club"},
{"Radio-Device"},

--ammo
{"4,5 mm"}, 
{"5,56 mm"},
{"7,62 mm"},
{"9,19 mm"},
{"11.5 mm"},
{"22,2 mm"},
}
--Vehicles-------------------------------------------
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
-- id,x,y,z
vehicleSpawns = {
    {522,-1387.9989013672, -108.2087020874, 14.1484375},

};
--model, tires, engine, tankparts, slots
local vehicleAddonsInfo = {
    {522, 2, 1, 1, 15},
	{475, 4, 1, 1, 35},
	{548, 3, 1, 1, 60},
    {471, 4, 1, 1, 35},
    {542, 4, 1, 1, 35},
	{506, 4, 1, 1, 35},
	{603, 4, 1, 1, 35},
	{463, 2, 1, 1, 20},
	{422, 4, 1, 1, 25},
	{522, 2, 1, 1, 20},
	{470, 4, 1, 1, 46},
	{593, 3, 1, 1, 35},
	{468, 2, 1, 1, 10},
	{433, 6, 1, 1, 70},
	{437, 6, 1, 1, 60},
	{509, 0, 0, 0, 0},
	{487, 0, 1, 1, 20},
	{497, 0, 1, 1, 20},
	{453, 0, 1, 1, 35},
};

local vehicleFuelInfo = {

    {522, 0.25},
    {471, 0.25},
	{548, 0.75},
	{603, 0.95},
	{506, 0.95},
	{542, 0.95},
	{463, 0.75},
	{475, 0.70},
	{422, 0.25},
	{522, 0.75},
	{593, 0.45},
	{470, 0.1},
	{468, 0.1},
	{433, 0.5},
	{437, 0.5},
	{509, 0  },
	{487, 0.25},
	{497, 0.25},
	{453, 0.1},
};
-- {Model ID, Max Fuel}
local vehicleFuelTable = {

    {522, 100},
	{422, 80},
	{548, 180},
	{471, 60},
	{542, 100},
	{603, 100},
	{463, 80},
	{506,100},
	{522, 80},
	{470, 100},
	{475,100},
	{468, 30},
	{593,100},
	{433, 140},
	{437, 140},
	{509, 0},
	{487, 60},
	{497, 60},
	{453, 60},
};

function getVehicleAddonInfos(id)
	for _,v in ipairs(vehicleAddonsInfo) do
		if (v[1] == id) then return v[2], v[3], v[4], v[5]; end
	end
end


function getVehicleMaxFuel(id)
	for _,v in ipairs(vehicleFuelTable) do
		if (id == v[1]) then return v[2]; end
	end
	return false;
end


function getVehicleFuelRemove(id)
	for _,v in ipairs(vehicleFuelInfo) do
		if (v[1] == id) then return v[2]; end
	end
end

function getVehicleMaxFuelLoot(loot)
    local modelID = getElementModel(getElementData(loot,"parent"))
    for i,vehicle in ipairs(vehicleFuelTable) do
        if modelID == vehicle[1] then
             return vehicle[2]
        end
    end
    return false
end
-- {Model ID, Tires, Engine, Tank Parts}
vehicleDataTable = {
    {"MAX_Slots"},
    {"Tire_inVehicle"},
    {"Engine_inVehicle"},
    {"Parts_inVehicle"},
    {"fuel"},
    {"Wood Pile"},
    {"Bandage"},
    {"Water Bottle"},
    {"Pasta Can"},
    {"Beans Can"},
    {"Burger"},
    {"Box of Matches"},
    {"Mountain Backpack"},
    {"Jill Army"},
    {"Armadilha de Urso"},
    {"Hunting Knife"},
    {"Morphine"},
    {"Pizza"},
    {"Soda Bottle"},
    {"Empty Gas Canister"},
    {"Full Gas Canister"},
    {"Roadflare"},
    {"Milk"},
    {"Watch"},
    {"Medic Kit"},
    {"Heat Pack"},
    {"Blood Bag"},
    {"GPS"},
    {"Bandit[F]"},
    {"Bandit[F]II"},
    {"Bandit[F]III"},
    {"Female Militar"},
    {"Blood Bag"},
    {"Blood Bag (Empty)"},
    {"Transfusion Kit"},
    {"Map"},
    {"Toolbox"},
    {"Wire Fence"},
    {"Tire"},
    {"Engine"},
    {"Tank Parts"},
    {"Infrared Goggles"},
    {"Night Vision Goggles"},
    {"Tent"},
    {"Raw Meat"},
    {"Cooked Meat"},
    {"Ghillie Suit"},
    {"Civilian Clothing"},
    {"Survivor Clothing"},
    {"Painkiller"},
    {"Binoculars"},
    {"Empty Water Bottle"},
    {"Empty Soda Cans"},
    {"Scruffy Burgers"},
    {"Assault Pack (ACU)"},
    {"Drybag(Yellow)"},
    {"Alice Pack"},
    {"Radio Device"},
    {"Coyote Backpack"},
    {"Czech Backpack"},

    --weapons
    {"Ak-47"},
    {"G36-KV"},
    {"M4A1"},
    {"AWP"},
    {"M1911"},
    {"M9-SD"},
    {"Desert-Eagle"},
    {"PDW"},
    {"Winchester-1866"},
    {"Sawn-Off-Shotgun"},
    {"SPAZ-12-Combat-Shotgun"},
    {"Lee-Enfield"},

    --other weapons
    {"Parachute"},
    {"Satchel"},
    {"Tear-Gas"},
    {"Grenade"},
    {"Hunting-Knife"},
    {"Hatchet"},
    {"Binoculars"},
    {"Baseball-Bat"},
    {"Shovel"},
    {"Golf-Club"},
    {"Radio-Device"},
}

backupItemsTable = {
	{"Bandage"},
	{"Painkiller"},
	{"Wood Pile"},
	{"Water Bottle"},
	{"Pasta Can"},
	{"Beans Can"},
	{"Burger"},
	{"Box of Matches"},


	{"Pizza"},
	{"Morphine"},
	{"Soda Bottle"},
	{"Empty Gas Canister"},
	{"Full Gas Canister"},
	{"Roadflare"},
	{"Milk"},
	{"Watch"},
	{"Medic Kit"},
	{"Heat Pack"},
	{"Blood Bag"},
	{"GPS"},
	{"Map"},
	{"Toolbox"},
	{"Wire Fence"},
	{"Tire"},
	{"Engine"},
	{"Satchel"},
	{"Infrared Goggles"},
	{"Night Vision Goggles"},
	{"Tent"},
	{"Raw Meat"},
	{"Cooked Meat"},
	{"Camouflage Clothing"},
	{"Ghillie Suit"},
	{"Civilian Clothing"},
	{"Survivor Clothing"},
	{"Empty Water Bottle"},
	{"Empty Soda Cans"},
	{"Scruffy Burgers"},
	{"Radio Device"},
	{"Tank Parts"},

    --weapons
    {"Ak-47"},
    {"G36-KV"},
    {"M4A1"},
    {"AWP"},
    {"M1911"},
    {"M9-SD"},
    {"Desert-Eagle"},
    {"PDW"},
    {"Winchester-1866"},
    {"Sawn-Off-Shotgun"},
    {"SPAZ-12-Combat-Shotgun"},
    {"Lee-Enfield"},

    --other weapons
    {"Parachute"},
    {"Satchel"},
    {"Tear-Gas"},
    {"Grenade"},
    {"Hunting-Knife"},
    {"Hatchet"},
    {"Binoculars"},
    {"Baseball-Bat"},
    {"Shovel"},
    {"Golf-Club"},
    {"Radio-Device"},
};
--Items-------------------------------------------
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
itemTable = {
----------------------
["farm"] = {
	-- Name, Model ID, Scale, RotX, Percent Chance to Appear
	{"Wood Pile",1463,0.4,0,13},
	{"Bandage",1578,0.5,0,4},
	{"Water Bottle",2683,1,0,6},
	{"Pasta Can",2770,1,0,6},
	{"Beans Can",2601,1,0,6},
	{"Burger",2768,1,0,6},
	{"Empty Soda Cans",2673,0.5,0,12},
	{"Scruffy Burgers",2675,0.5,0,12},
	{"Soda Bottle",2647,1,0,9},
	{"Tent",1512,1.5,0,0.001},
	{"Survivor Clothing(Medic)",1213,2,0,0.01},
	{"Survivor Clothing(Military)",1213,2,0,0.01},
	{"Survivor Clothing(Green)",1213,2,0,0.01},
	{"Survivor Clothing(Purple)",1213,2,0,0.01},
	{"Bandit[F]",1213,2,0,0.01},
	{"Bandit[F]II",1213,2,0,0.01},
	{"Bandit[F]III",1213,2,0,0.01},
	{"Female Militar",1213,2,0,0.01},
	{"Rebel[F]",1213,2,0,0.01},
	{"Empty Gas Canister",1650,1,0,10},
	{"Hunting Knife",335,1,90,4},
	{"Box of Matches",328,0.4,90,8},
	{"Jill Clothing",1213,2,0,0.01},
	{"Jill Army",1213,2,0,0.01},
	{"Morphine",1579,1,0,4},
	{"Painkiller",2709,3,0,3.5},
	{"Tire",1073,1,0,2},
	{"Tank Parts",1008,1,0.8,2},
	{"Map",1277,0.8,90,6},
	{"GPS",2976,0.15,0,2},

	--weapons
	{"Desert Eagle",348,1,90,0.2},
	{"M1911",346,1,90,4},
	{"Lee Enfield",357,1,90,0.3},
	{"Winchester-1866",349,1,90,0.3},
},
----------------------
["residential"] = {
	{"Box of Matches",328,0.4,90,5},
	{"Wood Pile",1463,0.4,0,5},
	{"Tent",1512,1.5,0,0.001},
	{"Survivor Clothing(Medic)",1213,2,0,0.01},
	{"Survivor Clothing(Military)",1213,2,0,0.01},
	{"Survivor Clothing(Green)",1213,2,0,0.01},
	{"Survivor Clothing(Purple)",1213,2,0,0.01},
	{"Jill Clothing",1213,2,0,0.01},
	{"Bandit[F]",1213,2,0,0.01},
	{"Bandit[F]II",1213,2,0,0.01},
	{"Bandit[F]III",1213,2,0,0.01},
	{"Jill Army",1213,2,0,0.01},
	{"Female Militar",1213,2,0,0.01},
	{"Rebel[F]",1213,2,0,0.01},
	{"Pizza",1582,1,0,7},
	{"Soda Bottle",2647,1,0,7},
	{"Empty Gas Canister",1650,1,0,9},
	{"Roadflare",324,1,90,9},
	{"Milk",2856,1,0,7},
	{"Assault Pack (ACU)",3026,1,0,6},
	{"Painkiller",2709,3,0,7},
	{"Empty Soda Cans",2673,0.5,0,12},
	{"Scruffy Burgers",2675,0.5,0,12},
	{"Watch",2710,1,0,3},
	{"Heat Pack",1576,5,0,6},
	{"Wire Fence",933,0.25,0,1},
	{"Alice Pack",1248,1,0,1.5},
	{"Tire",1073,1,0,1},
	{"Tank Parts",1008,0.8,0,1},
	{"Morphine",1579,1,0,2},
	{"Map",1277,0.8,90,10},
	{"GPS",2976,0.15,0,3},
	{"Pasta Can",2770,1,0,7},
	{"Beans Can",2601,1,0,7},
	{"Burger",2768,1,0,7},

	--weapons
	{"M1911",346,1,90,1.5},
	{"M9-SD",347,1,90,1.9},
	{"Winchester-1866",349,1,90,0.1},
	{"PDW",352,1,90,1},
	{"Hunting-Knife",335,1,90,3},
	{"Hatchet",339,1,90,1},
	{"Grenade",342,1,0,0.01},
	{"Desert Eagle",348,1,90,0.4},
	{"Sawn-Off Shotgun",350,1,90,0.3},
	{"SPAZ-12 Combat Shotgun",351,1,90,0.4},
	{"MP5A5",353,1,90,0.4},
	{"Lee-Enfield",357,1,90,0.3},
	{"Golf-Club",333,1,90,3},
	{"Baseball Bat",336,1,90,3},
	{"Shovel",337,1,90,3},
},
----------------------
["military"] = {
	{"Box of Matches",328,0.4,90,2},
	{"Drybag(Yellow)",1809,1,0,0.1},
	{"Tent",1512,1.5,0,0.001},
	{"Jill Clothing",1213,2,0,0.01},
	{"Mountain Backpack",1669,1,0,0.1},
	{"Jill Army",1213,2,0,0.01},
	{"Pizza",1582,1,0,2},
	{"Soda Bottle",2647,1,0,2},
	{"Empty Gas Canister",1650,1,0,4},
	{"Roadflare",324,1,90,4},
	{"Milk",2856,1,0,1},
	{"Painkiller",2709,3,0,4},
	{"Empty Soda Cans",2673,0.5,0,12},
	{"Survivor Clothing(Medic)",1213,2,0,0.01},
	{"Survivor Clothing(Military)",1213,2,0,0.01},
	{"Survivor Clothing(Green)",1213,2,0,0.01},
	{"Survivor Clothing(Purple)",1213,2,0,0.01},
	{"Bandit[F]",1213,2,0,0.01},
	{"Bandit[F]II",1213,2,0,0.01},
	{"Bandit[F]III",1213,2,0,0.01},
	{"Female Militar",1213,2,0,0.01},
	{"Rebel[F]",1213,2,0,0.01},
	{"Scruffy Burgers",2675,0.5,0,12},
	{"Watch",2710,1,0,4},
	{"Heat Pack",1576,5,0,3},
	{"Wire Fence",933,0.25,0,1},
	{"Alice Pack",1248,1,0,4},
	{"Night Vision Goggles",368,1,90,4},
	{"Binoculars",369,1,0,4},
	{"Tire",1073,1,0,2},
	{"Tank Parts",1008,0.8,0,2},
	{"Morphine",1579,1,0,4},
	{"GPS",2976,0.15,0,3},
	{"Map",1277,0.8,90,7},
	{"Toolbox",2969,0.5,0,1},
	{"Engine",929,0.3,0,2},
	{"Ghillie Suit",1213,2,0,0.3},
	{"Infrared Goggles",369,1,90,3},
	{"Assault Pack (ACU)",3026,1,0,5},
	{"Czech Backpack",1239,1,0,2}, 
	{"Radio Device",330,1,0,6},
	{"Coyote Backpack",1252,1,0,0.9},

	--weapons
	{"M1911",346,1,90,5},
	{"M9-SD",347,1,90,4},
	{"Winchester-1866",349,1,90,3},
	{"PDW",352,1,90,4},
	{"Hunting-Knife",335,1,90,2.4},
	{"Hatchet",339,1,90,2.1},
	{"Grenade",342,1,0,0.5},
	{"Sawn-Off-Shotgun",350,1,90,2.3},
	{"SPAZ-12-Combat-Shotgun",351,1,90,2.3},
	{"MP5A5",353,1,90,2.8},
	{"Lee-Enfield",357,1,90,3.5},
	{"Ak-47",2560,1,90,2.4},
	{"G36-KV",1899,1,90,2.4},
	{"M4A1",2402,1,90,2.4},
	{"AWP",1870,1,90,0.4},
	{"Shovel",337,1,90,1},
},
----------------------
["industrial"] = {
	{"Wire Fence",933,0.25,0,7},
	{"Toolbox",2969,0.5,0,3},
	{"Tire",1073,1,0,4},
	{"Engine",929,0.3,0,3.5},
	{"Tank Parts",1008,1,0.8,4},
	{"Water Bottle",2683,1,0,4},
	{"Pasta Can",2770,1,0,4},
	{"Beans Can",2601,1,0,4},
	{"Tent",1512,1.5,0,0.001},
	{"Burger",2768,1,0,4},
	{"Empty Soda Cans",2673,0.5,0,12},
	{"Scruffy Burgers",2675,0.5,0,10},
	{"Soda Bottle",2647,1,0,4},
	{"Empty Gas Canister",1650,1,0,6},
	{"Jill Army",1213,2,0,0.01},
	{"Full Gas Canister",1650,1,0,1.5},
	{"Jill Clothing",1213,2,0,0.01},
	{"Map",1277,0.8,90,3},
	{"Watch",2710,1,0,2},
	{"Box of Matches",328,0.4,90,5},
	{"Wood Pile",1463,0.4,0,2},
	{"Survivor Clothing(Medic)",1213,2,0,0.01},
	{"Survivor Clothing(Military)",1213,2,0,0.01},
	{"Survivor Clothing(Green)",1213,2,0,0.01},
	{"Survivor Clothing(Purple)",1213,2,0,0.01},
	{"Bandit[F]",1213,2,0,0.01},
	{"Bandit[F]II",1213,2,0,0.01},
	{"Bandit[F]III",1213,2,0,0.01},
	{"Female Militar",1213,2,0,0.01},
	{"Rebel[F]",1213,2,0,0.01},
	{"Pizza",1582,1,0,4},
	{"Roadflare",324,1,90,5},
	{"Milk",2856,1,0,4},
	{"Assault Pack (ACU)",3026,1,0,6},
	{"Coyote Backpack",1252,1,0,0.5},
	{"Radio Device",330,1,0,6},
	{"Night Vision Goggles",368,1,90,1.5},

	--weapons
	{"Winchester-1866",349,1,90,3},
	{"M1911",346,1,90,1.5},
	{"PDW",352,1,90,2},
	{"Hunting Knife",335,1,90,2},
	{"Hatchet",339,1,90,1.5},
	{"Golf-Club",333,1,90,1.5},
	{"Baseball-Bat",336,1,90,1.5},
	{"Shovel",337,1,90,1.5},
},
----------------------
["supermarket"] = {
	{"Raw Meat",2804,0.5,90,8},
	{"Box of Matches",328,0.4,90,5},
	{"Wood Pile",1463,0.4,0,5},
	{"Pizza",1582,1,0,7},
	{"Soda Bottle",2647,1,0,7},
	{"Empty Gas Canister",1650,1,0,5},
	{"Roadflare",324,1,90,6},
	{"Milk",2856,1,0,7},
	{"Assault Pack (ACU)",3026,1,0,6},
	{"Pasta Can",2770,1,0,7},
	{"Beans Can",2601,1,0,7},
	{"Jill Army",1213,2,0,0.01},
	{"Burger",2768,1,0,7},
	{"Painkiller",2709,3,0,7},
	{"Jill Clothing",1213,2,0,0.01},
	{"Tent",1512,1.5,0,0.001},
	{"Empty Soda Cans",2673,0.5,0,12},
	{"Survivor Clothing(Medic)",1213,2,0,0.01},
	{"Survivor Clothing(Military)",1213,2,0,0.01},
	{"Survivor Clothing(Green)",1213,2,0,0.01},
	{"Survivor Clothing(Purple)",1213,2,0,0.01},
	{"Bandit[F]",1213,2,0,0.01},
	{"Bandit[F]II",1213,2,0,0.01},
	{"Bandit[F]III",1213,2,0,0.01},
	{"Female Militar",1213,2,0,0.01},
	{"Rebel[F]",1213,2,0,0.01},
	{"Scruffy Burgers",2675,0.5,0,12},
	{"Watch",2710,1,0,3},
	{"Heat Pack",1576,5,0,6},
	{"Wire Fence",933,0.25,0,1},
	{"Alice Pack",1248,1,0,0.5},
	{"Tire",1073,1,0,1},
	{"Tank Parts",1008,1,0.8,2},
	{"Morphine",1579,1,0,2},
	{"Map",1277,0.8,90,4},
	{"GPS",2976,0.15,0,1},
	{"Radio Device",330,1,0,6},

	--weapons
	{"M1911",346,1,90,3.5},
	{"PDW",352,1,90,2},
	{"Hunting-Knife",335,1,90,3},
	{"Hatchet",339,1,90,2.1},
	{"MP5A5",353,1,90,0.5},
	{"Lee-Enfield",357,1,90,0.2},
	{"Golf-Club",333,1,90,1.9},
	{"Baseball-Bat",336,1,90,1.4},
	{"Shovel",337,1,90,0.3},
},
["other"] = {
    {"Raw Meat",2804,0.5,90},
    {"Cooked Meat",2806,0.5,90},
    {"Full Gas Canister",1650,1,0},
    {"Empty Water Bottle",2683,1,0},
    {"Survivor Clothing",1577,2,0},
    {"Night Vision Goggles",368,1,90},
    {"Infrared Goggles",369,1,90},
    {"Jill Clothing",1213,2,0,0.01},
    {"Jill Army",1213,2,0,0.01},
    {"Survivor Clothing(Medic)",1213,2,0,0.01},
    {"Survivor Clothing(Military)",1213,2,0,0.01},
    {"Survivor Clothing(Green)",1213,2,0,0.01},
    {"Survivor Clothing(Purple)",1213,2,0,0.01},
    {"Bandit[F]",1213,2,0,0.01},
    {"Bandit[F]II",1213,2,0,0.01},
    {"Bandit[F]III",1213,2,0,0.01},
    {"Female Militar",1213,2,0,0.01},
    {"Rebel[F]",1213,2,0,0.01},
    {"Box of Matches",328,0.4,90,5},
    {"Wood Pile",1463,0.4,0,5},
    {"Pizza",1582,1,0,7},
    {"Soda Bottle",2647,1,0,7},
    {"Empty Gas Canister",1650,1,0,5},
    {"Roadflare",324,1,90,6},
    {"Milk",2856,1,0,5},
    {"Assault Pack (ACU)",3026,1,0,6},
    {"Painkiller",2709,3,0,7},
    {"Empty Soda Cans",2673,0.5,0,12},
    {"Scruffy Burgers",2675,0.5,0,12},
    {"Watch",2710,1,0,3},
    {"Heat Pack",1576,5,0,6},
    {"Wire Fence",933,0.25,0,1},
    {"Alice Pack",1248,1,0,1.5},
    {"Coyote Backpack",1252,1,0,0.7},
    {"Tire",1073,1,0,1},
    {"Tank Parts",1008,1,0.8,4},
    {"Morphine",1579,1,0,2},
    {"Map",1277,0.8,90,4},
    {"Toolbox",2969,0.5,0,3},
    {"Engine",929,0.3,0,3.5},
    {"Water Bottle",2683,1,0,4},
    {"Binoculars",369,1,0,4},
    {"Ghillie Suit",1213,2,0,0.01},
    {"Heat-Seeking RPG",360,1,90,0},
    {"Bandage",1578,0.5,0,4},
    {"Pasta Can",2770,1,0,5},
    {"Beans Can",2601,1,0,6},
    {"Burger",2768,1,0,2},
    {"GPS",2976,0.15,0,1},
    {"Medic Kit",2891,2.2,0},
    {"Blood Bag",1580,1,0},
    {"Radio Device",2966,0.5,0,5},

    --weapons

    {"M1911",346,1,90,3.5},
    {"PDW",352,1,90,2},
    {"Hunting-Knife",335,1,90,2.5},
    {"Hatchet",339,1,90,1.8},
    {"MP5A5",353,1,90,1.5},
    {"Lee-Enfield",357,1,90,1.5},
    {"Winchester-1866",349,1,90,2},
    {"M9-SD",347,1,90,5},
    {"Grenade",342,1,0,0.5},
    {"Sawn-Off-Shotgun",350,1,90,2},
    {"SPAZ-12-Combat-Shotgun",351,1,90,1.9},
    {"Ak-47",2560,1,90,0.9},
    {"G36-KV",1899,1,90,0.9},
    {"M4A1",2402,1,90,0.9},
    {"AWP",1870,1,90,0.3},
    {"M1911",346,1,90,3},
    {"Desert-Eagle",348,1,90,3},
    {"Golf-Club",333,1,90,1.9},
    {"Baseball-Bat",336,1,90,1.4},
    {"Shovel",337,1,90,1.5},

    --ammo
    {"4,5 mm",2041,2,0},
    {"5,56 mm",1271,2,0},
    {"7,62 mm",1271,2,0},
    {"9,19 mm",3013,2,0},
    {"11.5 mm",2358,2,0},
    {"22,2 mm",2358,2,0},
    --{"M1911 Mag",3013,2,0}, --5,56 mm

    --{"Desert Eagle Mag",3013,2,0}, --11.5 mm
    --{"CZ 550 Mag",2358,2,0}, --7,62 mm
    --{"Lee Enfield Mag",2358,2,0}, --11.5 mm

    --{"MP5A5 Mag",2041,2,0}, --4,5 mm
    },
}

--MilitaryBox, HospitalPacks, Patrol Packs-------------------------------------------
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
MylitaryBox = {
{-1474.201171875,430.1845703125,7.1875},
{-1474.453125,390.53125,7.1875},
{-1473.5263671875,354.23046875,7.1875},
{1594.8056640625,-1678.2626953125,5.890625},
{2521.990234375,2512.064453125,10.8203125},
{2406.33984375,2542.603515625,21.875},
{-2197.115234375,-2260.0517578125,30.655773162842},
{-2264.9052734375,2307.7177734375,4.8202133178711,56},
{2279.57421875,2459.5595703125,10.8203125},
{-1397.3450927734, -105.20162200928, 14.1484375},
}
 
 -------------------------------------
lootItemsMylitary = {
["weaponbox"] = {
   
    {"Empty Gas Canister",1650,1,0,4},
    {"Roadflare",324,1,90,4},
    {"Painkiller",2709,3,0,4},
    {"Watch",2710,1,0,4},
    {"Alice Pack",1248,1,0,4},
    {"Night Vision Goggles",368,1,90,4},
    {"Binoculars",369,1,0,4},
    {"Engine",929,0.3,0,2},
    {"Tire",1073,1,0,2},
    {"Morphine",1579,1,0,4},
    {"GPS",2976,0.15,0,3},
    {"Map",1277,0.8,90,7},
    {"Infrared Goggles",369,1,90,3},
    {"Assault Pack (ACU)",3026,1,0,5},
    {"Drybag(Yellow)",1809,1,0,0.1},
    {"Mountain Backpack",1669,1,0,0.1},
    {"Czech Backpack",1239,1,0,2}, 
    {"Coyote Backpack",1252,1,0,0.9},
    {"Shovel",337,1,90,1},
    {"Pizza",1582,1,0,4},
    {"Soda Bottle",2647,1,0,4},
    {"Toolbox",2969,0.5,0,1},
    --weapons
    {"M1911",346,1,90,5},
    {"M9-SD",347,1,90,4},
    {"Desert-Eagle",348,1,90,0.2},
    {"Winchester-1866",349,1,90,3},
    {"PDW",352,1,90,4},
    {"Hunting-Knife",335,1,90,2.4},
    {"Hatchet",339,1,90,2.1},
    {"Sawn-Off-Shotgun",350,1,90,2.3},
    {"SPAZ-12-Combat-Shotgun",351,1,90,2.3},
    {"MP5A5",353,1,90,2.8},
    {"Lee-Enfield",357,1,90,3.5},
    {"Ak-47",2560,1,90,2.4},
    {"G36-KV",1899,1,90,2.4},
    {"M4A1",2402,1,90,2.4},
    {"AWP",1870,1,90,0.4},
    --awmo
    {"7,62 mm",1271,2,0},
    {"5,56 mm",1271,2,0},
    {"9,19 mm",3013,2,0},
    {"11.5 mm",3013,2,0},
    {"4,5 mm",2041,2,0},
    },
}





hospitalPacks = {
{-2670.87890625,636.8984375,14.453125},
{-2637.0556640625,635.03125,14.453125},
{-1515.669921875,2519.166015625,56.0703125},
{-1513.888671875,2519.5908203125,56.064819335938},
{-1528.8955078125,2516.724609375,55.986171722412},
{2022.1650390625,-1402.6806640625,17.18045425415},
{2042.7001953125,-1409.4775390625,17.1640625},
{-316.5478515625,1051.6494140625,20.340259552002},
{-337.9541015625,1049.490234375,19.739168167114},
{-331.5849609375,1046.037109375,26.012474060059},
{-307.0419921875,1045.27734375,26.012474060059},
{1171.490234375,-1310.560546875,13.986573219299},
{1171.609375,-1306.556640625,13.996350288391},
{1158.5048828125,-1326.333984375,31.503561019897},
{1159.80078125,-1323.9013671875,31.498970031738},
{1238.7119140625,328.2431640625,19.7555103302},
{1229.365234375,311.1435546875,24.7578125},
{-2204.07421875,-2309.58203125,31.375},
{1615.939453125,1818.0537109375,10.8203125},
{1601.9443359375,1816.736328125,10.8203125},
{1590.0166015625,1792.0234375,30.46875},
{1607.3232421875,1776.7412109375,37.3125},
{2107.7626953125,926.16015625,10.8203125},
{2116.12890625,925.7705078125,10.9609375},
{2122.1865234375,925.3193359375,10.8203125},
};
patrolPoints = {
	{-1603.2197265625,-2712.736328125,48.9453125},
	{2465.748046875,-2215.55859375,13.546875},
	{2473.439453125,-2215.56640625,13.546875},
	{2480.0732421875,-2216.140625,13.546875},
	{2487.24609375,-2215.5966796875,13.546875},
	{2494.1005859375,-2215.5859375,13.546875},
	{-1686.6728515625,408.9970703125,7.3984375},
	{-1682.34375,412.9384765625,7.3984375},
	{-1680.0263671875,402.3642578125,7.3984375},
	{-1675.84375,406.4677734375,7.3984375},
	{-1670.5615234375,411.8359375,7.3984375},
	{-1666.2392578125,416.2509765625,7.3984375},
	{-1672.7939453125,422.81640625,7.3984375},
	{-1677.20703125,418.46484375,7.3984375},
	{-2410.7021484375,969.9091796875,45.4609375},
	{-2410.744140625,975.220703125,45.4609375},
	{-2410.837890625,980.5302734375,45.4609375},
	{-1329.3046875,2668.5126953125,50.46875},
	{-1328.7314453125,2673.90625,50.0625},
	{-1327.0185546875,2679.3876953125,50.46875},
	{-1327.3798828125,2684.62890625,50.0625},
	{1940.7099609375,-1778.5244140625,13.390598297119},
	{1940.6552734375,-1774.908203125,13.390598297119},
	{1940.630859375,-1771.728515625,13.390598297119},
	{1940.7080078125,-1767.3837890625,13.390598297119},
	{-1477.921875,1868.138671875,32.639846801758},
	{-1466.1552734375,1869.0048828125,32.6328125},
	{-1464.5224609375,1861.3828125,32.639846801758},
	{-1477.4599609375,1860.5205078125,32.6328125},
	{-735.9208984375,2744.0087890625,47.2265625},
	{-739.0439453125,2744.2421875,47.165451049805},
	{377.6953125,2601.1083984375,16.484375},
	{624.5263671875,1676.25390625,6.9921875},
	{620.2958984375,1681.2431640625,6.9921875},
	{616.248046875,1686.4169921875,7.1875},
	{612.783203125,1691.1650390625,7.1875},
	{609.2060546875,1696.201171875,7.1875},
	{605.8505859375,1700.978515625,7.1875},
	{602.27734375,1706.3603515625,7.1875},
	{2141.037109375,2742.734375,10.960174560547},
	{2142.3115234375,2752.6982421875,10.96019744873},
	{2147.9521484375,2752.3203125,10.8203125},
	{2152.60546875,2751.953125,10.8203125},
	{2152.984375,2743.85546875,10.8203125},
	{2147.75,2743.7392578125,10.8203125},
	{-97.6298828125,-1175.0283203125,2.4990689754486},
	{-90.74609375,-1177.853515625,2.2021217346191},
	{-84.75390625,-1163.853515625,2.3359375},
	{-91.5771484375,-1160.5732421875,2.4453125},
	{-1606.525390625,-2717.2138671875,48.9453125},
	{-1609.7109375,-2721.544921875,48.9453125},
	{-1599.83203125,-2708.302734375,48.9453125},
	{-2246.314453125,-2558.8212890625,32.0703125},
	{-2241.3125,-2561.3662109375,32.0703125},
	{-1132.2880859375,-135.0986328125,14.14396572113},
	{-1153.529296875,-156.373046875,14.1484375},
	{-1142.826171875,-145.67578125,14.14396572113},
	{655.611328125,-557.9912109375,16.501491546631},
	{655.6572265625,-572.1728515625,16.501491546631},
	{1601.791015625,2203.90625,11.060997009277},
	{1596.806640625,2203.4345703125,10.8203125},
	{1590.197265625,2203.4853515625,10.8203125},
	{1589.4775390625,2195.43359375,10.8203125},
	{1596.125,2194.294921875,10.8203125},
	{1601.6591796875,2194.3369140625,10.8203125},
	{2206.8466796875,2470.47265625,10.8203125},
	{2206.94140625,2474.75,10.8203125},
	{2206.9267578125,2478.86328125,10.8203125},
	{2198.06640625,2480.6953125,10.8203125},
	{2197.541015625,2475.791015625,10.995170593262},
	{2197.609375,2471.9169921875,10.995170593262},
	{2120.8251953125,915.4833984375,10.8203125},
	{2115.1181640625,915.44140625,10.8203125},
	{2109.076171875,915.4228515625,10.8203125},
	{2109.22265625,924.8779296875,10.9609375},
	{2114.9404296875,924.8857421875,10.9609375},
	{2119.5126953125,925.2861328125,10.9609375},
	{2645.7197265625,1112.7802734375,10.8203125},
	{2639.984375,1112.56640625,10.8203125},
	{2634.828125,1112.3466796875,10.9609375},
	{2634.1826171875,1101.9482421875,10.8203125},
	{2636.7509765625,1101.6748046875,10.8203125},
	{2643.5126953125,1101.81640625,10.8203125},
	{2209.576171875,2469.8251953125,10.8203125},
	{2208.8310546875,2475.09375,10.8203125},
	{1005.078125,-901.7490234375,42.216625213623},
	{993.025390625,-902.474609375,42.222496032715},
};

heliCrashSites = {
	{-1360.0478515625,-1070.7314453125,160.4069519043},
	{-421.4619140625,-1284.4345703125,33.740924835205},
	{-2357.654296875,-1634.3623046875,483.703125},
	{979.0849609375,160.59375,28.935249328613},
	{-2057.2294921875,2781.73828125,163.12780761719},
	{826.90234375,2803.6259765625,74.863929748535},
	{2577.7060546875,-650.541015625,136.37449645996},
};


lootItems = {
	["helicrashsides"] = {
		{"Night Vision Goggles",368,1,90,10},
		{"Box of Matches",328,0.4,90,2},
		{"Pizza",1582,1,0,2},
		{"Soda Bottle",2647,1,0,2},
		{"Empty Gas Canister",1650,1,0,2},
		{"Roadflare",324,1,90,2},
		{"Milk",2856,1,0,1},
		{"Painkiller",2709,0.5,0,4},
		{"Empty Soda Cans",2673,0.5,0,2},
		{"Scruffy Burgers",2675,0.5,0,3},
		{"Watch",2710,1,0,4},
		{"Heat Pack",1576,1,0,3},
		{"Wire Fence",933,0.25,0,1},
		{"Alice Pack",3026,1,0,4},
		{"Night Vision Goggles",368,1,90,1.5},
		{"Tire",1073,1,0,2},
		{"Morphine",1579,1,0,4},
		{"Camouflage Clothing",1577,1,0,4.5},
		{"Civilian Clothing",1577,1,0,3},
		{"GPS",2976,0.15,0,3},
		{"Map",1277,0.8,90,7},
		{"Toolbox",2969,0.5,0,1},
		{"Engine",929,0.3,0,2},
		{"Tent",1279,1,0,4.5},
		{"Ghillie Suit",1577,1,0,0.5},
		{"Infrared Goggles",369,1,90,3},
		{"Assault Pack (ACU)",3026,0.5,0,5},
		{"Coyote Backpack",3026,1.3,0,2},

        --weapons
        {"M1911",346,1,90,10},
        {"M9-SD",347,1,90,7},
        {"Winchester-1866",349,1,90,6},
        {"PDW",352,1,90,5.5},
        {"Hunting-Knife",335,1,90,4},
        {"Hatchet",339,1,90,3},
        {"Grenade",342,1,0,4},
        {"Parachute",342,1,0,80},
        {"Sawn-Off-Shotgun",350,1,90,5},
        {"SPAZ-12-Combat Shotgun",351,1,90,4},
        {"MP5A5",353,1,90,6},
        {"Lee-Enfield",357,1,90,6},
        {"AK-47",2560,1,90,1},
        {"G36-KV",1899,1,90,1},
        {"M4A1",2402,1,90,1},
        {"AWP",1870,1,90,1.5},
	},
	["hospital"] = {
		{"Medic Kit",2891,0.7,0},
		{"Heat Pack",1576,1,0},
		{"Bandage",1578,0.5,0},
		{"Blood Bag",1580,1,0},
		{"Morphine",1579,1,0},
		{"Blood Bag",1580,1,0},
		{"Medic Kit",2891,0.7,0},
		{"Blood Bag",1580,1,0},
		{"Painkiller",1580,1,0},
		{"Transfusion Kit",1580,1,0},
		{"Blood Bag (Empty)",1580,1,0},
	},
};
