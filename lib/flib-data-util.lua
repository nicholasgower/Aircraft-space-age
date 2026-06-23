--Hard copy of the only function Aircraft actually needs from flib. Copied to expedite bringing Aircraft to Factorio 2.1
local flib_data_util = {}

local exponent_multipliers = {
  ["q"] = 0.000000000000000000000000000001,
  ["r"] = 0.000000000000000000000000001,
  ["y"] = 0.000000000000000000000001,
  ["z"] = 0.000000000000000000001,
  ["a"] = 0.000000000000000001,
  ["f"] = 0.000000000000001,
  ["p"] = 0.000000000001,
  ["n"] = 0.000000001,
  ["u"] = 0.000001, -- μ is invalid
  ["m"] = 0.001,
  ["c"] = 0.01,
  ["d"] = 0.1,
  [""] = 1,
  ["da"] = 10,
  ["h"] = 100,
  ["k"] = 1000,
  ["M"] = 1000000,
  ["G"] = 1000000000,
  ["T"] = 1000000000000,
  ["P"] = 1000000000000000,
  ["E"] = 1000000000000000000,
  ["Z"] = 1000000000000000000000,
  ["Y"] = 1000000000000000000000000,
  ["R"] = 1000000000000000000000000000,
  ["Q"] = 1000000000000000000000000000000,
}



function flib_data_util.get_energy_value(energy_string)
  if type(energy_string) == "string" then
    local v, _, exp, unit = string.match(energy_string, "([%-+]?[0-9]*%.?[0-9]+)((%D*)([WJ]))")
    local value = tonumber(v)
    if value and exp and exponent_multipliers[exp] then
      value = value * exponent_multipliers[exp]
      return value, unit
    end
  end
  return nil
end

return flib_data_util
