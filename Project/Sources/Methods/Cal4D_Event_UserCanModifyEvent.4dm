//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_Event_UserCanModifyEvent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2010 11:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $_bo_CanModify)
	C_POINTER:C301(<>Cal_ptr_GroupotherscanModField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_UserCanModifyEvent")

// ----------------------------------------------------
// Project Method: Cal4D_Event_UserCanModifyEvent --> Boolean

// Returns True if the current user can modify the currently loaded event.

// Access Type: Private

// Parameters: None

// Returns: Nothing
//   $0 : Boolean : True if it belongs to the current user

// Created by Dave Batton on Apr 17, 2006
// ----------------------------------------------------

If (False:C215)
	Case of 
		: (Cal4D_Event_UserOwnsEvent)
			$_bo_CanModify:=True:C214
			
		: (<>Cal_ptr_GroupotherscanModField->)  // The Cal4D_Event_UserOwnsEvent call loaded the [Cal4D_Group] record for us.
			$_bo_CanModify:=True:C214
			
		Else 
			$_bo_CanModify:=False:C215
	End case 
End if 
$_bo_CanModify:=True:C214

$0:=$_bo_CanModify
ERR_MethodTrackerReturn("Cal4D_Event_UserCanModifyEvent"; $_t_oldMethodName)