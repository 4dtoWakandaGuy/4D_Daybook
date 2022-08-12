
If (False:C215)
	//Object Name:      [CONTACTS].Contact_In.oCON_CompanyAdType1
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CON_at_AddressTypes;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_TEXT:C284(CON_t_CompanyAdType; CON_t_CompanyCode)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (CON_at_AddressTypes>0)
			$_bo_Continue:=True:C214
			If (CON_at_AddressTypes{CON_at_AddressTypes}="Home")
				If (CON_t_CompanyCode#"")
					If ([COMPANIES:2]Company_Code:1#CON_t_CompanyCode)
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=CON_t_CompanyCode)
						If (Not:C34([COMPANIES:2]Private:37))
							Gen_Alert("You cannot set a company as the home address")
							$_bo_Continue:=False:C215
						End if 
					End if 
				End if 
			End if 
			If ($_bo_Continue)
				CON_t_CompanyAdType:=CON_at_AddressTypes{CON_at_AddressTypes}
			End if 
			If (CON_t_CompanyAdType="Home")
				OBJECT SET ENTERABLE:C238(*; "oCONCompanyCode"; False:C215)
			End if 
			
			
			CON_at_AddressTypes:=0
			
		End if 
		
		
		
End case 
