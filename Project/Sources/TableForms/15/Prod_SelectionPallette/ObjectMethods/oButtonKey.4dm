If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oButtonKey
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(Prod_bo_AutoResize; PROD_bo_ViewExpand)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oButtonKey"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PROD_bo_ViewExpand=False:C215)
			
			PROD_bo_ViewExpand:=True:C214
			FORM GOTO PAGE:C247(1)
			Prod_PalletteSetObjects(1)
			Prod_bo_AutoResize:=False:C215
			
		Else 
			PROD_bo_ViewExpand:=False:C215
			FORM GOTO PAGE:C247(2)
			Prod_PalletteSetObjects(2)
			Prod_bo_AutoResize:=False:C215
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].Prod_SelectionPallette.oButtonKey"; $_t_oldMethodName)
