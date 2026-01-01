Scriptname LoreRimTrapper_QuestScript extends Quest  

ReferenceAlias Property CurrentFollower Auto

Function NewSummon(ActorBase akActorBase, Actor akTarget)
    If ! CurrentFollower.GetReference()
        Actor kSummon = akTarget.PlaceActorAtMe(akActorBase)
        kSummon.SetPlayerTeammate(1)
        CurrentFollower.ForceRefTo(kSummon)
    EndIf
EndFunction