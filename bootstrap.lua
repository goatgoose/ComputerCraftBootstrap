--
-- Created by IntelliJ IDEA.
-- User: goatgoose
-- Date: 7/20/15
-- Time: 8:30 PM
-- To change this template use File | Settings | File Templates.
--

local w, h = term.getSize()

local Button = {}
Button.__index = Button
function Button.new(title)
    local self = setmetatable({}, Button)
    self.title = title
    return self
end
function Button.draw(self, x, y)
    print(x .. y)
    term.setCursorPos(x, y)
    term.write("************")
    term.setCursorPos(x, y + 1)
    term.write("*          *")
    term.setCursorPos(x, y + 2)
    term.write("* " .. self.title)
    term.setCursorPos(x + 12, y + 2)
    term.write("*")
    term.setCursorPos(x, y + 3)
    term.write("*          *")
    term.setCursorPos(x, y + 4)
    term.write("************")

end
function Button.getLength()
    return 12
end
function Button.getWidth()
    return 5
end

local Menu = {}
Menu.__index = Menu
function Menu.new(title)
    local self = setmetatable({}, Menu)
    self.title = title
    self.buttons = {}
    self.pageNumber = 1
    return self
end
function Menu.draw(self)
    term.clear()
    for i = 1, #self.buttons do
        local button = self.buttons[i]
        if i == 1 then
            button:draw(w + 1, 5)
        elseif i == 2 then
            button:draw(w/2 - button.getLength()/2, 5)
        elseif i == 3 then
            button:draw(w - button.getLength() - 1, 5)
        end
    end
end
function Menu.addButton(self, button)
    self.buttons.insert(button)
    self.draw()
end

local button = Button:new("test")
button:draw(1,1)