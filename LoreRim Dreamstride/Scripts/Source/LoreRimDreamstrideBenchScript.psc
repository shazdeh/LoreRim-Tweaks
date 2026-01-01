Scriptname LoreRimDreamstrideBenchScript extends ObjectReference

Spell Property LoreRimDreamstrideGetUpMonitorAb Auto
GlobalVariable Property DA16SkullDreamCount Auto
MiscObject Property LoreRimStaffofCorruptionCharges Auto

Event OnActivate(ObjectReference akActionRef)
    Actor player = Game.GetPlayer()
    If player == akActionRef as Actor
        player.AddSpell(LoreRimDreamstrideGetUpMonitorAb, abVerbose = False)
        player.AddItem(LoreRimStaffofCorruptionCharges, DA16SkullDreamCount.GetValueInt(), abSilent = True)
    EndIf
EndEvent

Function OnEndTrade()
    Actor player = Game.GetPlayer()
    Int iCount = player.GetItemCount(LoreRimStaffofCorruptionCharges)
    player.RemoveItem(LoreRimStaffofCorruptionCharges, iCount, abSilent = True)
    player.RemoveSpell(LoreRimDreamstrideGetUpMonitorAb)
    DA16SkullDreamCount.SetValueInt(iCount)
EndFunction