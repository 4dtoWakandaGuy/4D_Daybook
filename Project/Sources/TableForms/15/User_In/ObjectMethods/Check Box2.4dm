If (False:C215)
	//object Name: [USER]User_In.Check Box2
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
	C_BOOLEAN:C305(SD_bo_ResultsDialogSequence; SD_bo_ChangePrefs)
	C_LONGINT:C283(SD_CB_l_Result; SD_CB_l_resultSequences)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box2"; Form event code:C388)
SD_bo_ChangePrefs:=True:C214
If (SD_CB_l_Result=1)
	OBJECT SET VISIBLE:C603(SD_CB_l_resultSequences; True:C214)
	SD_CB_l_resultSequences:=Num:C11(SD_bo_ResultsDialogSequence)
Else 
	OBJECT SET VISIBLE:C603(SD_CB_l_resultSequences; False:C215)
	SD_CB_l_resultSequences:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box2"; $_t_oldMethodName)
