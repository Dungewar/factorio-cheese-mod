local beryllium = table.deepcopy(data.raw["item"]["iron-plate"])

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

local beryllium_recipe = {
  type = "recipe",
  name = "beryllium",
  category = "crafting-with-fluid",
  main_product = "beryllium",
  enabled = true,
  energy_required = 10, -- time to craft in seconds (at crafting speed 1)
  ingredients = {
    { type = "item",  name = "coal",          amount = 1 },
    { type = "fluid", name = "sulfuric-acid", amount = 150 }
  },
  results = {
    { type = "fluid", name = "water",     amount = 150 },
    { type = "item",  name = "beryllium", amount = 1 },
  }
}

local milk_item = table.deepcopy(data.raw["fluid"]["water"])

milk_item.name = "milk"

milk_item.icons = {
  {
    icon = "__cheesetorio__/graphics/milk.png",
    -- icon = "__base__/graphics/icons/fluid/water.png",
    tint = { r = 1, g = 1, b = 1, a = 0 }
  }
}

local milk_vent = table.deepcopy(data.raw["resource"]["crude-oil"])

milk_vent.name = "milk-vent"
milk_vent.minable.results = {
  { type = "fluid", name = "milk", amount_min = 5, amount_max = 15 }
}
milk_vent.map_color = { r = 1.0, g = 1.0, b = 1.0 } -- milk white
milk_vent.icon = "__base__/graphics/entity/crude-oil/crude-oil.png"
-- milk_vent.stages.sheet.filename = "__cheesetorio__/graphics/entity/milk-vent.png"
-- milk_vent.stages.sheet.hr_version.filename = "__cheesetorio__/graphics/entity/hr-milk-vent.png"

local resource_autoplace = require("resource-autoplace")

milk_vent.autoplace = resource_autoplace.resource_autoplace_settings {
  name = "milk-vent",
  order = "c",
  base_density = 80.2,
  base_spots_per_km2 = 100.8,
  random_probability = 1,
  random_spot_size_minimum = 10,
  random_spot_size_maximum = 100,
  additional_richness = 220000,
  has_starting_area_placement = true,
  regular_rq_factor_multiplier = 1
}
milk_vent.selection_box = {{-0.5, -0.5}, {0.5, 0.5}}
milk_vent.collision_box = {{-0.1, -0.1}, {0.1, 0.1}}
milk_vent.category = "milk-fluid"
milk_vent.minable = {
  mining_time = 1,
  results = {
    { type = "fluid", name = "milk", amount = 10 }
  }
}

local milk_pumpjack = table.deepcopy(data.raw["mining-drill"]["pumpjack"])
milk_pumpjack.name = "milk-pumpjack"
milk_pumpjack.icon = "__cheesetorio__/graphics/icons/milk-pumpjack.png"
milk_pumpjack.minable.result = "milk-pumpjack"
milk_pumpjack.resource_categories = { "milk-fluid" }
milk_pumpjack.output_fluid_box =
{
  volume = 1,
  pipe_covers = pipecoverspictures(),
  pipe_connections =
  {
    {
      direction = defines.direction.north,
      positions = { { 1, -1 }, { 1, -1 }, { -1, 1 }, { -1, 1 } },
      flow_direction = "output"
    }
  }
}
milk_pumpjack.energy_usage = "90kW"
milk_pumpjack.mining_speed = 1
milk_pumpjack.module_specification = {
  module_slots = 2
}
milk_pumpjack.allowed_effects = { "consumption", "speed", "productivity", "pollution" }
data:extend({ milk_pumpjack })




local milk_pumpjack_item = table.deepcopy(data.raw["item"]["pumpjack"])

milk_pumpjack_item.name = "milk-pumpjack"

milk_pumpjack_item.stack_size = 10
milk_pumpjack_item.place_result = "milk-pumpjack"
milk_pumpjack_item.icon = "__cheesetorio__/graphics/icons/milk-pumpjack.png"


local milk_pumpjack_recipe = {
  type = "recipe",
  name = "milk-pumpjack",
  enabled = true,
  energy_required = 1, -- time to craft in seconds (at crafting speed 1)
  ingredients = {
    { type = "item",  name = "coal",          amount = 1 },
  },
  results = {
    { type = "item", name = "milk-pumpjack",     amount = 1 },
  }
}


data:extend({
  {
    type = "resource-category",
    name = "milk-fluid"
  }
})

data:extend { beryllium, beryllium_recipe, milk_item, milk_vent, milk_pumpjack_item, milk_pumpjack_recipe }
