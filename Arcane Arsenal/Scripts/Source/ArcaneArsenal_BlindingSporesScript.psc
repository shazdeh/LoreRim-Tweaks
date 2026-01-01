Scriptname ArcaneArsenal_BlindingSporesScript extends activemagiceffect

SPELL Property SpellToCast Auto
FormList Property AA_MushroomsList Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	RegisterForAnimationEvent(akTarget, "bashExit")
EndEvent

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	If akSource.GetItemCount(AA_MushroomsList)
		RemoveMushroom()
		SpellToCast.Cast(GetTargetActor())
	EndIf
EndEvent

Function RemoveMushroom()
	Int i = AA_MushroomsList.GetSize()
	Actor kTarget = GetTargetActor()
	While i != 0
		i -= 1
		If kTarget.GetItemCount(AA_MushroomsList.GetAt(i))
			kTarget.RemoveItem(AA_MushroomsList.GetAt(i))
			Return
		EndIf
	EndWhile
EndFunction