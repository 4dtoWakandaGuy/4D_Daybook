//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Clear Xs
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
	C_LONGINT:C283(xCancel; xDelete; xNew; xNext; xOK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Clear Xs")
xOK:=0
xCancel:=0
xNext:=0
xDelete:=0
xNew:=0
ERR_MethodTrackerReturn("Clear Xs"; $_t_oldMethodName)