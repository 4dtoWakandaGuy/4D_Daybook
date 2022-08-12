//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InLPBC
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 16:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_DefaultEntry; <>ForceCred)
	C_TEXT:C284(<>CompCode; <>ContCode; $_t_oldMethodName; SD_t_CallingCompanyCode; SD_t_CallingContactCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPBC")
If (SD_t_CallingCompanyCode#"") & ([INVOICES:39]Company_Code:2="")
	[INVOICES:39]Company_Code:2:=SD_t_CallingCompanyCode
	SD_t_CallingCompanyCode:=""
End if 
If ([INVOICES:39]Contact_Code:3="") & (SD_t_CallingContactCode#"")
	[INVOICES:39]Contact_Code:3:=SD_t_CallingContactCode
	SD_t_CallingContactCode:=""
End if 

If ((<>CompCode#"") & ([INVOICES:39]Company_Code:2="") & (<>SYS_bo_DefaultEntry) & (<>ForceCred=False:C215))
	[INVOICES:39]Company_Code:2:=<>CompCode
	RELATE ONE:C42([INVOICES:39]Company_Code:2)
	Invoices_InLPAr
	If (<>ContCode="")
		Check_ContDef(->[INVOICES:39]Company_Code:2; ->[INVOICES:39]Contact_Code:3)
	End if 
	If ([COMPANIES:2]Default_Layer:51#"")
		[INVOICES:39]Layer_Code:38:=[COMPANIES:2]Default_Layer:51
	End if 
	If (([COMPANIES:2]Default_Currency:59#"") & ([INVOICES:39]Currency_Code:27="")) | ((Old:C35([INVOICES:39]Company_Code:2)#"") & ([INVOICES:39]Company_Code:2#(Old:C35([INVOICES:39]Company_Code:2))) & ([COMPANIES:2]Default_Currency:59#""))
		
		
		[INVOICES:39]Currency_Code:27:=[COMPANIES:2]Default_Currency:59
	End if 
Else 
	RELATE ONE:C42([INVOICES:39]Company_Code:2)
End if 
If ((<>ContCode#"") & ([INVOICES:39]Contact_Code:3="") & (<>SYS_bo_DefaultEntry) & (<>ForceCred=False:C215))
	[INVOICES:39]Contact_Code:3:=<>ContCode
	RELATE ONE:C42([INVOICES:39]Contact_Code:3)
	If ((<>CompCode="") & (Not:C34(Check_ContCorr(->[INVOICES:39]Company_Code:2; ->[INVOICES:39]Contact_Code:3))))
		[INVOICES:39]Company_Code:2:=[CONTACTS:1]Company_Code:1
		RELATE ONE:C42([INVOICES:39]Company_Code:2)
		Invoices_InLPAr
	End if 
Else 
	RELATE ONE:C42([INVOICES:39]Contact_Code:3)
End if 
ERR_MethodTrackerReturn("Invoices_InLPBC"; $_t_oldMethodName)