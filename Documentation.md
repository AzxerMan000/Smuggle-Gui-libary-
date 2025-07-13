# SmuggleUI Library

This documentation is for the stable release of SmuggleUI Library, a modular Roblox GUI framework with tabs, togges and even Buttons

---

## Booting the Library

```lua
local SmuggleGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/AzxerMan000/Smuggle-Gui-libary-/refs/heads/main/The%20GUI"))()
```

## Creating GUI

this is the main thing so you stick this thing to your usage script.

```lua

local gui = SmuggleGui.new("My GUI", {

```

## key system
put this below local gui = SmuggleGui.new("", {

```lua

   useKeySystem = true,
    correctKey = "supersecret", -- change to your key
    keyLink = "https://your-get-key-link.com", -- change to your URL
})

```

## Creating the TAB

this is the tab if you dont have one you cant load toggles or Button.

```lua

task.wait(3)

local mainTab = gui:AddTab("ExampleTab")

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

## thats all what are you lookin dude?
