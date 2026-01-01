Scriptname LoreTraits_SoulEmbedScript extends ActiveMagicEffect

Spell Property LoreTraits_SoulEmbedFFSpell Auto
MagicEffect Property LoreTraits_SoulEmbedFFEffect Auto
Message Property LoreTraits_SoulEmbedNoSoulMsg Auto
Message Property LoreTraits_SoulEmbedRecastMsg Auto
Explosion Property ExplosionEffect Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
    If akTarget.HasMagicEffect(LoreTraits_SoulEmbedFFEffect)
        LoreTraits_SoulEmbedRecastMsg.Show()
    ElseIf akTarget.GetAv("DragonSouls") < 1
        LoreTraits_SoulEmbedNoSoulMsg.Show()
    Else
        LoreTraits_SoulEmbedFFSpell.Cast(akTarget)
        akTarget.ModAV("DragonSouls", -1)
        akTarget.PlaceAtMe(ExplosionEffect)
    EndIf
EndEvent