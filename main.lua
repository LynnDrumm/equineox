-- include files
require "rotozoom"
require "plasma"
require "chessboard"
require "plasma2"
require "dots"
require "plasma3"
require "kefrens"
require "flash"
require "scanlines"
require "dycp2"

function love.load()

        print("Demoralization/L�ve demosystem initializing\n \nSetting screenmode:\n")

        dmScreenW       = 1280
        dmScreenH       = 720
        dmFullscreen    = false
        dmVsync         = true
        dmBorderless    = true
        dmFsaa          = true

        print("         Resolution:     "..tostring(dmScreenW).." * "..tostring(dmScreenH))
        print("         Fullscreen:     "..tostring(dmFullscreen))
        print("         vsync:          "..tostring(dmVsync))
        print("         Borderless:     "..tostring(dmBorderless))
        print("         FSAA:           "..tostring(dmFsaa).."\n")

        love.window.setMode(dmScreenW, dmScreenH, {fullscreen=dmFullscreen, vsync=dmVsync, borderless=dmBorderless, msaa=dmFsaa})

        --- disable mouse

        love.mouse.setVisible( invisible )

        --- set global variables here ---

        c          = 0
        debugMode  = 0

        -- TODO: much much better init routine and way to wait for fullscreen
        -- function and way to handle this kinda shit. Fo reals.

        activePart = rotozoom

        -- set music here

        music = love.audio.newSource("cowbell.mp3", static)

        if dmFullscreen == true then

                --actualActivePart = activePart
                --activePart       = fullscreenWait
        end

        print("\ndebugMode: "..tostring(debugMode))

        -- define global fonts

        debugFont   = love.graphics.newFont("lucon.ttf", 32)

        overlayFont = love.graphics.newFont("aaaiight-fat.ttf", 48)
        overlayFont:setLineHeight( .5 )

        -- init parts

        plasmaInit()
        plasma2Init()
        plasma3Init()
        dotsInit()
        rotozoomInit()
        chessboardInit()
        kefrensInit()
        flashInit()
        scanlinesInit()
        dycp2Init()

        -- open canvas

        canvas = love.graphics.newCanvas(dmScreenW, dmScreenH)

        -- start playing music
        music:play()
end

function fullscreenWait()

        r, g, b = HSV(0, 0, (math.sin(c * 2) * 128) + 128)

        love.graphics.setColor(r, g, b)
        love.graphics.setFont(overlayFont)
        love.graphics.print("Waiting for fullscreen...", 100, 100)

        if c > 3 then

                c = 0
                activePart = actualActivePart
        end
end

function love.update()

        dt = love.timer.getDelta()
        c  = c + dt
end

function love.draw()

        love.graphics.setCanvas(canvas)
        love.graphics.clear()

        love.graphics.push()
        activePart()
        love.graphics.pop()

        love.graphics.setCanvas()
        love.graphics.setColor(255, 255, 255, 255)
        love.graphics.draw(canvas, 0, 0)

        flash()
        --flicker()
        scanlines()

        if debugMode == 1 then

                --- debug display ---

                love.graphics.scale(.5, .5)
                love.graphics.setFont(debugFont)

                width, height = love.window.getMode( )

                local fps = love.timer.getFPS( )
                local art = math.floor(love.timer.getDelta() * 1000)

                --drop shadow
                love.graphics.setColor(0, 0, 0)
                love.graphics.print("FPS: "..tostring(fps), 4, 2)
                love.graphics.print("FRT: "..tostring(art).."ms", 4, 34)
                love.graphics.print("  C: "..tostring(c), 4, 66)
                love.graphics.print("     PREVIEW VERSION, DON'T SPREAD!", 4, 98)

                --normal text

                -- change fps color based on fps

                if fps >= 60 then

                        love.graphics.setColor(0, 255, 0)

                elseif fps >= 30 and fps < 60 then

                        love.graphics.setColor(255, 255, 0)
                else

                        love.graphics.setColor(255, 0, 0)
                end

                love.graphics.print(tostring(fps), 95, 0)

                love.graphics.setColor(255,255,255)
                love.graphics.print("FPS: ", 2, 0)
                love.graphics.print("FRT: "..tostring(art).."ms", 2, 32)
                love.graphics.print("  C: "..tostring(c), 2, 64)
                love.graphics.print("     PREVIEW VERSION, DON'T SPREAD!", 2, 96)
        end


end

function love.keypressed(key)

        if key == "escape" then

                love.event.push("quit")

        elseif key == "f3" then

                if debugMode == 1 then

                        debugMode = 0
                else

                        debugMode = 1
                end

        elseif key == "f11" then

                if love.window.getFullscreen() == false then

                        love.window.setFullscreen(true)
                else

                        love.window.setFullscreen(false)
                end

        elseif key == "f1" then

                print(c)
        end
end

-- hsv to rgb function taken from love2d wiki <3
function HSV(h, s, v)

        if s <= 0 then return v,v,v end

        h, s, v = h/256*6, s/255, v/255

        local c = v*s
        local x = (1-math.abs((h%2)-1))*c
        local m,r,g,b = (v-c), 0,0,0
        if h < 1     then r,g,b = c,x,0
        elseif h < 2 then r,g,b = x,c,0
        elseif h < 3 then r,g,b = 0,c,x
        elseif h < 4 then r,g,b = 0,x,c
        elseif h < 5 then r,g,b = x,0,c
        else              r,g,b = c,0,x
        end return (r+m)*255,(g+m)*255,(b+m)*255
end