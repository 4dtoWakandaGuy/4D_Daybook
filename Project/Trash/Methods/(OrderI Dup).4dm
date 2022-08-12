//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI Dup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   23/11/2010 09:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_CanDuplicate; $_bo_Reselect; ORD_bo_IsRevision)
	C_LONGINT:C283($_l_DuplicateNumber; $_l_NextOrderSortReference; $_l_NumberofDuplications; $_l_OrderItemTableRow)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_HighlightSetName; $_t_oldMethodName; $_t_PurchaseCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI Dup")
If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		Menu_Record("OrderI Dup"; "Duplicate an Item")
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
		$_bo_Reselect:=False:C215
		If ((DB_t_CurrentFormUsage="Job@") | (DB_t_CurrentFormUsage="PJ"))
			$_bo_CanDuplicate:=([ORDER_ITEMS:25]Item_Number:27#0)
		Else 
			$_l_OrderItemTableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
			If ($_l_OrderItemTableRow>0)
				$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemTableRow}
				$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
				$_t_HighlightSetName:=$_ptr_HighlightSet->
				$_bo_Reselect:=False:C215
				If ($_t_HighlightSetName#"")
					If (Records in set:C195($_t_HighlightSetName)>0)
						USE SET:C118($_t_HighlightSetName)
						CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
						$_bo_Reselect:=True:C214
					End if 
				End if 
			Else 
				$_bo_Reselect:=False:C215
			End if 
			$_bo_CanDuplicate:=([ORDER_ITEMS:25]Item_Number:27#0)
			
		End if 
		If ($_bo_CanDuplicate)
			$_l_NumberofDuplications:=Int:C8(Num:C11(Gen_Request("Duplicate "+[ORDER_ITEMS:25]Product_Code:2+" x:"; "1")))
			If ((OK=1) & ($_l_NumberofDuplications>0))
				If ($_l_NumberofDuplications>10)
					Gen_Confirm("Are you sure?"; "Yes"; "No")
				End if 
				WS_KeepFocus
				
				If (OK=1)
					ONE RECORD SELECT:C189([ORDER_ITEMS:25])
					$_l_DuplicateNumber:=1
					While ($_l_DuplicateNumber<=$_l_NumberofDuplications)
						DUPLICATE RECORD:C225([ORDER_ITEMS:25])
						[ORDER_ITEMS:25]x_ID:58:=0
						
						If (DB_t_CurrentFormUsage="PJ")
							OrderI_NoPJ
						Else 
							OrderI_No
						End if 
						[ORDER_ITEMS:25]Delivery_Date:11:=!00-00-00!
						[ORDER_ITEMS:25]Item_Locked:16:=False:C215
						[ORDER_ITEMS:25]Invoice_Number:17:=""
						[ORDER_ITEMS:25]Received_Date:21:=!00-00-00!
						[ORDER_ITEMS:25]Serial_Number:24:=""
						[ORDER_ITEMS:25]Invoice_Date:25:=!00-00-00!
						[ORDER_ITEMS:25]Allocated:28:=0
						$_l_NextOrderSortReference:=1
						If (DB_t_CurrentFormUsage#"Job")
							[ORDERS:24]Sort_Number:27:=[ORDERS:24]Sort_Number:27+1
							//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextOrderSortReference)
							$_l_NextOrderSortReference:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderSortReference; Records in selection:C76([ORDER_ITEMS:25]))
							
							[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
							[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26
						Else 
							[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
							$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; ""; $_l_NextOrderSortReference)
							
							//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order Code;$_l_NextOrderSortReference)
							[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
							[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
						End if 
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
						$_l_DuplicateNumber:=$_l_DuplicateNumber+1
					End while 
					vTot:=1
				End if 
			End if 
			Case of 
				: (DB_t_CurrentFormUsage="Purch")
				: (DB_t_CurrentFormUsage="Job")
					Jobs_InLPOI
					Jobs_InLPTot
					
				: (DB_t_CurrentFormUsage="JobStages")
					JobStages_InOI2
					JobStages_InTo
					
				: (DB_t_CurrentFormUsage="PJ")
					$_t_PurchaseCode:=Substring:C12("*"+[PURCHASE_INVOICES:37]Purchase_Code:1; 1; 11)
					QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=$_t_PurchaseCode)
					ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
					REDRAW:C174([ORDER_ITEMS:25])
				Else 
					
					Orders_InLPOI
					Orders_InLPTot
					GET HIGHLIGHTED RECORDS:C902(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
					COPY NAMED SELECTION:C331(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$CurrentOISelection")
					REDUCE SELECTION:C351(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; 0)
					USE NAMED SELECTION:C332("$CurrentOISelection")
					HIGHLIGHT RECORDS:C656(Table:C252(ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})->; "$ORD_SelectedRelated")
					
			End case 
		End if 
	Else 
		Gen_Alert("This function can only be used to duplicate order items")
	End if 
Else 
	Gen_Alert("This function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("OrderI Dup"; $_t_oldMethodName)