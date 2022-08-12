//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_OutNo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Gen_OutNo")
If (Count parameters:C259=1)
	vNo:=Records in selection:C76($1->)
	If (vNo=0)
		CANCEL:C270
	End if 
Else 
	vNo:=Records in selection:C76
	If (vNo=0)
		CANCEL:C270
	End if 
End if 
ERR_MethodTrackerReturn("Gen_OutNo"; $_t_oldMethodName)