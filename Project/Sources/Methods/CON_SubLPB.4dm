//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_SubLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 07:52`Method: CON_SubLPB
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_LB_RelatedData;0)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CON_al_Levels;0)
	//ARRAY LONGINT(CON_al_TabIncludes;0)
	//ARRAY LONGINT(CON_al_ViewTableToTable;0)
	//ARRAY LONGINT(CON_al_ViewTabsSettings;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(CON_at_editMode;0)
	//ARRAY TEXT(CON_at_TabNames;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Editable; $_bo_NewLevel; CON_bo_ContextsInited; CON_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_FurtherFieldsExist; $_l_OK; $_l_ReuseLevel; $_l_TabRow; CON_at_ViewTabsLabelsOLD; CON_l_FurtherFieldsMod; CON_l_ParentProcess; CON_l_ViewTabsLabelsTABLE; vALLevels)
	C_PICTURE:C286(CON_Pi_EditMode)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_FlagReference; $_t_HandlerCharacter1; $_t_oldMethodName; $_t_SubItemName; CON_t_ContactCode; CON_t_ViewTabsLabel; vButtDisCon)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_SubLPB")

//if (CON_t_DisplayType="ContactApplic")
$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[CONTACTS:1])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
If (Records in set:C195("FUR_FFSelection")>0)
	USE SET:C118("FUR_FFSelection")
	CREATE SET:C116([CUSTOM_FIELDS:98]; "CON_FFSelection")
Else 
	CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "CON_FFSelection")
End if 
CLEAR SET:C117("FUR_FFSelection")
$_t_HandlerCharacter1:="P"
CON_l_FurtherFieldsMod:=0
//FURTHER FIELDS CANNOT BE PUT ON THE MENU
CON_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
If (Not:C34(CON_bo_ContextsInited))
	CON_Contexts
	CON_bo_ContextsInited:=True:C214
End if 
If (CON_at_ViewTabsLabelsOLD>0)
	CON_at_ViewTabsLabelsOLD:=0
	
End if 
If (CON_at_ViewTabsLabels=0)
	CON_at_ViewTabsLabels:=1
	CON_at_ViewTabsLabelsOLD:=0
End if 





$_bo_Editable:=(CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}=0)
If ($_bo_Editable)
	$_t_FlagReference:="411111000"
Else 
	$_t_FlagReference:="311111000"
End if 
CON_l_ViewTabsLabelsTABLE:=CON_al_ViewTableToTable{CON_at_ViewTabsLabels}
CON_t_ViewTabsLabel:=CON_at_ViewTabsLabels{CON_at_ViewTabsLabels}

ARRAY LONGINT:C221(CON_al_Levels; 1)
$_l_ReuseLevel:=0
If (Size of array:C274(CON_aptr_LBSetup)=0) & (vALLevels>0)
	If (CON_al_Levels{1}=0)
		$_bo_NewLevel:=True:C214
		
	Else 
		$_bo_NewLevel:=False:C215
		$_l_ReuseLevel:=CON_al_Levels{1}
	End if 
Else 
	$_bo_NewLevel:=False:C215
