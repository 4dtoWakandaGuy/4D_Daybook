If (False:C215)
	//object Name: [USER]User_In.Variable85
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 18:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD_aI_PriorityDF;0)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_PriorityCount)
	C_TEXT:C284($_t_NewName; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable85"; Form event code:C388)
$_t_NewName:=Request:C163("Enter New Priority:"; "")
If (OK=1)
	If ($_t_NewName#"")
		
		APPEND TO ARRAY:C911(SD_at_PriorityNM; $_t_NewName)
		$_l_PriorityCount:=Size of array:C274(SD_al_PriorityNUM)+1
		APPEND TO ARRAY:C911(SD_al_PriorityNUM; $_l_PriorityCount)
		APPEND TO ARRAY:C911(SD_aI_PriorityDF; 0)
		SD_bo_ChangePrefs:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable85"; $_t_oldMethodName)
