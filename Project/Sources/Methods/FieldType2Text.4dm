//%attributes = {}
If (False:C215)
	//Project Method Name:      FieldType2Text
	//------------------ Method Notes ------------------
	// FieldType2text
	// Returns a text description for a field type
	// 7/10/02 pb
	// Parameters: $1 = the field type constant
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FieldType2Text")
Case of 
	: ($1=Is alpha field:K8:1)
		$0:="Alpha"
	: ($1=Is BLOB:K8:12)
		$0:="Blob"
	: ($1=Is boolean:K8:9)
		$0:="Boolean"
	: ($1=Is date:K8:7)
		$0:="Date"
	: ($1=Is integer:K8:5)
		$0:="Integer"
	: ($1=Is longint:K8:6)
		$0:="Longint"
	: ($1=Is picture:K8:10)
		$0:="Picture"
	: ($1=Is real:K8:4)
		$0:="Real"
	: ($1=Is text:K8:3)
		$0:="Text"
	: ($1=Is time:K8:8)
		$0:="Time"
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("FieldType2Text"; $_t_oldMethodName)