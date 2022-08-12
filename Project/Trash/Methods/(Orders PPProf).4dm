//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPProf
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   22/11/2010 20:06
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	C_BOOLEAN:C305($_bo_Reselect; ORD_bo_IsRevision)
	C_DATE:C307(vDelDate; vInvDate)
	C_LONGINT:C283($_l_AddMode2; $_l_AvailableOIRecords; $_l_OrderItemsRow; $_l_Selected; vAdd)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup; BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_HighlightSetName; $_t_NamedSet; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vInvNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPProf")
//Orders_PPPO
If (Not:C34(ORD_bo_IsRevision))
	
	Menu_Record("Orders PPProf"; "Proforma Invoice")
	$_l_AddMode2:=vAdd
	If ((DB_GetModuleSettingByNUM(Module_SalesLedger)<2) | (DB_GetModuleSettingByNUM(Module_SalesLedger)=3))
		Gen_Alert("You do not have access to the Sales Ledger"; "Cancel")
	Else 
		
		Case of 
				
			: (BUT_p_ButtonStringPointer->="OI@")
				If (Orders_PPOut1(True:C214))
					If (Gen_PPChkSt(->[ORDERS:24]State:15; 2))
						If (Orders_PPChCo)
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
							QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
							OrderI_Level0
							If (Records in selection:C76([ORDER_ITEMS:25])=0)
								Gen_Alert("There are no Items for a Proforma"; "Cancel")
							Else 
								vInvNo:=""
								vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
								vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
								DB_t_CurrentFormUsage:="Proforma"
								DB_t_CurrentFormUsage2:="Proforma"
								Orders_InvTrans
								
							End if 
						End if 
					End if 
				End if 
				Orders_PPOut2
				
			: (BUT_p_ButtonStringPointer->="OO@")
				Gen_PPMultiCS(->[ORDERS:24])
				If (OK=1)
					If (Gen_PPChkSt(->[ORDERS:24]State:15; 2))
						FIRST RECORD:C50([ORDERS:24])
						While (Not:C34(End selection:C36([ORDERS:24])))
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
							QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
							OrderI_Level0
							If (Records in selection:C76([ORDER_ITEMS:25])=0)
								Gen_Alert("There are no Items for a Proforma"; "Cancel")
							Else 
								COPY NAMED SELECTION:C331([ORDERS:24]; "$Sel")
								vInvNo:=""
								vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
								vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
								DB_t_CurrentFormUsage:="Proforma"
								DB_t_CurrentFormUsage2:="Proforma"
								Orders_InvTrans
								USE NAMED SELECTION:C332("$Sel")
							End if 
							NEXT RECORD:C51([ORDERS:24])
						End while 
						CLEAR NAMED SELECTION:C333("$Sel")
					End if 
				End if 
				Gen_PPMultiUS
				
			: (BUT_p_ButtonStringPointer->="IO@")
				If (In_ButtChkMan(->[ORDERS:24]; "1 3"))
					If (Gen_PPChkStSing(->[ORDERS:24]State:15; 2))
						Gen_Confirm("Print existing Proforma or create proforma?"; "Existing"; "New")
						
						If (OK=1)
							vInvNo:=Gen_Request("Proforma No to print:")
							If (OK=1)
								DB_SaveRecord(->[ORDER_ITEMS:25])
								AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
								Orders_InLPA(False:C215)
								DB_SaveRecord(->[ORDERS:24])
								AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
								
								ORD_ISetSortOrder
								COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
								$_t_NamedSet:=""
								$_bo_Reselect:=False:C215
								If (DB_t_CurrentFormUsage#"None")
									$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
									
									If ($_l_OrderItemsRow>0)
										$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
										
										
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
								QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=vInvNo)
								OrderI_Level0
								If (Records in selection:C76([ORDER_ITEMS:25])=0)
									Gen_Alert("There are no Items to Invoice."; "Cancel")
								Else 
									vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
									vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
									Gen_PP1(->[ORDERS:24]; "Orders")
									DB_t_CurrentFormUsage:="Proforma"
									DB_t_CurrentFormUsage2:="Proforma"
									Orders_InvCalc
									Orders_InvTrans
									Gen_PP2("Orders")
								End if 
								Orders_PPEnd
								//Orders_InLPß ("S1")
								USE NAMED SELECTION:C332("$Temp")
								If ($_bo_Reselect)
									HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
								End if 
							End if 
						Else 
							COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
							
							CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Selected")
							If (DB_t_CurrentFormUsage#"None")
								$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
								
								If ($_l_OrderItemsRow>0)
									$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
									
									
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
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
								QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
								If (Records in selection:C76([ORDER_ITEMS:25])>0)
									CREATE SET:C116([ORDER_ITEMS:25]; "Selected")
								Else 
									CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Selected")
								End if 
								$_l_Selected:=Records in selection:C76([ORDER_ITEMS:25])
							End if 
							QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
							QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Invoice_Number:17=""; *)
							QUERY SELECTION:C341([ORDER_ITEMS:25];  | ; [ORDER_ITEMS:25]Invoice_Number:17="N")
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								CREATE SET:C116([ORDER_ITEMS:25]; "Available")
							Else 
								CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Available")
							End if 
							$_l_AvailableOIRecords:=Records in selection:C76([ORDER_ITEMS:25])
							If ($_l_Selected>0)
								Gen_Confirm("All uninvoiced or selected items"; "Selected"; "All")
								If (OK=1)
									USE SET:C118("Selected")
								Else 
									USE SET:C118("Available")
								End if 
								
							Else 
								USE SET:C118("Available")
								
							End if 
							CLEAR SET:C117("Available")
							CLEAR SET:C117("Selected")
							If (Records in selection:C76([ORDER_ITEMS:25])>0)
								vInvNo:=""
								vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
								vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
								DB_t_CurrentFormUsage:="Proforma"
								DB_t_CurrentFormUsage2:="Proforma"
								Orders_InvTrans
								
							End if 
							USE NAMED SELECTION:C332("$Temp")
							If ($_t_HighlightSetName#"")
								HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
							End if 
						End if 
						
						
					End if 
				End if 
				
		End case 
	End if 
	vAdd:=$_l_AddMode2
End if 
ERR_MethodTrackerReturn("Orders PPProf"; $_t_oldMethodName)
