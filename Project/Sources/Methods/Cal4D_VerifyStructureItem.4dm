//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_VerifyStructureItem
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_VerifyStructureItem (table or field name; field type{; indexed}) --> Pointer
	
	// Makes sure the required field exists. If not, the developer is notified.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : The required table or field name
	//   $2 : Longint : The expected field type
	//   $3 : Boolean : The field should be indexed? (optional)
	
	// Returns:
	//   $0 : Pointer : A pointer to the field
	
	// Created by Dave Batton on Feb 7, 2006
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 14:04`Method: Cal4D_VerifyStructureItem
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Indexed; $3)
	C_LONGINT:C283($_l_FieldType; $2)
	C_POINTER:C301(<>CAL_ptr_Field; $0)
	C_TEXT:C284($_t_FieldName; $_t_OldErrorHandler; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_VerifyStructureItem")

$_t_FieldName:=$1
$_l_FieldType:=0
$_bo_Indexed:=False:C215

If (Count parameters:C259>=2)
	$_l_FieldType:=$2
	If (Count parameters:C259>=3)
		$_bo_Indexed:=$3
	End if 
End if 

// We won't bother with calling Cal4D_Init just to keep this fast.

$_t_OldErrorHandler:=Method called on error:C704
//ON ERR CALL("Cal4D_DummyMethod")
Error:=0

EXECUTE FORMULA:C63("<>Cal4D_po_Field:=->"+$_t_FieldName)

If (Error=0)
	If ($_t_FieldName#"@]")  // Make sure it's a field, not a table.
		If ($_l_FieldType=Type:C295(<>CAL_ptr_Field->))
			If ($_bo_Indexed)
				SET INDEX:C344(<>CAL_ptr_Field->; True:C214; *)  // *=asynchronous
			End if 
			
		Else 
			Cal4D_Alert("The "+$_t_FieldName+" field is set to a data type of "+String:C10(Type:C295(<>CAL_ptr_Field->))+" rather than to the expected type of "+String:C10($_l_FieldType)+".")
		End if 
	End if 
	
Else 
	If ($_t_FieldName="@]")  // It's a table
		Cal4D_Alert("The Cal4D component requires a table that does not exist: "+$_t_FieldName)
	Else 
		Cal4D_Alert("The Cal4D component requires a field that does not exist: "+$_t_FieldName)
	End if 
	ON ERR CALL:C155($_t_OldErrorHandler)
	//ALERT("Method called on error "+Method called on error+"Cal4D_VerifyStructureItem")
	ABORT:C156  // Give up. Otherwise we'll display an error message for every missing field, which could be a lot of error messages.
End if 

ON ERR CALL:C155($_t_OldErrorHandler)

$0:=<>CAL_ptr_Field
ERR_MethodTrackerReturn("Cal4D_VerifyStructureItem"; $_t_oldMethodName)