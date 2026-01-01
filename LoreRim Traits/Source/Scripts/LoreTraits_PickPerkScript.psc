Scriptname LoreTraits_PickPerkScript extends activemagiceffect  

Message Property MessageToShow Auto
Perk[] Property AppliedPerks Auto

Perk chosenPerk

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Int iPick = MessageToShow.Show()
	If AppliedPerks[iPick]
		chosenPerk = AppliedPerks[iPick]
	EndIf
	akTarget.AddPerk(chosenPerk)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.RemovePerk(chosenPerk)
EndEvent