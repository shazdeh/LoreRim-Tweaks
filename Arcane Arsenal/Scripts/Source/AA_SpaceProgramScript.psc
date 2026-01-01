Scriptname AA_SpaceProgramScript extends activemagiceffect

Event OnEffectStart(Actor akTarget, Actor akCaster)
	Game.GetPlayer().PushActorAway(akTarget, 0.0)
    akTarget.ApplyHavokImpulse(0, 0, 100, GetMagnitude())
EndEvent