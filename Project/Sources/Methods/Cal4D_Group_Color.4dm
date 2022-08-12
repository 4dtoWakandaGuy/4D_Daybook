//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Group_Color
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Group_Color (cal ID{; color}) --> Number
	
	// Allows the developer to get and set a group's color.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Longint : The group ID
	//   $2 : Longint : The new RGB color (optional)
	
	// Returns:
	//   $0 : Longint : The group's color
	
	// Created by Dave Batton on Jun 10, 2004
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:28`Method: Cal4D_Group_Color
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0; $1; $2; $_l_colour)
	C_POINTER:C301(<>Cal_ptr_GroupFld_Colour; <>Cal_ptr_GroupTable)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Group_Color")


Cal4D_Group_LoadRecord($1)

$_l_colour:=<>Cal_ptr_GroupFld_Colour->

If (Count parameters:C259>=2)
	If (Not:C34(Is new record:C668(<>Cal_ptr_GroupTable->)))
		READ WRITE:C146(<>Cal_ptr_GroupTable->)
		LOAD RECORD:C52(<>Cal_ptr_GroupTable->)
	End if 
	<>Cal_ptr_GroupFld_Colour->:=$2
	$_l_colour:=<>Cal_ptr_GroupFld_Colour->
	If (Not:C34(Is new record:C668(<>Cal_ptr_GroupTable->)))
		SAVE RECORD:C53(<>Cal_ptr_GroupTable->)
		UNLOAD RECORD:C212(<>Cal_ptr_GroupTable->)
	End if 
End if 

$0:=$_l_colour
ERR_MethodTrackerReturn("Cal4D_Group_Color"; $_t_oldMethodName)