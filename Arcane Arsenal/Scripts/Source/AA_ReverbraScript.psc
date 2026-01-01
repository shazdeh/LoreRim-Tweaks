Scriptname AA_ReverbraScript extends activemagiceffect  

Spell Property MySpell Auto
Int Property iStaminaCost Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForAnimationEvent(akTarget, "bashExit")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    Actor target = GetTargetActor()
	If target.GetAv("Stamina") >= iStaminaCost
		target.DamageAv("Stamina", iStaminaCost)
		MySpell.Cast(target)
	EndIf
EndEvent