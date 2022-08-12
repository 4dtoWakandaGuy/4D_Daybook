//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPPO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 18:21`Method: Orders PPPO
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_BOOLEAN:C305($_bo_Reselect; DB_bo_noRefresh)
	C_LONGINT:C283($_l_AddMode2; $_l_TableRow; vAB; vAdd)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_HighlightSetName; $_t_NamedSet; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPPO")
//Orders PPPO
Menu_Record("Orders PPPO"; "Purchase Order")
$_l_AddMode2:=vAdd
If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders)<2) | (DB_GetModuleSettingByNUM(Module_PurchaseOrders)=3))
	Gen_Alert("You do not have access to Purchase Order Processing"; "Cancel")
Else 
	Case of 
			
		: (BUT_p_ButtonStringPointer->="OI@")
			If (Orders_PPOut1(True:C214))
				If (Gen_PPChkSt(->[ORDERS:24]State:15; 5))
					If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
						OrderI_LevelCrS
					End if 
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=""; *)
					QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Purchase_Order_Number:18="N")
					QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20#""; *)
					QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"BUNDLE"; *)
					QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
					If (Records in selection:C76([ORDER_ITEMS:25])=0)
						Gen_Alert("There are no Items to Order"; "Cancel")
					Else 
						vNumber:="N"
						DB_bo_noRefresh:=True:C214
						Orders_PurchP
						DB_bo_noRefresh:=False:C215
					End if 
				End if 
			End if 
			Orders_PPOut2
			
		: (BUT_p_ButtonStringPointer->="OO@")
			Gen_PPMultiCS(->[ORDERS:24])
			If (OK=1)
				If (Gen_PPChkSt(->[ORDERS:24]State:15; 5))
					CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Items")
					FIRST RECORD:C50([ORDERS:24])
					While (Not:C34(End selection:C36([ORDERS:24])))
						If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							OrderI_LevelCr
						End if 
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=""; *)
						QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Purchase_Order_Number:18="N")
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20#""; *)
						QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"BUNDLE"; *)
						QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
						CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
						UNION:C120("Extra"; "Items"; "Items")
						NEXT RECORD:C51([ORDERS:24])
					End while 
					USE SET:C118("Items")
					CLEAR SET:C117("Items")
					If (Records in selection:C76([ORDER_ITEMS:25])=0)
						Gen_Alert("There are no Items to Order"; "Cancel")
					Else 
						vNumber:="N"
						Orders_PurchP
					End if 
				End if 
			End if 
			Gen_PPMultiUS
			
		: (BUT_p_ButtonStringPointer->="IO@")
			//TRACE
			If ((DB_GetModuleSettingByNUM(Module_Assemblies))>0)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
				OrderI_LevelCr
			Else 
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
			End if 
			
			If (In_ButtChkMan(->[ORDERS:24]; "1 3"))
				If (Gen_PPChkStSing(->[ORDERS:24]State:15; 5))
					If (DB_t_CurrentFormUsage2="Sel")
						vNumber:="zzz999"
						OK:=1
					Else 
						vNumber:=Gen_Request("Purchase No to print:")
					End if 
					If (OK=1)
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
						$_t_NamedSet:=""
						$_bo_Reselect:=False:C215
						DB_SaveRecord(->[ORDERS:24])
						AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
						DB_SaveRecord(->[ORDER_ITEMS:25])
						AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
						
						ORD_ISetSortOrder
						
						If (DB_t_CurrentFormUsage#"None")
							
							If (DB_t_CurrentFormUsage#"None")
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
								End if 
							Else 
								$_bo_Reselect:=False:C215
							End if 
							
						Else 
							$_bo_Reselect:=False:C215
						End if 
						Gen_PPSingleCS(->[ORDERS:24])
						
						If (DB_t_CurrentFormUsage2="Sel")
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Purchase_Order_Number:18=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Purchase_Order_Number:18="N")
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20#""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"BUNDLE"; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
							End if 
						Else 
							Orders_InLPOI(vAB)
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3; *)
							QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Purchase_Order_Number:18=vNumber; *)
							QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#""; *)
							QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"BUNDLE"; *)
							QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
						End if 
						Orders_PurchP
						Gen_PPSingleUS
						Orders_PPEnd
						USE NAMED SELECTION:C332("$Temp")
						If ($_bo_Reselect)
							HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
						End if 
						
						
					End if 
				End if 
			End if 
			
	End case 
End if 
UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
vAdd:=$_l_AddMode2
//Need to reSET_MENU
ERR_MethodTrackerReturn("Orders PPPO"; $_t_oldMethodName)
