local composer = require( "composer" )
local scene = composer.newScene()

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

        return true
	end
	buildScene()

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