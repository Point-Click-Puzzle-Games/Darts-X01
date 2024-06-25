local composer = require( "composer" )
local scene = composer.newScene()

local modAdmin = require( "modAdmin" )
local modColor = require("modColor")

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

        local txtFooter = display.newText( modAdmin.optionsFooterText )
        grpUI:insert(txtFooter)
        txtFooter:setFillColor( unpack(modColor.black) )



--		
--		if modAdmin.manufacturer() == "Amazon" then txtFooter.y = display.actualContentHeight-50 elseif modAdmin.manufacturer() == "samsung" then txtFooter.y = display.actualContentHeight-140 end
--		if modAdmin.model() == "iPhone" then txtFooter.y = display.actualContentHeight-130 elseif modAdmin.model() == "iPad" then footer.y = display.actualContentHeight-30 end
--		-- print(modAdmin.architectureInfo())
--		if modAdmin.architectureInfo() == "iPhone6" or modAdmin.architectureInfo() == "iPhone5" or modAdmin.architectureInfo() == "iPhone4" then txtFooter.y = display.actualContentHeight-80 end
        


        return true
	end

    local function initialiseAppEnviroment()
        print("need to initialise the entire app enviroment from the T1 splash screen")

        return true
	end

	buildScene()
	initialiseAppEnviroment()

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