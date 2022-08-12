//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllocCur
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  19/11/2010 13:28
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
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; <>STK_bo_TypesInited; $_bo_Reselect; ORD_bo_IsRevision; STK_bo_AllocCLog)
	C_LONGINT:C283($_l_TableRow; vNo)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; $_ptr_StateField)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_HighlightSetName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllocCur")
//OrderI Alloc
//STK_bo_AllocCLog:=True
//<>STK_bo_AllocationLog:=True
//<>STK_l_ALLOCATIONLOGPROC:=New process("STK_SHOWPROGRESS";128000;"SHOW STOCK HANDLING";Current process)
<>STK_T_AllocLog:="Start Time:="+String:C10(Current time:C178)

If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		Menu_Record("OrderI_AllocCur"; "Allocate Stock")
		If (Not:C34(<>STK_bo_TypesInited))
			Order_Buttons
			<>STK_bo_TypesInited:=True:C214
		End if 
		//$RevertSetting:=ORD_SetSelectable (1)
		If ((DB_t_CurrentFormUsage#"NA@") & ((DB_GetModuleSettingByNUM(Module_StockControl)=2) | (DB_GetModuleSettingByNUM(Module_StockControl)=4)))  //((DB_t_CurrentFormUsage#"NA@") | (◊SalesAlloc=True))
			If (DB_t_CurrentFormUsage="Jobs")
				$_ptr_StateField:=->[JOBS:26]State:9
			Else 
				$_ptr_StateField:=->[ORDERS:24]State:15
				If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1) & ([ORDER_ITEMS:25]Order_Code:1#"")
					RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
					
				End if 
			End if 
			If (Gen_PPChkStSing($_ptr_StateField; 4))
				DB_SaveRecord(->[ORDER_ITEMS:25])
				AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
				COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
				CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "$Reselection")
				$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				If ($_l_TableRow>0)
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
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
				
				
				
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					If ([ORDER_ITEMS:25]Item_Number:27#0)
						If ([ORDER_ITEMS:25]Quantity:3#0)
							If ([ORDER_ITEMS:25]Quantity:3>0)
								If ([ORDER_ITEMS:25]Product_Code:2#"")
									If ([ORDER_ITEMS:25]Purchase_Order_Number:18#"BUNDLE@")
										If ([ORDER_ITEMS:25]Invoice_Number:17#"ASS COMP")
											QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
											If (Records in selection:C76([MOVEMENT_TYPES:60])=0)
												Gen_Alert(Term_StoWT("Please create a Stock Movement Type suitable for Allocations before using this ")+"function"; "Cancel")
												OK:=0
											Else 
												vNo:=0
												STK_at_AllStockTypes:=Find in array:C230(STK_at_AllStockTypes; [MOVEMENT_TYPES:60]Stock_Minus:4)
												UNLOAD RECORD:C212([MOVEMENT_TYPES:60])
												
												OrderI_AllocCu2
												//LBi_ModUpifAl (->ORD_aPtr_OrderItemsSetup)
												
											End if 
										Else 
											Gen_Alert("You cannot Allocate to Components of Assemblies - allocate an"+" Assembled Product to the top level instead"; "Try again")
										End if 
									Else 
										Gen_Alert("This is a Bundle Product - please Show Next Level Items and allocate there"; "Try again")
									End if 
								Else 
									Gen_Alert("An Order Item without a Product Code cannot be allocated"; "Try again")
								End if 
							Else 
								Gen_Alert("You cannot allocate to negative Quantities, "+"but the Delivery-Type Stock Movement "+"will handle them (if it is in use)."; "Try again")
							End if 
						Else 
							Gen_Alert("Please enter an Item Quantity to allocate"; "Try again")
						End if 
					Else 
						Gen_Alert("Please highlight an Item to allocate"; "Try again")
					End if 
				Else 
					Gen_Alert("Please highlight an Item to allocate"; "Try again")
				End if 
				USE NAMED SELECTION:C332("$Temp")
				If ($_t_HighlightSetName#"")
					HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
				End if 
			End if 
			
		Else 
			Gen_Alert("You do not have access to Allocate Stock"; "Cancel")
		End if 
		vNo:=Records in selection:C76([ORDERS:24])
		//$RevertSetting:=ORD_SetSelectable ($RevertSetting)
	Else 
		Gen_Alert("This function can only be used when viewing the order items")
	End if 
Else 
	Gen_Alert("This function cannot be used when viewing previous revisions")
End if 
STK_bo_AllocCLog:=False:C215
<>STK_bo_AllocationLog:=False:C215
ERR_MethodTrackerReturn("OrderI_AllocCur"; $_t_oldMethodName)
