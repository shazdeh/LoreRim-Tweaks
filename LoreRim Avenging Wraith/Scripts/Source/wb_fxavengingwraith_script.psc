;/ Decompiled by Champollion V1.0.1
Source   : WB_FXAvengingWraith_Script.psc
Modified : 2016-07-04 19:55:49
Compiled : 2016-07-04 19:55:50
User     : Maximilian
Computer : MARUNAE
/;
scriptName WB_FXAvengingWraith_Script extends activemagiceffect

;-- Properties --------------------------------------
globalvariable property WB_Conjuration_ConjureAvengingWraith_Global_Health auto
Int property WB_DefaultLevel auto
globalvariable property WB_Conjuration_ConjureAvengingWraith_Global_Mult auto
Float property WB_DefaultMagicka auto
globalvariable property WB_Conjuration_ConjureAvengingWraith_Global_Magicka auto
globalvariable property WB_Conjuration_ConjureAvengingWraith_Global_Level auto
Float property WB_DefaultStamina auto
globalvariable property WB_Conjuration_ConjureAvengingWraith_Global_Stamina auto
visualeffect property WB_ConjurationUndead_VFX_EyesFemale auto
Float property WB_DefaultHealth auto
Globalvariable Property LoreRim_AvengingWraithMaxHealth Auto
Globalvariable Property LoreRim_AvengingWraithMaxMagicka Auto
Globalvariable Property LoreRim_AvengingWraithMaxStamina Auto

;-- Variables ---------------------------------------
Float StatMult

;-- Functions ---------------------------------------

; Skipped compiler generated GetState

function OnEffectStart(Actor akTarget, Actor akCaster)

	WB_ConjurationUndead_VFX_EyesFemale.Play(akTarget as objectreference, -1 as Float, none)
	StatMult = (WB_Conjuration_ConjureAvengingWraith_Global_Mult.GetValue() as Int / 100) as Float
	akTarget.SetActorValue("Health", WB_Conjuration_ConjureAvengingWraith_Global_Health.GetValue())
	akTarget.SetActorValue("Magicka", WB_Conjuration_ConjureAvengingWraith_Global_Magicka.GetValue())
	akTarget.SetActorValue("Stamina", WB_Conjuration_ConjureAvengingWraith_Global_Stamina.GetValue())
	akTarget.RestoreActorValue("Health", 9999 as Float)
	akTarget.RestoreActorValue("Magicka", 9999 as Float)
	akTarget.RestoreActorValue("Stamina", 9999 as Float)
endFunction

function OnDying(Actor akKiller)

	if akKiller
		Float ActorValue = akKiller.GetActorValue("Health")
        Float fNewActorValue = ActorValue / akKiller.GetActorValuePercentage("Health") * StatMult
        Float fMaxActorValue = LoreRim_AvengingWraithMaxHealth.GetValue()
        If fNewActorValue > fMaxActorValue
            fNewActorValue = fMaxActorValue
        EndIf
		if ActorValue > 0 as Float
			WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue(fNewActorValue)
		else
			WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue(WB_DefaultHealth)
		endIf

		akKiller.RestoreActorValue("Magicka", 2.50000)
		ActorValue = akKiller.GetActorValue("Magicka")
        fNewActorValue = ActorValue / akKiller.GetActorValuePercentage("Magicka") * StatMult
        fMaxActorValue = LoreRim_AvengingWraithMaxMagicka.GetValue()
        If fNewActorValue > fMaxActorValue
            fNewActorValue = fMaxActorValue
        EndIf
		if ActorValue > 0 as Float
			WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue(fNewActorValue)
		else
			WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue(WB_DefaultMagicka)
		endIf

		akKiller.RestoreActorValue("Stamina", 2.50000)
		ActorValue = akKiller.GetActorValue("Stamina")
        fNewActorValue = ActorValue / akKiller.GetActorValuePercentage("Stamina") * StatMult
        fMaxActorValue = LoreRim_AvengingWraithMaxStamina.GetValue()
        If fNewActorValue > fMaxActorValue
            fNewActorValue = fMaxActorValue
        EndIf
		if ActorValue > 0 as Float
			WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue(fNewActorValue)
		else
			WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue(WB_DefaultStamina)
		endIf
		WB_Conjuration_ConjureAvengingWraith_Global_Level.SetValue(akKiller.GetLevel() as Float)
	else
		WB_Conjuration_ConjureAvengingWraith_Global_Health.SetValue(WB_DefaultHealth)
		WB_Conjuration_ConjureAvengingWraith_Global_Magicka.SetValue(WB_DefaultMagicka)
		WB_Conjuration_ConjureAvengingWraith_Global_Stamina.SetValue(WB_DefaultStamina)
		WB_Conjuration_ConjureAvengingWraith_Global_Level.SetValueInt(WB_DefaultLevel)
	endIf
	WB_ConjurationUndead_VFX_EyesFemale.Stop(self.GetTargetActor() as objectreference)
endFunction

; Skipped compiler generated GotoState
