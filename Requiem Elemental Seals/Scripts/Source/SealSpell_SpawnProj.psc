Scriptname SealSpell_SpawnProj extends activemagiceffect

Hazard Property HazardToSpawn Auto
ObjectReference tempObject

Event OnEffectStart(Actor akTarget, Actor akCaster)
    tempObject = akTarget.PlaceAtMe(HazardToSpawn)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    tempObject.DisableNoWait()
    tempObject.Delete()
EndEvent