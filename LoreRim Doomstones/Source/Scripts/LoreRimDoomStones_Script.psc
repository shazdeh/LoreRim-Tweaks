Scriptname LoreRimDoomStones_Script extends Quest  

Import PO3_SKSEFunctions
Import b612

FormList Property LoreRimDoomstones_List Auto
FormList Property LoreRimDoomstones_SpellsList Auto
Actor Property PlayerRef Auto
b612_TraitsMenu Property TraitsMenu Auto
String[] Property ImageNames Auto
Spell Property LoreRimDoomstones_StatMonitorAb Auto
Spell Property LoreRimDoomstones_DoomSelectionPower Auto
MagicEffect Property CrownEffect Auto

Event OnInit()
    Utility.Wait(5)
    Game.GetPlayer().AddSpell(LoreRimDoomstones_StatMonitorAb, False)
EndEvent

Function OnActivateStone(Activator doomStone)
    Int index = LoreRimDoomstones_List.Find(doomStone)
    If index == -1
        Return
    EndIf

    Int keep = 0
    If PlayerRef.HasMagicEffect(CrownEffect)
        ; we're wearing the crown, keep 2 effects, dispel the rest
        keep = 2
    EndIf
    DispellAllDoomstones(keep)

    (LoreRimDoomstones_SpellsList.GetAt(index) as Spell).Cast(PlayerRef)
EndFunction

Function DispellAllDoomstones(Int iKeep = 0)
    Int i = LoreRimDoomstones_SpellsList.GetSize()
    While i != 0
        i -= 1
        Spell thisSpell = LoreRimDoomstones_SpellsList.GetAt(i) as Spell
        If HasActiveSpell(PlayerRef, thisSpell)
;            debug.Notification(GetFormEditorID(thisSpell))
            If iKeep > 0
                iKeep -= 1
            Else
                PlayerRef.DispelSpell(thisSpell)
            EndIf
        EndIf
    EndWhile
EndFunction

Function ShowSelection()
    GetSpinicon().Show("$SKYSIGN_LOADING")
    TraitsMenu.Init()
    Int i = 0
    Int size = LoreRimDoomstones_SpellsList.GetSize()
    While i < size
        Spell thisSpell = LoreRimDoomstones_SpellsList.GetAt(i) as Spell
        String sEditorID = GetFormEditorID(thisSpell)
        String sDescription = GetDescription(thisSpell)
        TraitsMenu.AddItem(thisSpell.GetName(), sDescription, "SkySigns/" + ImageNames[i] + ".dds")
        i += 1
    EndWhile
    GetSpinicon().Hide()
    Int max = 1
    If PlayerRef.HasMagicEffect(CrownEffect)
        max = 3
    EndIf
    String[] result = TraitsMenu.Show(aiMaxSelection = max, aiMinSelection = 0)

    DispellAllDoomstones()
    i = 0
    While i < result.Length
        Int selectedIndex = result[i] as Int
        (LoreRimDoomstones_SpellsList.GetAt(selectedIndex) as Spell).Cast(PlayerRef)
        i += 1
    EndWhile
EndFunction

Function OnAetherialCrownEquip()
    PlayerRef.AddSpell(LoreRimDoomstones_DoomSelectionPower)
EndFunction

Function OnAetherialCrownUnequip()
    DispellAllDoomstones()
    If Game.QueryStat("Standing Stones Found") < LoreRimDoomstones_List.GetSize()
        PlayerRef.RemoveSpell(LoreRimDoomstones_DoomSelectionPower)
    EndIf
EndFunction