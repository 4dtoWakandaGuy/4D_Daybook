//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls Code
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2/6/10 11:08 AM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(INV_isUnique)
	C_TEXT:C284(<>TechCode; $_t_CallCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls Code")

Repeat 
	$_t_CallCode:=<>TechCode+Gen_CodePref(12; ->[SERVICE_CALLS:20]Call_Code:4; <>TechCode)
	//$_t_CallCode:=[SERVICE CALLS]Call Code
	SET QUERY DESTINATION:C396(3; INV_isUnique)
	QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Call_Code:4=$_t_CallCode)
	If (INV_isUnique=0)
		[SERVICE_CALLS:20]Call_Code:4:=$_t_CallCode
	End if 
	SET QUERY DESTINATION:C396(0)
Until (INV_isUnique=0)
ERR_MethodTrackerReturn("Calls Code"; $_t_oldMethodName)