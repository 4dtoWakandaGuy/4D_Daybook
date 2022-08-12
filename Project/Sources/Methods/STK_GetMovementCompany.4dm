//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetMovementCompany
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/01/2012 10:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CompanyID; $2; STK_l_CompanyID)
	C_TEXT:C284($_t_CompanyCode; $_t_ContactCode; $_t_oldMethodName; $1; STK_t_fromCompany; STK_t_FromContact)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetMovementCompany")


If (Count parameters:C259>=2)
	QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$1)
	$_t_CompanyCode:=[STOCK_MOVEMENTS:40]Company_From:2
	$_t_ContactCode:=[STOCK_MOVEMENTS:40]Contact_Code:3
	$_l_CompanyID:=[STOCK_MOVEMENTS:40]xCompanyFromID:25
	SET PROCESS VARIABLE:C370($2; STK_t_fromCompany; $_t_CompanyCode)
	SET PROCESS VARIABLE:C370($2; STK_t_FromContact; $_t_ContactCode)
	SET PROCESS VARIABLE:C370($2; STK_l_CompanyID; $_l_CompanyID)
	
	
End if 
ERR_MethodTrackerReturn("STK_GetMovementCompany"; $_t_oldMethodName)
