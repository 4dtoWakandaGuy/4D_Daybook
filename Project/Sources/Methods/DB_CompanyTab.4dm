//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_CompanyTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   27/01/2011 11:14 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CO_al_AddressRecordIDs;0)
	//ARRAY LONGINT(CO_al_AddressType;0)
	//ARRAY LONGINT(CO_al_AddressTypes;0)
	//ARRAY LONGINT(CO_al_ExistingAddressReference;0)
	//ARRAY LONGINT(CO_al_ExistingAddressTypes;0)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(COM_al_CompanyTabPage;0)
	ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY TEXT(CO_at_AddressLine1;0)
	//ARRAY TEXT(CO_at_AddressLine2;0)
	//ARRAY TEXT(CO_at_AddressType;0)
	//ARRAY TEXT(CO_at_AddressTypes;0)
	//ARRAY TEXT(CO_at_Country;0)
	//ARRAY TEXT(CO_at_County;0)
	//ARRAY TEXT(CO_at_ExistingAddressTypes;0)
	//ARRAY TEXT(CO_at_FormattedAddress;0)
	//ARRAY TEXT(CO_at_PostalCode;0)
	//ARRAY TEXT(CO_at_Town;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_CompanyTab;0)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_BOOLEAN:C305($_bo_OK; CO_bo_EditOLD; COM_bo_ContactShowAnalysis; COM_bo_ContactShowRelated)
	C_LONGINT:C283($_l_addressRow; $_l_addressType; $_l_addressTypeRow; $_l_CompanyPage; $_l_CompPrevOverrideSR; $_l_CompPrevUseStandardSR; $_l_CompSettingsOverrideSR; $_l_CompSettingsUseStandardSR; $_l_CurrentFormPage; $_l_Index; $_l_MenuItem)
	C_LONGINT:C283($_l_PageNumber; B_ClipboardButton; cb_Edit; cb_EmailInvoices; cb_EmailOrders; cb_EmailPurchOrders; cb_EmailStatements; CO_addressRefOLD; CUR_l_SelectedAddressTypeRow)
	C_PICTURE:C286(COM_pic_ClipBoardPICT)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ListboxSetup; $_ptr_PrefsToLoad)
	C_TEXT:C284($_t_CompanyTab; $_t_CompanyTab2; $_t_Execute; $_t_MenuItemParameter; $_t_oldMethodName; $_t_SubItemName; COM_t_AccPayableEmail; COM_t_AccReceivableEmail; COM_t_AddressLine1; COM_t_AddressLine2; COM_t_Country)
	C_TEXT:C284(COM_t_County; COM_t_DisplayAddress; COM_t_PostalCode; COM_t_Town; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel; DB_t_CUrrentInputMenuRef; DB_t_PostcodeLabel; DB_t_TownLabel)
	C_TEXT:C284(REP_t_CurrentSRDocReport; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role; vATAdd11; vButtDisCom)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_CompanyTab")
$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_MenuItem:=Num:C11($_t_MenuItemParameter)
	If ($_l_MenuItem>0)
		COM_at_CompanyTab:=$_l_MenuItem
	End if 
End if 

//object method
//COM_at_CompanyTab on companyt in13

$_l_CurrentFormPage:=FORM Get current page:C276

$_l_CompanyPage:=COM_al_CompanyTabPage{COM_at_CompanyTab}

