Scriptname SealSpell_ContactScript extends activemagiceffect

Explosion Property ExplosionEffect Auto
Spell Property CastedSpell Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If ! akTarget.IsDead()
        ObjectReference explosionObj = akTarget.PlaceAtMe(ExplosionEffect)
        Game.GetPlayer().DispelSpell(CastedSpell)
        Utility.Wait(1)
        explosionObj.DisableNoWait()
        explosionObj.Delete()
    EndIf
EndEvent