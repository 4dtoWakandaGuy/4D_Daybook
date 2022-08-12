If (False:C215)
	//object Name: [CONTRACTS]Contract_in.Invisible Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_ContractsTabs;0)
	C_TEXT:C284($_t_oldMethodName; vCompName; vTel)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.Invisible Button1"; Form event code:C388)
If (SVS_at_ContractsTabs>1)
	SVS_at_ContractsTabs:=SVS_at_ContractsTabs-1
End if 

If (SVS_at_ContractsTabs>0)
	If (SVS_at_ContractsTabs#FORM Get current page:C276)
		Case of 
			: (SVS_at_ContractsTabs=2)
				RELATE ONE:C42([CONTRACTS:17]Supplier_Company:9)
				RELATE ONE:C42([CONTRACTS:17]Supplier_Contact:10)
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				Contact_Details
				FORM GOTO PAGE:C247(2)
			: (SVS_at_ContractsTabs=1)
				RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
				RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				Contact_Details
				FORM GOTO PAGE:C247(1)
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.Invisible Button1"; $_t_oldMethodName)