If ($_l_CompanyPage#FORM Get current page:C276)
	If (FORM Get current page:C276=1)
		//AL_ExitCell (eALContI)
		If ([CONTACTS:1]Forename:4#"")
			DB_SaveRecord(->[CONTACTS_COMPANIES:145])
			DB_SaveRecord(->[CONTACTS:1])
			
			AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		End if 
	End if 
	
	$_t_Execute:="P"+String:C10($_l_CompanyPage)
	$_bo_OK:=True:C214
	$_l_PageNumber:=1
	Case of 
			
			
		: ($_l_CompanyPage=2)
			
			If (FORM Get current page:C276#5)
				$_l_CompanyPage:=2
				
			Else 
				$_l_CompanyPage:=0
				COM_bo_ContactShowAnalysis:=True:C214
				If (Not:C34(COM_bo_ContactShowAnalysis))
					OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oContactsRelated"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; False:C215)
					OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; False:C215)
				Else 
					OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oContactsRelated"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; True:C214)
					OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; True:C214)
					OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; True:C214)
				End if 
				
			End if 
		: ($_l_CompanyPage=3)
			//Wed, Feb 15, 2006 bwalia: added
			
			If ((DB_GetModuleSettingByNUM(Module_SalesLedger)=2) | (DB_GetModuleSettingByNUM(Module_PurchaseLedger)=2) | (DB_GetModuleSettingByNUM(Module_SalesOrders)=2) | (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=2) | (DB_GetModuleSettingByNUM(Module_JobCosting)=2) | (DB_GetModuleSettingByNUM(Module_NominalLedger)=2))
				
				
				cb_EmailStatements:=Num:C11(Company_docPrintPrefGet("statements"; "email"))
				cb_EmailInvoices:=Num:C11(Company_docPrintPrefGet("invoices"; "email"))
				cb_EmailOrders:=Num:C11(Company_docPrintPrefGet("Sales Orders"; "email"))
				cb_EmailPurchOrders:=Num:C11(Company_docPrintPrefGet("Purchase Orders"; "email"))
				
				Company_docPrintPrefGet("AccPayableEmail"; "email"; ->COM_t_AccPayableEmail)  //init AccPayableEmail
				
				Company_docPrintPrefGet("AccReceivableEmail"; "email"; ->COM_t_AccReceivableEmail)  //AccReceivableEmail
				
				If (False:C215)
					//*************** need to load these properly (and where needed save them as well) instead of just defaulting them like it is now ************
					$_l_CompPrevUseStandardSR:=1
					$_l_CompSettingsUseStandardSR:=1
					$_l_CompPrevOverrideSR:=0
					$_l_CompSettingsOverrideSR:=0
					//*************************************************************************************************************************************
				End if 
				//
				//Load the company level options first in order to see whether to use them or not
				REP_t_CurrentSRDocReport:=REP_at_DocReportTo{REP_at_DocReportTo}  //Added 18/11/08 v631b120i -kmw
				ARRAY POINTER:C280($_aptr_PrefsToLoad; 0)
				$_ptr_PrefsToLoad:=->$_aptr_PrefsToLoad
				Reports_BuildArrayofElements(->$_aptr_PrefsToLoad; ->$_l_CompSettingsUseStandardSR; ->$_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
				
				Reports_PrefsLoadNEW(REP_t_CurrentSRDocReport; "COMPANY REPORT"; $_ptr_PrefsToLoad; False:C215; Table:C252(->[COMPANIES:2]); [COMPANIES:2]x_ID:63)  //Added 18/11/08 v631b120i -kmw
				
				$_l_CompPrevUseStandardSR:=$_l_CompSettingsUseStandardSR  //Added 18/11/08 v631b120i -kmw
				$_l_CompPrevOverrideSR:=$_l_CompSettingsOverrideSR  //Added 18/11/08 v631b120i -kmw
				//
				Companies_DisplayDocOptions
				$_l_PageNumber:=3
			Else 
				$_bo_OK:=False:C215
				$_l_PageNumber:=1
				Gen_Alert("You do not have Access Rights to view this page"; "Cancel")
			End if 
			
		: ($_l_CompanyPage=4)
			
			Companies_InLas
			$_l_CompanyPage:=4
			
			
			
		: ($_l_CompanyPage=5)
			
			FORM GOTO PAGE:C247($_l_CompanyPage)
			$_l_CompanyPage:=5
			COM_bo_ContactShowRelated:=False:C215
			If (COM_bo_ContactShowRelated)
				OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oContactsRelated"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; False:C215)
				OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactsRelated"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; True:C214)
				OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; True:C214)
			End if 
			
		: ($_l_CompanyPage=5)
			FORM GOTO PAGE:C247($_l_CompanyPage)
			$_l_PageNumber:=5
	End case 
	If ($_bo_OK)
		Case of 
			: ($_l_CompanyPage=2)
				//go to analysis page
				If ($_l_CurrentFormPage#3)
					CO_addressRefOLD:=CUR_l_SelectedAddressTypeRow  //1 OR 2 OR 3
					CO_bo_EditOLD:=(cb_Edit=1)
				End if 
				$_l_addressTypeRow:=Find in array:C230(CO_at_ExistingAddressTypes; "Invoice Address")
				If ($_l_addressTypeRow>0)
					//it should be!!
					If (CO_al_ExistingAddressReference{$_l_addressTypeRow}>0)
						CUR_l_SelectedAddressTypeRow:=0
						//there is an existing record of this type
						//swap what is being displayed.
						//dont change visible invisible stuff
						CO_AddressManager(CO_al_ExistingAddressReference{$_l_addressTypeRow})  //1 OR 2 OR 3
					Else 
						If (CO_al_ExistingAddressReference{$_l_addressTypeRow}#0)
							//no existing address of this type
							
							COM_t_AddressLine1:=""
							COM_t_AddressLine2:=""
							COM_t_Town:=""
							COM_t_County:=""
							COM_t_PostalCode:=""
							COM_t_Country:=""
							COM_t_DisplayAddress:=""
							
							CUR_l_SelectedAddressTypeRow:=CO_al_ExistingAddressReference{$_l_addressTypeRow}
							CO_AddressManager(-(CO_al_ExistingAddressTypes{$_l_addressTypeRow}))  //289 OR 288 OR 290(IN THIS DATAFILE)
						Else 
							//add another type of address to this company.
							//not allowing this just yet as not part of the current requirement
							CO_AddressManager(9999)
							
						End if 
						
					End if 
					
				End if 
			: ($_l_CompanyPage=3)  //financial
				If ($_l_CurrentFormPage#2)
					CO_addressRefOLD:=CUR_l_SelectedAddressTypeRow
					CO_bo_EditOLD:=(cb_Edit=1)
				End if 
				
				$_l_addressTypeRow:=Find in array:C230(CO_at_ExistingAddressTypes; "Registered Address")
				If ($_l_addressTypeRow>0)
					//it should be!!
					If (CO_al_ExistingAddressReference{$_l_addressTypeRow}>0)
						CUR_l_SelectedAddressTypeRow:=0
						//there is an existing record of this type
						//swap what is being displayed.
						//dont change visible invisible stuff
						CO_AddressManager(CO_al_ExistingAddressReference{$_l_addressTypeRow})  //1 OR 2 OR 3
					Else 
						If (CO_al_ExistingAddressReference{$_l_addressTypeRow}#0)
							//no existing address of this type
							CUR_l_SelectedAddressTypeRow:=CO_al_ExistingAddressReference{$_l_addressTypeRow}
							CO_AddressManager(-(CO_al_ExistingAddressTypes{$_l_addressTypeRow}))  //289 OR 288 OR 290(IN THIS DATAFILE)
						Else 
							//add another type of address to this company.
							//not allowing this just yet as not part of the current requirement
							CO_AddressManager(9999)
							
						End if 
						
					End if 
					
				End if 
				
				
			Else 
				If ($_l_CompanyPage>0)
					If (FORM Get current page:C276#5)
						If (CO_addressRefOLD#0)
							//switch back to previous view
							If (CO_addressRefOLD>0)
								CUR_l_SelectedAddressTypeRow:=0
								CO_AddressManager(CO_addressRefOLD)  //1,2,OR 3
								
								
							Else 
								//was never set on that page
								$_l_addressTypeRow:=Find in array:C230(CO_at_AddressTypes; "Shipping Address")
								If ($_l_addressTypeRow>0)
									$_l_addressType:=CO_al_AddressTypes{$_l_addressTypeRow}
									If ($_l_addressType>0)
										$_l_addressRow:=Find in array:C230(CO_al_AddressType; $_l_addressType)
										If ($_l_addressRow<0)
											INSERT IN ARRAY:C227(CO_al_AddressRecordIDs; Size of array:C274(CO_al_AddressRecordIDs)+1; 1)
											INSERT IN ARRAY:C227(CO_at_AddressLine1; Size of array:C274(CO_at_AddressLine1)+1; 1)
											INSERT IN ARRAY:C227(CO_at_AddressLine2; Size of array:C274(CO_at_AddressLine2)+1; 1)
											INSERT IN ARRAY:C227(CO_at_Town; Size of array:C274(CO_at_Town)+1; 1)
											INSERT IN ARRAY:C227(CO_at_County; Size of array:C274(CO_at_County)+1; 1)
											INSERT IN ARRAY:C227(CO_at_PostalCode; Size of array:C274(CO_at_PostalCode)+1; 1)
											INSERT IN ARRAY:C227(CO_at_Country; Size of array:C274(CO_at_Country)+1; 1)
											INSERT IN ARRAY:C227(CO_al_AddressType; Size of array:C274(CO_al_AddressType)+1; 1)
											INSERT IN ARRAY:C227(CO_at_AddressType; Size of array:C274(CO_al_AddressType)+1; 1)
											INSERT IN ARRAY:C227(CO_at_FormattedAddress; Size of array:C274(CO_at_FormattedAddress)+1; 1)
											CO_at_AddressLine1{Size of array:C274(CO_at_AddressLine1)}:=COM_t_AddressLine1
											CO_al_AddressType{Size of array:C274(CO_at_AddressLine1)}:=CO_al_AddressTypes{$_l_addressTypeRow}
											CO_at_AddressType{Size of array:C274(CO_at_AddressLine1)}:=CO_at_AddressTypes{$_l_addressTypeRow}
											CO_al_AddressRecordIDs{Size of array:C274(CO_at_AddressLine1)}:=-(AA_GetNextIDinMethod(->[AddressRecords:125]X_ID:1))
											CO_at_FormattedAddress{Size of array:C274(CO_at_FormattedAddress)}:=WS_BUILDADDRESS([COMPANIES:2]Invoice_Address_Line_One:18; [COMPANIES:2]Invoice_Address_Line_Two:19; [COMPANIES:2]Invoice_Town:20; [COMPANIES:2]Invoice_County:21; [COMPANIES:2]Invoice_Postcode:22; [COMPANIES:2]Invoice_Country:23)
											CUR_l_SelectedAddressTypeRow:=Size of array:C274(CO_al_AddressType)  // 1 or 2 or 3
										Else 
											CUR_l_SelectedAddressTypeRow:=$_l_addressRow
										End if 
									End if 
								End if 
								
								//`CUR_l_SelectedAddressTypeRow:=0
								
								CO_AddressManager(CUR_l_SelectedAddressTypeRow)  //1,2,OR 3
							End if 
							Case of 
								: (CO_bo_EditOLD)
									OBJECT SET VISIBLE:C603(DB_t_Address1Label; True:C214)
									OBJECT SET VISIBLE:C603(DB_t_Address2Label; True:C214)
									OBJECT SET VISIBLE:C603(DB_t_TownLabel; True:C214)
									OBJECT SET VISIBLE:C603(DB_t_CountyLabel; True:C214)
									OBJECT SET VISIBLE:C603(DB_t_PostcodeLabel; True:C214)
									OBJECT SET VISIBLE:C603(DB_t_CountryLabel; True:C214)
									OBJECT SET VISIBLE:C603(COM_t_AddressLine1; True:C214)
									OBJECT SET VISIBLE:C603(COM_t_AddressLine2; True:C214)
									OBJECT SET VISIBLE:C603(COM_t_Town; True:C214)
									OBJECT SET VISIBLE:C603(COM_t_County; True:C214)
									OBJECT SET VISIBLE:C603(COM_t_PostalCode; True:C214)
									OBJECT SET VISIBLE:C603(COM_t_Country; True:C214)
									OBJECT SET VISIBLE:C603(vATAdd11; False:C215)
									OBJECT SET VISIBLE:C603(COM_t_DisplayAddress; False:C215)
									OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; False:C215)
									OBJECT SET VISIBLE:C603(B_ClipboardButton; False:C215)
									OBJECT SET ENABLED:C1123(B_ClipBoardButton; False:C215)
									
									OBJECT SET ENTERABLE:C238([COMPANIES:2]Company_Name:2; True:C214)
									OBJECT SET ENTERABLE:C238(COM_t_AddressLine1; True:C214)
									OBJECT SET ENTERABLE:C238(COM_t_AddressLine2; True:C214)
									OBJECT SET ENTERABLE:C238(COM_t_Town; True:C214)
									OBJECT SET ENTERABLE:C238(COM_t_County; True:C214)
									OBJECT SET ENTERABLE:C238(COM_t_PostalCode; True:C214)
									OBJECT SET ENTERABLE:C238(COM_t_Country; True:C214)
									cb_Edit:=1
								Else 
									
									OBJECT SET VISIBLE:C603(DB_t_Address2Label; False:C215)
									OBJECT SET VISIBLE:C603(DB_t_TownLabel; False:C215)
									OBJECT SET VISIBLE:C603(DB_t_CountyLabel; False:C215)
									OBJECT SET VISIBLE:C603(DB_t_PostcodeLabel; False:C215)
									OBJECT SET VISIBLE:C603(DB_t_CountryLabel; False:C215)
									OBJECT SET VISIBLE:C603(COM_t_AddressLine1; False:C215)
									OBJECT SET VISIBLE:C603(COM_t_AddressLine2; False:C215)
									OBJECT SET VISIBLE:C603(COM_t_Town; False:C215)
									OBJECT SET VISIBLE:C603(COM_t_County; False:C215)
									OBJECT SET VISIBLE:C603(COM_t_PostalCode; False:C215)
									OBJECT SET VISIBLE:C603(COM_t_Country; False:C215)
									OBJECT SET VISIBLE:C603(vATAdd11; True:C214)
									OBJECT SET VISIBLE:C603(COM_t_DisplayAddress; True:C214)
									OBJECT SET VISIBLE:C603(COM_pic_ClipBoardPICT; True:C214)
									OBJECT SET VISIBLE:C603(B_ClipboardButton; True:C214)
									OBJECT SET ENABLED:C1123(B_ClipBoardButton; True:C214)
									OBJECT SET ENTERABLE:C238([COMPANIES:2]Company_Name:2; False:C215)
									OBJECT SET ENTERABLE:C238(COM_t_AddressLine1; False:C215)
									OBJECT SET ENTERABLE:C238(COM_t_AddressLine2; False:C215)
									OBJECT SET ENTERABLE:C238(COM_t_Town; False:C215)
									OBJECT SET ENTERABLE:C238(COM_t_County; False:C215)
									OBJECT SET ENTERABLE:C238(COM_t_PostalCode; False:C215)
									OBJECT SET ENTERABLE:C238(COM_t_Country; False:C215)
									cb_Edit:=0
									
							End case 
							CO_addressRefOLD:=0
						End if 
					Else 
						COM_bo_ContactShowAnalysis:=False:C215
						If (Not:C34(COM_bo_ContactShowAnalysis))
							OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oContactsRelated"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; False:C215)
							OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; False:C215)
						Else 
							OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oContactsRelated"; False:C215)
							OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; True:C214)
							OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; True:C214)
							OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; True:C214)
						End if 
					End if 
				End if 
		End case 
		
		//Companies_InLPß ($_t_Execute)
		If ($_l_CompanyPage>0)
			FORM GOTO PAGE:C247($_l_CompanyPage)
		End if 
	End if 
Else 
	If ($_l_CompanyPage=5)
		COM_bo_ContactShowAnalysis:=False:C215
		If (Not:C34(COM_bo_ContactShowAnalysis))
			OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsRelated"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; False:C215)
			OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(*; "oCOntactsP1Tabs"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsRelated"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactsP2Label"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsP2CommentsField"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactFurtherAnalButton"; True:C214)
			OBJECT SET VISIBLE:C603(*; "OCOntactsP2FALabel"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oContactsP2FA"; True:C214)
		End if 
	End if 
End if 
If (Size of array:C274(COM_aptr_LBItemsSetup)>=9)
	$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
	$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubItemName:=$_ptr_ArrayReferences->{10}
		Case of 
			: ($_l_CompanyPage=1)
				If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
					
					In_ButtChkDis(->vButtDisCom; "Company")
				Else 
					If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1])) | (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))
						In_ButtChkDis(->vButtDisCom; "Company"; $_t_SubItemName)
					Else 
						In_ButtChkDis(->vButtDisCom; "Company")
					End if 
				End if 
			: ($_l_CompanyPage=2)
				In_ButtChkDis(->vButtDisCom; "Company"; "Further Analysis")
			: ($_l_CompanyPage=5)
				In_ButtChkDis(->vButtDisCom; "Contact"; "Further Analysis")
			Else 
				In_ButtChkDis(->vButtDisCom; "Company")
		End case 
	End if 
