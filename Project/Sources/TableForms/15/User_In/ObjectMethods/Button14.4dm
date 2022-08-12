If (False:C215)
	//object Name: [USER]User_In.Button14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 18:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_PriorityRow)
	C_TEXT:C284($_t_NewName; $_t_oldMethodName; SD_t_PriorityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button14"; Form event code:C388)
$_t_NewName:=Request:C163("Change Priority to:"; SD_t_PriorityName)
If (OK=1)
	If ($_t_NewName#"")
		$_l_PriorityRow:=Find in array:C230(SD_at_PriorityNM; SD_t_PriorityName)
		SD_at_PriorityNM{$_l_PriorityRow}:=$_t_NewName
		SD_bo_ChangePrefs:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Button14"; $_t_oldMethodName)
