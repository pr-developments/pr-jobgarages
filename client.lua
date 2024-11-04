local QBCore = exports['qb-core']:GetCoreObject() -- Get QBCore object reference
local ESX = nil

-- Initialize ESX
TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj 
end)

local spawnLocations = Config.SpawnLocations -- For vehicle spawning
local deleteLocations = Config.DeleteLocations -- For vehicle deletion

-- Function to draw markers with configurable height
local function drawMarker(coords, color, height)
    local markerHeight = height or 1.0 -- Use provided height or default to 1.0 if nil
    DrawMarker(27, coords.x, coords.y, coords.z - markerHeight, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, markerHeight, color.r, color.g, color.b, 100, false, true, 2, true, nil, nil, false)
end

-- Function to draw 3D text
local function drawText3D(x, y, z, text)
    SetDrawOrigin(x, y, z, 0)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(0.0, 0.0)
    ClearDrawOrigin()
end

local function spawnVehicle(model, location)
    local playerPed = PlayerPedId()
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(100) end
    local vehicle = CreateVehicle(model, location.vehicleSpawn.x, location.vehicleSpawn.y, location.vehicleSpawn.z, location.heading, true, false)
    TaskWarpPedIntoVehicle(playerPed, vehicle, -1)
    SetModelAsNoLongerNeeded(model)
    QBCore.Functions.Notify("You have spawned a " .. model, "success")
end

local function openCarMenu(location)
    local carOptions = {}
    local playerData = QBCore.Functions.GetPlayerData()
    local playerJob = playerData.job.name
    local playerGrade = playerData.job.grade.level or playerData.job.grade

    for _, car in ipairs(Config.Cars) do
        if playerJob == "police" and playerGrade >= car.requiredGrade then
            carOptions[#carOptions + 1] = {
                title = car.label,
                onSelect = function()
                    spawnVehicle(car.model, location)
                end
            }
        end
    end

    lib.registerContext({ id = 'car_spawn_menu', title = 'Choose a Vehicle', options = carOptions })
    lib.showContext('car_spawn_menu')
end

local function openAmbulanceMenu(location)
    local ambulanceOptions = {}
    local playerData = QBCore.Functions.GetPlayerData()
    local playerJob = playerData.job.name
    local playerGrade = playerData.job.grade.level or playerData.job.grade

    for _, ambulance in ipairs(Config.Ambulances) do
        if playerJob == "ambulance" and playerGrade >= ambulance.requiredGrade then
            ambulanceOptions[#ambulanceOptions + 1] = {
                title = ambulance.label,
                onSelect = function()
                    spawnVehicle(ambulance.model, location)
                end
            }
        end
    end

    lib.registerContext({ id = 'ambulance_spawn_menu', title = 'Choose an Ambulance', options = ambulanceOptions })
    lib.showContext('ambulance_spawn_menu')
end

local function deleteVehicleMenu()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle ~= 0 then
        SetEntityAsMissionEntity(vehicle, true, true)
        DeleteVehicle(vehicle)
        QBCore.Functions.Notify("Your vehicle has been deleted", "success")
        ESX.ShowNotification("Your vehicle has been deleted") -- ESX notification
    else
        QBCore.Functions.Notify("You are not in a vehicle", "error")
        ESX.ShowNotification("You are not in a vehicle") -- ESX notification
    end
end

-- Main thread for handling interactions
CreateThread(function()
    while true do
        local sleep = 50
        local playerCoords = GetEntityCoords(PlayerPedId())
        local playerData = QBCore.Functions.GetPlayerData()

        -- Check if playerData and job are available
        if playerData and playerData.job then
            local playerJob = playerData.job.name

            if playerJob == "police" or playerJob == "ambulance" then
                -- Handle spawn locations
                for _, location in ipairs(spawnLocations) do
                    local distance = Vdist(playerCoords, location.coords)
                    if distance < 100.0 then
                        sleep = 0
                        drawMarker(location.coords, location.color, location.markerHeight or 1.0) -- Use the marker height from the config

                        if distance < 2.0 then
                            local menuText = playerJob == "police" and '[~b~E~w~] Open Car Menu' or '[~g~E~w~] Open Ambulance Menu'
                            drawText3D(location.coords.x, location.coords.y, location.coords.z, menuText)
                            if IsControlJustReleased(0, 38) then
                                if playerJob == "police" then
                                    openCarMenu(location)
                                else
                                    openAmbulanceMenu(location)
                                end
                            end
                        end
                    end
                end -- End of spawn locations handling

                -- Handle delete locations
                for _, location in ipairs(deleteLocations) do
                    local distance = Vdist(playerCoords, location.coords)
                    if distance < 500.0 then
                        sleep = 0
                        drawMarker(location.coords, location.color)

                        if distance < 1.5 then
                            drawText3D(location.coords.x, location.coords.y, location.coords.z, '[~r~E~w~] Delete Vehicle')
                            if IsControlJustReleased(0, 38) then
                                deleteVehicleMenu()
                            end
                        end
                    end
                end -- End of delete locations handling
            end -- End of job check
        end -- End of playerData check

        Wait(sleep)
    end
end) -- End of CreateThread
