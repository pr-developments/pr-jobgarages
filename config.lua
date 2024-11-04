Config = {}

-- Vehicle spawn locations
Config.SpawnLocations = {
    {
        coords = vector3(459.48, -986.71, 25.7), -- Location for spawning Police Cars
        vehicleSpawn = vector3(448.09, -981.39, 25.7), -- Coordinates where the Car vehicle will appear
        heading = 90.0, -- Direction the car vehicle will face when spawned
        color = {r = 0, g = 0, b = 255}, -- Blue color for the marker
        height = Config.MarkerHeightPolice -- Custom marker height for police
    },
    {
        coords = vector3(296.42, -591.03, 43.27), -- Location for spawning ambulances
        vehicleSpawn = vector3(290.56, -589.77, 43.19), -- Coordinates where the ambulance vehicle will appear
        heading = 345.0, -- Direction the ambulance will face when spawned
        color = {r = 0, g = 255, b = 0}, -- Green color for the marker
        height = Config.MarkerHeightAmbulance -- Custom marker height for ambulance
    }
}

-- Vehicles List - Ranks
Config.Cars = {
    {label = 'GD Passat', model = 'gdpassat', requiredGrade = 0},       -- Grade 0: Officer
    {label = 'GD Ranger', model = 'ranger', requiredGrade = 1},         -- Grade 1: Sergeant
    {label = 'GD Sonata', model = 'sonata', requiredGrade = 1},        -- Grade 1: Sergeant
    {label = 'HWP Marked Bmw', model = 'hwp2018v2', requiredGrade = 2}, -- Grade 2: Lieutenant
    {label = 'HWP UnMarked Bmw', model = 'umbmw2021', requiredGrade = 2}, -- Grade 2: Lieutenant
    {label = 'UnMarked Ranger', model = 'umranger', requiredGrade = 1}, -- Grade 1: Sergeant
    {label = 'UnMarked Hilux', model = 'nswpfhilux', requiredGrade = 3}, -- Grade 3: Captain
    {label = 'UnMarked RS6', model = 'ACTRPavantum', requiredGrade = 3}, -- Grade 3: Captain
}

-- Available ambulance vehicles to spawn
Config.Ambulances = {
    {label = 'Ambulance', model = 'ambulance', requiredGrade = 0},     -- Grade 0: Paramedic
    {label = 'EMS SUV', model = 'ems_suv', requiredGrade = 1},         -- Grade 1: Senior Paramedic
}

-- Store vehicle location for the menu that deletes vehicles
Config.DeleteLocations = {
    {
        coords = vector3(445.26, -988.97, 25.7), -- Location where vehicles can be stored/deleted
        color = {r = 255, g = 0, b = 0}, -- Red color for the marker
        height = Config.MarkerHeightPolice -- Custom marker height for police
    },
    {
        coords = vector3(445.2, -991.77, 25.7), -- Location where vehicles can be stored/deleted
        color = {r = 255, g = 0, b = 0}, -- Red color for the marker
        height = Config.MarkerHeightPolice -- Custom marker height for police
    },
    {
        coords = vector3(445.19, -994.46, 25.7), -- Location where vehicles can be stored/deleted
        color = {r = 255, g = 0, b = 0}, -- Red color for the marker
        height = Config.MarkerHeightPolice -- Custom marker height for police
    }
}
