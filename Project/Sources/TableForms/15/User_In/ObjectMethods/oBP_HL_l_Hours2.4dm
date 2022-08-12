If (False:C215)
	//object Name: [USER]User_In.oBP_HL_l_Hours2
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
	C_LONGINT:C283($_bo_Expanded; $_l_ListItemReference; $_l_SelectedListItem; $_l_SublistID; BP_HL_l_Hours; BP_HL_l_Hours2)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName)
	C_TIME:C306(BP_ti_BackupTime)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oBP_HL_l_Hours2"; Form event code:C388)

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		If (BP_IsUserAuthorized)
			$_l_SelectedListItem:=Selected list items:C379(BP_HL_l_Hours2)
			If ($_l_SelectedListItem>0)
				GET LIST ITEM:C378(BP_HL_l_Hours2; $_l_SelectedListItem; $_l_ListItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				BP_ti_BackupTime:=Time:C179(Time string:C180($_l_ListItemReference))
			End if 
		End if 
End case 

If (BP_IsUserAuthorized)
	SELECT LIST ITEMS BY POSITION:C381(BP_HL_l_Hours2; 0)
	SELECT LIST ITEMS BY POSITION:C381(BP_HL_l_Hours; 0)
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oBP_HL_l_Hours2"; $_t_oldMethodName)
