cw = 777
ch = 472

human = {}
comp = {}

function love.load()
    
    require "load.fonts"
    
    love.window.setMode(cw,ch,{resizable=false, vsync = false })
    love.window.setTitle('DICE')
    love.graphics.setBackgroundColor(0,0,0)
    --context
    math.randomseed(os.time())
    human.img = love.graphics.newImage('img/digital-die0.png')
    human.win = false
    comp.img = love.graphics.newImage('img/digital-die0.png')
    -- comp.img = love.graphics.newImage('img/comp-die0.png')
    start = true
    --player = math.random(1,20)
    --computer = math.random(1,20)
    --for context
    human.name = "human"
    comp.name = "Computer"
    human.roll = 0
    comp.roll = 0
    font = love.graphics.setNewFont("font/LeagueMono-Regular.ttf",72)
    fontBig = love.graphics.setNewFont("font/LeagueMono-Regular.ttf",80)

end

function love.draw()
    -- love.graphics.setColor(1,1,1)
    if start == false then
        -- do something here
        love.graphics.setFont( font )
        -- love.graphics.setDefaultFilter("nearest", "nearest")
        if human.roll == comp.roll then
            love.graphics.setColor(1,1,1)
            love.graphics.printf("Tie!",0,ch-76,cw,'center')
            love.graphics.setColor(1,1,1)
        elseif human.win == true then
            love.graphics.setColor(0.2,1,0.2)
            love.graphics.printf(human.name.." wins!",0,ch-76,cw,'center')
            love.graphics.setColor(1,1,1)
        else        
            love.graphics.setColor(1,0.2,0.2)
            love.graphics.printf(comp.name.." wins!",0,ch-76,cw,'center')
            love.graphics.setColor(1,1,1)
        end
        -- love.graphics.print("A"..human.roll,15,ch-86)
        -- love.graphics.print("A"..human.roll,153,ch-320)
        --love.graphics.setScissor(153, ch-320, 90, 90 )
        -- love.graphics.setColor(1,1,1)
        -- love.graphics.printf("A"..human.roll,15,ch-86,cw,'left')
        -- love.graphics.printf("A"..human.roll,153,ch-320,cw,'left')
        -- love.graphics.setScissor()
        
    else
        love.graphics.printf("Click to roll",0,ch-76,cw,'center')
        -- love.graphics.printf("Player:"..player,0,0,100)
        -- love.graphics.printf("Computer:"..computer,0,10,100)
        -- if player > computer then
        --     love.graphics.printf("Player wins!",0,view_h*0.5,view_w*0.5,'center')
        -- elseif player == computer then
        --     love.graphics.printf("Empate!",0,view_h*0.5,view_w*0.5,'center')
        -- else
        --     love.graphics.printf("Computer wins!",0,view_h*0.5,view_w*0.5,'center')
        -- end
    end
    love.graphics.draw(human.img,33,30,0,0.2,0.2)
    love.graphics.draw(comp.img,cw*0.5,30,0,0.2,0.2)

    -- love.graphics.setBlendMode('alpha', 'alphamultiply')
    -- human.text = love.graphics.newText(font,human.roll)
    -- comp.text = love.graphics.newText(font,comp.roll)
    -- love.graphics.draw(human.text,153,ch-320)
    -- love.graphics.draw(comp.text,250,ch-320)

    --love.graphics.setColor(128/255,128/255,0)
    -- love.graphics.setColor(134/255,134/255,132/255)
    -- love.graphics.setFont( fontBig )
    -- love.graphics.printf(human.roll,0,ch-325,cw/2 + 11,'center')

    --love.graphics.setColor(1,1,1)
    love.graphics.setColor(75/255,0,130/255)
    love.graphics.setFont( font )
    love.graphics.printf(human.roll,0,ch-320,cw/2 + 11,'center')


    
    -- love.graphics.setColor(180/255,42/255,202/255)
    -- love.graphics.setColor(180/255,42/255,202/255)
    -- love.graphics.setFont( fontBig )
    -- love.graphics.printf(comp.roll,cw/2 - 25,ch-325,cw/2,'center')

    love.graphics.setColor(1,1,1)
    love.graphics.setColor(0,1,1)
    love.graphics.setFont( font )
    love.graphics.printf(comp.roll,cw/2 - 25,ch-320,cw/2,'center')



    love.graphics.setColor(1,1,1)
    
    -- love.graphics.setFont( font_3x5_4 )
    -- love.graphics.print( 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789', 16, 16 )
end

-- function love.mousemoved( x, y, dx, dy, istouch )
--     print("X:"..x.."Y:"..y)
-- end

function love.mousereleased(x,y, button)


    -- print " "..button
    if button == 1 then
        if x > cw/2 then
            comp.name = "human"
            human.name = "computer"
        else
            comp.name = "computer"
            human.name = "human"
        end

        --function love.mouserelased()
        start = false
        comp.roll = math.random(1,6)
        human.roll = math.random(1,6)
        -- set graphics
        human.img = love.graphics.newImage('img/digital-die'..human.roll..'.png')
        comp.img = love.graphics.newImage('img/comp-die'..comp.roll..'.png')
        -- love.graphics.printf(human.roll,0,0,1,'center')
        --love.graphics.printf()
        if human.roll > comp.roll then
            human.win = true
        else
            human.win = false
        end
    end

    if button == 2 then        
        comp.roll = math.random(1,6)
        human.roll = math.random(1,6)
        if comp.roll == human.roll then
            if  comp.roll == 1 then
                comp.roll = comp.roll +1
            else
                human.roll = human.roll-1
            end
        end
        if human.roll > comp.roll then
            temp = comp.roll
            comp.roll = human.roll
            human.roll = temp
        end
        human.win = false;
    end
    
    if button == 3 then        
        comp.roll = math.random(1,6)
        human.roll = math.random(1,6)
        if comp.roll == human.roll then
            if  human.roll == 1 then
                human.roll = human.roll +1
            else
                comp.roll = comp.roll-1
            end
        end
        if comp.roll > human.roll then
            temp = comp.roll
            comp.roll = human.roll
            human.roll = temp
        end
        human.win = true;
    end
end