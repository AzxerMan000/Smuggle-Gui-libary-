# SmuggleUI Library

This documentation is for the stable release of SmuggleUI Library, a modular Roblox GUI framework with tabs, togges and even Buttons

---

## Booting the Library

```lua
local SmuggleGui = loadstring(game:HttpGet("https://pastefy.app/DErxDuNa/raw"))
```

## Creating GUI

this is the main thing so you stick this thing to your usage script.

```lua

local gui = SmuggleGui.new("untitled")

```

## Creating the TAB

this is the tab if you dont have one you cant load toggles or Button.

```lua

local exampleTab = gui:AddTab("ExampleTab")

 --        ↑
  --     you have to rename this first before giving it name
```

## Adding button To Your tab.


adding buttons is main thing so its highly Recommended.


```lua

exmapleTab:AddButton("example", function()
--your script of whatever print you wanna add
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

