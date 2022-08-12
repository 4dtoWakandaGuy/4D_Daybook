//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_LoadAssociatedRecord
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_LoadAssociatedRecord (->variable object; read/write mode)
	
	// Pass this method a pointer to a variable object (like <>Cal4D_Text1 or
	//   <>Cal_Banner1) and this method will load the related [Calendar] record.
	// Pass one of the 4D constants for the read/write mode:
	//      Read Mode
	//      Write Mode
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Pointer : A 4D form object
	//   $2 : Longint : The read/write mode
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 21, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:26`Method: Cal4D_LoadAssociatedRecord
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_eventID; $_l_ReadWriteMode; $2)
	C_POINTER:C301(<>Cal_ptr_EventIDField; <>Cal_ptr_EventTable; $_ptr_object; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_LoadAssociatedRecord")


$_ptr_object:=$1
$_l_ReadWriteMode:=$2

If ($_l_ReadWriteMode=Read mode:K24:5)
	READ ONLY:C145(<>Cal_ptr_EventTable->)
Else 
	READ WRITE:C146(<>Cal_ptr_EventTable->)
End if 

$_l_eventID:=Cal4D_GetEventIDfromFormObject($_ptr_object)

// Even if we get a 0 for the object ID, this will reduce the selection.
QUERY:C277(<>Cal_ptr_EventTable->; <>Cal_ptr_EventIDField->=$_l_eventID)
ERR_MethodTrackerReturn("Cal4D_LoadAssociatedRecord"; $_t_oldMethodName)