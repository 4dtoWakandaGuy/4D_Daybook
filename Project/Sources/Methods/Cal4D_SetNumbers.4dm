//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_SetNumbers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>CAL_d_Box1Date)
	C_LONGINT:C283(<>CAL_l_FirstBox; <>CAL_l_LastBox; $_l_FirstDateNum; $_l_ObjectNumber)
	C_POINTER:C301($_ptr_Object)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_SetNumbers")

// ----------------------------------------------------
// Project Method: Cal4D_SetNumbers

// Assigns day numbers to the calendar boxes.

// Access Type: Private

// Parameters: None

// Returns: Nothing

// Created by Dave Batton on Aug 5, 2004
// ----------------------------------------------------


$_l_FirstDateNum:=Day of:C23(<>CAL_d_Box1Date)

For ($_l_ObjectNumber; 1; (<>CAL_l_FirstBox-1))
	$_ptr_Object:=Get pointer:C304("<>Cal4D_l_Num"+String:C10($_l_ObjectNumber; "000"))  // "<>" works on Mac too.
	$_ptr_Object->:=$_l_FirstDateNum+$_l_ObjectNumber-1
End for 

For ($_l_ObjectNumber; <>CAL_l_FirstBox; <>CAL_l_LastBox)
	$_ptr_Object:=Get pointer:C304("<>Cal4D_l_Num"+String:C10($_l_ObjectNumber; "000"))
	$_ptr_Object->:=$_l_ObjectNumber-<>CAL_l_FirstBox+1
End for 

For ($_l_ObjectNumber; <>CAL_l_LastBox+1; 42)
	$_ptr_Object:=Get pointer:C304("<>Cal4D_l_Num"+String:C10($_l_ObjectNumber; "000"))
	$_ptr_Object->:=$_l_ObjectNumber-<>CAL_l_LastBox
End for 
ERR_MethodTrackerReturn("Cal4D_SetNumbers"; $_t_oldMethodName)