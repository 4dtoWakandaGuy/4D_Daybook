//%attributes = {}
If (False:C215)
	//Project Method Name:      FF_GetData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  03/06/2010 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FF_GetData")

Case of 
	: ([CUSTOM_FIELDS:98]Date_Field:7#!00-00-00!)
		$0:=String:C10([CUSTOM_FIELDS:98]Date_Field:7; System date short:K1:1)
	: ([CUSTOM_FIELDS:98]Real_or_Integer:5#0)
		$0:=String:C10([CUSTOM_FIELDS:98]Real_or_Integer:5)
	: ([CUSTOM_FIELDS:98]String_31:4#"")
		$0:=[CUSTOM_FIELDS:98]String_31:4
	: ([CUSTOM_FIELDS:98]Text_Field:6#"")
		$0:=[CUSTOM_FIELDS:98]Text_Field:6
	Else 
		$0:=""
End case 
ERR_MethodTrackerReturn("FF_GetData"; $_t_oldMethodName)