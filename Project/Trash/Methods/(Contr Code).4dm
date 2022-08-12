//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr Code
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_IsUnique)
	C_TEXT:C284($_t_ContactCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contr Code")
//Contr Code
//[CONTRACTS]Contract Code:=Gen_CodePref (9;->[CONTRACTS]Contract Code)
Repeat 
	$_t_ContactCode:=Gen_CodePref(9; ->[CONTRACTS:17]Contract_Code:3)
	SET QUERY DESTINATION:C396(3; $_l_IsUnique)
	QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contract_Code:3=$_t_ContactCode)
	If ($_l_IsUnique=0)
		[CONTRACTS:17]Contract_Code:3:=$_t_ContactCode
	End if 
	SET QUERY DESTINATION:C396(0)
Until ($_l_IsUnique=0)
ERR_MethodTrackerReturn("Contr Code"; $_t_oldMethodName)