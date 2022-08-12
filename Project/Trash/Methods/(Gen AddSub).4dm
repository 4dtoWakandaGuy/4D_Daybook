//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen_AddSub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 13:12:17If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1; $2)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_AddSub")
$0:=0
FIRST RECORD:C50($1->)
While (Not:C34(End selection:C36($1->)))
	$0:=$0+$2->
	NEXT RECORD:C51($1->)
End while 
ERR_MethodTrackerReturn("Gen_AddSub"; $_t_oldMethodName)