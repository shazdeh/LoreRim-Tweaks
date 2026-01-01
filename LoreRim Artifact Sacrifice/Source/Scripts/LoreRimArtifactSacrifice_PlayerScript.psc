Scriptname LoreRimArtifactSacrifice_PlayerScript extends ReferenceAlias

State Listening
    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        (GetOwningQuest() as LoreRimArtifactSacrifice_Script).OnForgeItemRemoved(akBaseItem)
    EndEvent

    Event OnGetUp(ObjectReference akFurniture)
        GoToState("")
    EndEvent
EndState