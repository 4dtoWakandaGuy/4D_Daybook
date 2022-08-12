//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_InLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_LB_FurtherAnalysis;0)
	//ARRAY BOOLEAN(GEN_lb_ItemsArea;0)
	ARRAY INTEGER:C220($_Ad_addressDate; 0)
	ARRAY LONGINT:C221($_Al_addressStatus; 0)
	//ARRAY LONGINT(CO_al_ViewTableToTable;0)
	//ARRAY LONGINT(CO_al_ViewTabsSettings;0)
	//ARRAY LONGINT(COM_al_CompanyTabPage;0)
	//ARRAY LONGINT(COM_al_EditMode;0)
	//ARRAY LONGINT(COM_al_EmployeeRange;0)
	//ARRAY LONGINT(COM_al_pageLevels;0)
	//ARRAY LONGINT(WS_al_RecordStatesID;0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	//ARRAY TEXT(CO_at_EmployeeRange;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_AddAnalCode;0)
	//ARRAY TEXT(COM_at_AddAnalysisName;0)
	//ARRAY TEXT(COM_at_CompanyNames;0)
	//ARRAY TEXT(COM_at_CompanyTab;0)
	//ARRAY TEXT(COM_at_editMode;0)
	//ARRAY TEXT(WS_at_RecordStates;0)
	C_BOOLEAN:C305(<>PER_bo_LbDefinitiionsInited; $_bo_Editable; $_bo_IsAdminUser; $_bo_NewLevel; CO_bo_EmployeeRangeInited; Co_bo_FurthersSetup)
	C_LONGINT:C283($_l_AddedItemID; $_l_CurrentFormPage; $_l_EmployeesRow; $_l_Event; $_l_Index; $_l_ListID; $_l_OK; $_l_Page5Position; $_l_ReUseLevel; $_t_ButtonSelected; $2)
	C_LONGINT:C283($3; $no; B_ClipboardButton; CB_3; cb_Edit; CO_at_ViewTabsLabelsOLD; L_aFurtherCodeSelected; Vadd; vALLevels; vCT; WS_l_Bdetail)
	C_LONGINT:C283(WS_l_Bname)
	C_PICTURE:C286(COM_Pi_EditMode; COM_pic_ClipBoardPICT)
	C_POINTER:C301($_ptr_ArrayReferences; $_ptr_ListboxSetup; $_ptr_ListboxSetup2; $_ptr_ListboxSetup2s)
	C_TEXT:C284(<>Forename; <>Surname; $_t_BuiltAddress; $_t_CHaracter1; $_t_FlagReference; $_t_FormName; $_t_ImagePath; $_t_oldMethodName; $_t_Parameter1; $_t_ResourcesFolder; $_t_SubItemName)
	C_TEXT:C284($1; CO_t_Employees; COM_t_EmailAddress; CON_t_CompanyFAX; CON_t_CompanyName; DB_t_Address1Label; DB_t_Address2Label; DB_t_CountryLabel; DB_t_CountyLabel; DB_t_CurrentFormUsage; DB_t_PostcodeLabel)
	C_TEXT:C284(DB_t_TownLabel; SYS_t_AccessType; vArea; vATAdd11; vButtDisCom; vSales; vSource; vStatus; vTele; vType; WS_t_Label1)
	C_TEXT:C284(WS_t_Label2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("Companies_InLPß")
$_l_Event:=Form event code:C388
//GOTO PAGE(1)
//Companies_InLPß - takes over Before & After phases
//see InButt_LPß for description of param
CREATE EMPTY SET:C140([CONTACTS:1]; "Rejected2")

If (Count parameters:C259>=1)
	$_t_Parameter1:=$1
Else 
	$_t_Parameter1:="B"
End if 

If (Count parameters:C259>1)
	$_t_ButtonSelected:=$2
Else 
	$_t_ButtonSelected:=0
End if 

$_t_CHaracter1:=Substring:C12($_t_Parameter1; 1; 1)
If ($_t_CHaracter1="A")
	ARRAY TEXT:C222(COM_at_AddAnalCode; 0)
	ARRAY TEXT:C222(COM_at_AddAnalysisName; 0)
	ARRAY TEXT:C222(WS_at_RecordStates; 0)
	ARRAY LONGINT:C221(WS_al_RecordStatesID; 0)
End if 

If (DB_t_CurrentFormUsage#"NONE")
	
	If (FORM Get current page:C276=5)
		COM_at_CompanyTab:=1
		FORM GOTO PAGE:C247(COM_al_CompanyTabPage{COM_at_CompanyTab})
		
	End if 
End if 

If ([COMPANIES:2]x_ID:63=0) & ([COMPANIES:2]Company_Code:1#"")
	[COMPANIES:2]x_ID:63:=AA_GetNextIDinMethod(->[COMPANIES:2]x_ID:63)
	DB_SaveRecord(->[COMPANIES:2])
	AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
End if 
$_t_CHaracter1:=Substring:C12($_t_Parameter1; 1; 1)
Case of 
	: (($_t_CHaracter1="B") | ($_t_CHaracter1="N"))  //use this bit if don't use Before2 method `($_t_CHaracter1="N")
		//ARRAY STRING(25;COM_at_CompanyTab;3)
		If ($_l_Event#On Outside Call:K2:11) | ($_t_CHaracter1="N") | ($_t_CHaracter1="B")
			$_bo_IsAdminUser:=User in group:C338("Administrators"; Current user:C182)
			If (Not:C34(CO_bo_EmployeeRangeInited))
				ARRAY TEXT:C222(CO_at_EmployeeRange; 0)
				ARRAY LONGINT:C221(COM_al_EmployeeRange; 0)
				$_l_ListID:=AA_LoadListByName("Employee Ranges"; ->CO_at_EmployeeRange; ->COM_al_EmployeeRange; $_bo_IsAdminUser)
				If (Size of array:C274(CO_at_EmployeeRange)=0)
					$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "1"; "2-20"; "21-50"; "51-200"; "201-500"; "over 500")
					$_l_ListID:=AA_LoadListByName("Employee Ranges"; ->CO_at_EmployeeRange; ->COM_al_EmployeeRange; $_bo_IsAdminUser)
				End if 
				CO_bo_EmployeeRangeInited:=True:C214
			End if 
			If ([COMPANIES:2]x_Employees:73>0)
				$_l_EmployeesRow:=Find in array:C230(COM_al_EmployeeRange; [COMPANIES:2]x_Employees:73)
				If ($_l_EmployeesRow>0)
					CO_t_Employees:=CO_at_EmployeeRange{$_l_EmployeesRow}
				End if 
			Else 
				CO_t_Employees:=""
			End if 
			COM_al_EmployeeRange:=0
			COM_t_EmailAddress:=""
			If ([COMPANIES:2]Email_Before_At:58#"") & ([COMPANIES:2]EMail_After_At:55#"")
				COM_t_EmailAddress:=[COMPANIES:2]Email_Before_At:58+"@"+[COMPANIES:2]EMail_After_At:55
			End if 
			
			Companies_InLPB
			Macro_AccType("Load "+String:C10(Table:C252(->[COMPANIES:2])))
		Else 
			If ([COMPANIES:2]x_Employees:73>0)
				$_l_EmployeesRow:=Find in array:C230(COM_al_EmployeeRange; [COMPANIES:2]x_Employees:73)
				If ($_l_EmployeesRow>0)
					CO_t_Employees:=CO_at_EmployeeRange{$_l_EmployeesRow}
				End if 
			Else 
				CO_t_Employees:=""
			End if 
			COM_al_EmployeeRange:=0
			
			COM_t_EmailAddress:=""
			If ([COMPANIES:2]Email_Before_At:58#"") & ([COMPANIES:2]EMail_After_At:55#"")
				COM_t_EmailAddress:=[COMPANIES:2]Email_Before_At:58+"@"+[COMPANIES:2]EMail_After_At:55
			End if 
			Companies_InLPB
			Macro_AccType("Load "+String:C10(Table:C252(->[COMPANIES:2])))
		End if 
		
	: (($_t_CHaracter1="A") | ($_t_CHaracter1="F"))  //remove the |($_t_CHaracter1="F")) if the InButt Call reads "R:..."
		Companies_InLPA($_t_ButtonSelected)
	: ($_t_CHaracter1="C")
		Companies_InCan
	: ($_t_CHaracter1="D")
		Companies_InDel
End case 
If (DB_t_CurrentFormUsage#"None")
	If ([COMPANIES:2]Private:37) & (($_t_CHaracter1="F") | ($_t_CHaracter1="B") | ($_t_CHaracter1="N"))
		
		//why show the company record-just show the contact
		If ([COMPANIES:2]Company_Code:1#"")
			QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
			QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
			
			SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
			QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
			
			QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
			$_l_OK:=Num:C11((Records in selection:C76([CONTACTS:1])>1) | (Records in selection:C76([CONTACTS:1])=0))
			UNLOAD RECORD:C212([CONTACTS:1])
		Else 
			$_l_OK:=1
		End if 
	Else 
		$_l_OK:=1
	End if 
End if 

If (DB_t_CurrentFormUsage#"None")
	$_ptr_ListboxSetup:=->COM_aptr_LBItemsSetup
	$_ptr_ListboxSetup2:=->COM_aPtr_CoFurthers
	Case of 
		: (($_t_CHaracter1="B") | ($_t_CHaracter1="N") | ($_t_CHaracter1="S") | ($_t_CHaracter1="P"))
			Case of 
				: ($_t_CHaracter1="B")
					$_l_CurrentFormPage:=1
				: ($_t_CHaracter1="N")
					$_l_CurrentFormPage:=FORM Get current page:C276
				Else 
					$_l_CurrentFormPage:=Num:C11(Substring:C12($_t_Parameter1; 2; 1))  //Layout Page you're going to
			End case 
			
			Case of 
				: ($_l_CurrentFormPage<5)
					If (vCT=0)  //leave the area blank if come from Contact in same process
						$_bo_Editable:=(CO_al_ViewTabsSettings{CO_at_ViewTabsLabels}=0)
						If ($_bo_Editable)
							$_t_FlagReference:="411111000"
						Else 
							$_t_FlagReference:="311111000"
						End if 
						ARRAY LONGINT:C221(COM_al_pageLevels; 5)
						
						If (Size of array:C274($_ptr_ListboxSetup->)=0) & (vALLevels>0)
							If (COM_al_pageLevels{1}=0)
								$_bo_NewLevel:=True:C214
							Else 
								$_bo_NewLevel:=False:C215
								$_l_ReUseLevel:=COM_al_pageLevels{1}
							End if 
						Else 
							$_bo_NewLevel:=False:C215
						End if 
						Case of 
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1]))  //Contacts
								
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
									QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
									
									SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)  //;[CONTACTS_COMPANIES]Address_Status;$_Al_addressStatus;[CONTACTS_COMPANIES]Address_DateDeleted;$_Ad_addressDate)
									//TRACE
									QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
									CREATE SET:C116([CONTACTS:1]; "$Set1")
									
									QUERY:C277([CONTACTS:1]; [CONTACTS:1]Company_Code:1=[COMPANIES:2]Company_Code:1)
									CREATE SET:C116([CONTACTS:1]; "$Set2")
									UNION:C120("$set1"; "$set2"; "$Set1")
									USE SET:C118("$Set1")
									QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Deleted:32#1)
								Else 
									REDUCE SELECTION:C351([CONTACTS:1]; 0)
								End if 
								
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									//NG Aug 2006 VaccessTypes is still used to determine which subform to use
									
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[CONTACTS:1]Contact_Code:2; ->[COMPANIES:2]Company_Code:1; "411111000"; "Contact_In"; (3+Num:C11(SYS_t_AccessType="Q")); "Contacts"; "Contact"; ""; $_bo_NewLevel; $_l_ReUseLevel)
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")
											//this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
								
								USE SET:C118("COM_FFSelection")
								//Because this does not use the definitions a definition set must be loaded-we will load the contacts
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									//NG Aug 2006 VaccessTypes is still used to determine which subform to use
									
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[CONTACTS:1]Contact_Code:2; ->[COMPANIES:2]Company_Code:1; "411111000"; "Contacts_InN13"; (3+Num:C11(SYS_t_AccessType="Q")); "Contacts"; "Contact"; ""; $_bo_NewLevel; $_l_ReUseLevel)
									
								End if 
								FUR_FillListBoxArea(->GEN_lb_ItemsArea; ->[COMPANIES:2])
								
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
								
								
								$_t_FormName:=COM_SelectDiaryRecords(CO_at_ViewTabsLabels{CO_at_ViewTabsLabels})
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[DIARY:12]Diary_Code:3; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReUseLevel)
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work        ;
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
								
								$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
								If ($_t_FormName#"")
									$_ptr_ArrayReferences->{5}:=$_t_FormName
								Else 
									$_ptr_ArrayReferences->{5}:="Diary_InNEW"
								End if 
								
								
								
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents(eh diary actually)
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([DIARY:12]; [DIARY:12]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15#""; *)
									QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
								Else 
									REDUCE SELECTION:C351([DIARY:12]; 0)
								End if 
								
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									
									//NOTE THAT THE FORM ON THE NEXT LINE DOES NOT EXIST
									//see _inProcess(it may be one of several forms
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[DIARY:12]Diary_Code:3; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReUseLevel)
									
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[ORDERS:24]))  //orders or enquiries
								
								Case of 
									: (CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}="Enquiries")
										$_l_OK:=0
										If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0) & ([COMPANIES:2]Company_Code:1#"")
											QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="024"+<>SYS_at_RecStateCodes{24}{1}; *)
											QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Company_Code:1=[COMPANIES:2]Company_Code:1)
										Else 
											REDUCE SELECTION:C351([ORDERS:24]; 0)
										End if 
										If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
											CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
											
											LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[ORDERS:24]Order_Code:3; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Order_In"; 8; "Enquiry Records"; "Enquiries"; ""; $_bo_NewLevel; $_l_ReUseLevel)
											
											$_l_OK:=1
											
										Else 
											OK:=1
											Case of 
												: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
													
													
													$_l_OK:=1
													LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
												: ($_t_CHaracter1="P")
													$_l_OK:=1
													LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
											End case 
										End if 
										If ($_l_OK=1)
											LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
										End if 
										
									: (CO_at_ViewTabsLabels{CO_at_ViewTabsLabels}="Orders")
										$_l_OK:=0
										If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0) & ([COMPANIES:2]Company_Code:1#"")
											
											QUERY:C277([ORDERS:24]; [ORDERS:24]State:15>"024"+<>SYS_at_RecStateCodes{24}{1}; *)
											QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Company_Code:1=[COMPANIES:2]Company_Code:1)
										Else 
											If ([COMPANIES:2]Company_Code:1#"")
												QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=[COMPANIES:2]Company_Code:1)
											Else 
												REDUCE SELECTION:C351([ORDERS:24]; 0)
											End if 
										End if 
										
										If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
											CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
											
											
											$_l_OK:=1
											LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[ORDERS:24]Order_Code:3; ->[COMPANIES:2]Company_Code:1; "411111000"; "Order_In"; 9; "Order Records"; "Orders"; ""; $_bo_NewLevel; $_l_ReUseLevel)
											
										Else 
											OK:=1
											Case of 
												: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
													
													
													$_l_OK:=1
													LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
												: ($_t_CHaracter1="P")
													$_l_OK:=1
													LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
											End case 
										End if 
										If ($_l_OK=1)
											LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
										End if 
										
								End case 
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //Purchase orders
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=[COMPANIES:2]Company_Code:1)
								Else 
									REDUCE SELECTION:C351([PURCHASE_ORDERS:57]; 0)
								End if 
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "PurchaseOrder_In"; 5; "Purchases Orders"; "Purchase order"; ""; $_bo_NewLevel; $_l_ReUseLevel)
									
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //Invoices
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=[COMPANIES:2]Company_Code:1; *)
									QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1#"*"+"@")
								Else 
									REDUCE SELECTION:C351([INVOICES:39]; 0)
								End if 
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[INVOICES:39]Invoice_Number:1; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Invoice_In"; 6; "Invoices"; "Invoice"; ""; $_bo_NewLevel; $_l_ReUseLevel)
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PURCHASE_INVOICES:37]))  //Purchase Invoices
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=[COMPANIES:2]Company_Code:1)
								Else 
									REDUCE SELECTION:C351([PURCHASE_INVOICES:37]; 0)
								End if 
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Purchases_in"; 4; "Purchases"; "Purchase invoice"; ""; $_bo_NewLevel; $_l_ReUseLevel)
									
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
								
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTRACTS:17]))  //Contracts
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Company_Code:1=[COMPANIES:2]Company_Code:1)
								Else 
									REDUCE SELECTION:C351([CONTRACTS:17]; 0)
								End if 
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[CONTRACTS:17]Contract_Code:3; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Contract_in"; 2; "Contracts"; "Contract"; ""; $_bo_NewLevel; $_l_ReUseLevel)
									
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
								
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[SERVICE_CALLS:20]))  //Service calls
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Company_Code:1=[COMPANIES:2]Company_Code:1)
								Else 
									REDUCE SELECTION:C351([SERVICE_CALLS:20]; 0)
								End if 
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[SERVICE_CALLS:20]Call_Code:4; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Calls_in"; 2; "Service Calls"; "Service Call"; ""; $_bo_NewLevel; $_l_ReUseLevel)
									
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
								
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))  //| (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table(->[PRODUCTS_SUPPLIERS]))  `Products(supplier)
								If ([COMPANIES:2]Company_Code:1#"")
									
									QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[COMPANIES:2]Company_Code:1)
									SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
									QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
									
								Else 
									REDUCE SELECTION:C351([PRODUCTS:9]; 0)
								End if 
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[PRODUCTS:9]Product_Code:1; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Products_in2009"; 4; "Products"; "Product"; ""; $_bo_NewLevel; $_l_ReUseLevel)
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2s)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
								
							: (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[JOBS:26]))  //JOBS
								If ([COMPANIES:2]Company_Code:1#"")
									QUERY:C277([JOBS:26]; [JOBS:26]Company_Code:3=[COMPANIES:2]Company_Code:1)
								Else 
									REDUCE SELECTION:C351([JOBS:26]; 0)
								End if 
								
								If (Size of array:C274($_ptr_ListboxSetup->)=0) | (CO_at_ViewTabsLabelsOLD#CO_at_ViewTabsLabels)
									CO_at_ViewTabsLabelsOLD:=CO_at_ViewTabsLabels
									LBi_ArrDefFill($_ptr_ListboxSetup; ->GEN_lb_ItemsArea; ->[JOBS:26]Job_Code:1; ->[COMPANIES:2]Company_Code:1; $_t_FlagReference; "Job_In"; 2; "Jobs"; "Job"; ""; $_bo_NewLevel; $_l_ReUseLevel)
								Else 
									OK:=1
									Case of 
										: ($_t_CHaracter1="B") | ($_t_CHaracter1="N")  //this Else bit only on the first page
											LBi_Prefs11($_ptr_ListboxSetup; $_ptr_ListboxSetup2)  //reset the unique fields or page-turning won't work
										: ($_t_CHaracter1="P")
											LBi_SetScroll0s($_ptr_ListboxSetup2)  //set scrolls of other areas to 0.  Use ALSetScroll0 if only 1 other
									End case 
								End if 
								LBi_LoadSetup($_ptr_ListboxSetup; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
								
						End case 
						If (COM_al_pageLevels{1}=0)
							COM_al_pageLevels{1}:=vALLevels
							
						End if 
						If (COM_at_editMode=0)
							COM_at_editMode:=1
							COM_al_EditMode:=1
						End if 
						Case of 
							: (CO_al_ViewTabsSettings{CO_at_ViewTabsLabels}=0)
								COM_al_EditMode{1}:=2
								COM_at_editMode{1}:="No Edit"
							: (CO_al_ViewTabsSettings{CO_at_ViewTabsLabels}=3)
								COM_al_EditMode{1}:=-1
								COM_at_editMode{1}:="Edit"
						End case 
						LBi_EditListLay($_ptr_ListboxSetup; ->COM_at_editMode; ->COM_Pi_EditMode; ->COM_al_EditMode)
						//: ($_l_CurrentFormPage=2)
						If (Not:C34(Co_bo_FurthersSetup))
							
							If ($_t_CHaracter1="P")
								LBi_SetScroll0s($_ptr_ListboxSetup)
							End if 
							If (($_t_CHaracter1="N") | ($_t_CHaracter1="P") | ($_t_CHaracter1="B"))
								QUERY:C277([COMPANIES_RECORD_ANALYSIS:146]; [COMPANIES_RECORD_ANALYSIS:146]Company_Code:4=[COMPANIES:2]Company_Code:1; *)
								QUERY:C277([COMPANIES_RECORD_ANALYSIS:146];  & ; [COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1#"")
								
							End if 
							If (Size of array:C274($_ptr_ListboxSetup2->)=0)  //& (False)
								//COM_LB_FurtherAnalysis
								LBi_ArrDefFill($_ptr_ListboxSetup2; ->COM_LB_FurtherAnalysis; ->[COMPANIES_RECORD_ANALYSIS:146]ID:2; ->[COMPANIES:2]Company_Code:1; "200001000"; ""; 1; "Record Analysis"; "Analysis"; ""; True:C214)
								
							Else 
								OK:=1
							End if 
							LBi_LoadSetup($_ptr_ListboxSetup2; $_t_CHaracter1; CO_al_ViewTabsSettings{CO_at_ViewTabsLabels})
							Co_bo_FurthersSetup:=True:C214
							If (COM_al_pageLevels{2}=0)
								COM_al_pageLevels{2}:=vALLevels
							End if 
							
						End if 
						
						//If (Size of array(QUAL_aptr_Information)=0)
						//Else
						OK:=1
					End if 
					
					
			End case 
			If (Size of array:C274($_ptr_ListboxSetup->)>=9)
				$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
				If (Size of array:C274($_ptr_ArrayReferences->)>=10)
					$_t_SubItemName:=$_ptr_ArrayReferences->{10}
					Case of 
						: (FORM Get current page:C276=1)
							If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
								
								In_ButtChkDis(->vButtDisCom; "Company")
							Else 
								If (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1])) | (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))
									//TRACE
									In_ButtChkDis(->vButtDisCom; "Company"; $_t_SubItemName)
								Else 
									In_ButtChkDis(->vButtDisCom; "Company")
								End if 
							End if 
						: (FORM Get current page:C276=2)
							In_ButtChkDis(->vButtDisCom; "Company"; "Further Analysis")
						: (FORM Get current page:C276=5)
							In_ButtChkDis(->vButtDisCom; "Contact")
						Else 
							In_ButtChkDis(->vButtDisCom; "Company")
					End case 
				End if 
			End if 
		: ((($_t_CHaracter1="A") & (OK=1)) | ((($_t_CHaracter1="C") | ($_t_CHaracter1="D")) & (OK=0)))  //check the procs return these OKs
			If (<>PER_bo_LbDefinitiionsInited)
				LBi_pRefs4upd($_ptr_ListboxSetup)
				LBi_pRefs4upd($_ptr_ListboxSetup2)
				//ALpRefs4Upd (->QUAL_aptr_Information)`NG Removed Aug 2006
			End if 
			DB_t_Address1Label:=""
			DB_t_Address2Label:=""
			DB_t_TownLabel:=""
			DB_t_CountyLabel:=""
			DB_t_PostcodeLabel:=""
			DB_t_CountryLabel:=""
			vStatus:=""
			vType:=""
			vSource:=""
			vArea:=""
			vSales:=""
			vTele:=""
	End case 
	
	
	If (vCT=0)
		If (Records in selection:C76([CONTACTS:1])=0) & (CO_al_ViewTableToTable{CO_at_ViewTabsLabels}=Table:C252(->[CONTACTS:1]))  //Contacts
			
			COM_at_editMode:=1
			COM_al_EditMode:=1
		End if 
		
		
		
		
		LBi_EditListLay($_ptr_ListboxSetup; ->COM_at_editMode; ->COM_Pi_EditMode; ->COM_al_EditMode)
		
		
		
	End if 
End if 

If (DB_t_CurrentFormUsage#"None")
	$_t_BuiltAddress:=WS_BUILDADDRESS  // 19/11/02 pb
	If ($_t_CHaracter1#"P")  //NG April 2003
		
		cb_Edit:=0  //WT: 10/12/00: initialise the Edit checkbox for address visible proc.
		CO_AddressManager  //NG april 2003
		
	End if 
	
	If ($_t_BuiltAddress#[COMPANIES:2]ADDRESS:60)
		[COMPANIES:2]ADDRESS:60:=$_t_BuiltAddress
	End if 
End if 
$_t_ResourcesFolder:=Get 4D folder:C485(Current resources folder:K5:16)
$_t_ImagePath:=$_t_ResourcesFolder+"Images"
COM_pic_ClipBoardPICT:=Get_Picture(22566)

//Get Picture FROM LIBRARY(22566;COM_pic_ClipBoardPICT)
If (DB_t_CurrentFormUsage#"None")
	If (False:C215)
		If ([COMPANIES:2]ADDRESS:60="") | (Vadd=1)
			OBJECT SET VISIBLE:C603(*; "oAddressLine1Label@"; (DB_t_Address1Label#""))
			OBJECT SET VISIBLE:C603(*; "oAddressLine2Label@"; (DB_t_Address2Label#""))
			OBJECT SET VISIBLE:C603(*; "oTownLabel@"; (DB_t_TownLabel#""))
			OBJECT SET VISIBLE:C603(*; "oCountyLabel@"; (DB_t_CountyLabel#""))
			OBJECT SET VISIBLE:C603(*; "oPostcodeLabel@"; (DB_t_PostcodeLabel#""))
			OBJECT SET VISIBLE:C603(*; "oCountryLabel@"; (DB_t_CountryLabel#""))
			
			OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; True:C214)
			//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
			//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
			OBJECT SET VISIBLE:C603(*; "oTown@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCounty@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oPostalCode@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCountry@"; True:C214)
			
			OBJECT SET VISIBLE:C603(vATAdd11; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCompanyAddress"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddressClipBoardPicture@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddressClipBoardButton@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddressClipBoardPicture@"; False:C215)
			
		Else 
			OBJECT SET VISIBLE:C603(*; "oAddressLine1Label@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddressLine2Label@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oTownLabel@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCountyLabel@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPostcodeLabel@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCountryLabel@"; False:C215)
			
			OBJECT SET VISIBLE:C603(*; "oAddressLine1var@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oAddressLine2Var@"; False:C215)
			//OBJECT SET VISIBLE(COM_t_AddressLine1;False)
			//OBJECT SET VISIBLE(COM_t_AddressLine2;False)
			OBJECT SET VISIBLE:C603(*; "oTown@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCounty@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oPostalCode@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oCountry@"; False:C215)
			
			OBJECT SET VISIBLE:C603(vATAdd11; True:C214)
			OBJECT SET VISIBLE:C603(*; "oCompanyAddress"; True:C214)
			OBJECT SET VISIBLE:C603(B_ClipboardButton; True:C214)
			
			OBJECT SET VISIBLE:C603(*; "oAddressClipBoardButton@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oAddressClipBoardPicture@"; True:C214)
			OBJECT SET ENABLED:C1123(*; "oAddressClipBoardButton@"; True:C214)
		End if 
	End if 
End if 

If (vAdd=1) & (DB_t_CurrentFormUsage#"None")
	Case of 
		: (FORM Get current page:C276=1)
			GOTO OBJECT:C206(*; "oCompanyName")
		: (FORM Get current page:C276=2)
			GOTO OBJECT:C206(*; "oAddressLine2")
		: (FORM Get current page:C276=3)
			GOTO OBJECT:C206(*; "oAddressLine3")
		: (FORM Get current page:C276=4)
			GOTO OBJECT:C206(*; "oAddressLine4")
	End case 
End if 

If (($_l_OK=0) & (($_t_CHaracter1="F") | ($_t_CHaracter1="B") | ($_t_CHaracter1="N"))) & (DB_t_CurrentFormUsage#"None")
	//this is not a company it's a person
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=[COMPANIES:2]Company_Code:1; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	
	SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
	QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
	
	If (Records in selection:C76([CONTACTS:1])=1)
		
		If (DB_t_CurrentFormUsage#"None")
			WS_t_Label1:="Name"
			WS_t_Label2:="Title"
			OBJECT SET VISIBLE:C603(*; "oContactTitle"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactForename"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactSurname"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactName"; True:C214)
			
			OBJECT SET TITLE:C194(*; "oContactTitleLabel"; WS_t_Label2+" :")
			OBJECT SET TITLE:C194(*; "oContactForenameLabel"; <>Forename+" :")
			OBJECT SET TITLE:C194(*; "oContactSurnameLabel"; <>Surname+" :")
			
			OBJECT SET VISIBLE:C603(*; "oContactTitleLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactForenameLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactSurnameLabel"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oContactNameLabel"; True:C214)
			//OBJECT SET ENABLED(*; "oNameButton"; False)
			//_O_ENABLE BUTTON(WS_l_Bdetail)
			OBJECT SET ENABLED:C1123(*; "oNameDetails"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oClipboardPict"; True:C214)
			
			OBJECT SET VISIBLE:C603(*; "oClipboardButton"; True:C214)
			
			OBJECT SET ENABLED:C1123(*; "oClipboardButton"; True:C214)
			
			
		End if 
		
		Contacts_InLPB(False:C215; False:C215)
		//◊BUTTDIS:=VBUTTDISCOM
		
		If ([CONTACTS:1]Company_Code:1#"")
			cb_3:=1
		Else 
			cb_3:=0
		End if 
		If (DB_t_CurrentFormUsage#"None")
			//I/f (cb_3=1)
			
			OBJECT SET VISIBLE:C603(*; "oCompanyNamesDropsDown"; (cb_3=1))
			OBJECT SET VISIBLE:C603(*; "oCompanyName@"; (cb_3=1))
			OBJECT SET VISIBLE:C603(*; "oContactAddress"; (cb_3=1))
			OBJECT SET VISIBLE:C603(*; "oAddressLine"; (Not:C34(cb_3=1)))
			OBJECT SET VISIBLE:C603(*; "oCONCompanyTel"; (cb_3=1))
			OBJECT SET VISIBLE:C603(*; "oCONCompanyFAX"; (cb_3=1))
			
			//Else 
			
			//OBJECT SET VISIBLE(*;"oCompanyNamesDropsDown";False)
			//OBJECT SET VISIBLE(*;"oCompanyName";False)
			//OBJECT SET VISIBLE(*;"oContactAddress;False)
			
			//OBJECT SET VISIBLE(*;"oCONCompanyFAX";False)
			
			//End if 
			WS_KeepFocus
			If ([CONTACTS:1]Contact_Name:31#"")
				GOTO OBJECT:C206([CONTACTS:1]Comments:10)
			Else 
				GOTO OBJECT:C206([CONTACTS:1]Contact_Name:31)
			End if 
			If (Old:C35([CONTACTS:1]Contact_Code:2)#"")
				OBJECT SET ENTERABLE:C238([CONTACTS:1]Contact_Code:2; False:C215)
			End if 
		End if 
		
		//because we are here we need to put the subrecord
		//into an array
		QUERY:C277([CONTACTS_RECORD_ANALYSIS:144]; [CONTACTS_RECORD_ANALYSIS:144]Contact_Code:3=[CONTACTS:1]Contact_Code:2)
		
		ARRAY TEXT:C222(COM_at_AddAnalCode; Records in selection:C76([CONTACTS_RECORD_ANALYSIS:144]))
		ARRAY TEXT:C222(COM_at_AddAnalysisName; Records in selection:C76([CONTACTS_RECORD_ANALYSIS:144]))
		
		FIRST RECORD:C50([CONTACTS_RECORD_ANALYSIS:144])
		For ($_l_Index; 1; Size of array:C274(COM_at_AddAnalCode))
			COM_at_AddAnalCode{$_l_Index}:=[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1
			RELATE ONE:C42([CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1)
			COM_at_AddAnalysisName{$_l_Index}:=[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2
			NEXT RECORD:C51([CONTACTS_RECORD_ANALYSIS:144])
		End for 
		
		If (DB_t_CurrentFormUsage#"None")
			$_l_Page5Position:=Find in array:C230(COM_al_CompanyTabPage; 5)
			If ($_l_Page5Position<0)
				INSERT IN ARRAY:C227(COM_at_CompanyTab; Size of array:C274(COM_at_CompanyTab)+1; 1)
				INSERT IN ARRAY:C227(COM_al_CompanyTabPage; Size of array:C274(COM_al_CompanyTabPage)+1; 1)
				COM_al_CompanyTabPage{1}:=5
				COM_at_CompanyTab{Size of array:C274(COM_at_CompanyTab)}:="Company"
				COM_al_CompanyTabPage{Size of array:C274(COM_al_CompanyTabPage)}:=1
			End if 
			COM_at_CompanyTab:=1
			If (DB_t_CurrentFormUsage#"None")
				FORM GOTO PAGE:C247(COM_al_CompanyTabPage{COM_at_CompanyTab})
			End if 
		End if 
		
		
	Else 
		//it should not be a contact
		$_l_OK:=1
		If ([COMPANIES:2]Private:37) & (Records in selection:C76([CONTACTS:1])>1)
			[COMPANIES:2]Private:37:=False:C215
		End if 
		If ([COMPANIES:2]Private:37=False:C215)
			ARRAY TEXT:C222(COM_at_CompanyTab; 3)
			ARRAY LONGINT:C221(COM_al_CompanyTabPage; 3)
			COM_al_CompanyTabPage{1}:=1
			COM_al_CompanyTabPage{2}:=2
			COM_al_CompanyTabPage{3}:=3
			COM_at_CompanyTab{1}:=" Address"
			COM_at_CompanyTab{2}:="Analysis"
			COM_at_CompanyTab{3}:="Financial"
			If ($_l_CurrentFormPage>Size of array:C274(COM_al_CompanyTabPage)) | ($_l_CurrentFormPage=0)
				$_l_CurrentFormPage:=1
			End if 
			
			COM_at_CompanyTab:=$_l_CurrentFormPage
			
		Else 
			If ($_t_CHaracter1#"P")
				ARRAY TEXT:C222(COM_at_CompanyTab; 4)
				ARRAY LONGINT:C221(COM_al_CompanyTabPage; 4)
				COM_al_CompanyTabPage{1}:=5
				COM_al_CompanyTabPage{2}:=2
				COM_al_CompanyTabPage{3}:=3
				COM_al_CompanyTabPage{4}:=1
				COM_at_CompanyTab{1}:=" Address"
				COM_at_CompanyTab{2}:="Analysis"
				COM_at_CompanyTab{3}:="Financial"
				COM_at_CompanyTab{4}:="Company"
				COM_at_CompanyTab:=1
			End if 
		End if 
		
		If (DB_t_CurrentFormUsage#"None")
			FORM GOTO PAGE:C247(COM_al_CompanyTabPage{COM_at_CompanyTab})
		End if 
		
		
	End if 
	
Else 
	If ([COMPANIES:2]Private:37) & ((Records in selection:C76([CONTACTS:1])>1) | (Records in selection:C76([CONTACTS:1])=0))
		[COMPANIES:2]Private:37:=False:C215
	End if 
	If ([COMPANIES:2]Private:37=False:C215)
		ARRAY TEXT:C222(COM_at_CompanyTab; 3)
		ARRAY LONGINT:C221(COM_al_CompanyTabPage; 3)
		COM_al_CompanyTabPage{1}:=1
		COM_al_CompanyTabPage{2}:=2
		COM_al_CompanyTabPage{3}:=3
		COM_at_CompanyTab{1}:=" Address"
		COM_at_CompanyTab{2}:="Analysis"
		COM_at_CompanyTab{3}:="Financial"
		If ($_l_CurrentFormPage>Size of array:C274(COM_al_CompanyTabPage)) | ($_l_CurrentFormPage=0)
			$_l_CurrentFormPage:=1
		End if 
		
		COM_at_CompanyTab:=$_l_CurrentFormPage
		
	Else 
		If ($_t_CHaracter1#"P")
			ARRAY TEXT:C222(COM_at_CompanyTab; 4)
			ARRAY LONGINT:C221(COM_al_CompanyTabPage; 4)
			COM_al_CompanyTabPage{1}:=5
			COM_al_CompanyTabPage{2}:=2
			COM_al_CompanyTabPage{3}:=3
			COM_al_CompanyTabPage{4}:=1
			COM_at_CompanyTab{1}:=" Address"
			COM_at_CompanyTab{2}:="Analysis"
			COM_at_CompanyTab{3}:="Financial"
			COM_at_CompanyTab{4}:="Company"
			COM_at_CompanyTab:=1
		End if 
	End if 
	
	If (DB_t_CurrentFormUsage#"None")
		FORM GOTO PAGE:C247(COM_al_CompanyTabPage{COM_at_CompanyTab})
		If (vAdd=1) & (DB_t_CurrentFormUsage#"None")
			GOTO OBJECT:C206([COMPANIES:2]Company_Name:2)
		End if 
		
	End if 
	
End if 
ERR_MethodTrackerReturn("Companies_InLPß"; $_t_oldMethodName)
