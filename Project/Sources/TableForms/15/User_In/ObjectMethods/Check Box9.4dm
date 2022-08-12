If (False:C215)
	//object Name: [USER]User_In.Check Box9
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
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	C_BOOLEAN:C305(USR_bo_EWEnabled)
	C_LONGINT:C283($_l_DataInterchangeRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box9"; Form event code:C388)
// data interchange
// 31/10/02 pb

If (Self:C308->=1)
	$_l_DataInterchangeRow:=Find in array:C230(DB_at_USERTAB; "data interchange")
	If ($_l_DataInterchangeRow<0)
		INSERT IN ARRAY:C227(DB_at_USERTAB; Size of array:C274(DB_at_USERTAB)+1; 1)
		DB_at_USERTAB{Size of array:C274(DB_at_USERTAB)}:="data interchange"
		INSERT IN ARRAY:C227(DB_al_UserTabPage; Size of array:C274(DB_al_UserTabPage)+1; 1)
		DB_al_UserTabPage{Size of array:C274(DB_at_USERTAB)}:=22
		WT_DataManagerListBuild
		
	End if 
	USR_bo_EWEnabled:=True:C214
Else 
	USR_bo_EWEnabled:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box9"; $_t_oldMethodName)
