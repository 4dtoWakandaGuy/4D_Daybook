//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_ValidateCompanyCode
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
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName; $0; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_ValidateCompanyCode")
//this method will be passed a source type and a company code to validate
//the company code will always be in alpha format
$0:=$3

Case of 
	: ($1=0)  //Business Kit
		//as the business kit does not actually have COMPANIES seperate to contacts
		//the value passed here will be treated as the CUSID
		
	: ($1=1)
		//DAYBOOK WEBSERVER
		//THE COMPANY CODE SHOULD EXIST
End case 
$0:=$3
ERR_MethodTrackerReturn("DM_ValidateCompanyCode"; $_t_oldMethodName)