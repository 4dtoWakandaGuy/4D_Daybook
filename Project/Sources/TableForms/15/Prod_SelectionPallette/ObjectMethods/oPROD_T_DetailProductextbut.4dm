If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oPROD_T_DetailProductextbut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oPROD_T_DetailProductextbut"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If ([PRODUCTS:9]Description:6#"")
			Text_Expand(->[PRODUCTS:9]Description:6; "Produc Description"; False:C215)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].Prod_SelectionPallette.oPROD_T_DetailProductextbut"; $_t_oldMethodName)
