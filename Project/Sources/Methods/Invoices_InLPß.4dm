//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_InLPß
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 21:41`Method: Invoices_InLPß
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN(ballocate)
	//C_UNKNOWN(vALLevels)
	//C_UNKNOWN(vButtDisInv)
	//ARRAY BOOLEAN(INV_lb_InvoiceItems;0)
	ARRAY LONGINT:C221($_al_ItemNumber; 0)
	//ARRAY LONGINT(INV_al_EditMode;0)
	//ARRAY LONGINT(INV_al_TabIncludes;0)
	//ARRAY LONGINT(INV_al_ViewTableToTable;0)
	//ARRAY LONGINT(INV_al_ViewTabsSettings;0)
	//ARRAY POINTER(INV_aptr_ListboxSetup;0)
	//ARRAY TEXT(INV_at_EditMode;0)
	//ARRAY TEXT(INV_at_InvoicesTab;0)
	//ARRAY TEXT(INV_at_TabNames;0)
	//ARRAY TEXT(INV_at_ViewTabsLabels;0)
	//ARRAY TEXT(INV_at_ViewTabsLabelsOLD;0)
	C_BOOLEAN:C305($_bo_NewLevel; $_bo_ShowP1Fields; INV_bo_FurtherFieldsLoaded; $_bo_Editable; $_bo_NewLevel; $_bo_ShowP1Fields; INV_bo_FurtherFieldsLoaded)
	C_LONGINT:C283($_l_FurtherFieldsExist; $_l_Index; $_l_TabRow; ballocate; INV_at_ViewTabsLabelsOLD; vALLevels; $_l_CurrentFormPage; $_l_FurtherFieldsExist; $_l_Index; $_l_TabRow; INV_l_FurtherFieldsMod)
	C_PICTURE:C286(INV_Pi_Mode)
	C_POINTER:C301($_ptr_ArrayReferences)
	C_TEXT:C284($_t_HandlerCharacter1; $_t_oldMethodName; $_t_SubItemName; $1; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; INV_T_AssignedCode; SYS_t_AccessType; vButtDisInv; $_t_FlagReference)
	C_TEXT:C284($_t_HandlerCharacter1; $_t_oldMethodName; $_t_SubItemName; DB_t_CurrentFormUsage; INV_T_AssignedCode; SYS_t_AccessType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPß")
//Invoices_InLPß - the pretend before phase
//see InButt_LPß for description of param
If (Count parameters:C259>=1)
	$_t_HandlerCharacter1:=Substring:C12($1; 1; 1)
Else 
	$_t_HandlerCharacter1:="S"
End if 

Case of 
	: ($_t_HandlerCharacter1="N")  //(($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N"))  `use this bit if don't use Before2 method
		Invoices_InLPBB
		
		INV_DisplayAllocations
		//```
		
		
		
		If ([INVOICES:39]X_DepositRelatedTable:44>0) & ([INVOICES:39]X_DepositRelatedRecordID:45>0)
			Case of 
				: ([INVOICES:39]X_DepositRelatedTable:44=Table:C252(->[ORDERS:24]))
					If ([ORDERS:24]x_ID:58#[INVOICES:39]X_DepositRelatedRecordID:45)
						QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[INVOICES:39]X_DepositRelatedRecordID:45)
					End if 
					If (Records in selection:C76([ORDERS:24])=0)
						INV_T_AssignedCode:="Order:"+"Unknown"
					Else 
						INV_T_AssignedCode:="Order:"+[ORDERS:24]Order_Code:3
					End if 
					
					
			End case 
			OBJECT SET VISIBLE:C603(*; "oLabelAssigned"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oassignment"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "oLabelAssigned"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oassignment"; False:C215)
			
		End if 
		
		Case of 
			: ([INVOICES:39]State:10=-2) | ([INVOICES:39]State:10=-3)
				OBJECT SET VISIBLE:C603(ballocate; False:C215)
			: (DB_t_CurrentFormUsage="CN")
				OBJECT SET TITLE:C194(Ballocate; "Allocate Credit")
		End case 
		CCM_LoadInvAuths([INVOICES:39]Invoice_Number:1; True:C214)
		//````
	: ($_t_HandlerCharacter1="A")  //| ($_t_HandlerCharacter1="F"))  `not F cos accepts the record
		Inv_Accept
	: ($_t_HandlerCharacter1="C")
		Inv_Cancel
	: ($_t_HandlerCharacter1="D")
		Inv_Delete
