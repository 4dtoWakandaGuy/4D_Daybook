If (False:C215)
	//object Name: [PROJECTS]Projects_In.Variable13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AL_al_ModeJob;0)
	//ARRAY POINTER(PTR_aptr_LbSetup;0)
	//ARRAY TEXT(PRJ_at_ModeJob;0)
	C_PICTURE:C286(JOB_pic_LBMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PROJECTS].Projects_In.Variable13"; Form event code:C388)

If ([JOBS:26]Project_Code:27#"")
	DB_SaveRecord(->[JOBS:26])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOBS:26]))
End if 
LBi_EditListLay(->PTR_aptr_LbSetup; ->PRJ_at_ModeJob; ->JOB_pic_LBMode; ->AL_al_ModeJob; True:C214)

If (OK=1)
	
End if 
ERR_MethodTrackerReturn("OBJ [PROJECTS].Projects_In.Variable13"; $_t_oldMethodName)
