Scriptname LoreRimArtifactSacrifice_Script extends Quest

WSN_TrackerQuest_Quest Property WSN Auto
Form Property DA01SoulGemAzurasStar Auto
Form Property DA01SoulGemBlackStar Auto
Form Property DA09Dawnbreaker Auto
Form Property DA08EbonyBlade Auto
Form Property DA02Armor Auto
Form Property DA10MaceofMolagBal Auto
Form Property DA03RuefulAxe Auto
Form Property ClavicusVileMask Auto
Form Property DA07MehrunesRazor Auto
Form Property DA04OghmaInfinium Auto
Form Property DA11RingofNamira Auto
Form Property DA14SanguineRose Auto
Form Property DA05SaviorsHide Auto
Form Property DA05HircinesRing Auto
Form Property TG08SkeletonKey Auto
Form Property DA16SkullofCorruption Auto
Form Property DA13Spellbreaker Auto
Form Property DA06Volendrung Auto
Form Property DA15Wabbajack Auto
Form Property ccKRTSSE001_Bittercup Auto
Form Property ccBGSSSE038_BowOfShadows Auto
Form Property ccBGSSSE005_Goldbrand Auto
Form Property ccBGSSSE025_Nerveshatter Auto
Form Property ccBGSSSE001_ArtifactRingKhajiit Auto
Form Property ccBGSSSE067_DaedricMaceScourge Auto
Form Property BGSSSE018ShadowrendBattleaxe Auto
Form Property BGSSSE018ShadowrendClaymore Auto
Form Property ccBGSSSE019_StaffOfSheogorath Auto
Form Property ccBGSSSE025_Jyggalag Auto
Form Property NMeridiaRingofKhajiitiEnhanced Auto
Form Property manny_GF_Armor_GrayCowl Auto
Form Property manny_GF_Weapon_Umbra Auto

Message Property LoreRimArtifactSacrifice_AbandonMsg Auto
Message Property LoreRimArtifactSacrifice_WorshipBlockMsg Auto

Int[] BlockedDeities

Event OnInit()
    BlockedDeities = new Int[55]
EndEvent

; WSN_Shrine_Effect_WorshipRequest_
Function OnForgeItemRemoved(Form kItem)
    Int ID
    If kItem == DA01SoulGemBlackStar || kItem == DA01SoulGemAzurasStar
        ID = 6 ; Azura
    ElseIf kItem == DA09Dawnbreaker || kItem == NMeridiaRingofKhajiitiEnhanced
        ID = 5 ; Meridia
    ElseIf kItem == DA08EbonyBlade || kItem == ccBGSSSE001_ArtifactRingKhajiit
        ID = 18 ; Mephala
    ElseIf kItem == DA02Armor || kItem == ccBGSSSE005_Goldbrand
        ID = 14 ; Boethiah
    ElseIf kItem == DA10MaceofMolagBal
        ID = 16
    ElseIf kItem == DA03RuefulAxe || kItem == ClavicusVileMask || kItem == ccKRTSSE001_Bittercup || kItem == manny_GF_Weapon_Umbra
        ID = 29 ; Clavicus
    ElseIf kItem == DA07MehrunesRazor
        ID = 11
    ElseIf kItem == DA04OghmaInfinium
        ID = 28
    ElseIf kItem == DA11RingofNamira
        ID = 30
    ElseIf kItem == DA14SanguineRose
        ID = 20
    ElseIf kItem == DA05SaviorsHide || kItem == DA05HircinesRing
        ID = 25
    ElseIf kItem == TG08SkeletonKey || kItem == ccBGSSSE038_BowOfShadows || kItem == manny_GF_Armor_GrayCowl
        ID = 15 ; Nocturnal
    ElseIf kItem == DA16SkullofCorruption
        ID = 12
    ElseIf kItem == DA13Spellbreaker || kItem == ccBGSSSE001_ArtifactRingKhajiit
        ID = 24
    ElseIf kItem == DA06Volendrung || kItem == ccBGSSSE067_DaedricMaceScourge
        ID = 21 ; Malacath
    ElseIf kItem == DA15Wabbajack || kItem == ccBGSSSE025_Nerveshatter || kItem == BGSSSE018ShadowrendBattleaxe || kItem == BGSSSE018ShadowrendClaymore || kItem == ccBGSSSE019_StaffOfSheogorath
        ID = 33
    ElseIf kItem == ccBGSSSE025_Jyggalag
        ID = 31
    EndIf

    If ID != 0
        BlockedDeities[ID] = 1
        If WSN.WorshipID == ID
            WSN.EndWorship()
            LoreRimArtifactSacrifice_AbandonMsg.Show()
        EndIf
    EndIf
EndFunction

Bool Function CanWorship(Int id)
    If BlockedDeities[id] == 1
        LoreRimArtifactSacrifice_WorshipBlockMsg.Show()
        Return False
    EndIf

    Return True
EndFunction