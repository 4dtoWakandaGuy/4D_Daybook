If (False:C215)
	//object Name: [COMPANIES]WS_TOOLBAR.oBarButton7
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
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_FieldNumber; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_TableNumber)
	C_POINTER:C301($BAR_ptr_Button)
	C_TEXT:C284($_t_oldMethodName; BAR_t_Button)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].WS_TOOLBAR.oBarButton7"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$BAR_ptr_Button:=Self:C308
		RESOLVE POINTER:C394($BAR_ptr_Button; BAR_t_Button; $_l_TableNumber; $_l_FieldNumber)
	: ($_l_event=On Long Click:K2:37)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		$BAR_ptr_Button:=Self:C308
		RESOLVE POINTER:C394($BAR_ptr_Button; BAR_t_Button; $_l_TableNumber; $_l_FieldNumber)
		//`Get the associated module..
		$_l_ButtonNumber:=Num:C11(BAR_t_Button)
		BAR_ButtonMethod($_l_ButtonNumber)
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].WS_TOOLBAR.oBarButton7"; $_t_oldMethodName)
