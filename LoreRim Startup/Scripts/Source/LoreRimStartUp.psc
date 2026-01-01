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

Event OnInit()
    RegisterForMenu("RaceSex Menu")
EndEvent

Event OnMenuClose(String sMenuName)
    UnregisterForAllMenus()
    StartSetup()
EndEvent

Function StartSetup()
    Actor player = Game.GetPlayer()
    Player.RemoveSpell(REQ_Ability_Birthsign_ChooseBirthsign)

    LoreRimStartup_WelcomeMsg.Show()

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
    SkySigns_Ab.Cast(player)

    Utility.Wait(1)

    ; 2. major / minor skills
    StartingSkills.OpenMenu()

    Utility.Wait(1)

    ; 3. Deity
    Wintersun.ReceiveFreeDeity()
    Wintersun.HideDeityMenu = True

    ; 4. Traits
    Traits_SelectionSpell.Cast(player)

    While player.HasSpell(Traits_SelectionSpell)
        Utility.Wait(1)
    EndWhile

    ; 5. Game mode
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
EndFunction