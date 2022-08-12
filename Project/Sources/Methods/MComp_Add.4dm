//%attributes = {}
If (False:C215)
	//Project Method Name:      MComp_Add
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
	C_LONGINT:C283(iInv; iInvL)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MComp_Add")
//MComp_Add
If ($1="L")
	If ((iInvL=1) & ([COMPANIES:2]Invoice_Address_Line_One:18#""))
		Comp_DetailsI
	Else 
		Company_Details
	End if 
Else 
	If ((iInv=1) & ([COMPANIES:2]Invoice_Address_Line_One:18#""))
		Comp_DetailsI
	Else 
		Company_Details
	End if 
End if 
Company_Contact
ERR_MethodTrackerReturn("MComp_Add"; $_t_oldMethodName)