End case 
If ([INVOICES:39]Invoice_Number:1#"")
	OBJECT SET ENTERABLE:C238([INVOICES:39]Invoice_Number:1; False:C215)
End if 
If ([INVOICES:39]Posted_Date:8#!00-00-00!)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Invoice_Date:4; False:C215)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Company_Code:2; False:C215)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Contact_Code:3; False:C215)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Period_Code:13; False:C215)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Debtors_Account:15; False:C215)
	
	OBJECT SET ENTERABLE:C238([INVOICES:39]Currency_Code:27; False:C215)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Analysis_Code:17; False:C215)
	OBJECT SET ENTERABLE:C238([INVOICES:39]Layer_Code:38; False:C215)
	OBJECT SET ENTERABLE:C238([INVOICES:39]TAX_Registration_Number:20; False:C215)
	
End if 


If (($_t_HandlerCharacter1="B") | ($_t_HandlerCharacter1="N") | ($_t_HandlerCharacter1="S") | ($_t_HandlerCharacter1="P"))
	Case of 
		: ($_t_HandlerCharacter1="B")
			OBJECT SET ENTERABLE:C238([INVOICES:39]Deliver_To:32; False:C215)
			$_l_FurtherFieldsExist:=FUR_FIELDSLOAD(->[INVOICES:39])  //this load an array. note this is completelty different to all the other areas on thi page as it does not use the definitions-big FUN
			If (Records in set:C195("FUR_FFSelection")>0)
				USE SET:C118("FUR_FFSelection")
				CREATE SET:C116([CUSTOM_FIELDS:98]; "INV_FFSelection")
			Else 
				CREATE EMPTY SET:C140([CUSTOM_FIELDS:98]; "INV_FFSelection")
			End if 
			CLEAR SET:C117("FUR_FFSelection")
			INV_l_FurtherFieldsMod:=0
			//FURTHER FIELDS CANNOT BE PUT ON THE MENU
			INV_bo_FurtherFieldsLoaded:=($_l_FurtherFieldsExist=0)
			//Note that for a new record this will be false!!!!!
			
			Invoice_Contexts
			If (INV_at_ViewTabsLabelsOLD>0)
				INV_at_ViewTabsLabels:=INV_at_ViewTabsLabelsOLD
			End if 
			If (INV_at_ViewTabsLabels=0)
				INV_at_ViewTabsLabels:=1
				INV_at_ViewTabsLabelsOLD:=0
			End if 
			
			$_l_CurrentFormPage:=1
			INV_DisplayAllocations
			
			If ([INVOICES:39]X_DepositRelatedTable:44>0) & ([INVOICES:39]X_DepositRelatedRecordID:45>0)
				Case of 
					: ([INVOICES:39]X_DepositRelatedTable:44=Table:C252(->[ORDERS:24]))
						If ([ORDERS:24]x_ID:58#[INVOICES:39]X_DepositRelatedRecordID:45)
							QUERY:C277([ORDERS:24]; [ORDERS:24]x_ID:58=[INVOICES:39]X_DepositRelatedRecordID:45)
						End if 
						If (Records in selection:C76([ORDERS:24])=0)
							INV_T_AssignedCode:="Order:"+"Unknown"
						Else 
							INV_T_AssignedCode:="Order:"+[ORDERS:24]Order_Code:3
						End if 
						
						
				End case 
				OBJECT SET VISIBLE:C603(*; "oLabelAssigned"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oassignment"; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(*; "oLabelAssigned"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oassignment"; False:C215)
				
			End if 
			
			Case of 
				: ([INVOICES:39]State:10=-2) | ([INVOICES:39]State:10=-3)
					OBJECT SET VISIBLE:C603(ballocate; False:C215)
				: (DB_t_CurrentFormUsage="CN")
					OBJECT SET TITLE:C194(Ballocate; "Allocate Credit")
			End case 
			CCM_LoadInvAuths([INVOICES:39]Invoice_Number:1; True:C214)
			
			
		: ($_t_HandlerCharacter1="N")
			$_l_CurrentFormPage:=FORM Get current page:C276
		Else 
			If (Count parameters:C259>=1)
				$_l_CurrentFormPage:=Num:C11(Substring:C12($1; 2; 1))  //Layout Page you're going to
			Else 
				$_l_CurrentFormPage:=1
			End if 
	End case 
	
	Case of 
		: ($_l_CurrentFormPage=1)
			$_bo_Editable:=(INV_al_ViewTabsSettings{INV_at_ViewTabsLabels}=0)
			If ($_bo_Editable)
				$_t_FlagReference:="411111000"
			Else 
				$_t_FlagReference:="311111000"
			End if 
			
			If (Size of array:C274(INV_aptr_ListboxSetup)=0) & (vALLevels>0)
				$_bo_NewLevel:=True:C214
			Else 
				$_bo_NewLevel:=False:C215
			End if 
			Case of 
				: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[CUSTOM_FIELDS:98]))
					USE SET:C118("INV_FFSelection")
					//Because this does not use the definitions a definition set must be loaded-we will load the contacts
					If (Size of array:C274(INV_aptr_ListboxSetup)=0) | (INV_at_ViewTabsLabelsOLD#INV_at_ViewTabsLabels)
						INV_at_ViewTabsLabelsOLD:=INV_at_ViewTabsLabels
						//NG Aug 2006 VaccessTypes is still used to determine which subform to use
						
						LBi_ArrDefFill(->INV_aptr_ListboxSetup; ->INV_lb_InvoiceItems; ->[INVOICES_ITEMS:161]ID:17; ->[INVOICES:39]Invoice_Number:1; $_t_FlagReference; "Items_in"; 3; "Sales Ledger Items"; "Sales Ledger Item"; ""; $_bo_NewLevel)
						
					End if 
					FUR_FillListBoxArea(->INV_lb_InvoiceItems; ->[INVOICES:39])
				: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //Invoice items
					//TRACE
					If ([INVOICES:39]Invoice_Number:1#"")
						QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
					Else 
						REDUCE SELECTION:C351([INVOICES_ITEMS:161]; 0)
					End if 
					
					If (Size of array:C274(INV_aptr_ListboxSetup)=0) | (INV_at_ViewTabsLabelsOLD#INV_at_ViewTabsLabels)
						INV_at_ViewTabsLabelsOLD:=INV_at_ViewTabsLabels
						LBi_ArrDefFill(->INV_aptr_ListboxSetup; ->INV_lb_InvoiceItems; ->[INVOICES_ITEMS:161]ID:17; ->[INVOICES:39]Invoice_Number:1; $_t_FlagReference; "Items_in"; 3; "Sales Ledger Items"; "Sales Ledger Item"; ""; $_bo_NewLevel)
						//ALArrDefFill (->INV_aptr_ListboxSetup;->eALInvII;->[INVOICES];->[INVOICES]ITEMS;"Green";"ALModInvI";"411111000";"Items_in";"03903";◊User;"[INVOICES]ITEMS";"Sales Ledger Items";"Sales Ledger Item";->[INVOICES];->[INVOICES]Invoice No)
						//NG April 2004 removed reference to ◊screen
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								LBi_Prefs11(->INV_aptr_ListboxSetup)
								// :  ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
					End if 
					LBi_LoadSetup(->INV_aptr_ListboxSetup; $_t_HandlerCharacter1; INV_al_ViewTabsSettings{INV_at_ViewTabsLabels})
					//Else
					
					INV_at_EditMode:=1
					
					If ([INVOICES:39]Posted_Date:8#!00-00-00!) | ([INVOICES:39]State:10>=1)
						INV_at_EditMode{1}:="No Edit"
						INV_al_EditMode{1}:=-1
						INV_al_EditMode:=1
					End if 
					
					LBi_EditListLay(->INV_aptr_ListboxSetup; ->INV_at_EditMode; ->INV_Pi_Mode; ->INV_al_EditMode)
				: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[DIARY:12]))  //DIary
					If (Size of array:C274(INV_at_TabNames)=0)
						SD2_GetRelatedDiaryItems(Table:C252(->[INVOICES:39]); Field:C253(->[INVOICES:39]Invoice_Number:1); [INVOICES:39]Invoice_Number:1)
						If (Size of array:C274(INV_aptr_ListboxSetup)=0) | (INV_at_ViewTabsLabelsOLD#INV_at_ViewTabsLabels)
							INV_at_ViewTabsLabelsOLD:=INV_at_ViewTabsLabels
							
							LBi_ArrDefFill(->INV_aptr_ListboxSetup; ->INV_lb_InvoiceItems; ->[DIARY:12]Diary_Code:3; ->[INVOICES:39]Invoice_Number:1; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel)
						Else 
							OK:=1
							Case of 
								: ($_t_HandlerCharacter1="B")
									LBi_Prefs11(->INV_aptr_ListboxSetup)
							End case 
						End if 
						LBi_LoadSetup(->INV_aptr_ListboxSetup; $_t_HandlerCharacter1; INV_al_ViewTabsSettings{INV_at_ViewTabsLabels})
					Else 
						$_l_TabRow:=Find in array:C230(INV_at_TabNames; INV_at_ViewTabsLabels{INV_at_ViewTabsLabels})
						If ($_l_TabRow>0)  //it should be
							If (Size of array:C274(INV_al_TabIncludes{$_l_TabRow})>0)
								INV_SelectDiaryRecords($_l_TabRow)
							Else 
								SD2_GetRelatedDiaryItems(Table:C252(->[INVOICES:39]); Field:C253(->[INVOICES:39]Invoice_Number:1); [INVOICES:39]Invoice_Number:1)
							End if 
							If (Size of array:C274(INV_aptr_ListboxSetup)=0) | (INV_at_ViewTabsLabelsOLD#INV_at_ViewTabsLabels)
								If (Size of array:C274(INV_al_TabIncludes{$_l_TabRow})>0)
									
									
									INV_at_ViewTabsLabelsOLD:=INV_at_ViewTabsLabels
									
									LBi_ArrDefFill(->INV_aptr_ListboxSetup; ->INV_lb_InvoiceItems; ->[DIARY:12]Diary_Code:3; ->[INVOICES:39]Invoice_Number:1; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel)
									
								Else 
									INV_at_ViewTabsLabelsOLD:=INV_at_ViewTabsLabels
									
									LBi_ArrDefFill(->INV_aptr_ListboxSetup; ->INV_lb_InvoiceItems; ->[DIARY:12]Diary_Code:3; ->[INVOICES:39]Invoice_Number:1; $_t_FlagReference; "Diary_InNEW"; 8; "Diary Records"; "Diary Record"; ""; $_bo_NewLevel)
								End if 
								
							Else 
								OK:=1
								Case of 
									: ($_t_HandlerCharacter1="B")
										LBi_Prefs11(->INV_aptr_ListboxSetup)
								End case 
								
								
							End if 
							LBi_LoadSetup(->INV_aptr_ListboxSetup; $_t_HandlerCharacter1; INV_al_ViewTabsSettings{INV_at_ViewTabsLabels})
						End if 
						
					End if 
					
				: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[DOCUMENTS:7]))  //Documents
					SD2_GetRelatedDiaryItems(Table:C252(->[INVOICES:39]); Field:C253(->[INVOICES:39]Invoice_Number:1); [INVOICES:39]Invoice_Number:1; True:C214)
					If (Size of array:C274(INV_aptr_ListboxSetup)=0) | (INV_at_ViewTabsLabelsOLD#INV_at_ViewTabsLabels)
						INV_at_ViewTabsLabelsOLD:=INV_at_ViewTabsLabels
						
						LBi_ArrDefFill(->INV_aptr_ListboxSetup; ->INV_lb_InvoiceItems; ->[DIARY:12]Diary_Code:3; ->[ORDERS:24]Order_Code:3; $_t_FlagReference; "LETTER"; 9; "Documents"; "Document"; ""; $_bo_NewLevel)
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")  //this Else bit only on the first page
								LBi_Prefs11(->INV_aptr_ListboxSetup)
								
						End case 
					End if 
					LBi_LoadSetup(->INV_aptr_ListboxSetup; $_t_HandlerCharacter1; INV_al_ViewTabsSettings{INV_at_ViewTabsLabels})
				: (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))  //Orders
					ARRAY LONGINT:C221($_al_ItemNumber; 0)
					QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
					
					FIRST RECORD:C50([INVOICES_ITEMS:161])
					For ($_l_Index; 1; Records in selection:C76([INVOICES_ITEMS:161]))
						If ([INVOICES_ITEMS:161]Item_Number:12#0)
							APPEND TO ARRAY:C911($_al_ItemNumber; [INVOICES_ITEMS:161]Item_Number:12)
						End if 
						NEXT RECORD:C51([INVOICES_ITEMS:161])
						
					End for 
					QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_al_ItemNumber)
					If (Size of array:C274(INV_aptr_ListboxSetup)=0) | (INV_at_ViewTabsLabelsOLD#INV_at_ViewTabsLabels)
						INV_at_ViewTabsLabelsOLD:=INV_at_ViewTabsLabels
						
						//DISTINCT VALUES([ORDER ITEMS]Order Code;$_at_OrderCodes)
						//QUERY WITH ARRAY([ORDERS]Order Code;$_at_OrderCodes)
						
						LBi_ArrDefFill(->INV_aptr_ListboxSetup; ->INV_lb_InvoiceItems; ->[ORDER_ITEMS:25]Item_Number:27; ->[INVOICES:39]Invoice_Number:1; $_t_FlagReference; "Items_in"; (3+Num:C11(SYS_t_AccessType="Q")+(2*(Num:C11((DB_t_CurrentFormUsage="InE@") | (DB_t_CurrentFormUsage="InQ@") | (DB_t_CurrentFormUsage="InV@"))))); "Order Items"; "Order Item"; ""; $_bo_NewLevel)
						//LBi_ArrDefFill (->INV_aptr_ListboxSetup;->INV_lb_InvoiceItems;->[ORDERS]Order Code;->[INVOICES]Invoice No;"411111000";"Order_In";8;"Sales Orders";"Sales Orders";"";False)
						
					Else 
						OK:=1
						Case of 
							: ($_t_HandlerCharacter1="B")
								LBi_Prefs11(->INV_aptr_ListboxSetup)
								// :  ($_t_HandlerCharacter1="P")
								//  ALSetScroll0 (»aAlloIPtrs)`enable this once set up allocations
						End case 
					End if 
					LBi_LoadSetup(->INV_aptr_ListboxSetup; $_t_HandlerCharacter1; INV_al_ViewTabsSettings{INV_at_ViewTabsLabels})
					
					
					
			End case 
			If (INV_at_EditMode=0)
				INV_at_EditMode:=1
				INV_al_EditMode:=1
			End if 
			Case of 
				: (INV_al_ViewTabsSettings{INV_at_ViewTabsLabels}=0)
					If ([INVOICES:39]Posted_Date:8=!00-00-00!)
						INV_al_EditMode{1}:=2
						INV_at_EditMode{1}:="No Edit"
					Else 
						INV_al_EditMode{1}:=-1
						INV_at_EditMode{1}:="Edit"  //By doing this it cannot be changed
					End if 
				: (INV_al_ViewTabsSettings{INV_at_ViewTabsLabels}=3)
					INV_al_EditMode{1}:=-1
					INV_at_EditMode{1}:="Edit"
			End case 
			LBi_EditListLay(->INV_aptr_ListboxSetup; ->INV_at_EditMode; ->INV_Pi_Mode; ->INV_al_EditMode)
			
		: ($_l_CurrentFormPage=2)
			
			//If ($_t_HandlerCharacter1="P")
			//  ALSetScroll0 (»INV_aptr_ListboxSetup)`enable this once set up allocations
			//  End if
			//Allocations
			
	End case 
	If (Size of array:C274(INV_aptr_ListboxSetup)>=9)
		
		$_ptr_ArrayReferences:=INV_aptr_ListboxSetup{9}
		If (Size of array:C274($_ptr_ArrayReferences->)>=10)
			$_t_SubItemName:=$_ptr_ArrayReferences->{10}
			Case of 
				: ($_l_CurrentFormPage=1)
					If (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES_ITEMS:161])) | (INV_al_ViewTableToTable{INV_at_ViewTabsLabels}=Table:C252(->[INVOICES:39]))  //if and when we make other  items removable then we can enable other items
						In_ButtChkDis(->vButtDisInv; "Invoice"; $_t_SubItemName)
					Else 
						In_ButtChkDis(->vButtDisInv; "Invoice")
					End if 
				: ($_l_CurrentFormPage=2)
					//In_ButtChkDis (->vButtDisInv;"Invocie")
					In_ButtChkDis(->vButtDisInv; "Invoice")  //fixed typo 02/09/08 -kmw
			End case 
		End if 
	End if 
	
	
Else 
	If ((($_t_HandlerCharacter1="A") & (OK=1)) | ((($_t_HandlerCharacter1="C") | ($_t_HandlerCharacter1="D")) & (OK=0)))
		LBi_pRefs4upd(->INV_aptr_ListboxSetup)
	End if 
	//no ALpRefs4Sort
End if 
If ([INVOICES:39]State:10=-3)  //& (False)
	FORM GOTO PAGE:C247(2)
	OBJECT SET VISIBLE:C603(INV_at_InvoicesTab; False:C215)
	OBJECT SET VISIBLE:C603(*; "oP2Label@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oP2Labe@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oP2Label@"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; False:C215)
	//SET VISIBLE(*;"oDeliveryAdLabel@";False)
	OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStdAddressField"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oStdAddressModButton"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oDeliveryDetails"; False:C215)
	//SET VISIBLE(*;"oInvoicePersonLabel";False)
	OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; False:C215)
	OBJECT SET VISIBLE:C603(*; "oFieldDeliveryCoCode"; False:C215)
	//SET VISIBLE(*;"oFieldInvoicePerson";False)
