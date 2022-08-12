//%attributes = {}
If (False:C215)
	//Project Method Name:      MCont_Add
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/03/2011 22:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(iInv; iInvL)
	C_TEXT:C284($_t_oldMethodName; $1; Vdetails; EMAIL_t_EmailTo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MCont_Add")
//MCont_Add
If ($1="L")
	If ((iInvL=1) & ([COMPANIES:2]Invoice_Address_Line_One:18#""))
		Comp_DetailsI
	Else 
		Vdetails:="B"
		Letter_Details
	End if 
Else 
	If ((iInv=1) & ([COMPANIES:2]Invoice_Address_Line_One:18#""))
		Comp_DetailsI
	Else 
		Letter_Details
	End if 
End if 

If ([CONTACTS:1]Email_Before_At:30#"") & ([CONTACTS:1]EMail_After_At:24#"")
	EMAIL_t_EmailTo:=[CONTACTS:1]Email_Before_At:30+"@"+[CONTACTS:1]EMail_After_At:24
Else 
	EMAIL_t_EmailTo:=""
End if 
ERR_MethodTrackerReturn("MCont_Add"; $_t_oldMethodName)