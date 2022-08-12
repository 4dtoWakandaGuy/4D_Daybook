//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      ConfirmT Cancel
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
	C_LONGINT:C283($_l_Process; $_l_ProcessState; $_l_ProcessTime; $Secs)
	C_TEXT:C284($_t_oldMethodName; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ConfirmT Cancel")
PROCESS PROPERTIES:C336(Current process:C322; vT; $_l_ProcessState; $_l_ProcessTime)
vT:=Substring:C12(vT; 2; 32000)
$Secs:=Num:C11(First_Field(->vT; Char:C90(9)))
$_l_Process:=Num:C11(First_Field(->vT; Char:C90(9)))
DelayTicks(60*$Secs)
POST OUTSIDE CALL:C329($_l_Process)
ERR_MethodTrackerReturn("ConfirmT Cancel"; $_t_oldMethodName)