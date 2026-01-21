local colors = require("colors")
local icons = require("icons")
local sbar = require("sketchybar")

local wifi = sbar.add("item", "wifi", {
  position = "right",
  
  icon = {
    string = icons.wifi.connected,
    color = colors.magenta,
  },
  
  label = {
    string = "Wi-Fi",
    color = colors.magenta,
  },
})

wifi:subscribe({"wifi_change", "system_woke"}, function(env)
  sbar.exec("ipconfig getifaddr en0", function(ip)
    
    local connected = (ip ~= "" and ip ~= nil)

    if connected then
      sbar.exec("networksetup -listpreferredwirelessnetworks en0 | sed -n '2p' | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'", function(ssid)
        wifi:set({
          icon = {
            string = icons.wifi.connected,
            color = colors.magenta,
          },
          label = {
            string = ssid,
            color = colors.magenta,
          },
        })
      end)
    else
      wifi:set({
        icon = {
          string = icons.wifi.disconnected,
          color = colors.red,
        },
        label = {
          string = "Disconnected",
          color = colors.red,
        },
      })
    end
  end)
end)
