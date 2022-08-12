//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Forms GenTit
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
	C_BOOLEAN:C305(<>StateAnal)
	C_POINTER:C301($1; $2)
	C_TEXT:C284(<>TitAdd; <>TitDepCo; <>TitDepCoP; <>TitReg; $_t_oldMethodName; vTitAdd; vTitDepCo; vTitDepCoP; vTitReg)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Forms GenTit")
vTitDepCoP:=<>TitDepCoP
vTitDepCo:=<>TitDepCo
vTitAdd:=<>TitAdd
vTitReg:=<>TitReg
If (($1->#"") & (<>StateAnal))
	RELATE ONE:C42($1->)
	If ([ANALYSES:36]Title_Department_Co_Person:4#"")
		vTitDepCoP:=[ANALYSES:36]Title_Department_Co_Person:4
	End if 
	If ([ANALYSES:36]Title_Department_Company:3#"")
		vTitDepCo:=[ANALYSES:36]Title_Department_Company:3
	End if 
	If ([ANALYSES:36]Title_Address:5#"")
		vTitAdd:=[ANALYSES:36]Title_Address:5
	End if 
	If ([ANALYSES:36]Title_Registration:6#"")
		vTitReg:=[ANALYSES:36]Title_Registration:6
	Else 
		If (Count parameters:C259=2)
			If ($2->#"")
				vTitReg:="VAT Reg No: "+$2->
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Forms GenTit"; $_t_oldMethodName)