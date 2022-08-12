//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_ModO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283(vCalls)
	C_TEXT:C284($_t_CallCodeFind; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_ModO")

If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	$_t_CallCodeFind:=$1
End if 
//NG this is the only call in the system to Gen_ModLay
Gen_ModLay("Outstanding Calls"; "Calls_File"; "Master"; ->[SERVICE_CALLS:20]; ->vCalls; "Calls_SelP"; "Calls"; "Outs"; $_t_CallCodeFind; $_bo_AutoFind)
ERR_MethodTrackerReturn("Calls_ModO"; $_t_oldMethodName)