//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movements Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/04/2010 15:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_AL_AUTOALLOCATEOI;0)
	//ARRAY LONGINT(STK_al_DeleteItems;0)
	//ARRAY LONGINT(STK_al_RemoveFromItemID;0)
	//ARRAY REAL(STK_ar_AUTOALLOCATEQTY;0)
	C_BOOLEAN:C305($_bo_Ready; STK_bAllocateReady; STK_bo_AddItem; STK_bo_AutoAllocateInited; STK_bo_isHDeletedInited; STK_bo_MoveOnOrderAllocation; STK_bo_RestReady; STK_bo_RestReadytoreceive)
	C_LONGINT:C283($_l_CopiedFromRow; $_l_Process; $_l_QuantityIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements Print")
//Movements Print
Menu_Record("Movements Print"; "Print Movement")
If (Modified record:C314([STOCK_MOVEMENT_ITEMS:27])) | (STK_bo_AddItem)
	If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
		[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	End if 
	DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
	AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
	
End if 
If (Modified record:C314([STOCK_MOVEMENTS:40]))
	[STOCK_MOVEMENTS:40]Total_Cost:8:=Gen_Round(Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
	DB_SaveRecord(->[STOCK_MOVEMENTS:40])
End if 
If (In_ButtChkMan(->[STOCK_MOVEMENTS:40]; "1 5 6"))
	Move_InLPACheck
	If (OK=1)
		Movement_CodeUp
		If (OK=1)
			Movements_Prin2
			//  OUTPUT LAYOUT([STOCK MOVEMENTS];"Movt Form")
			// PRINT RECORD([STOCK MOVEMENTS])
			//   OUTPUT LAYOUT([STOCK MOVEMENTS];"Movements Out")
			If (OK=1)
				If (STK_bo_MoveOnOrderAllocation) & (Size of array:C274(STK_AL_AUTOALLOCATEOI)>0)
					Gen_Alert("This movement is a purchase cancellation the order items will be re-allocated stock!")
					
					STK_bAllocateReady:=False:C215
					$_l_Process:=New process:C317("STK_reAllocAutoOnReceipt"; 256000; "Auto allocate Stock"; Current process:C322)
					
					Repeat 
						DelayTicks(2)
						GET PROCESS VARIABLE:C371($_l_Process; STK_bAllocateReady; STK_bAllocateReady)
						
					Until (STK_bAllocateReady)
					VARIABLE TO VARIABLE:C635($_l_Process; STK_AL_AUTOALLOCATEOI; STK_AL_AUTOALLOCATEOI)
					VARIABLE TO VARIABLE:C635($_l_Process; STK_ar_AUTOALLOCATEQTY; STK_ar_AUTOALLOCATEQTY)
					VARIABLE TO VARIABLE:C635($_l_Process; STK_al_RemoveFromItemID; STK_al_RemoveFromItemID)
					RESUME PROCESS:C320($_l_Process)
					STK_bo_AutoAllocateInited:=False:C215
					//Gen_Alert ("Re-allocation process started")
					
				Else 
					If (Size of array:C274(STK_AL_AUTOALLOCATEOI)>0) | (Size of array:C274(STK_AL_AUTOALLOCATEOI)>0)
						//TRACE
						//Gen_Alert ("Re-allocation Process will be run for stock allocated from on order")
						//This movement has copied from on order items where those items were allocated.
						STK_bAllocateReady:=False:C215
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
						//the allocation has been taken off the on order items and now the stock is in we can allocate the stock when this Process_Ends
						//however the quantities may have been changed so STK_ar_AUTOALLOCATEQTY could be wrong
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_QuantityIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
							If ([STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17>0)
								$_l_CopiedFromRow:=Find in array:C230(STK_al_RemoveFromItemID; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17)
								If ($_l_CopiedFromRow>0)
									If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12#STK_ar_AUTOALLOCATEQTY{$_l_CopiedFromRow})
										STK_ar_AUTOALLOCATEQTY{$_l_CopiedFromRow}:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									End if 
								End if 
							End if 
							NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
						End for 
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						
						
						//the allocation has been taken off the on order items and now the stock is in we can allocate the stock when this Process_Ends
						$_l_Process:=New process:C317("STK_AllocAutoOnReceipt"; 256000; "Auto allocate Stock"; Current process:C322)
						
						Repeat 
							DelayTicks(2)
							GET PROCESS VARIABLE:C371($_l_Process; STK_bAllocateReady; STK_bAllocateReady)
							
						Until (STK_bAllocateReady)
						VARIABLE TO VARIABLE:C635($_l_Process; STK_AL_AUTOALLOCATEOI; STK_AL_AUTOALLOCATEOI)
						VARIABLE TO VARIABLE:C635($_l_Process; STK_ar_AUTOALLOCATEQTY; STK_ar_AUTOALLOCATEQTY)
						VARIABLE TO VARIABLE:C635($_l_Process; STK_al_RemoveFromItemID; STK_al_RemoveFromItemID)
						RESUME PROCESS:C320($_l_Process)
						STK_bo_AutoAllocateInited:=False:C215
						//`Gen_Alert ("Re-allocation process started")
					Else 
						//Gen_Alert ("No Re-allocations to do!???")
					End if 
				End if 
				If (STK_bo_isHDeletedInited)
					If (Size of array:C274(STK_al_DeleteItems)>0)
						$_l_Process:=New process:C317("STK_DeleteUsedNulItems"; 128000; "Delete Used Items"; False:C215)
						DelayTicks(20)
						If ($_l_Process>0)
							Repeat 
								DelayTicks(2)
								GET PROCESS VARIABLE:C371($_l_Process; STK_bo_RestReadytoreceive; $_bo_Ready)
							Until ($_bo_Ready)
							VARIABLE TO VARIABLE:C635($_l_Process; STK_al_DeleteItems; STK_al_DeleteItems)
							SET PROCESS VARIABLE:C370($_l_Process; STK_bo_RestReady; True:C214)
						End if 
					End if 
				End if 
				If (([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!) & ([STOCK_MOVEMENTS:40]Movement_Type:6#""))
					If ([MOVEMENT_TYPES:60]Edit_After_Print:22)
						Gen_Confirm("Do you want to post this Movement and update Stock Levels?"; "Post it"; "Try again")
					Else 
						Gen_Confirm("Do you want to post this Movement and update Stock Levels?"; "Post it"; "Cancel")
					End if 
					If (OK=1)
						Move_InLPAPost
					End if 
					If ([MOVEMENT_TYPES:60]Edit_After_Print:22=False:C215)
						If (OK=1)
							ACCEPT:C269
						Else 
							CANCEL:C270
						End if 
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Movements Print"; $_t_oldMethodName)
