Scriptname ArcaneArsenal_HallowedFlareScript extends activemagiceffect

Explosion Property SpawnedExplosion Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.PlaceAtMe(SpawnedExplosion)
EndEvent
