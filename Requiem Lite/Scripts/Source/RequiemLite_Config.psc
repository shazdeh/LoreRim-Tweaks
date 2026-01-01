Scriptname RequiemLite_Config extends Quest

GlobalVariable Property RequiemLite_Enabled Auto
Message Property RequiemLite_DisableMsg Auto
Message Property RequiemLite_EnableMsg Auto
Perk Property RequiemLite_Perk Auto
Bool Property bShowUpdateMessage Auto

String sMenuName = "Journal Menu"
String sMenuRoot = "_root.ReqLite.Menu_mc"
Int cachedValue
Int newValue

Event OnInit()
    Init()
EndEvent

Function Init()
    RegisterForMenu(sMenuName)
EndFunction

Event OnMenuOpen(String asMenuName)
    cachedValue = RequiemLite_Enabled.GetValueInt()
    newValue = cachedValue
    string[] args = new string[2]
    args[0] = "ReqLite_" + cachedValue
    args[1] = "-8108"
    UI.InvokeStringA(sMenuName, "_root.createEmptyMovieClip", args)
    UI.InvokeString(sMenuName, "_root." + args[0] + ".loadMovie", "requiemlite_inject.swf")
    RegisterForModEvent("RequiemLite_UpdateOptions", "onRequiemLite_UpdateOptions")
EndEvent

Event OnMenuClose(String asMenuName)
    UnregisterForModEvent("RequiemLite_UpdateOptions")
    If cachedValue != newValue
        If newValue == 0
            DisableLiteMode()
        Else
            EnableLiteMode()
        EndIf
    EndIf
EndEvent

Event onRequiemLite_UpdateOptions(string eventName, string strArg, float numArg, Form formArg)
    newValue = strArg as Int
EndEvent

Function DisableLiteMode()
    Game.GetPlayer().RemovePerk(RequiemLite_Perk)
    If bShowUpdateMessage
        RequiemLite_DisableMsg.Show()
    EndIf
    RequiemLite_Enabled.SetValueInt(0)
EndFunction

Function EnableLiteMode()
    Game.GetPlayer().AddPerk(RequiemLite_Perk)
    If bShowUpdateMessage
        RequiemLite_EnableMsg.Show()
    EndIf
    RequiemLite_Enabled.SetValueInt(1)
EndFunction