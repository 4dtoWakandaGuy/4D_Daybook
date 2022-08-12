//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_FindVars
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2009 19:44:01If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>ProdCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_FindVars")
<>CompCode:=[COMPANIES:2]Company_Code:1
<>ContCode:=[CONTACTS:1]Contact_Code:2
<>CallCode:=[SERVICE_CALLS:20]Call_Code:4
<>OrderCode:=[ORDERS:24]Order_Code:3
<>JobCode:=[JOBS:26]Job_Code:1
<>ProdCode:=[PRODUCTS:9]Product_Code:1
ERR_MethodTrackerReturn("Gen_FindVars"; $_t_oldMethodName)