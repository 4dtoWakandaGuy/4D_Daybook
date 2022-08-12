If (False:C215)
	//object Name: Object Name:      CONFIG_SETUP.oORDConfirmdeliveryCheckBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/09/2012 10:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_UserTabPage;0)
	//ARRAY TEXT(DB_at_USERTAB;0)
	C_LONGINT:C283($_l_tabRow; WS_l_CB_Catalogues)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oORDConfirmdeliveryCheckBox")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oORDConfirmdeliveryCheckBox"; Form event code:C388)
If (WS_l_CB_Catalogues=1)
	$_l_tabRow:=Find in array:C230(DB_at_USERTAB; "Product Catalogues")
	If ($_l_tabRow<0)
		INSERT IN ARRAY:C227(DB_at_USERTAB; Size of array:C274(DB_at_USERTAB)+1; 1)
		DB_at_USERTAB{Size of array:C274(DB_at_USERTAB)}:="Product Catalogues"
		INSERT IN ARRAY:C227(DB_al_UserTabPage; Size of array:C274(DB_al_UserTabPage)+1; 1)
		DB_al_UserTabPage{Size of array:C274(DB_at_USERTAB)}:=19
		WT_DataManagerListBuild
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oORDConfirmdeliveryCheckBox"; $_t_oldMethodName)
