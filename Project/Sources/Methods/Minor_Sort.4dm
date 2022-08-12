//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_Sort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 13:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAdd; vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Minor_Sort")
vAdd:=0
ALL RECORDS:C47($1->)
vNo:=Records in selection:C76($1->)
ERR_MethodTrackerReturn("Minor_Sort"; $_t_oldMethodName)
