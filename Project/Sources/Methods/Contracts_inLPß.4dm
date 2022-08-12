//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_inLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 07:52`Method: Contracts_inLPß
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SVS_lb_ItemsSetup;0)
	ARRAY LONGINT:C221($_al_DiaryIDS; 0)
	//ARRAY LONGINT(CONT_al_Levels;0)
	//ARRAY LONGINT(CONT_al_TabIncludes;0)
	//ARRAY LONGINT(CONT_al_ViewTableToTable;0)
	//ARRAY LONGINT(CONT_al_ViewTabsSettings;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	ARRAY TEXT:C222($_at_PONumbers; 0)
	ARRAY TEXT:C222($_at_ServiceCalls; 0)
	//ARRAY TEXT(CONT_at_TabNames;0)
	//ARRAY TEXT(CONT_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Editable; $_bo_NewLevel)
	C_LONGINT:C283($_l_ReuseLevel; $_l_TabRow; CONT_l_ViewTabsSelectedOLD; vALLevels)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_FlagReference; $_t_oldMethodName; $_t_SubItemName; $1; vButtDisCNTR)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_inLPß")

$_bo_Editable:=(CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels}=0)
If ($_bo_Editable)
	$_t_FlagReference:="411111000"
Else 
	$_t_FlagReference:="311111000"
End if 
ARRAY LONGINT:C221(CONT_al_Levels; 1)

$_l_ReuseLevel:=0
If (Size of array:C274(SVS_aptr_ListboxSetup)=0) & (vALLevels>0)
	If (CONT_al_Levels{1}=0)
		$_bo_NewLevel:=True:C214
	Else 
		$_bo_NewLevel:=False:C215
		$_l_ReuseLevel:=CONT_al_Levels{1}
	End if 
Else 
	$_bo_NewLevel:=False:C215
End if 

