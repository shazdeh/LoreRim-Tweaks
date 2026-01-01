Scriptname LoreRim_OghmaBookReward extends Quest  

String[] Property ActorValues Auto
Actor Property Player Auto

Int iDoneKey
Int iResetKey

Function OpenMenu()
    RegisterForModEvent("StartingSkills_SetSkills", "OnSetSkills")
    iDoneKey = Input.GetMappedKey("Ready Weapon")
    iResetKey = Input.GetMappedKey("Jump")
    UI.OpenCustomMenu("StartingSkills_movie")
    Utility.WaitMenuMode(0.1)
    Int[] args = new Int[6]
    args[0] = 6 ; number of minor skills
    args[1] = 0 ; number of majors
    args[2] = 5 ; minor reward
    args[3] = 0 ; major reward
    args[4] = iResetKey
    args[5] = iDoneKey
    UI.InvokeIntA("CustomMenu", "_root.Menu_mc.setConfig", args)
    UI.InvokeString("CustomMenu", "_root.Menu_mc.setData", Serialize())
    RegisterForKey(iResetKey)
    RegisterForKey(iDoneKey)
    UI.Invoke("CustomMenu", "_root.Menu_mc.render")
EndFunction

Event OnSetSkills(string eventName, string strArg, float numArg, Form formArg)
    String[] skills = StringUtil.Split(strArg, "|")
    Int i
    CloseMenu()
    While i < skills.Length
        String[] skillData = StringUtil.Split(skills[i], ",")
        Int iAV = skillData[0] as Int
        String sAV = ActorValues[iAV]
        Int value = skillData[2] as Int
        If value > 100
            value = 100
        EndIf
        Player.SetActorValue(sAV, value)
        i += 1
    EndWhile
EndEvent

Event CloseMenu()
    UnregisterForAllKeys()
    UI.CloseCustomMenu()
    UnregisterForModEvent("StartingSkills_SetSkills")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == iDoneKey
        UI.Invoke("CustomMenu", "_root.Menu_mc.closeMenu")
    ElseIf KeyCode == iResetKey
        UI.Invoke("CustomMenu", "_root.Menu_mc.reset")
    EndIf
EndEvent

String Function Serialize()
    String result = ""
    Int i
    While i < ActorValues.Length
        result += Player.GetAV(ActorValues[i]) + ","
        i += 1
    EndWhile

    Return result
EndFunction