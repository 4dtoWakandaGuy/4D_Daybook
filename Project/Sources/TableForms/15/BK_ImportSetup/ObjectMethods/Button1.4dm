If (False:C215)
	//object Name: [USER]BK_ImportSetup.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_StoreID; DM_l_BkserverID; DM_l_BkstoreID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Button1"; Form event code:C388)
If (DM_l_BkstoreID>0)
	$_l_StoreID:=BK_EditStore(DM_l_BkserverID; DM_l_BkstoreID)
Else 
	Gen_Alert("You must select a store first to edit settings")
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Button1"; $_t_oldMethodName)