Case of 
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //Contract shedule items
		CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
		CON_LoadCharges($_bo_NewLevel; $_l_ReuseLevel)
		//NG April 2004
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[ORDERS:24]))  //Contract shedule items
		
		QUERY:C277([ORDERS:24]; [ORDERS:24]X_contractCode:61=[CONTRACTS:17]Contract_Code:3)
		//Be careful not to put the contract code on the the order items here!! else they will apear in the schedule
		
		If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
			CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
			LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[ORDERS:24]Order_Code:3; ->[CONTRACTS:17]Contract_Code:3; "411111000"; "Order_In"; 9; "Order Records"; "Orders"; ""; $_bo_NewLevel; $_l_ReuseLevel)
		Else 
			LBi_Prefs11(->SVS_aptr_ListboxSetup)  //reset the unique fields or page-turning won't work
		End if 
		LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels})
		
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
		USE SET:C118("CONT_FFSelection")
		//Because this does not use the definitions a definition set must be loaded-we will load the contract items
		If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
			CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
			//NG Aug 2006 VaccessTypes is still used to determine which subform to use
			
			LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[ORDER_ITEMS:25]Item_Number:27; ->[CONTRACTS:17]Contract_Code:3; "411111126"; "Items_in"; 9; "Products"; "Product"; ""; $_bo_NewLevel; $_l_ReuseLevel)  // todo: this needs checking!
			
		End if 
		FUR_FillListBoxArea(->SVS_lb_ItemsSetup; ->[CONTRACTS:17])
		
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[ORDERS:24])) & (CONT_at_ViewTabsLabels{CONT_at_ViewTabsLabels}#"Contract Billing")
		//Billed Orders
		QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
		ARRAY TEXT:C222($_at_ServiceCalls; 0)
		SELECTION TO ARRAY:C260([SERVICE_CALLS:20]Call_Code:4; $_at_ServiceCalls)
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]x_ServiceCallCODE:61; $_at_ServiceCalls)
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
		QUERY WITH ARRAY:C644([ORDERS:24]Order_Code:3; $_at_OrderCodes)
		If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
			CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
			LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[ORDERS:24]Order_Code:3; ->[CONTRACTS:17]Contract_Code:3; "411111000"; "Order_In"; 9; "Order Records"; "Orders"; ""; $_bo_NewLevel; $_l_ReuseLevel)
		Else 
			LBi_Prefs11(->SVS_aptr_ListboxSetup)  //reset the unique fields or page-turning won't work
		End if 
		LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels})
		
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[PURCHASE_ORDERS:57]))  //PO's relating to Order items charges in relation to the contract
		QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
		ARRAY TEXT:C222($_at_ServiceCalls; 0)
		SELECTION TO ARRAY:C260([SERVICE_CALLS:20]Call_Code:4; $_at_ServiceCalls)
		QUERY WITH ARRAY:C644([ORDER_ITEMS:25]x_ServiceCallCODE:61; $_at_ServiceCalls)
		ARRAY TEXT:C222($_at_PONumbers; 0)
		DISTINCT VALUES:C339([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PONumbers)
		QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PONumbers)
		If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
			CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
			LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2; ->[CONTRACTS:17]Contract_Code:3; $_t_FlagReference; "PurchaseOrder_In"; 5; "Purchases Orders"; "Purchase order"; ""; $_bo_NewLevel; $_l_ReuseLevel)
		Else 
			LBi_Prefs11(->SVS_aptr_ListboxSetup)  //reset the unique fields or page-turning won't work
		End if 
		LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels})
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[SERVICE_CALLS:20]))  //service calls for the contract
		QUERY:C277([SERVICE_CALLS:20]; [SERVICE_CALLS:20]Contract_Code:3=[CONTRACTS:17]Contract_Code:3)
		
		If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
			CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
			LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[SERVICE_CALLS:20]Call_Code:4; ->[CONTRACTS:17]Contract_Code:3; $_t_FlagReference; "Calls_in"; 2; "Service Calls"; "Service Call"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			
		Else 
			
			
			LBi_Prefs11(->SVS_aptr_ListboxSetup)  //reset the unique fields or page-turning won't work
		End if 
		LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels})
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //Diary
		
		If (Size of array:C274(CONT_at_TabNames)=0)
			SD2_GetRelatedDiaryItems(Table:C252(->[CONTRACTS:17]); Field:C253(->[CONTRACTS:17]Contact_Code:2); [CONTRACTS:17]Contract_Code:3)
			
			If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
				CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
				// [DIARY];"Diary_InNEW"
				
				LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[DIARY:12]Diary_Code:3; ->[CONTRACTS:17]Contract_Code:3; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			Else 
				LBi_Prefs11(->SVS_aptr_ListboxSetup)  //reset the unique fields or page-turning won't work        ;
				
			End if 
			LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels})
		Else 
			$_l_TabRow:=Find in array:C230(CONT_at_TabNames; CONT_at_ViewTabsLabels{CONT_at_ViewTabsLabels})
			If ($_l_TabRow>0)  //it should be
				CONT_SelectDiaryRecords($_l_TabRow)
				If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
					If (Size of array:C274(CONT_al_TabIncludes{$_l_TabRow})>0)
						
						
						CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
						
						LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[DIARY:12]Diary_Code:3; ->[CONTRACTS:17]Contract_Code:3; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
						
					Else 
						CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
						SD2_GetRelatedDiaryItems(Table:C252(->[CONTRACTS:17]); Field:C253(->[CONTRACTS:17]Contract_Code:3); [CONTRACTS:17]Contract_Code:3)
						
						// [DIARY];"Diary_InNEW"
						LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[DIARY:12]Diary_Code:3; ->[CONTRACTS:17]Contract_Code:3; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel; $_l_ReuseLevel)
					End if 
				Else 
					LBi_Prefs11(->SVS_aptr_ListboxSetup)  //reset the unique fields or page-turning won't work        ;
				End if 
			End if 
			LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels})
		End if 
		
		
		
		
	: (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents(eh diary actually)
		ARRAY LONGINT:C221($_al_DiaryIDS; 0)
		QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=Table:C252(->[CONTRACTS:17]); *)
		QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=[CONTRACTS:17]Contract_Code:3)
		SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_DiaryIDS)
		QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_DiaryIDS)
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#""; *)
		QUERY SELECTION:C341([DIARY:12];  & ; [DIARY:12]Deleted:43=0)
		
		If (Size of array:C274(SVS_aptr_ListboxSetup)=0) | (CONT_l_ViewTabsSelectedOLD#CONT_at_ViewTabsLabels)
			CONT_l_ViewTabsSelectedOLD:=CONT_at_ViewTabsLabels
			//NOTE THAT THE FORM ON THE NEXT LINE DOES NOT EXIST
			//see _inProcess(it may be one of several forms
			LBi_ArrDefFill(->SVS_aptr_ListboxSetup; ->SVS_lb_ItemsSetup; ->[DIARY:12]Diary_Code:3; ->[CONTRACTS:17]Contract_Code:3; $_t_FlagReference; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel; $_l_ReuseLevel)
			
		Else 
			OK:=1
			LBi_Prefs11(->SVS_aptr_ListboxSetup)  //reset the unique fields or page-turning won't work
			
		End if 
		LBi_LoadSetup(->SVS_aptr_ListboxSetup; "B"; CONT_al_ViewTabsSettings{CONT_at_ViewTabsLabels})
		
		
End case 
If (CONT_al_Levels{1}=0)
	CONT_al_Levels{1}:=vALLevels
End if 

If (Size of array:C274(SVS_aptr_ListboxSetup)>=9)
	$_ptr_ArrayReferences:=SVS_aptr_ListboxSetup{9}
	If (Size of array:C274($_ptr_ArrayReferences->)>=10)
		$_t_SubItemName:=$_ptr_ArrayReferences->{10}
		If (FORM Get current page:C276=1)
			If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
				
				In_ButtChkDis(->vButtDisCNTR; "Contract")
			Else 
				If (CONT_al_ViewTableToTable{CONT_at_ViewTabsLabels}=Table:C252(->[PRODUCTS:9]))  //if and when we make items removable then we can other tables this
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
ERR_MethodTrackerReturn("Contracts_inLPß"; $_t_oldMethodName)