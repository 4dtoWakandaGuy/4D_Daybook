//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_Names
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
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

$_t_oldMethodName:=ERR_MethodTracker("Cont_Names")
$0:=""
FIRST RECORD:C50([CONTACTS:1])
While (Not:C34(End selection:C36([CONTACTS:1])))
	$0:=$0+[CONTACTS:1]Contact_Name:31+Char:C90(13)
	NEXT RECORD:C51([CONTACTS:1])
End while 
If ($0#"")
	$0:=Substring:C12($0; 1; Length:C16($0)-1)
End if 
ERR_MethodTrackerReturn("Cont_Names"; $_t_oldMethodName)