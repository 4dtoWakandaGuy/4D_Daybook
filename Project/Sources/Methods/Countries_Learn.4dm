//%attributes = {}
If (False:C215)
	//Project Method Name:      Countries_Learn
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
	ARRAY TEXT:C222($_at_CountryCodes; 0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Countries_Learn")
//RAeS Countries
ALL RECORDS:C47([COMPANIES:2])
ARRAY TEXT:C222($_at_CountryCodes; 0)

DISTINCT VALUES:C339([COMPANIES:2]Country:8; $_at_CountryCodes)
READ WRITE:C146([COUNTRIES:73])
ARRAY TO SELECTION:C261($_at_CountryCodes; [COUNTRIES:73]COUNTRY_CODE:1)
ERR_MethodTrackerReturn("Countries_Learn"; $_t_oldMethodName)