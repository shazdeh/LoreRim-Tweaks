Scriptname LoreTraits_WanderingStarsExplosion extends activemagiceffect

Explosion Property ExplosionEffect Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    Game.GetPlayer().PlaceAtMe(ExplosionEffect)
EndEvent
