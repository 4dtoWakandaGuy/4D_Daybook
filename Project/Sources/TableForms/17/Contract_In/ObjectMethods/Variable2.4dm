If (False:C215)
	//object Name: [CONTRACTS]Contract_in.Variable2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2011 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(SVS_at_ContractsTabs;0)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_oldMethodName; $_t_SubItemName; COM_t_TelephoneNumberFormat; vButtDisCNTR; vCompName; vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.Variable2"; Form event code:C388)
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
			Else 
				RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
				RELATE ONE:C42([CONTRACTS:17]Contact_Code:2)
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				Contact_Details
				FORM GOTO PAGE:C247(SVS_at_ContractsTabs)
				
		End case 
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		Else 
			COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
		End if 
	End if 
	If (Size of array:C274(SVS_aptr_ListboxSetup)>=9)
		$_ptr_ArrayReferences:=SVS_aptr_ListboxSetup{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			$_t_SubItemName:=$_ptr_ArrayReferences->{10}
			If (SVS_at_ContractsTabs=1)
				If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
					
					In_ButtChkDis(->vButtDisCNTR; "Contract")
				Else 
					If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))  //if and when we make items removable then we can include other tables this
						In_ButtChkDis(->vButtDisCNTR; "Contract"; $_t_SubItemName)
					Else 
						In_ButtChkDis(->vButtDisCNTR; "Contract")
					End if 
				End if 
			Else 
				In_ButtChkDis(->vButtDisCNTR; "Contract")
			End if 
		Else 
			In_ButtChkDis(->vButtDisCNTR)
		End if 
	Else 
		In_ButtChkDis(->vButtDisCNTR)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Contract_in,SVS_at_ContractsTabs"; $_t_oldMethodName)
