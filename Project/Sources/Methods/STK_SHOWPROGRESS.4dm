//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SHOWPROGRESS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/12/2014 23:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SHOWPROGRESS")

Open window:C153(0; Screen height:C188-200; 200; Screen height:C188-50; Palette window:K34:3)
DIALOG:C40("STK_PROGRESS")
ERR_MethodTrackerReturn("STK_SHOWPROGRESS"; $_t_oldMethodName)