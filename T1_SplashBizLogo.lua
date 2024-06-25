local composer = require( "composer" )
local scene = composer.newScene()

local modAdmin = require( "modAdmin" )
local modLang = require( "modLanguage" )
local modColor = require( "modColor" )

function scene:create( event )
	local sceneGroup = self.view

    local function buildScene()
        local grpBG = display.newGroup()
		sceneGroup:insert( grpBG )
		local grpFG = display.newGroup()
		sceneGroup:insert( grpFG )
		local grpUI = display.newGroup()
		sceneGroup:insert( grpUI )

        local imgBackground = display.newImageRect( grpBG, "Images/background.png", 1024, 1024 )
		imgBackground.x = display.contentCenterX
		imgBackground.y = display.contentCenterY
        
        local imgLogo = display.newImageRect( grpFG, "Images/P&CPGs_Logo.png", 200, 200 )
		imgLogo.x = display.contentCenterX
		imgLogo.y = display.contentCenterY


		local function buildFooter()
			grpFooter = display.newGroup()
			grpUI:insert( grpFooter )

			local lblLoading = display.newText(modAdmin.optionsFooterText)
			grpFooter:insert(lblLoading)
			lblLoading:setFillColor( unpack(modColor.black) )

			grpFooter.anchorChildren = true 
			grpFooter.anchorX = 0.5
			grpFooter.anchorY = 1 
			grpFooter.x = display.contentCenterX
			grpFooter.y = display.contentCenterY
			grpFooter.y = grpFooter.y + (display.actualContentHeight/2) - 30

			return true
		end
		buildFooter()


        return true
	end
	buildScene()

	local function initialiseAppEnviroment()
		-- language management
		modLang.loadLanguage()

	end
	initialiseAppEnviroment()

end

function scene:show( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then

	elseif ( phase == "did" ) then

		local function gotoM1( event )
			composer.gotoScene( "M1_MainMenu", { time=1000, effect="crossFade" } )
		end
		timer.performWithDelay( 1000, gotoM1 )

    end
end

function scene:hide( event )
	local sceneGroup = self.view
	local phase = event.phase

	if ( phase == "will" ) then
	elseif ( phase == "did" ) then

		composer.removeScene( "T1_SplashBizLogo" )
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