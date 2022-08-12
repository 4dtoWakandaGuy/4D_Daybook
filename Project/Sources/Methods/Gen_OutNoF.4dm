//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_OutNoF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_OutNoF")
vNo:=Records in selection:C76($1->)
If (Records in selection:C76($1->)=0)
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("Gen_OutNoF"; $_t_oldMethodName)