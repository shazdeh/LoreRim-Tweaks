Scriptname Traits_AutodidactScript extends activemagiceffect

Import PO3_Events_AME
Import Traits_Utils

Actor Property PlayerRef Auto
Traits_MCM Property Config Auto
FormList Property ExcludeList Auto

Bool bDestruction25
Bool bDestruction50
Bool bDestruction75
Bool bDestruction100
Bool bAlteration25
Bool bAlteration50
Bool bAlteration75
Bool bAlteration100
Bool bRestoration25
Bool bRestoration50
Bool bRestoration75
Bool bRestoration100
Bool bConjuration25
Bool bConjuration50
Bool bConjuration75
Bool bConjuration100
Bool bIllusion25
Bool bIllusion50
Bool bIllusion75
Bool bIllusion100

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForSkillIncrease(Self)

    ; retroactive
    OnSkillIncrease(18)
    OnSkillIncrease(19)
    OnSkillIncrease(20)
    OnSkillIncrease(21)
    OnSkillIncrease(22)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForSkillIncrease(Self)
EndEvent

Event OnSkillIncrease(Int aiSkill)
    If aiSkill == 18 ; Alteration
        If PlayerRef.GetBaseAV("Alteration") >= 25 && ! bAlteration25
            bAlteration25 = True
            AddTheSpells("Alteration", 25, "<=")
        EndIf
        If PlayerRef.GetBaseAV("Alteration") >= 50 && ! bAlteration50
            bAlteration50 = True
            AddTheSpells("Alteration", 50)
        EndIf
        If PlayerRef.GetBaseAV("Alteration") >= 75 && ! bAlteration75
            bAlteration75 = True
            AddTheSpells("Alteration", 75)
        EndIf
        If PlayerRef.GetBaseAV("Alteration") >= 100 && ! bAlteration100
            bAlteration100 = True
            AddTheSpells("Alteration", 100)
        EndIf
    ElseIf aiSkill == 19 ; Conjuration
        If PlayerRef.GetBaseAV("Conjuration") >= 25 && ! bConjuration25
            bConjuration25 = True
            AddTheSpells("Conjuration", 25, "<=")
        EndIf
        If PlayerRef.GetBaseAV("Conjuration") >= 50 && ! bConjuration50
            bConjuration50 = True
            AddTheSpells("Conjuration", 50)
        EndIf
        If PlayerRef.GetBaseAV("Conjuration") >= 75 && ! bConjuration75
            bConjuration75 = True
            AddTheSpells("Conjuration", 75)
        EndIf
        If PlayerRef.GetBaseAV("Conjuration") >= 100 && ! bConjuration100
            bConjuration100 = True
            AddTheSpells("Conjuration", 100)
        EndIf
    ElseIf aiSkill == 20 ; Destruction
        If PlayerRef.GetBaseAV("Destruction") >= 25 && ! bDestruction25
            bDestruction25 = True
            AddTheSpells("Destruction", 25, "<=")
        EndIf
        If PlayerRef.GetBaseAV("Destruction") >= 50 && ! bDestruction50
            bDestruction50 = True
            AddTheSpells("Destruction", 50)
        EndIf
        If PlayerRef.GetBaseAV("Destruction") >= 75 && ! bDestruction75
            bDestruction75 = True
            AddTheSpells("Destruction", 75)
        EndIf
        If PlayerRef.GetBaseAV("Destruction") >= 100 && ! bDestruction100
            bDestruction100 = True
            AddTheSpells("Destruction", 100)
        EndIf
    ElseIf aiSkill == 21 ; Illusion
        If PlayerRef.GetBaseAV("Illusion") >= 25 && ! bIllusion25
            bIllusion25 = True
            AddTheSpells("Illusion", 25, "<=")
        EndIf
        If PlayerRef.GetBaseAV("Illusion") >= 50 && ! bIllusion50
            bIllusion50 = True
            AddTheSpells("Illusion", 50)
        EndIf
        If PlayerRef.GetBaseAV("Illusion") >= 75 && ! bIllusion75
            bIllusion75 = True
            AddTheSpells("Illusion", 75)
        EndIf
        If PlayerRef.GetBaseAV("Illusion") >= 100 && ! bIllusion100
            bIllusion100 = True
            AddTheSpells("Illusion", 100)
        EndIf
    ElseIf aiSkill == 22 ; Restoration
        If PlayerRef.GetBaseAV("Restoration") >= 25 && ! bRestoration25
            bRestoration25 = True
            AddTheSpells("Restoration", 25, "<=")
        EndIf
        If PlayerRef.GetBaseAV("Restoration") >= 50 && ! bRestoration50
            bRestoration50 = True
            AddTheSpells("Restoration", 50)
        EndIf
        If PlayerRef.GetBaseAV("Restoration") >= 75 && ! bRestoration75
            bRestoration75 = True
            AddTheSpells("Restoration", 75)
        EndIf
        If PlayerRef.GetBaseAV("Restoration") >= 100 && ! bRestoration100
            bRestoration100 = True
            AddTheSpells("Restoration", 100)
        EndIf
    EndIf
EndEvent

Function AddTheSpells(String skill, Int level, String comp = "=")
    Keyword theKeyword = PO3_SkSEFunctions.GetFormFromEditorID("LoreRim_AutodidactSpell") as Keyword
    If Config.iAutodidactSpell
        Spell[] spells = GetSpellsWithKeyword(theKeyword, skill, level, comp, Config.iAutodidactCount)
        Int i
        While i < spells.Length
            PlayerRef.AddSpell(spells[i])
            i += 1
        EndWhile
    Else
        Book[] spells = GetSpellBooksWithKeyword(theKeyword, skill, level, comp, Config.iAutodidactCount)
        Int i
        While i < spells.Length
            PlayerRef.AddItem(spells[i])
            i += 1
        EndWhile
    EndIf
EndFunction