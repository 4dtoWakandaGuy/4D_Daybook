//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllocAut
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/11/2010 09:10
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
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $_bo_Reselect; ORD_bo_IsRevision; ORD_bo_NoRebuild; ORD_bo_Rebuild; STK_bo_AllocCLog)
	C_LONGINT:C283($_l_OrderItemsRow; IP_l_Message; vAB; vALLevels)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_AllocateResult; $_t_HighlightSetName; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProdCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllocAut")
//OrderI_AllocAut
//TRACE
//STK_bo_AllocCLog:=True
//<>STK_bo_AllocationLog:=True
//<>STK_l_ALLOCATIONLOGPROC:=New process("STK_SHOWPROGRESS";128000;"SHOW STOCK HANDLING";Current process)
<>STK_T_AllocLog:="Start Time:="+String:C10(Current time:C178)


If (Not:C34(ORD_bo_IsRevision))
	If (ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels}=Table:C252(->[ORDER_ITEMS:25]))
		
		
		Menu_Record("OrderI_AllocAut"; "Allocate - Auto")
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+"Menu_Record:="+String:C10(Current time:C178)
		
		COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$Temp")
		If (DB_t_CurrentFormUsage#"NA@")  //((DB_t_CurrentFormUsage#"NA@") | (◊SalesAlloc=True))
			
			If (Gen_PPChkStSing(->[ORDERS:24]State:15; 4))
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+"PPChkStSing:="+String:C10(Current time:C178)
				
				If (OrderI_AllocAu1)
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					$_bo_Reselect:=False:C215
					If (DB_t_CurrentFormUsage#"None") & (Not:C34(Undefined:C82(ORD_al_SubAreaTables)))
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
						Else 
							$_bo_Reselect:=False:C215
						End if 
					End if 
					
					vProdCode:=[ORDER_ITEMS:25]Product_Code:2
					If (vALLevels>0)
						
						
						//USE NAMED SELECTION("$Temp")
						//Gen_Confirm ("This Function will allocate Current "+Term_StoWT ("Stock")+" of Type "+vStatus+", if available, to the "+String(Records in selection([ORDER ITEMS]))+" selected Order Item(s), assuming that "+Term_StoWT ("Stock")+" is maintained and sufficient Allocations have not alread"+"y been made";"";"")
						//     Else
						
					Else 
						$_bo_Reselect:=True:C214
						//Gen_Confirm ("This Function allocates Current "+Term_StoWT ("Stock")+" of Type "+vStatus+", if available, to Order Item(s) for which "+Term_StoWT ("Stock")+" is maintained, where sufficient Allocations have not alread"+"y been made";"";"")
						If (OK=1)
							Gen_Confirm("Do you want to Allocate to just the current Order Item ("+vProdCode+") or to all suitable?"; "Current"; "All")
							If (OK=1)
								ONE RECORD SELECT:C189([ORDER_ITEMS:25])
							Else 
								OK:=1
							End if 
						End if 
					End if 
					If (OK=1)
						//Gen_Confirm ("Are you sure?";"Yes";"No")
						If (OK=1)
							ORD_bo_NoRebuild:=True:C214
							ORD_bo_Rebuild:=False:C215
							$_t_AllocateResult:=OrderI_AllocAu2
							If (ORD_bo_Rebuild)
								ORD_bo_Rebuild:=False:C215
								IP_l_Message:=514
								POST OUTSIDE CALL:C329(Current process:C322)
							End if 
							If ($_t_AllocateResult="None")
								Gen_Alert("No Allocations have been made"; "OK")
							End if 
						End if 
					End if 
					
					Orders_InLPOI(vAB)
					USE NAMED SELECTION:C332("$Temp")
					If ($_bo_Reselect)
						HIGHLIGHT RECORDS:C656([ORDER_ITEMS:25]; "$Reselection")
					End if 
					
					
				End if 
			End if 
		End if 
		//$RevertSetting:=ORD_SetSelectable ($RevertSetting)
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+"Menu_Record:="+String:C10(Current time:C178)
		
	Else 
		Gen_Alert("This function can only be used when viewing order items")
		
	End if 
Else 
	Gen_Alert("This Function cannot be used when viewing previous revisions")
End if 
//STK_SENDLOGTOME

STK_bo_AllocCLog:=False:C215
<>STK_bo_AllocationLog:=False:C215
ERR_MethodTrackerReturn("OrderI_AllocAut"; $_t_oldMethodName)