Scriptname ArtifactsOfLoreRim_DrainLuckScript extends activemagiceffect

MiscObject Property Gold Auto
Actor Property player Auto
Message Property AOL_DrainLuckMsg Auto
Int Property iMinLostGold Auto
Int Property iMaxLostGold Auto
Int Property iMinSeconds Auto
Int Property iMaxSeconds Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If akTarget == player
        RegisterForSingleUpdate(Utility.RandomInt(iMinSeconds, iMaxSeconds))
    EndIf
EndEvent

Event OnUpdate()
    Int iRandGold = Utility.RandomInt(iMinLostGold, iMaxLostGold)
    If player.GetItemCount(gold) >= iRandGold
        player.RemoveItem(gold, iRandGold)
        AOL_DrainLuckMsg.Show(iRandGold)
    EndIf
    RegisterForSingleUpdate(Utility.RandomInt(iMinSeconds, iMaxSeconds))
EndEvent