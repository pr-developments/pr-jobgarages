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
    {label = 'GD Passat', model = 'gdpassat', requiredGrade = 1},       -- Grade 0: Officer
    {label = 'GD Ranger', model = 'ranger', requiredGrade = 1},         -- Grade 1: Sergeant
    {label = 'GD Sonata', model = 'sonata', requiredGrade = 1},         -- Grade 1: Sergeant
    {label = 'HWP Marked Bmw', model = 'hwp2018v2', requiredGrade = 5}, -- Grade 2: Lieutenant
    {label = 'HWP Unmarked Fusion', model = 'umfusion', requiredGrade = 5}, -- Grade 2: Lieutenant
    {label = 'HWP UnMarked Bmw', model = 'umbmw2021', requiredGrade = 6}, -- Grade 2: Lieutenant
    {label = 'UnMarked Ranger', model = 'umranger', requiredGrade = 7, 8}, -- Grade 1: Sergeant
    {label = 'UnMarked Hilux', model = 'nswpfhilux', requiredGrade = 6}, -- Grade 3: Captain
    {label = 'UnMarked RS6', model = 'ACTRPavantum', requiredGrade = 6}, -- Grade 3: Captain
}

-- Available ambulance vehicles to spawn
Config.Ambulances = {
    {label = 'AMB Sprinter', model = 'nswambo', requiredGrade = 0 },     -- Grade 0: Paramedic
}

-- Store vehicle location for the menu that deletes vehicles
Config.DeleteLocations = {
    {
        coords = vector3(445.78, -989.22, 25.7), -- Location where vehicles can be stored/deleted
        color = {r = 255, g = 0, b = 0}, -- Red color for the marker
        height = Config.MarkerHeightPolice -- Custom marker height
    },
    {
        coords = vector3(445.7, -991.16, 25.7), -- Location where vehicles can be stored/deleted
        color = {r = 255, g = 0, b = 0}, -- Red color for the marker
        height = Config.MarkerHeightPolice -- Custom marker height
    },
    {
        coords = vector3(276.3, -605.63, 42.98), -- Location where vehicles can be stored/deleted
        color = {r = 255, g = 0, b = 0}, -- Red color for the marker
        height = Config.MarkerHeightPolice -- Custom marker height
    }
}

-- Vehicle settings including extras and livery
Config.VehicleSettings = {
    ['gdpassat'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['ranger'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['sonata'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['hwp2018v2'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['umfusion'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['umbmw2021'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['umranger'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['nswpfhilux'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['ACTRPavantum'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    },
    ['nswambo'] = {
        ['extras'] = { ['1'] = true, ['2'] = true, ['3'] = true, ['4'] = true, ['5'] = true, ['6'] = true, ['7'] = true, ['8'] = true, ['9'] = true, ['10'] = true, ['11'] = true, ['12'] = true },
        ['livery'] = 1
    }
}
