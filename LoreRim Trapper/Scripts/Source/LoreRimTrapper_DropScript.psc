Scriptname LoreRimTrapper_DropScript extends ObjectReference

Activator Property BearTrap01 Auto
Perk Property LoreRimTrapper_Rank3 Auto
Perk Property LoreRimTrapper_Rank4 Auto
Message Property LoreRimTrapper_ChooseElemental Auto
Ingredient Property FireSalts Auto
Ingredient Property FrostSalts Auto
Ingredient Property VoidSalts Auto

ObjectReference mytomb

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akOldContainer && !akNewContainer

        ; This bit is copied from SotW mod by JaySerpa.
        ; I have no idea why this fixes physics on the kTrap obj,
        ; whereas Disable() and Enable() on the same ref doesn't.
        ; Godspeed, Papyrus.
        ObjectReference kTrap = PlaceAtMe(BearTrap01)
        mytomb.SetPosition(myTomb.GetPositionX(), mytomb.GetPositionY(), mytomb.GetPositionZ())
        mytomb.SetAngle(Utility.RandomInt(), Utility.RandomInt(), Utility.RandomInt())

        If (akOldContainer as Actor).HasPerk(LoreRimTrapper_Rank3)
            If akOldContainer.GetItemCount(FireSalts) > 0 || akOldContainer.GetItemCount(FrostSalts) > 0 || akOldContainer.GetItemCount(VoidSalts) > 0
                Int iSalt = LoreRimTrapper_ChooseElemental.Show()
                If iSalt
                    If iSalt == 1
                        akOldContainer.RemoveItem(FireSalts)
                    ElseIf iSalt == 2
                        akOldContainer.RemoveItem(FrostSalts)
                    ElseIf iSalt == 3
                        akOldContainer.RemoveItem(VoidSalts)
                    EndIf
                    (kTrap as LoreRimTrapper_TrapScript).iElementalType = iSalt
                EndIf
            EndIf
        EndIf
        If (akOldContainer as Actor).HasPerk(LoreRimTrapper_Rank4)
            (kTrap as LoreRimTrapper_TrapScript).bApplyParalysis = True
        EndIf

        Disable()

    endif
endevent