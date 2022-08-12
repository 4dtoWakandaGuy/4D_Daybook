//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies vAT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/08/2011 16:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>DB_t_Address1Label; <>DB_t_Address2Label; <>DB_t_CountryLabel; <>DB_t_CountyLabel; <>DB_t_PostcodeLabel; <>DB_t_TownLabel; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies vAT")
DB_t_Address1Label:=<>DB_t_Address1Label
DB_t_Address2Label:=<>DB_t_Address2Label
DB_t_TownLabel:=<>DB_t_TownLabel
DB_t_CountyLabel:=<>DB_t_CountyLabel
DB_t_PostcodeLabel:=<>DB_t_PostcodeLabel
DB_t_CountryLabel:=<>DB_t_CountryLabel
ERR_MethodTrackerReturn("Companies vAT"; $_t_oldMethodName)