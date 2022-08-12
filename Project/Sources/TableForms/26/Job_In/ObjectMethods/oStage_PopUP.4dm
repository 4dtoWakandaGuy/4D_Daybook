If (False:C215)
	//object Name: [JOBS]Job_In.oStage_PopUP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(AL_l_ModeStage;0)
	//Array POINTER(JOB_aptr_LBStageSettings;0)
	//Array TEXT(JOB_at_ModeStage;0)
	C_PICTURE:C286(JOB_pic_StageEditMode)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Job_In.oStage_PopUP"; Form event code:C388)



If ([ORDER_ITEMS:25]Job_Code:34#"")
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 


//**********************************************************************************
If ([JOB_STAGES:47]Job_Code:1#"")
	DB_SaveRecord(->[JOB_STAGES:47])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB_STAGES:47]))
End if 




LBi_EditListLay(->JOB_aptr_LBStageSettings; ->JOB_at_ModeStage; ->JOB_pic_StageEditMode; ->AL_l_ModeStage; True:C214)

If (OK=1)
	
	//re-find all of the Items
	//remember to issue a save before a search if not this proc
	// (->JOB_aptr_LBStageSettings)
End if 
JC_JobSetTimePostEnterability  //added 19/02/07 -kmw
ERR_MethodTrackerReturn("OBJ [JOBS].Job_In.oStage_PopUP"; $_t_oldMethodName)