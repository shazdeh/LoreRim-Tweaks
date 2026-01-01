Scriptname LoreTraits_IronKneesScript extends activemagiceffect  

Keyword Property WeapTypeBow Auto
Spell Property LoreTraits_IronKneesStaminaSpell Auto

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
    If akSource as Weapon && akSource.HasKeyword(WeapTypeBow)
        LoreTraits_IronKneesStaminaSpell.Cast(GetTargetActor())
    EndIf
EndEvent