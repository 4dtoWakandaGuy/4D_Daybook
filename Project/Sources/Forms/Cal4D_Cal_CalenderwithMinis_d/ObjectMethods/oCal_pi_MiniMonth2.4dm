If (False:C215)
	//object Name: Object Name:      Cal4D_Cal_CalenderwithMinis_d.oCal_pi_MiniMonth2
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
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ Cal4D_Cal_CalenderwithMinis_d.oCal_pi_MiniMonth2")

If (True:C214)
	If (False:C215)
		//*****************************************************************************
		////
		////  Object Method: Cal4D_Cal_CalendarWithMinis_d.Mini_Month_2_G
		////
		////  Written by Charles Vass - 03/09/2009, 09:21
		////
		////  Purpose:
		////
		////  $1 - type - purpose
		////
		////
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
		Cal4D_OM_CalWithMinis_Mini($_ptr_Self)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Load:K2:1)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Activate:K2:9)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Header:K2:17)
		//insert_code_here
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Unload:K2:2)
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Outside Call:K2:11)
		//insert_code_here
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Validate:K2:3)
		//insert_code_here
		//
	: ($_l_FormEvent=On Resize:K2:27)
		// The following code sets the lines at the top of the Master Input form to the
		// width of the window.
		//
		//--------------------------------------------------------------------------------
End case 

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("OBJ Cal4D_Cal_CalenderwithMinis_d.oCal_pi_MiniMonth2"; $_t_oldMethodName)
