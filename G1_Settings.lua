local composer = require( "composer" )
local scene = composer.newScene()

local modAdmin = require( "modAdmin" )
local modLang = require( "modLanguage" )
local modColor = require( "modColor" )

local grpBG
local grpFG
local grpUI
local grpHeader

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
                lblTitle.text = "X01 Scorer"
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
	end	buildScene()

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

	elseif ( phase == "did" ) then

    end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
	elseif ( phase == "did" ) then

		composer.removeScene( "G1_Settings" )
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