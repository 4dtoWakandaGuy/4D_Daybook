//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_TextObjectMethod
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_TextObjectMethod
	
	// Called from the Text event objects on the Cal4D_Calendar form.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : A pointer to the form object
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 27, 2004
	// ----------------------------------------------------
	
	//declarations
	
	
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:24`Method: Cal4D_TextObjectMethod
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_EndDate; $_d_StartDate)
	C_LONGINT:C283($_l_colour; $_l_eventID; $_l_GroupID)
	C_POINTER:C301(<>CAL_ptr_SelectedObject; $_ptr_object; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_Title; $_t_Type)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_TextObjectMethod")

$_ptr_object:=$1

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If ($_ptr_object#<>CAL_ptr_SelectedObject)
			Cal4D_SelectObject($_ptr_object)
			
			$_l_eventID:=Cal4D_GetEventIDfromFormObject($_ptr_object)
			Cal4D_Event_GetData($_l_eventID; ->$_t_Type; ->$_t_Title; ->$_d_StartDate; ->$_ti_StartTime; ->$_d_EndDate; ->$_ti_EndTime; ->$_l_colour; ->$_l_GroupID)
			
			// Set the selected calendar date to the date associated with this event.
			Cal4D_Cal_SelectedDate($_d_StartDate)
			
			Cal4D_CallCallbackMethod(On Selection Change:K2:29; $_l_eventID)
		End if 
		
	: (Form event code:C388=On Double Clicked:K2:5)
		$_l_eventID:=Cal4D_GetEventIDfromFormObject($_ptr_object)
		
		If ($_l_eventID<0)  // Our records have negative IDs. Temporary events have positive IDs.
			Cal4D_Event_Edit($_l_eventID)
		Else 
			Cal4D_CallCallbackMethod(On Double Clicked:K2:5; $_l_eventID)
		End if 
End case 
ERR_MethodTrackerReturn("Cal4D_TextObjectMethod"; $_t_oldMethodName)