If (False:C215)
	//object Name: [JOB_STAGES]JobStage_in.oPerons_PopUP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AL_al_ModPers;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	//ARRAY TEXT(JST_at_ModePersonnel;0)
	C_PICTURE:C286(ALModePicturePersons)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStage_in.oPerons_PopUP"; Form event code:C388)
If ([JOB PERSONNEL:48]Job_stage_Code:17#"")
	DB_SaveRecord(->[JOB PERSONNEL:48])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB PERSONNEL:48]))
End if 
If ([ORDER_ITEMS:25]Job_Code:34#"")
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
End if 
LBi_EditListLay(->JST_aptr_LBSettings; ->JST_at_ModePersonnel; ->ALModePicturePersons; ->AL_al_ModPers; True:C214)
If (OK=1)
	
	//re-find all of the Items
	//remember to issue a save before a search if not this proc
	// (->JOB_aptr_LBStageSettings)
End if 

JC_JSSetTimePostEnterability  //added 22/03/07 -kmw
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStage_in.oPerons_PopUP"; $_t_oldMethodName)