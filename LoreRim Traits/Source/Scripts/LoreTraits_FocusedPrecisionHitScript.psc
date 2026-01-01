Scriptname LoreTraits_FocusedPrecisionHitScript extends ActiveMagicEffect

Float Property fMult Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akCaster.PushActorAway(akTarget, akCaster.GetAV("Marksman") * fMult)
EndEvent