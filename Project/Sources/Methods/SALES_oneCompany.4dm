//%attributes = {}
If (False:C215)
	//Project Method Name:      SALES_oneCompany
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SALES_oneCompany")
//sales_Onecompany
CALL_SalesYearonYEar([COMPANIES:2]Company_Code:1; 2)
ERR_MethodTrackerReturn("SALES_oneCompany"; $_t_oldMethodName)