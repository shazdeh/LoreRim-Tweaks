Scriptname RequiemLite_PlayerScript extends ReferenceAlias

Event OnPlayerLoadGame()
    (GetOwningQuest() as RequiemLite_Config).Init()
EndEvent