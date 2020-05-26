
--Weapons-------------------------------------------
---------------------------------------------------
---------------------------------------------------
---------------------------------------------------
Ammo = {
    --cartucho, tamaño
    {'4,5 mm', 35}, 
    {'5,56 mm', 30},
    {'7,62 mm', 30},
    {'9,19 mm', 15},
    {'11.5 mm', 7},
    {'22,2 mm', 7},
}


Armas = {
--Name, Model object, weapon, ammo, damage, sound
    --TYPE AK
    {'Ak-47', 2560, 30, '7,62 mm', 3300, 'Ak-47'},
    --TYP M4
    {'M4A1', 2402, 31, '5,56 mm', 2400, 'M4A1'},
    --TYPE SNIPER
    {'AWP', 1870, 34, '7,62 mm', 10000, 'AWP'},


    {'M1911', 346, 22, '5,56 mm', 2000, false},
    {'M9-SD', 347, 23, '9,19 mm', 3000, false},
    {'Desert-Eagle', 348, 24, '11.5 mm', 4000, false},
    {'PDW', 352, 28, '4,5 mm', 2000, false},
    {'MP5A5', 353, 29, '4,5 mm', 2500, false},
    {'Winchester-1866', 349, 25, '22,2 mm', 6000, false },
    {"Sawn-Off-Shotgun", 350, 26, '11.5 mm', 4500, false},
    {'SPAZ-12-Combat-Shotgun', 351, 27,'11.5 mm', 4000, false},
    {'Lee-Enfield', 357, 33, '11.5 mm',5000, false},

    --otros
    {"Parachute",46},
    {"Satchel",39},
    {"Tear-Gas",17},
    {"Grenade",16},
    {"Hunting-Knife",4},
    {"Hatchet",8},
    {"Binoculars",43},
    {"Baseball-Bat",5},
    {"Shovel",6},
    {"Golf-Club",2},
    --{"Radio Device",1},

    --[[
    {"Parachute",46, 46, false, false, false},
    {"Satchel",39, 39, false, 3000, false},
    {"Tear Gas",17, 17, false, false, false},
    {"Grenade",16, 16, false, 20000, false},
    {"Hunting Knife", 4, 4, false, 6000, false},
    {"Hatchet",8, 8, false, 3500,false},
    {"Binoculars",43, 43, false, false, false},
    {"Baseball Bat",5, 5, false, 2500, false},
    {"Shovel",6, 6, false, 2000, false},
    {"Golf Club",2, 2, false, 1500, false},
    ]]

}

-- WEAPON DAMAGE TABLE IS IN editor_client.lua

function getWeaponDamage (weapon)
    for i,weapon2 in ipairs(Armas) do
        local t,weapon1 = getWeaponAmmoType(weapon2[1])
        if weapon1 == weapon then
            if getElementData(getLocalPlayer(),"humanity") == 5000 then
                if weapon2[1] == "M1911" or weapon2[1] == "M9-SD" or weapon2[1] == "PDW" then
                    return weapon2[5]*0.3
                end
            end    
            return weapon2[5]
        end
    end
end

function getWeaponAmmoType(weaponName)
    for i,weaponData in ipairs(Armas) do
        if weaponData[4] then
            if weaponName == weaponData[1] then
                return weaponData[4],weaponData[3]
            end
        else
            if weaponName == weaponData[1] then
                return weaponData[1],weaponData[2]
            end
        end
    end
    return false
end

function getWeaponAmmoType2(weaponType)
    for i,weaponData in ipairs(Armas) do
        if weaponData[4] then
            if weaponType == weaponData[3] then
                return weaponData[4],weaponData[3]
            end
        else
            if weaponName == weaponData[1] then
                return weaponData[1],weaponData[2]
            end
        end
    end
    return false
end

weaponNoiseTable = {
{22,20},
{23,0},
{24,60},
{28,40},
{32,40},
{29,40},
{30,60},
{31,60},
{25,40},
{26,60},
{27,60},
{33,40},
{34,60},
{36,60},
{35,60},
}
--0 none
--20 low
--40 moderate
--60 high

function getWeaponNoise(weapon)
    for i,weapon2 in ipairs(weaponNoiseTable) do
        if weapon == weapon2[1] then
            return weapon2[2]
        end
    end
    return 0
end  