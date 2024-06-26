local mod = {}
    local composer = require( "composer" ) 

    mod.optionsFooterText = {
        text = "Version: 2024.07 (1)\n© 2024 - Angela McCall\nwww.PointClickPuzzle.games",     
        x = display.contentCenterX,
        y = display.actualContentHeight-150,
        width = display.safeActualContentWidth - 50,
        font = "Fonts/Proximity-Black.ttf",   
        fontSize = 14,
        align = "center"
    } 

    mod.optionsH1 = {  -- pageTitles
        text = "xxx",     
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = display.safeActualContentWidth-50,
        font = "Fonts/ShowcardGothic.ttf",   
        fontSize = 30,
        align = "center",
    }

    mod.optionsBtnsMenu = {  
        text = "xxxx xxxx",     
        x = display.contentCenterX,
        y = display.contentCenterY,
        width = display.safeActualContentWidth-50,
        font = "Fonts/Proximity-Black.ttf",   
        fontSize = 20,
        align = "center",
    }

    function mod.listOfGames()
        print ("test")
        local arrGames = {
            "X01 Scorer",
            "Round The Clock",
            "Cricket",
            "121",
            "Hello World"
        }
        return arrGames
    end


    
return mod