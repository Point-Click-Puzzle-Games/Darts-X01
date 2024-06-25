local mod = {}
    local composer = require( "composer" ) -- use the composer engine and library

    mod.optionsFooterText = {
        text = "Version: 2024.07 (1)\n© 2024 - Angela McCall\nwww.PointClickPuzzle.games",     
        x = display.contentCenterX,
        y = display.actualContentHeight-150,
        width = display.safeActualContentWidth - 50,
        font = "Fonts/Proximity-Black.ttf",   
        fontSize = 14,
        align = "center"
    } 


    
return mod