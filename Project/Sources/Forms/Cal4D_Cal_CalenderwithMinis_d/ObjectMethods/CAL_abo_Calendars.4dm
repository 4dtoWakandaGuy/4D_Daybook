If (False:C215)
	//object Name: Object Name:      Cal4D_Cal_CalenderwithMinis_d.CAL_abo_Calendars
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
	//ARRAY BOOLEAN(Cal_lb_ListboxCalender;0)
	//ARRAY TEXT(Cal_at_Calendar;0)
	C_LONGINT:C283($_l_FormEvent)
	C_POINTER:C301($_ptr_Self)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ Cal4D_Cal_CalenderwithMinis_d.CAL_abo_Calendars"; Form event code:C388)

If (True:C214)
	If (False:C215)
		//*****************************************************************************
		////
		////  Object Method: Cal4D_Cal_CalendarWithMinis_d.List Box
		////
		////  Written by Charles Vass - 03/31/2009, 13:33
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
	: (($_l_FormEvent=On Load:K2:1) | ($_l_FormEvent=On Double Clicked:K2:5) | ($_l_FormEvent=On Clicked:K2:4))
		Cal4D_OM_Calendars_ListBox($_ptr_Self; $_l_FormEvent; ->Cal_lb_ListboxCalender; ->Cal_at_Calendar)
		//
		//--------------------------------------------------------------------------------
End case 

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("OBJ Cal4D_Cal_CalenderwithMinis_d.CAL_abo_Calendars"; $_t_oldMethodName)
