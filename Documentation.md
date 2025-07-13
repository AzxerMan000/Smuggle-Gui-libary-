# SmuggleUI Library

This documentation is for the stable release of SmuggleUI Library, a modular Roblox GUI framework with tabs, togges and even Buttons

---

## Booting the Library

```lua
local SmuggleGui = loadstring(game:HttpGet("https://pastefy.app/sVDPCfPe/raw"))()
```

## Creating GUI

this is the main thing so you stick this thing to your usage script.

```lua

local gui = SmuggleGui.new("My GUI")

```

## Creating the TAB

this is the tab if you dont have one you cant load toggles or Button.

```lua

local exampleTab = gui:AddTab("ExampleTab")

```

## Adding button To Your tab.


adding buttons is main thing so its highly Recommended.


```lua

exampleTab:AddButton("example", function(state)
    print("example pressed.:",state)
end)

```

## toggle buttons 

this is optional so you can add or not add

```lua

exampleTab:AddToggle("example", function(state)
    print("example toggled.:", state)
-- put your script here or what ever print you wanna add
end)

```

## Thats all i can tell new updates will come soon TOMORROW 

key system commin you excited?
