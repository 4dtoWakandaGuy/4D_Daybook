//%attributes = {}
If (False:C215)
	//Project Method Name:      FieldDataToText
	//------------------ Method Notes ------------------
	// FieldDataToText
	// converts any type of field data to a string
	// 21/11/02 pb
	// Parameters: $1=pointer to the field
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($_Ptr_Field; $1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FieldDataToText")

$_Ptr_Field:=$1
Case of 
	: ((Type:C295($_Ptr_Field->)=Is alpha field:K8:1) | (Type:C295($_Ptr_Field->)=Is text:K8:3))
		$0:=$_Ptr_Field->
	: ((Type:C295($_Ptr_Field->)=Is real:K8:4) | (Type:C295($_Ptr_Field->)=Is integer:K8:5) | (Type:C295($_Ptr_Field->)=Is longint:K8:6))
		$0:=String:C10($_Ptr_Field->)
	: (Type:C295($_Ptr_Field->)=Is date:K8:7)
		$0:=String:C10($_Ptr_Field->)
	: (Type:C295($_Ptr_Field->)=Is time:K8:8)
		$0:=String:C10($_Ptr_Field->)
	: (Type:C295($_Ptr_Field->)=Is boolean:K8:9)
		If ($_Ptr_Field->=True:C214)
			$0:="True"
		Else 
			$0:="False"
		End if 
	: (Type:C295($_Ptr_Field->)=Is picture:K8:10)
		// can't export a picture
	: (Type:C295($_Ptr_Field->)=Is subtable:K8:11)
		// This should never happen ...
	: (Type:C295($_Ptr_Field->)=Is BLOB:K8:12)
		// this should never happen ...
End case 
ERR_MethodTrackerReturn("FieldDataToText"; $_t_oldMethodName)