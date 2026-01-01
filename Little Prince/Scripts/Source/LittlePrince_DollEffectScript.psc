Scriptname LittlePrince_DollEffectScript extends activemagiceffect

Faction Property LittlePrince_FoxFriendFaction  Auto
Faction Property PlayerFaction  Auto
Perk Property LittlePrince_FriendPerk Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    LittlePrince_FoxFriendFaction.SetReaction(PlayerFaction, 3)
    akTarget.AddPerk(LittlePrince_FriendPerk)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    LittlePrince_FoxFriendFaction.SetReaction(PlayerFaction, 0)
    akTarget.RemovePerk(LittlePrince_FriendPerk)
EndEvent