End if 
If ($_l_CompanyPage>0)
	COM_at_CompanyTab:=Find in array:C230(COM_al_CompanyTabPage; $_l_CompanyPage)
	
	If (Size of array:C274(COM_at_CompanyTab)>0)
		$_t_CompanyTab:=COM_at_CompanyTab{COM_at_CompanyTab}
		If ($_t_CompanyTab#"")
			Repeat 
				If ($_t_CompanyTab[[1]]=" ")
					$_t_CompanyTab:=Substring:C12($_t_CompanyTab; 2)
				End if 
			Until ($_t_CompanyTab[[1]]#" ")
			For ($_l_Index; 1; Size of array:C274(COM_at_CompanyTab))
				If (COM_at_CompanyTab#$_l_Index)
					$_t_CompanyTab2:=COM_at_CompanyTab{$_l_Index}
					Repeat 
						If ($_t_CompanyTab2[[1]]=" ")
							$_t_CompanyTab2:=Substring:C12($_t_CompanyTab2; 2)
						End if 
					Until ($_t_CompanyTab2[[1]]#" ")
					DB_MenuAction("View"; $_t_CompanyTab2; 4; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
			End for 
			DB_MenuAction("View"; $_t_CompanyTab; 4; "18"; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DB_CompanyTab"; $_t_oldMethodName)
