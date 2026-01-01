Scriptname LoreTraits_GiveWeaponScript extends activemagiceffect

Weapon Property LoreTraits_StaffofWanderingStars Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    akTarget.AddItem(LoreTraits_StaffofWanderingStars)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    akTarget.RemoveItem(LoreTraits_StaffofWanderingStars)
EndEvent