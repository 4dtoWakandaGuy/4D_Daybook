//%attributes = {}
If (False:C215)
	//Project Method Name:      Forms_InvTit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 11:43:07If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StateAnal)
	C_TEXT:C284(<>TitAdd; <>TitDepCo; <>TitReg; $_t_oldMethodName; vTitAdd; vTitDepCo; vTitReg)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Forms_InvTit")
vTitDepCo:=<>TitDepCo
vTitAdd:=<>TitAdd
vTitReg:=<>TitReg
If (([INVOICES_ITEMS:161]Analysis_Code:10#"") & (<>StateAnal)) & (False:C215)
	RELATE ONE:C42([INVOICES_ITEMS:161]Analysis_Code:10)
	If ([ANALYSES:36]Title_Department_Company:3#"")
		vTitDepCo:=[ANALYSES:36]Title_Department_Company:3
	End if 
	If ([ANALYSES:36]Title_Address:5#"")
		vTitAdd:=[ANALYSES:36]Title_Address:5
	End if 
	If ([ANALYSES:36]Title_Registration:6#"")
		vTitReg:=[ANALYSES:36]Title_Registration:6
		
	End if 
Else 
	If (([INVOICES:39]Analysis_Code:17#"") & (<>StateAnal))
		RELATE ONE:C42([INVOICES:39]Analysis_Code:17)
		If ([ANALYSES:36]Title_Department_Company:3#"")
			vTitDepCo:=[ANALYSES:36]Title_Department_Company:3
		End if 
		If ([ANALYSES:36]Title_Address:5#"")
			vTitAdd:=[ANALYSES:36]Title_Address:5
		End if 
		If ([ANALYSES:36]Title_Registration:6#"")
			vTitReg:=[ANALYSES:36]Title_Registration:6
			
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Forms_InvTit"; $_t_oldMethodName)