Else 
	OBJECT SET VISIBLE:C603(INV_at_InvoicesTab; True:C214)
End if 
If (FORM Get current page:C276=2)
	$_bo_ShowP1Fields:=False:C215
	Case of 
		: ([INVOICES:39]State:10>=0)
			Case of 
					
				: ([INVOICES:39]State:10=0)
					$_bo_ShowP1Fields:=False:C215
				: ([INVOICES:39]State:10=1)  //Batched
					
					$_bo_ShowP1Fields:=False:C215
				: ([INVOICES:39]State:10=2)  //"Posted"
					If ([INVOICES:39]x_DeliveryAddressID:48=0)
						$_bo_ShowP1Fields:=True:C214
					Else 
						$_bo_ShowP1Fields:=False:C215
					End if 
				: ([INVOICES:39]State:10=3)
					If ([INVOICES:39]x_DeliveryAddressID:48=0)
						$_bo_ShowP1Fields:=True:C214
					Else 
						$_bo_ShowP1Fields:=False:C215
					End if 
			End case 
		Else 
			Case of 
				: ([INVOICES:39]State:10=-3)  //Receipt
					$_bo_ShowP1Fields:=True:C214
				: ([INVOICES:39]State:10=-1)  //:="Proforma"
					$_bo_ShowP1Fields:=False:C215
			End case 
	End case 
	If ($_bo_ShowP1Fields)
		OBJECT SET VISIBLE:C603(*; "oP2Label@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oP2Labe@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oP2Label@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDeliveryAdLabel@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oStdAddressField"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oStdAddressModButton"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oDeliveryDetails"; False:C215)
		//SET VISIBLE(*;"oInvoicePersonLabel";False)
		OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oFieldDeliveryCoCode"; False:C215)
		//SET VISIBLE(*;"oFieldInvoicePerson";False)
		OBJECT SET VISIBLE:C603(*; "oP1Field@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oP1Label@"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "oP2Label@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oP2Labe@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oP2Label@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oDeliveryAd@"; False:C215)
		//SET VISIBLE(*;"oDeliveryAdLabel@";True)
		OBJECT SET VISIBLE:C603(*; "oStdAddressLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oStdAddressField"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oStdAddressModButton"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oDeliveryDetails"; True:C214)
		//SET VISIBLE(*;"oInvoicePersonLabel";False)
		OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oFieldDeliveryContCode"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oFieldDeliveryCoCode"; True:C214)
		//SET VISIBLE(*;"oFieldInvoicePerson";False)
		OBJECT SET VISIBLE:C603(*; "oP1Field@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oP1Label@"; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("Invoices_InLPß"; $_t_oldMethodName)
