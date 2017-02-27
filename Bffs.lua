--setting the name of the Key Binding Section
BINDING_HEADER_BFFS = "BFFs"

local markers = { 6, 1, 4, 5 }

function BFFS_Toggle()
    if GetRaidTargetIndex("player") then
        BFFS_ClearAll()
    else
        BFFS_MarkAll()
    end
end

-- Setting raid icons on the party
function BFFS_MarkAll()
    --[[ for the 4 party members, check if they exist and
         then assign them the marker in the table
     ]]
    for i=1,4 do
        local unit = "party"..i
        if UnitInParty(unit) then
            SetRaidTarget(unit, markers[i])
        end
    end
    -- Then mark the player
    SetRaidTarget("player", 3)
end

--[[ Removing the raid markers by putting them all
    onto the player and then setting the player to nothing
]]
function BFFS_ClearAll()
    for i=1,4 do
        local unit = "party"..i
        if UnitInParty(unit) then
            SetRaidTarget(unit, 0)
        end
    end
    SetRaidTarget("player", 0)
end

SLASH_BFF1 = "/bff"

SlashCmdList["BFF"] = function()
    BFFS_Toggle()
end