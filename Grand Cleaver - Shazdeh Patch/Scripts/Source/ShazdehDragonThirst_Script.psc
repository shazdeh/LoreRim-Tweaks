Scriptname ShazdehDragonThirst_Script extends activemagiceffect

Event OnDying(Actor akKiller)
    Actor player = Game.GetPlayer()
    player.RestoreAV("RightItemCharge", player.GetBaseActorValue("RightItemCharge"))
EndEvent