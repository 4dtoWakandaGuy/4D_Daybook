//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term PCWT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>DB_t_PostcodeLabel; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term PCWT")
$0:=$1
If (<>DB_t_PostcodeLabel#"Postcode")
	$0:=Replace string:C233($0; "Postcode"; <>DB_t_PostcodeLabel)
End if 
ERR_MethodTrackerReturn("Term PCWT"; $_t_oldMethodName)