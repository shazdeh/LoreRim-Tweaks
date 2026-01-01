Scriptname LoreRimAlcoholStumble_Script extends activemagiceffect  

Faction Property REQ_Storage_Alcohol Auto
Actor Property PlayerRef Auto
GlobalVariable Property LoreRimDrunkStumble_Interval Auto
GlobalVariable[] Property Chances Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    RegisterForUpdate(LoreRimDrunkStumble_Interval.GetValue())
EndEvent

Event OnUpdate()
    If Utility.RandomInt() < GetChance()
        PlayerRef.PushActorAway(PlayerRef, 1)
    EndIf
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
    UnregisterForUpdate()
EndEvent

Int Function GetChance()
    Float level = PlayerRef.GetFactionRank(REQ_Storage_Alcohol)
    If level >= 100
        Return Chances[4].GetValueInt()
    ElseIf level >= 80
        Return Chances[3].GetValueInt()
    ElseIf level >= 60
        Return Chances[2].GetValueInt()
    ElseIf level >= 40
        Return Chances[1].GetValueInt()
    Else
        Return Chances[0].GetValueInt()
    EndIf
EndFunction