Scriptname LoreTraits_BalacedCastingScript extends activemagiceffect

Message Property LoreTraits_BalacedCastingPickMsg Auto
Spell Property LoreTraits_BalacedCastingFireWeaknessAb Auto
Spell Property LoreTraits_BalacedCastingFrostWeaknessAb Auto
Spell Property LoreTraits_BalacedCastingShockWeaknessAb Auto
Spell Property LoreTraits_BalacedCastingMagicWeaknessAb Auto
Spell Property LoreTraits_BalacedCastingPoisonWeaknessAb Auto

Spell chosenResist

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Int iPick = LoreTraits_BalacedCastingPickMsg.Show()
    If iPick == 0
        chosenResist = LoreTraits_BalacedCastingMagicWeaknessAb
    ElseIf iPick == 1
        chosenResist = LoreTraits_BalacedCastingFireWeaknessAb
    ElseIf iPick == 2
        chosenResist = LoreTraits_BalacedCastingFrostWeaknessAb
    ElseIf iPick == 3
        chosenResist = LoreTraits_BalacedCastingShockWeaknessAb
    ElseIf iPick == 4
        chosenResist = LoreTraits_BalacedCastingPoisonWeaknessAb
    EndIf
    akTarget.AddSpell(chosenResist, abVerbose = False)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.RemoveSpell(chosenResist)
EndEvent