Scriptname RelentlessTriad_Script extends ReferenceAlias

Import PO3_Events_Alias

Quest[] Property PrerequisiteQuests Auto
Perk Property RelentlessTriad_Rank1 Auto
Perk Property RelentlessTriad_Rank2 Auto

Event OnPlayerLoadGame()
    Init()
EndEvent

Event OnInit()
    Init()
EndEvent

Function Init()
    RegisterForSingleUpdate(7)
EndFunction

Event OnUpdate()
    UnregisterForAllQuests(Self)
    Int i = PrerequisiteQuests.Length
    While i > 0
        i -= 1
        RegisterForQuest(Self, PrerequisiteQuests[i])
    EndWhile
EndEvent

Event OnQuestStop(Quest akQuest)
    Int iDefeatedBosses
    Int i = PrerequisiteQuests.Length
    While i > 0
        i -= 1
        If PrerequisiteQuests[i].IsCompleted()
            iDefeatedBosses += 1
        EndIf
    EndWhile

    If iDefeatedBosses == 3
        GetActorReference().RemovePerk(RelentlessTriad_Rank2)
        GetOwningQuest().Stop()
    ElseIf iDefeatedBosses == 2
        GetActorReference().RemovePerk(RelentlessTriad_Rank1)
        GetActorReference().AddPerk(RelentlessTriad_Rank2)
    ElseIf iDefeatedBosses == 1
        GetActorReference().AddPerk(RelentlessTriad_Rank1)
    EndIf
EndEvent