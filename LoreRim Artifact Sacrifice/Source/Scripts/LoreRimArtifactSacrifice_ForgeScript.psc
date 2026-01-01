Scriptname LoreRimArtifactSacrifice_ForgeScript extends ObjectReference

LoreRimArtifactSacrifice_PlayerScript Property PlayerScript Auto

Event OnActivate(ObjectReference akActivator)
    If akActivator == Game.GetPlayer()
        PlayerScript.GoToState("Listening")
    EndIf
EndEvent