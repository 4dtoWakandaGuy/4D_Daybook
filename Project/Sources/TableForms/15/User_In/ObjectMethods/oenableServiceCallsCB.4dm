If (False:C215)
	//object Name: [USER]User_In.Check Box20
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	C_BOOLEAN:C305(DSS_bo_Enabled)
	C_LONGINT:C283($_l_WebIntegrationTab)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Check Box20"; Form event code:C388)
// data interchange
// 31/10/02 pb

If (Self:C308->=1)
	$_l_WebIntegrationTab:=Find in array:C230(DB_at_USERTAB; "Web Service Call Intergration")
	If ($_l_WebIntegrationTab<0)
		INSERT IN ARRAY:C227(DB_at_USERTAB; Size of array:C274(DB_at_USERTAB)+1; 1)
		DB_at_USERTAB{Size of array:C274(DB_at_USERTAB)}:="Web Service Call Intergration"
		INSERT IN ARRAY:C227(DB_al_UserTabPage; Size of array:C274(DB_al_UserTabPage)+1; 1)
		DB_al_UserTabPage{Size of array:C274(DB_at_USERTAB)}:=23
		WT_DataManagerListBuild
		
	End if 
	DSS_bo_Enabled:=True:C214
Else 
	DSS_bo_Enabled:=False:C215
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Check Box20"; $_t_oldMethodName)
