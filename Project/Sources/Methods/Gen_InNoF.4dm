//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_InNoF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 22:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(oOK; vNo)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_InNoF")
vNo:=Records in selection:C76($1->)
If (Records in selection:C76($1->)=0)
	oOK:=1
End if 
vFromIn:=True:C214
ERR_MethodTrackerReturn("Gen_InNoF"; $_t_oldMethodName)