function scanlinesInit()

        scanlinesActive = 1
end

function scanlines()

        love.graphics.setLineWidth(1)
        y = 1

        while y < 720 do

                if y == scanlinesActive then

                        love.graphics.setColor(64, 64, 64, 32)
                else
                        love.graphics.setColor(0, 0, 0, 32)
                end

                love.graphics.line(0, y, 1280, y)

                y = y + 4
        end


        scanlinesActive = scanlinesActive + 4

        if scanlinesActive > 720 then

                scanlinesActive = 1
        end
end