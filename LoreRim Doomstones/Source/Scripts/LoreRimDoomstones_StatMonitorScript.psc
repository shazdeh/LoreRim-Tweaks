Scriptname LoreRimDoomstones_StatMonitorScript extends activemagiceffect

Import PO3_SKSEFunctions

Message Property LoreRimDoomstones_SelectionPowerAddedMsg  Auto
Sound Property SoundFX  Auto
Perk Property LoreRimDoomstones_GivePowerPerk Auto
Spell Property LoreRimDoomstones_DoomSelectionPower Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    SoundFX.Play(akTarget)
    LoreRimDoomstones_SelectionPowerAddedMsg.Show()
    akTarget.RemoveSpell(GetActiveEffectSpell(Self) as Spell)
    akTarget.AddSpell(LoreRimDoomstones_DoomSelectionPower)
EndEvent