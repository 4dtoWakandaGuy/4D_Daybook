//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail_StateComp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 14:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; vNo)
	C_TEXT:C284($_t_oldMethodName; vCompany)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_StateComp")
//Mail_StateComp
CREATE SET:C116([INVOICES:39]; "Master2")
RELATE ONE SELECTION:C349([INVOICES:39]; [COMPANIES:2])
vCompany:=""
//DEFAULT TABLE([COMPANIES])
vNo:=Records in selection:C76([COMPANIES:2])
If (Count parameters:C259>=1)
	Case of 
		: ($1=1)
			ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Name:2; >)
		Else 
			ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Code:1; >)
	End case 
Else 
	
	ORDER BY:C49([COMPANIES:2]; [COMPANIES:2]Company_Code:1; >)
End if 
ERR_MethodTrackerReturn("Mail_StateComp"; $_t_oldMethodName)
