If (False:C215)
	//object Name: [COMPANIES]WS_TOOLBAR.oBarButton1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FieldNumber; $_l_TableNumber)
	C_POINTER:C301($BAR_ptr_Button)
	C_TEXT:C284($_t_oldMethodName; BAR_t_Button)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].WS_TOOLBAR.oBarButton1"; Form event code:C388)
$BAR_ptr_Button:=Self:C308
RESOLVE POINTER:C394($BAR_ptr_Button; BAR_t_Button; $_l_TableNumber; $_l_FieldNumber)
ERR_MethodTrackerReturn("OBJ [COMPANIES].WS_TOOLBAR.oBarButton1"; $_t_oldMethodName)