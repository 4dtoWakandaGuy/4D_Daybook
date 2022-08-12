If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oBanner_Week
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/01/2013 17:16
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oBanner_Week"; Form event code:C388)

If (True:C214)
	If (False:C215)
		//*****************************************************************************
		////
		////  Object Method: Cal4D_Cal_CalendarWithMinis_d.CalBanner_Week_G
		////
		////  Written by Charles Vass - 07/07/2009, 12:13
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
	: (($_l_FormEvent=On Clicked:K2:4) | ($_l_FormEvent=On Double Clicked:K2:5))
		Cal4D_OM_CalWithMinis_Week_Bnr($_l_FormEvent; $_ptr_Self)
		//
		//--------------------------------------------------------------------------------
End case 

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oBanner_Week"; $_t_oldMethodName)
