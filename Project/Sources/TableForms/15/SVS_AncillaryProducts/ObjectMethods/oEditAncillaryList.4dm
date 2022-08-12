If (False:C215)
	//object Name: [USER]SVS_AncillaryProducts.oEditAncillaryList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 11:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SVS_al_Accessory;0)
	//ARRAY TEXT(SVS_at_Accessory;0)
	C_LONGINT:C283($_l_ListID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SVS_AncillaryProducts.oEditAncillaryList"; Form event code:C388)

$_l_ListID:=AA_GetListID(0; 0; "Stored Service Items")
$_l_ListID:=AA_ListAddItembyID($_l_ListID)
$_l_ListID:=AA_LoadListByName("Stored Service Items"; ->SVS_at_Accessory; ->SVS_al_Accessory)
ERR_MethodTrackerReturn("OBJ [USER].SVS_AncillaryProducts.oEditAncillaryList"; $_t_oldMethodName)
