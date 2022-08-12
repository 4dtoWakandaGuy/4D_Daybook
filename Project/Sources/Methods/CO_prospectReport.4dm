//%attributes = {}
If (False:C215)
	//Project Method Name:      CO_prospectReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  15/05/2010 10:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_prospectReport")
If (Count parameters:C259=0)
	CREATE SET:C116([COMPANIES:2]; "$temp")
	USE SET:C118("ListboxSet0")
End if 
ORDER BY:C49([COMPANIES:2]Sales_Person:29; >; [COMPANIES:2]Company_Type:13; >; [COMPANIES:2]Entry_Date:16; >)
If (Not:C34(SR_ReportOK("CompPros")))
	BREAK LEVEL:C302(2; 1)
	ACCUMULATE:C303([COMPANIES:2]Value:31)
	FORM SET OUTPUT:C54([COMPANIES:2]; "Companies_Pros")
	PRINT SELECTION:C60([COMPANIES:2])
	
End if 
If (Count parameters:C259=0)
	USE SET:C118("$temp")
	DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
End if 
ERR_MethodTrackerReturn("CO_prospectReport"; $_t_oldMethodName)