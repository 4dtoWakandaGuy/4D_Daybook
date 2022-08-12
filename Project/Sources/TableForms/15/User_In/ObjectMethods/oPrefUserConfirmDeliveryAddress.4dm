If (False:C215)
	//object Name: [USER]User_In.Variable20
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
	C_LONGINT:C283($_l_CataloguesTab; WS_l_CB_Catalogues)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable20"; Form event code:C388)
If (WS_l_CB_Catalogues=1)
	$_l_CataloguesTab:=Find in array:C230(DB_at_USERTAB; "Product Catalogues")
	If ($_l_CataloguesTab<0)
		INSERT IN ARRAY:C227(DB_at_USERTAB; Size of array:C274(DB_at_USERTAB)+1; 1)
		DB_at_USERTAB{Size of array:C274(DB_at_USERTAB)}:="Product Catalogues"
		INSERT IN ARRAY:C227(DB_al_UserTabPage; Size of array:C274(DB_al_UserTabPage)+1; 1)
		DB_al_UserTabPage{Size of array:C274(DB_at_USERTAB)}:=19
		WT_DataManagerListBuild
		
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable20"; $_t_oldMethodName)