End if 
Case of 
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
		USE SET:C118("CON_FFSelection")
		//Because this does not use the definitions a definition set must be loaded-we will load the Diary
		If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
			CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
			//NG Aug 2006 VaccessTypes is still used to determine which subform to use
			If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
				CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
				SD2_GetRelatedDiaryItems(Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Code:2); CON_t_ContactCode)
				// [DIARY];"Diary_InNEW"
				
				LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			Else 
				OK:=1
				
				LBi_Prefs11(->CON_aptr_LBSetup)
				
			End if 
			
		End if 
		FUR_FillListBoxArea(->CON_LB_RelatedData; ->[CONTACTS:1])
		
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
		
		
		If (Size of array:C274(CON_at_TabNames)=0)
			SD2_GetRelatedDiaryItems(Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Code:2); CON_t_ContactCode)
			
			If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
				CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
				SD2_GetRelatedDiaryItems(Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Code:2); CON_t_ContactCode)
				
				// [DIARY];"Diary_InNEW"
				LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
				
			Else 
				LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
			End if 
			LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
		Else 
			$_l_TabRow:=Find in array:C230(CON_at_TabNames; CON_at_ViewTabsLabels{CON_at_ViewTabsLabels})
			If ($_l_TabRow>0)  //it should be
				CON_SelectDiaryRecords($_l_TabRow)
				If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
					If (Size of array:C274(CON_al_TabIncludes{$_l_TabRow})>0)
						
						
						CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
						
						LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
					Else 
						CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
						SD2_GetRelatedDiaryItems(Table:C252(->[CONTACTS:1]); Field:C253(->[CONTACTS:1]Contact_Code:2); CON_t_ContactCode)
						// [DIARY];"Diary_InNEW"
						LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
					End if 
					
				Else 
					LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
				End if 
				LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
			End if 
			
		End if 
		
		
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents(eh diary actually)
		QUERY:C277([DIARY:12]; [DIARY:12]Contact_Code:2=CON_t_ContactCode; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Document_Code:15#""; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
		
		If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
			CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
			//NOTE THAT THE FORM ON THE NEXT LINE DOES NOT EXIST
			//see _inProcess(it may be one of several forms
			LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[DIARY:12]Diary_Code:3; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			
		Else 
			OK:=1
			LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
			
		End if 
		LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[ORDERS:24]))  //orders or enquiries
		
		Case of 
			: (CON_at_ViewTabsLabels{CON_at_ViewTabsLabels}="Enquiries")
				$_l_OK:=0
				If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0)
					QUERY:C277([ORDERS:24]; [ORDERS:24]State:15="024"+<>SYS_at_RecStateCodes{24}{1}; *)
					QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Contact_Code:2=CON_t_ContactCode)
				Else 
					REDUCE SELECTION:C351([ORDERS:24]; 0)
				End if 
				
				If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
					CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
					
					
					LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[ORDERS:24]Order_Code:3; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Order_In"; 8; "Enquiry Records"; "Enquiries"; ""; $_bo_NewLevel; $_l_ReuseLevel)
					
					$_l_OK:=1
					
				Else 
					$_l_OK:=1
					LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
					
					
				End if 
				If ($_l_OK=1)
					LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
				End if 
				
			: (CON_at_ViewTabsLabels{CON_at_ViewTabsLabels}="Orders")
				$_l_OK:=0
				If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0)
					QUERY:C277([ORDERS:24]; [ORDERS:24]State:15>"024"+<>SYS_at_RecStateCodes{24}{1}; *)
					QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Contact_Code:2=CON_t_ContactCode)
				Else 
					QUERY:C277([ORDERS:24]; [ORDERS:24]Contact_Code:2=CON_t_ContactCode)
				End if 
				
				If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
					CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
					
					
					$_l_OK:=1
					LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[ORDERS:24]Order_Code:3; ->[CONTACTS:1]Contact_Code:2; "411111000"; "Order_In"; 9; "Order Records"; "Orders"; ""; $_bo_NewLevel; $_l_ReuseLevel)
					
				Else 
					$_l_OK:=1
					LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
					
				End if 
				If ($_l_OK=1)
					LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
				End if 
				
		End case 
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //Purchase orders
		QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Contact_Code:5=CON_t_ContactCode)
		If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
			CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
			LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "PurchaseOrder_In"; 5; "Purchases Orders"; "Purchase order"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			
		Else 
			LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
			
		End if 
		LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //Invoices
		QUERY:C277([INVOICES:39]; [INVOICES:39]Contact_Code:3=CON_t_ContactCode; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1#"*"+"@")
		If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
			CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
			
			LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[INVOICES:39]Invoice_Number:1; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Invoice_In"; 6; "Invoices"; "Invoice"; ""; $_bo_NewLevel; $_l_ReuseLevel)
		Else 
			
			LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
			
		End if 
		LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
		
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[CONTRACTS:17]))  //Contracts
		QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]Contact_Code:2=CON_t_ContactCode)
		If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
			CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
			LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[CONTRACTS:17]Contract_Code:3; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Contract_in"; 2; "Contracts"; "Contract"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			
		Else 
			
			LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
			
		End if 
		LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
		
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[SERVICE_CALLS:20]))  //Service calls
		QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contact_Code:2=CON_t_ContactCode)
		If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
			CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
			LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[SERVICE_CALLS:20]Call_Code:4; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Calls_in"; 2; "Service Calls"; "Service Call"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			
		Else 
			
			LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
			
		End if 
		LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
		
	: (CON_al_ViewTableToTable{CON_at_ViewTabsLabels}=Table:C252(->[JOBS:26]))  //JOBS
		QUERY:C277([JOBS:26]; [JOBS:26]Contact_Code:4=CON_t_ContactCode)
		If (Size of array:C274(CON_aptr_LBSetup)=0) | (CON_at_ViewTabsLabelsOLD#CON_at_ViewTabsLabels)
			CON_at_ViewTabsLabelsOLD:=CON_at_ViewTabsLabels
			LBi_ArrDefFill(->CON_aptr_LBSetup; ->CON_LB_RelatedData; ->[JOBS:26]Job_Code:1; ->[CONTACTS:1]Contact_Code:2; $_t_FlagReference; "Job_In"; 2; "Jobs"; "Job"; ""; $_bo_NewLevel; $_l_ReuseLevel)
		Else 
			LBi_Prefs11(->CON_aptr_LBSetup)  //reset the unique fields or page-turning won't work
		End if 
		LBi_LoadSetup(->CON_aptr_LBSetup; $_t_HandlerCharacter1; CON_al_ViewTabsSettings{CON_at_ViewTabsLabels})
		
		
End case 
If (CON_al_Levels{1}=0)
	CON_al_Levels{1}:=vALLevels
End if 

vButtDisCon:="I    O   SSSRCAD"
GET PROCESS VARIABLE:C371(CON_l_ParentProcess; vButtDisCon; vButtDisCon)

If (Size of array:C274(CON_aptr_LBSetup)>=9)
	$_ptr_ArrayReferences:=CON_aptr_LBSetup{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubItemName:=$_ptr_ArrayReferences->{10}
		If (False:C215)
			In_ButtChkDis(->vButtDisCon; "Contact"; $_t_SubItemName)
		Else 
			In_ButtChkDis(->vButtDisCon; "Contact")
		End if 
		//note here sending this to the parent process so that the parent process has the pop-up to send to the button process on activate.
		//NOTE also that currently ONLY futher analysis can be removed from a contact..so the contact form will change it(this is an example where the remove option would need a 3rd item)
		//VARIABLE TO VARIABLE(CON_l_ParentProcess;PAL_at_PopUpMenu5;PAL_at_PopUpMenu5)
		
	End if 
End if 

If (CON_at_editMode=0)
	CON_at_editMode:=1
	CON_al_EditMode:=1
End if 

Case of 
	: (CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}=0)
		CON_al_EditMode{1}:=2
		CON_at_editMode{1}:="No Edit"
	: (CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}=3)
		CON_al_EditMode{1}:=-1
		CON_at_editMode{1}:="Edit"
End case 
LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode)
ERR_MethodTrackerReturn("CON_SubLPB"; $_t_oldMethodName)