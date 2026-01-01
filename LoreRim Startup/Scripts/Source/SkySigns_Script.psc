Scriptname SkySigns_Script extends activemagiceffect

Import b612
Import PO3_SKSEFunctions
Import StringUtil

Spell Property SkySigns_Ab Auto
FormList Property SkySigns_SpellList Auto
b612_TraitsMenu Property TraitsMenu Auto
Message Property SkySigns_NoSelectionMsg Auto
ObjectReference[] Property ActivatorList Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.RemoveSpell(SkySigns_Ab)
    ShowMenu()
EndEvent

Function ShowMenu()
    GetSpinicon().Show("$SKYSIGN_LOADING")
    TraitsMenu.Init()
    Int i = 0
    Int size = SkySigns_SpellList.GetSize()
    While i < size
        Spell thisSpell = SkySigns_SpellList.GetAt(i) as Spell
        String sEditorID = GetFormEditorID(thisSpell)
        String sDescription = GetDescription(thisSpell)
        sDescription = FormatDescription(sDescription)
        TraitsMenu.AddItem(thisSpell.GetName(), sDescription, "SkySigns/" + sEditorID + ".dds")
        i += 1
    EndWhile
    GetSpinicon().Hide()
    String[] result = TraitsMenu.Show(aiMaxSelection = 1, aiMinSelection = 1)

    If ! result || result.Length == 0
        If SkySigns_NoSelectionMsg.Show() == 0
            ShowMenu()
        EndIf
    Else
        i = 0
        While i < result.Length
            Int selectedIndex = result[i] as Int
            Game.GetPlayer().AddSpell(SkySigns_SpellList.GetAt(selectedIndex) as Spell)
            i += 1
        EndWhile
    EndIf
EndFunction

; add support for CK's way of <bolding text>
; both GetNthChar and Substring mess up string's text casing
String Function FormatDescription(String desc)
    String sResult
    String[] parts1 = StringUtil.Split(desc, "<")
    Int i
    While i < parts1.Length
        If i != 0
            sResult += "<b>"
        EndIf
        String[] parts2 = StringUtil.Split(parts1[i], ">")
        String part = ""
        Int j = 0

        While j < parts2.Length
            If j != 0
                sResult += "</b>"
            EndIf
            sResult += parts2[j]
            j += 1
        EndWhile
        i += 1
    EndWhile

    Return sResult
EndFunction
