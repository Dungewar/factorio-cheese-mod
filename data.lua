--data.lua

-- local fireArmor = table.deepcopy(data.raw["armor"]["heavy-armor"]) -- copy the table that defines the heavy armor item into the fireArmor variable

-- fireArmor.name = "fire-armor"
-- fireArmor.icons = {
--   {
--     icon = fireArmor.icon,
--     icon_size = fireArmor.icon_size,
--     tint = { r = 1, g = 0, b = 0, a = 0.3 }
--   },
-- }

-- fireArmor.resistances = {
--   {
--     type = "physical",
--     decrease = 6,
--     percent = 10
--   },
--   {
--     type = "explosion",
--     decrease = 10,
--     percent = 30
--   },
--   {
--     type = "acid",
--     decrease = 5,
--     percent = 30
--   },
--   {
--     type = "fire",
--     decrease = 0,
--     percent = 100
--   }
-- }

-- -- create the recipe prototype from scratch
-- local fireArmorRecipe = {
--   type = "recipe",
--   name = "fire-armor",
--   enabled = true,
--   energy_required = 8, -- time to craft in seconds (at crafting speed 1)
--   ingredients = {
--     { type = "item", name = "copper-plate", amount = 200 },
--     { type = "item", name = "steel-plate",  amount = 50 }
--   },
--   results = { { type = "item", name = "fire-armor", amount = 1 } }
-- }

-- data:extend { fireArmor, fireArmorRecipe }


local beryllium = table.deepcopy(data.raw["item"]["iron-plate"]) -- copy the table that defines the heavy armor item into the fireArmor variable

beryllium.name = "beryllium"

-- Hurricane stuff!
-- local Hurricane = require("graphics/hurricane")
-- local skin = Hurricane.crafter({
--   name = "beryllium.png",
--   width = 1024, height = 1024,
--   total_frames = 1,
--   shadow_width = 0, shadow_height = 0,
-- })

beryllium.icons = {
  {
    icon = "__cheesetorio__/graphics/beryllium.png",
    icon_size = 1024,
    -- tint = {r=0,g=0,b=0,a=0}
  },
}

local berylliumRecipe = {
  type = "recipe",
  name = "beryllium",
  category = "crafting-with-fluid",
  main_product = "beryllium",
  enabled = true,
  energy_required = 10, -- time to craft in seconds (at crafting speed 1)
  ingredients = {
    { type = "item",  name = "coal",  amount = 1 },
    { type = "fluid", name = "sulfuric-acid", amount = 150 }
  },
  results = { 
    { type = "fluid", name = "water", amount = 150 },
    { type = "item", name = "beryllium", amount = 1 },
  }
}

local milkItem = table.deepcopy(data.raw["fluid"]["water"])

milkItem.name = "milk"

milkItem.icons = {
  {
    icon = "__cheesetorio__/graphics/milk.png",
    -- icon = "__base__/graphics/icons/fluid/water.png",
    tint = { r = 1, g = 1, b = 1, a = 0 }
  }
}


local milk_vent = {
  type = "resource",
  name = "crude-oil",
  icon = "__base__/graphics/icons/crude-oil.png",
  icon_size = 32,
  flags = {"placeable-neutral"},
  category = "basic-fluid",
  order="a-b-a",
  infinite = true,
  highlight = true,
  minimum = 60000,
  normal = 300000,
  infinite_depletion_amount = 10,
  resource_patch_search_radius = 12,
  tree_removal_probability = 0.7,
  tree_removal_max_distance = 32 * 32,
  minable =
  {
    mining_time = 1,
    results =
    {
      {
        type = "fluid",
        name = "crude-oil",
        amount_min = 10,
        amount_max = 10,
        probability = 1
      }
    }
  },
  collision_box = {{ -1.4, -1.4}, {1.4, 1.4}},
  selection_box = {{ -0.5, -0.5}, {0.5, 0.5}},
  autoplace = resource_autoplace.resource_autoplace_settings{
    name = "crude-oil",
    order = "c", -- Other resources are "b"; oil won't get placed if something else is already there.
    base_density = 8.2,
    base_spots_per_km2 = 1.8,
    random_probability = 1/48,
    random_spot_size_minimum = 1,
    random_spot_size_maximum = 1, -- don't randomize spot size
    additional_richness = 220000, -- this increases the total everywhere, so base_density needs to be decreased to compensate
    has_starting_area_placement = false,
    resource_index = resource_autoplace.resource_indexes["crude-oil"],
    regular_rq_factor_multiplier = 1
  },
  stage_counts = {0},
  stages =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/crude-oil/crude-oil.png",
      priority = "extra-high",
      width = 75,
      height = 61,
      frame_count = 4,
      variation_count = 1
    }
  },
  map_color = {r=0.78, g=0.2, b=0.77},
  map_grid = false
}



data:extend { beryllium, berylliumRecipe, milkItem }
