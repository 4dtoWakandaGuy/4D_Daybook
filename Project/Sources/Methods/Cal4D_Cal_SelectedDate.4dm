//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SelectedDate
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Cal_SelectedDate ({date}) --> Date
	
	// Allows the developer to set and get the currently selected date.
	// Highlights the currently selected date (<>Cal4D_DateClicked).
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Date : The date to set as selected (optional)
	
	// Returns:
	//   $0 : Date : The currently selected date
	
	// Created by Dave Batton on May 25, 2004
	//
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 15:20`Method: Cal4D_Cal_SelectedDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0; $1; CAL_d_SelectedDate)
	C_LONGINT:C283(Cal_l_SelectedDate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SelectedDate")

//```----------------------------------------------------



If (Count parameters:C259>=1)
	If ($1#CAL_d_SelectedDate)
		CAL_d_SelectedDate:=$1
		Cal_l_SelectedDate:=Cal4D_Cal_DateToOrdinal($1)
		
	End if 
End if 

$0:=CAL_d_SelectedDate
ERR_MethodTrackerReturn("Cal4D_Cal_SelectedDate"; $_t_oldMethodName)