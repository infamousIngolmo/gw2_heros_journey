:: You must replace YOUR PACKS NAME and YOUR XMLS NAME in order to use
:: ex: packname = "TehsTrails"
set pack_name = "HerosJourney"



:: deletes existing pack
del ".\%pack_name%.taco"

:: uses WinRar to create a zip out of \Data and \YOUR XML
"%ProgramFiles%\WinRAR\WinRAR.exe" a -afzip -ep1 -ibck -r -y ".\%pack_name%.zip" ".\Data" ".\%pack_name%.xml"

:: renames the zip to taco
rename "%pack_name%.zip" "%pack_name%.taco"
