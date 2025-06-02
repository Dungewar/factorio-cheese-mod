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

data:extend { beryllium, berylliumRecipe }
