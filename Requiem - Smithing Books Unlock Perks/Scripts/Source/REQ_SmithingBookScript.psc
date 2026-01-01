ScriptName REQ_SmithingBookScript Extends ObjectReference

Import b612

Perk Property RequiredPerk1 Auto
Perk Property RequiredPerk2 Auto
Perk Property UnlockedPerk Auto
Message Property SmithingBookPerkMsg Auto
Message Property SmithingBookPerkNotYetMsg Auto
Int Property iRequiredLevel Auto
Sound Property SmithingBookPerkSound Auto

Event OnRead()
    Actor player = Game.GetPlayer()
    If ! player.HasPerk(UnlockedPerk)
        Bool bCanLearn = True
        If RequiredPerk1 != None || RequiredPerk2 != None
            bCanLearn = player.HasPerk(RequiredPerk1) || player.HasPerk(RequiredPerk2)
        EndIf

        If bCanLearn && player.GetBaseActorValue("Smithing") >= iRequiredLevel
            player.AddPerk(UnlockedPerk)
            Utility.WaitMenuMode(1)
            SmithingBookPerkSound.Play(player)
            String perkName = UnlockedPerk.GetName()
            b612.GetAnnouncement().Show(perkName + " Unlocked", "smithing.dds", 3.5)
        Else
            SmithingBookPerkNotYetMsg.Show()
        EndIf
    EndIf
EndEvent