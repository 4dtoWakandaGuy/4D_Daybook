If (False:C215)
	//object Name: Object Name:      Cal4D_Cal_CalenderwithMinis_d.Cal4D_NavBar_G
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FormEvent)
	C_POINTER:C301($_ptr_Self)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName; $_t_RefID)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ Cal4D_Cal_CalenderwithMinis_d.Cal4D_NavBar_G")

If (True:C214)
	If (False:C215)
		//*****************************************************************************
		// //
		// //  Object Method: Cal4D_Cal_CalendarWithMinis_d.Cal4D_NavBar_G
		// //
		// //  Written by Charles Vass - 04/17/2009, 11:52
		// //
		// //  Purpose:
		// //
		// //  $1 - type - purpose
		// //
		// //
		//*****************************************************************************
	End if 
	$_t_MethodName:=Current method name:C684
	//===========================    Declare Variables     ===========================
	//method_parameters_declarations
	//--------------------------------------------------------------------------------
	//method_wide_constants_declarations
	//--------------------------------------------------------------------------------
	//local_variable_declarations
	//===========================    Initialize and Setup    ===========================
	$_l_FormEvent:=Form event code:C388
	$_ptr_Self:=Self:C308
	
End if 

//===========================      Method Actions      ===========================

Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		// //  Get the ID to the object just clicked on and call the Object Method handler
		//{
		$_t_RefID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)
		//__Cal4D_NavBar_OM ($_l_FormEvent;$_t_RefID)
		//}
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Resize:K2:27)
		// The following code sets the lines at the top of the Master Input form to the
		// width of the window.
		//
		//--------------------------------------------------------------------------------
End case 

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("OBJ Cal4D_Cal_CalenderwithMinis_d.Cal4D_NavBar_G"; $_t_oldMethodName)
