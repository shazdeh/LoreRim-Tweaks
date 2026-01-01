;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname PRKF_LittlePrince_FriendPerk_07005902 Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.GetPlayer().AddItem(LittlePrince_Gifts, 1)
(akTargetRef as Actor).AddSpell(LittlePrince_GiftGivenAb)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Spell Property LittlePrince_GiftGivenAb Auto
LeveledItem Property LittlePrince_Gifts Auto