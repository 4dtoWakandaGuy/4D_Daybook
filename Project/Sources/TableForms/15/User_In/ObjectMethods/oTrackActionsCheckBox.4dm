If (False:C215)
	//object Name: [USER]User_In.oTrackActionsCheckBox
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
	//ARRAY INTEGER(DM_ai_UserTrackActive;0)
	//ARRAY TEXT(DM_at_UserNames;0)
	C_LONGINT:C283($_l_event; $_l_Index; DB_l_trackPath)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oTrackActionsCheckBox"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DB_l_trackPath=0)
			For ($_l_Index; 1; Size of array:C274(DM_at_UserNames))
				DM_ai_UserTrackActive{$_l_Index}:=0
			End for 
		Else 
			For ($_l_Index; 1; Size of array:C274(DM_at_UserNames))
				DM_ai_UserTrackActive{$_l_Index}:=1
			End for 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oTrackActionsCheckBox"; $_t_oldMethodName)
