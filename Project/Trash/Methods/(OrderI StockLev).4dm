//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_StockLev
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2010 20:25
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
	C_BOOLEAN:C305($_bo_Reselect; ORD_bo_IsRevision)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_TableRow)
	C_POINTER:C301($_l_StateFIeldPointer; $_ptr_HighlightSet; $_ptr_ListBoxSetup)
	C_TEXT:C284(<>ProdCode; $_t_HighlightSetName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_StockLev")
If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		Menu_Record("OrderI_StockLev"; "Stock Levels")
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
		If ([ORDERS:24]Order_Code:3#[ORDER_ITEMS:25]Order_Code:1) & ([ORDER_ITEMS:25]Order_Code:1#"")
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		End if 
		If (DB_t_CurrentFormUsage="Jobs")
			$_l_StateFIeldPointer:=->[JOBS:26]State:9
		Else 
			$_l_StateFIeldPointer:=->[ORDERS:24]State:15
		End if 
		If (Gen_PPChkStSing($_l_StateFIeldPointer; 4))
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
			DB_SaveRecord(->[ORDERS:24])
			AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
			//◊AutoFind:=True
			//◊AutoOut:=True
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
				If (Records in selection:C76([ORDER_ITEMS:25])>0)
					If ([ORDER_ITEMS:25]Product_Code:2#"")
						<>ProdCode:=[ORDER_ITEMS:25]Product_Code:2
						//`ZStockLev_Mod
						DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_LEVELS:58])); <>MENU_l_BarModule; ""; ->[STOCK_LEVELS:58]Product_Code:1; [ORDER_ITEMS:25]Product_Code:2)
						
					Else 
						Gen_Alert("Please first highlight a Cost Item"; "Cancel")
					End if 
				End if 
				USE NAMED SELECTION:C332("$Temp")
				If ($_bo_Reselect)
					HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
				End if 
			End if 
		End if 
	Else 
		Gen_Alert("This function can only be used when viewing order items")
		
	End if 
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
ERR_MethodTrackerReturn("OrderI_StockLev"; $_t_oldMethodName)
