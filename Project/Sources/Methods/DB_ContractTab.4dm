//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ContractTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/03/2011 13:19 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CONT_al_TabPage;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	//ARRAY TEXT(SVS_at_ContractsTabs;0)
	C_LONGINT:C283($_l_ContractPage; $_l_MenuParameter)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $_t_SubItemName; COM_t_TelephoneNumberFormat; vButtDisCNTR; vCompName; vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ContractTab")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_MenuParameter:=Num:C11($_t_MenuItemParameter)
	If ($_l_MenuParameter>0)
		SVS_at_ContractsTabs:=$_l_MenuParameter
	End if 
End if 
$_l_ContractPage:=CONT_al_TabPage{SVS_at_ContractsTabs}

If ($_l_ContractPage>0)
	If ($_l_ContractPage#FORM Get current page:C276)
		Case of 
			: ($_l_ContractPage=2)
				RELATE ONE:C42([CONTRACTS:17]Supplier_Company:9)
				RELATE ONE:C42([CONTRACTS:17]Supplier_Contact:10)
				vCompName:=[COMPANIES:2]Company_Name:2
				vTel:=[COMPANIES:2]Telephone:9
				If (COM_t_TelephoneNumberFormat="")
					If ([COMPANIES:2]Country:8#"")
						If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
							QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
							COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
						End if 
					End if 
				End if 
				
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
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_ContractTab"; $_t_oldMethodName)