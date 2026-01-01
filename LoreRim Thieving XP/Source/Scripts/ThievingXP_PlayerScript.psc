Scriptname ThievingXP_PlayerScript extends ReferenceAlias  

Event OnPlayerLoadGame()
    (GetOwningQuest() as ThievingXP_Script).Init()
EndEvent

State Listening
    Event OnItemAdded(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
        (GetOwningQuest() as ThievingXP_Script).CalcValue(akBaseItem, aiItemCount)
    EndEvent

    Event OnItemRemoved(Form akBaseItem, Int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
        (GetOwningQuest() as ThievingXP_Script).CalcValue(akBaseItem, aiItemCount)
    EndEvent
EndState