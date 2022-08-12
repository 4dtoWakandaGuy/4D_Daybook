//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_RecordToBlob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_FieldValue; $_blb_ReturnValue; $0)
	C_BOOLEAN:C305($_bo_FieldValue)
	C_DATE:C307($_d_FieldValue)
	C_LONGINT:C283($_l_FieldCount; $_l_FieldIndex; $_l_FieldLength; $_l_FieldType; $_l_FieldValue; $_l_TableNumber)
	C_PICTURE:C286($_pic_FieldValue)
	C_POINTER:C301($_ptr_Field; $_ptr_Table; $1)
	C_REAL:C285($_r_FieldValue)
	C_TEXT:C284($_t_FieldValue; $_t_oldMethodName)
	C_TIME:C306($_ti_FieldValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_RecordToBlob")
// CAC_RecordToBlob
// Takes a pointer to a table, and packs the current record to a blob.


//Declare temporary variables

SET BLOB SIZE:C606($_blb_ReturnValue; 0)

If (Count parameters:C259=1)
	
	$_ptr_Table:=$1
	$_l_TableNumber:=Table:C252($_ptr_Table)
	$_l_FieldCount:=Get last field number:C255($_ptr_Table)
	
	For ($_l_FieldIndex; 1; $_l_FieldCount)
		
		GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldIndex; $_l_FieldType; $_l_FieldLength)
		$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldIndex)
		
		Case of 
				
			: ($_l_FieldType=Is alpha field:K8:1)
				$_t_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_t_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is text:K8:3)
				$_t_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_t_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is real:K8:4)
				$_r_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_r_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is integer:K8:5)
				$_l_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_l_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is longint:K8:6)
				$_l_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_l_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is date:K8:7)
				$_d_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_d_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is time:K8:8)
				$_ti_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_ti_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is boolean:K8:9)
				$_bo_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_bo_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is picture:K8:10)
				$_pic_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_pic_FieldValue; $_blb_ReturnValue; *)
			: ($_l_FieldType=Is BLOB:K8:12)
				$_blb_FieldValue:=$_ptr_Field->
				VARIABLE TO BLOB:C532($_blb_FieldValue; $_blb_ReturnValue; *)
			Else 
				// Unhandled type error
		End case 
		
	End for 
	
End if 

$0:=$_blb_ReturnValue

// End CAC_RecordToBlob
ERR_MethodTrackerReturn("CAC_RecordToBlob"; $_t_oldMethodName)
