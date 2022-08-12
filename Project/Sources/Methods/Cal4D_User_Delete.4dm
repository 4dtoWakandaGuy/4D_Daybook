//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_User_Delete
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_User_Delete (user name) --> Error
	
	// Deletes the specified user and all related groups and events.
	// If we're not already in a transaction, a transaction is used to make sure all of the records get deleted.
	// Returns 0 if the user is deleted, or an error number if there's a problem.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : User name
	
	// Returns:
	//   $0 : Longint : Error
	
	// Created by Dave Batton on Apr 17, 2006
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:23`Method: Cal4D_User_Delete
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_WasinTransaction)
	C_LONGINT:C283($_l_UserID; $0)
	C_POINTER:C301(<>Cal_ptr_GroupFld_ID; <>Cal_ptr_GroupTable; <>Cal_ptr_GroupUserIDField; Cal_ptr_UserIDField; Cal_ptr_UserTable)
	C_TEXT:C284($_t_oldMethodName; $_t_UserName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_User_Delete")
$_t_UserName:=$1

$_l_UserID:=Cal4D_User_ID($_t_UserName)

Error:=0

$_bo_WasinTransaction:=In transaction:C397
Cal4D_TRANSACTION("START")  // These can't be nested, so this is harmless if we're already in one.

QUERY:C277(<>Cal_ptr_GroupTable->; <>Cal_ptr_GroupUserIDField->=$_l_UserID)

While ((Not:C34(End selection:C36(<>Cal_ptr_GroupTable->))) & (Error=0))
	Cal4D_Group_Delete(<>Cal_ptr_GroupFld_ID->)
End while 

If (Error=0)
	READ WRITE:C146(Cal_ptr_UserTable->)
	QUERY:C277(Cal_ptr_UserTable->; Cal_ptr_UserIDField->=$_l_UserID)
	
	Case of 
		: (Records in selection:C76(Cal_ptr_UserTable->)=0)
			Error:=19310
			
		: (Locked:C147(Cal_ptr_UserTable->))
			Error:=19311
			
		Else 
			DELETE RECORD:C58(Cal_ptr_UserTable->)
	End case 
End if 

If (Not:C34($_bo_WasinTransaction))
	If (Error=0)
		Cal4D_TRANSACTION("VALIDATE")
	Else 
		Cal4D_TRANSACTION("CANCEL")
	End if 
End if 

// We don't need to update the calendar here. Cal4D_Group_Delete did that for us.
ERR_MethodTrackerReturn("Cal4D_User_Delete"; $_t_oldMethodName)