Scriptname LoreRimStartUp extends Quest

Import MCM

Quest Property RequiemSetupQuest Auto
Spell Property REQ_Ability_Birthsign_ChooseBirthsign Auto
Spell Property Traits_SelectionSpell Auto
Spell Property SkySigns_Ab Auto
WSN_Peryite_Script Property Wintersun Auto
RequiemLite_Config Property RequiemLite Auto
Message Property LoreRimStartup_WelcomeMsg Auto
Message Property LoreRimStartup_ModeMsg Auto
Spell Property LoreRimStartUp_KeyBindingHelpSpell Auto
StartingSkills_Script Property StartingSkills Auto

Int Property Naaktiid_Extra_Perks Auto
{Number of extra perks player gets for choosing Naaktiid mode.}

String sMenu = "HUD Menu"
String sMenuRoot = "_root.HUDMovieBaseInstance.lorerimstart.Menu_mc"

Event OnInit()
    RegisterForMenu("RaceSex Menu")
EndEvent

Event OnMenuClose(String sMenuName)
    UnregisterForAllMenus()
    StartSetup()
EndEvent

Function StartSetup()
    Inject()
    Actor player = Game.GetPlayer()
    Player.RemoveSpell(SkySigns_Ab)

    LoreRimStartup_WelcomeMsg.Show()

    AdvanceWidget(0)

    b612.GetSpinicon().Show("Please wait...")
    Utility.Wait(10) ; Wait for Requiem events to register

    ; trigger Requiem setup
    Debug.ToggleMenus()
    UI.InvokeString("HUD Menu", "_global.skse.OpenMenu", "InventoryMenu")
    UI.InvokeString("HUD Menu", "_global.skse.CloseMenu", "InventoryMenu")
    Debug.ToggleMenus()

    While RequiemSetupQuest.GetStage() != 10
        Utility.Wait(1)
    EndWhile

    ; 1. select Birthsign
    AdvanceWidget(1)
    REQ_Ability_Birthsign_ChooseBirthsign.Cast(player)

    Utility.Wait(1)

    ; 2. major / minor skills
    AdvanceWidget(2)
    StartingSkills.OpenMenu()

    Utility.Wait(1)

    ; 3. Deity
    AdvanceWidget(3)
    Wintersun.ReceiveFreeDeity()
    Wintersun.HideDeityMenu = True

    ; 4. Traits
    AdvanceWidget(4)
    Traits_SelectionSpell.Cast(player)

    While player.HasSpell(Traits_SelectionSpell)
        Utility.Wait(1)
    EndWhile

    ; 5. Game mode
    AdvanceWidget(5)
    Int mode = LoreRimStartup_ModeMsg.Show()
    SetModSettingBool("Requiem Lite", "bEnableLite:Main", mode == 0)
    If mode == 0
        Game.AddPerkPoints(Naaktiid_Extra_Perks)
        RequiemLite.bShowUpdateMessage = False ; disable Requiem lite messages
        RequiemLite.EnableLiteMode()
        RequiemLite.bShowUpdateMessage = True
    EndIf

    b612.GetSpinicon().Hide()

    player.AddSpell(LoreRimStartUp_KeyBindingHelpSpell, False)
    DestroyWidget()
    Stop()
EndFunction

Function Inject()
    string[] args = new string[2]
    args[0] = "lorerimstart"
    args[1] = Utility.RandomInt(1000, 10000)
    UI.InvokeStringA("HUD Menu", "_root.HUDMovieBaseInstance.createEmptyMovieClip", args)
    UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.lorerimstart.loadMovie", "lorerimstartup_inject.swf")
EndFunction

Function AdvanceWidget(Int stage)
    UI.InvokeInt(sMenu, sMenuRoot + ".setCurrent", stage)
EndFunction

Function DestroyWidget()
    UI.Invoke(sMenu, sMenuRoot + ".done")
EndFunction