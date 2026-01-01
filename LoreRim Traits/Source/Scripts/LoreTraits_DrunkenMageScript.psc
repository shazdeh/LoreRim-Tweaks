Scriptname LoreTraits_DrunkenMageScript extends activemagiceffect  

Quest Property LoreTraits_DrunkenMageQuest Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    LoreTraits_DrunkenMageQuest.Start()
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    LoreTraits_DrunkenMageQuest.Stop()
EndEvent