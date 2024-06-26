local composer = require( "composer" )
local scene = composer.newScene()

local modAdmin = require( "modAdmin" )
local modLang = require( "modLanguage" )
local modColor = require( "modColor" )

local grpBG
local grpFG
local grpUI
local grpHeader

local arrMenu = {}

function scene:create( event )
	local sceneGroup = self.view

    grpBG = display.newGroup()
    sceneGroup:insert( grpBG )
    grpFG = display.newGroup()
    sceneGroup:insert( grpFG )
    grpUI = display.newGroup()
    sceneGroup:insert( grpUI )

    local function buildScene()

        grpHeader = display.newGroup()
        grpFG:insert(grpHeader)

        local imgBackground = display.newImageRect( grpBG, "Images/background.png", 1024, 1024 )
		imgBackground.x = display.contentCenterX
		imgBackground.y = display.contentCenterY

            local function buildHeader()

                local imgLogo = display.newImageRect(grpHeader, "Images/logo_100px.png", 50, 50)
                imgLogo.x = display.contentCenterX
                imgLogo.y = display.contentCenterY - 20

                local lblTitle = display.newText(modAdmin.optionsH1)
                lblTitle.text = modLang.get("mainmenu")
                grpHeader:insert(lblTitle)
                lblTitle:setFillColor( unpack(modColor.black) )
                lblTitle.x = display.contentCenterX
                lblTitle.y = display.contentCenterY +20

                grpHeader.anchorChildren = true
                grpHeader.anchorX = 0.5
                grpHeader.anchorY = 0
                grpHeader.x = display.contentCenterX
                grpHeader.y = display.contentCenterY
                grpHeader.y = grpHeader.y - (display.actualContentHeight/2) + 30

                return true
            end
            buildHeader()
        
        return true
	end

    local function buildMenu()

        local grpMenu = display.newGroup()
        grpUI:insert(grpMenu)

        local arrGames = modAdmin.listOfGames()
        local startY = display.contentCenterY

        for i, v in ipairs(arrGames) do
            local btn = display.newRoundedRect( grpMenu, display.contentCenterX, startY, display.actualContentWidth-60, 40, 13 )
            btn:setFillColor( unpack(modColor.black) )

            btn.name = display.newText(modAdmin.optionsBtnsMenu)
            btn.name.text = tostring(v)
            btn.name:setFillColor( unpack(modColor.white) )
            grpMenu:insert(btn.name)
            btn.name.x = btn.x
            btn.name.y = btn.y

            startY = startY + btn.height + 10 
            table.insert(arrMenu, btn)        
        end

        grpMenu.anchorChildren = true
        grpMenu.anchorX = 0.5
        grpMenu.anchorY = 0.5
        grpMenu.x = display.contentCenterX
        grpMenu.y = display.contentCenterY

        return true
    end

	buildScene()
    buildMenu()

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

	elseif ( phase == "did" ) then

        local function takeAction(event) 
            if (event.phase == "began") then 	
                display.getCurrentStage():setFocus( event.target )
                event.target.isFocus = true 
                event.target.xScale = 0.90 
                event.target.yScale = 0.90
        --         -- modAudio.getSFX("playBtnTap")
            elseif (event.phase == "ended" or event.phase == "cancelled") then
                event.target.xScale = 1  
                event.target.yScale = 1
                display.getCurrentStage():setFocus( nil )
                event.target.isFocus = nil

                for i, v in ipairs(arrMenu) do
                    local fileName = tostring("G"..i.."_Settings")
                    if event.target.name.text == arrMenu[i].name.text then composer.gotoScene( fileName, { time=1000, effect="crossFade" } ) end
                    fileName = nil
                end
                

                -- elseif event.target == btnSettings then modAdmin.cutScene("M2_Settings","NORMAL")

                event = nil
            end
        end

        for i, btn in ipairs(arrMenu) do 
            btn:addEventListener("touch", takeAction)
        end







    end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
	elseif ( phase == "did" ) then

		composer.removeScene( "M1_MainMenu" )
	end
end

function scene:destroy( event )
	local sceneGroup = self.view
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )

return scene