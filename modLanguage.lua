local mod = {}

    local json = require( "json" )
    local pathLanguage = system.pathForFile( "language.json", system.DocumentsDirectory )

    -- local arrlanguages = { en, sp, fr, pl, zh, ja, dl, de, no, sv, fi, tr, el, cs, it, pt } 

    local currentLanguage

    function mod.saveLanguage(langIn)
        local language = langIn
        if language then 
            string.lower(language) 
        else 
            language = "en" 
        end
        
        local fileLanguage = io.open( pathLanguage, "w" )
        if fileLanguage then
            fileLanguage:write( json.encode( string.lower(language) ) )
            io.close( fileLanguage )
        end
        return true
    end

    local languageBackup
    function mod.setLanguage(langIn)
        if langIn == "EN" then currentLanguage = "en" --english
        elseif langIn == "SP" then currentLanguage = "sp" --spanish
        elseif langIn == "FR" then currentLanguage = "fr" --french
        elseif langIn == "PL" then currentLanguage = "pl" --polish
        elseif langIn == "ZH" then currentLanguage = "zh" --chinese
        elseif langIn == "JA" then currentLanguage = "ja" --japanese
        elseif langIn == "DL" then currentLanguage = "dl" --dutch
        elseif langIn == "DE" then currentLanguage = "de" --german
        elseif langIn == "NO" then currentLanguage = "no" --norwegian
        elseif langIn == "SV" then currentLanguage = "sv" --swedish
        elseif langIn == "FI" then currentLanguage = "fi" --finnish
        elseif langIn == "TR" then currentLanguage = "tr" --turkish
        elseif langIn == "EL" then currentLanguage = "el" --greek
        elseif langIn == "CS" then currentLanguage = "cs" --czech
        elseif langIn == "IT" then currentLanguage = "it" --italian
        elseif langIn == "PT" then currentLanguage = "pt" --portugese
        else currentLanguage = "en" --english
        end
        languageBackup = currentLanguage
        return true
    end

    function mod.revertSetLanguage()
         currentLanguage = languageBackup
        return true
    end

    function mod.get(key)  
        return mod[string.lower(currentLanguage)][key]
    end

    function mod.loadLanguage()
        local fileLanguage = io.open( pathLanguage, "r" )
        if fileLanguage then
            local contents = fileLanguage:read( "*a" )
            io.close( fileLanguage )
            currentLanguage = json.decode( contents )
        else
            currentLanguage = "en"
            mod.saveLanguage(currentLanguage)
        end
        return currentLanguage
    end

    mod.en = { --english
        mainmenu = "Main Menu",
        welcome = "Welcome to Darts-X01",
    
    }

    mod.sp = { --spanish
        welcome = "Bienvenido a Darts-X01",
    }

    mod.fr = { --french
        welcome = "Bienvenue à Darts-X01",
    }

    mod.pl = { --polish
        welcome = "Witaj na Darts-X01", 
    }

    mod.zh = { -- chinese simplified
        welcome = "Huānyíng lái dào Darts-X01",
    }

    mod.dl = { -- dutch
        welcome = "Welkom bij Darts-X01",
    }

    mod.de = { -- german
        welcome = "Willkommen bei Darts-X01",
    }

    mod.no = { -- norwegian
        welcome = "Velkommen til Darts-X01",
    }

    mod.sv = { -- swedish
        welcome = "Välkommen till Darts-X01",
    }

    mod.fi = { -- finnish
        welcome = "Tervetuloa Darts-X01",
    }

    mod.tr = { -- turkish
        welcome = "Hoş geldiniz Darts-X01",
    }

    mod.el = { -- greek
        welcome = "Kalós oríste sto Darts-X01",
    }

    mod.cs = { --czech
        welcome = "Vítejte v Darts-X01",
    }

    mod.it = { --italian
        welcome = "Benvenuto a Darts-X01",
    }

    mod.pt = { --portugese
        welcome = "Bem-vindo a Darts-X01",
    }

return mod