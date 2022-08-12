//%attributes = {}
If (False:C215)
	//Project Method Name:      CAC_BlobToRecord
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
	C_BLOB:C604($_blb_Output; $_blob_CacheBlob; $1)
	C_BOOLEAN:C305($_bo_Output)
	C_DATE:C307($_d_Output)
	C_LONGINT:C283($_l_FieldCount; $_l_FieldLength; $_l_FieldNumber; $_l_FieldType; $_l_Offset; $_l_Output; $_l_Result; $_l_ReturnValue; $_l_TableNumber; $0)
	C_PICTURE:C286($_pic_Output)
	C_POINTER:C301($_ptr_CacheTable; $_ptr_Field; $2)
	C_REAL:C285($_r_Output)
	C_TEXT:C284($_t_oldMethodName; $_t_Output)
	C_TIME:C306($_ti_Output)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAC_BlobToRecord")
// CAC_BlobToRecord



$_l_ReturnValue:=-1

If (Count parameters:C259=2)
	
	$_blob_CacheBlob:=$1
	$_ptr_CacheTable:=$2
	$_l_Offset:=0
	
	//Declare temporary variables
	
	$_l_TableNumber:=Table:C252($_ptr_CacheTable)
	$_l_FieldCount:=Get last field number:C255($_ptr_CacheTable)
	
	$_l_ReturnValue:=0
	
	CREATE RECORD:C68($_ptr_CacheTable->)
	
	For ($_l_FieldNumber; 1; $_l_FieldCount)
		
		GET FIELD PROPERTIES:C258($_l_TableNumber; $_l_FieldNumber; $_l_FieldType; $_l_FieldLength)
		$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
		
		Case of 
				
			: ($_l_FieldType=Is alpha field:K8:1)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_t_Output; $_l_Offset)
				$_ptr_Field->:=$_t_Output
			: ($_l_FieldType=Is text:K8:3)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_t_Output; $_l_Offset)
				$_ptr_Field->:=$_t_Output
			: ($_l_FieldType=Is real:K8:4)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_r_Output; $_l_Offset)
				$_ptr_Field->:=$_r_Output
			: ($_l_FieldType=Is integer:K8:5)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_l_Result; $_l_Offset)
				$_ptr_Field->:=$_l_Result
			: ($_l_FieldType=Is longint:K8:6)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_l_Output; $_l_Offset)
				$_ptr_Field->:=$_l_Output
			: ($_l_FieldType=Is date:K8:7)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_d_Output; $_l_Offset)
				$_ptr_Field->:=$_d_Output
			: ($_l_FieldType=Is time:K8:8)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_ti_Output; $_l_Offset)
				$_ptr_Field->:=$_ti_Output
			: ($_l_FieldType=Is boolean:K8:9)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_bo_Output; $_l_Offset)
				$_ptr_Field->:=$_bo_Output
			: ($_l_FieldType=Is picture:K8:10)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_pic_Output; $_l_Offset)
				$_ptr_Field->:=$_pic_Output
			: ($_l_FieldType=Is BLOB:K8:12)
				BLOB TO VARIABLE:C533($_blob_CacheBlob; $_blb_Output; $_l_Offset)
				$_ptr_Field->:=$_blb_Output
			Else 
				// Unhandled type error
				$_l_ReturnValue:=-1
		End case 
		
	End for 
	
End if 

$0:=$_l_ReturnValue

// End CAC_BlobToRecord
ERR_MethodTrackerReturn("CAC_BlobToRecord"; $_t_oldMethodName)
