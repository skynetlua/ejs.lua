local Render = require "render"


local views_path = "./asset"
local function get_res(path)
    local fullpath = views_path.."/"..path..".html"
    local file = io.open(fullpath, "r")
    if not file then
        fullpath =  views_path.."/"..path..".lua"
        file = io.open(fullpath, "r")
        if not file then
            print("[ERROR]fullpath:", fullpath, debug.traceback())
            assert(false)
            return
        end
    end
    res = file:read("*a")
    file:close()
    return res
end

local viewdatas = {}
local config = {
    description = "ejs.lua come from www.skynetlua.com",
    keywords = "ejs.lua, skynetlua",
    name = "ejs.lua"
}
viewdatas.config = config
local function helloworld(...)
    if select("#", ...) > 0 then
        return "come from helloworld function"..table.concat(... , ", ")
    else
        return "come from helloworld function"
    end
end
viewdatas.helloworld = helloworld

local render = Render(get_res, viewdatas, 1)

-------------------------
--------------------------
local data = {
    topic = {
        title = "hello ejs.lua"
    },
    topics = {
        {
            title = "topic1"
        },{
            title = "topic2"
        }
    }
}

local body = render("index", data)
data.body = body
local html = render("layout", data)

print(html)
