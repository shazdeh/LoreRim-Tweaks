Scriptname LoreRimDoomstones_SelectionScript extends activemagiceffect

LoreRimDoomStones_Script Property QuestScript Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    QuestScript.ShowSelection()
EndEvent