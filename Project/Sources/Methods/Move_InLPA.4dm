//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/12/2009 11:17`Method: Move_InLPA
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_LB_StockItems;0)
	//ARRAY LONGINT(STK_AL_AUTOALLOCATEOI;0)
	//ARRAY LONGINT(STK_al_DeleteItems;0)
	//ARRAY LONGINT(STK_al_ModifiedLineIDS;0)
	//ARRAY LONGINT(STK_al_RemoveFromItemID;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY REAL(STK_ar_AUTOALLOCATEQTY;0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $ready; STK_bAllocateReady; STK_bo_AllocCLog; STK_bo_AutoAllocateInited; STK_bo_ConsolidatedView; STK_bo_isHDeletedInited; STK_bo_LineTrackerActive; STK_bo_MoveOnOrderAllocation; STK_bo_RestReady; STK_bo_RestReadytoreceive)
	C_LONGINT:C283($_l_ColumnNumber; $_l_CopiedFromRow; $_l_FieldNumber; $_l_KeyPosition; $_l_Process; $_l_Row; $_l_TableNumber; $_l_ValidateQuantityIndex; STOCK_l_Context)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_FocusObject; $_Ptr_KeyField; $_ptr_LBTable; $_Ptr_ThisColumnArray)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_CurrentFormUsage; $_t_oldMethodName; $_t_VariableName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_InLPA")
//Move_InLPA
//TRACE

//First we need to make sure if we in a field that we tab out of it..
$_ptr_FocusObject:=Focus object:C278
RESOLVE POINTER:C394($_ptr_FocusObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
If ($_t_VariableName="STK_LB_StockItems")
	LISTBOX GET CELL POSITION:C971(STK_LB_StockItems; $_l_ColumnNumber; $_l_Row)
	If ($_l_ColumnNumber>0) & ($_l_Row>0)
		LBi_AreaScript(->STK_aptr_ItemPreferences; -(On Data Change:K2:15); [STOCK_MOVEMENTS:40]Movement_Code:1; ->SM_at_ModeStockMov; $_l_Row; $_t_VariableName; "STK_Lbi_MovItems")
		
	End if 
	
End if 
//STK_bo_AllocCLog:=True
//<>STK_bo_AllocationLog:=True
//<>STK_l_ALLOCATIONLOGPROC:=New process("STK_SHOWPROGRESS";128000;"SHOW STOCK HANDLING";Current process)
<>STK_T_AllocLog:="Start Time:="+String:C10(Current time:C178)


If (STOCK_l_Context<0)
	CANCEL:C270
Else 
	
	If (STK_bo_ConsolidatedView)
		ARRAY POINTER:C280(STK_aptr_ItemPreferences; 0)
		STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)  //New Call NG May 2004
		
	End if 
	
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	If ([STOCK_MOVEMENTS:40]Movement_Type:6="")
		Gen_Alert("This Movement cannot be posted - Movement Type is Mandatory"; "Try again")
	Else 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
		LISTBOX GET CELL POSITION:C971(STK_LB_StockItems; $_l_ColumnNumber; $_l_Row)
		If ($_l_Row>0)
			If (Size of array:C274(STK_aptr_ItemPreferences)>9)
				$_ptr_LBTable:=STK_aptr_ItemPreferences{7}
				$_ptr_ArrayFieldPointers:=STK_aptr_ItemPreferences{2}
				$_Ptr_KeyField:=STK_aptr_ItemPreferences{8}
				$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
				If (($_l_KeyPosition>0) | ($_l_KeyPosition=-3))
					$_ptr_ArrayofArrayPointers:=STK_aptr_ItemPreferences{3}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
					If (Size of array:C274($_Ptr_ThisColumnArray->)>=$_l_Row)
						If ($_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Row})
							If (Read only state:C362($_ptr_LBTable->))
								If ((Record number:C243($_ptr_LBTable->)#-3))
									READ WRITE:C146($_ptr_LBTable->)
									LOAD RECORD:C52($_ptr_LBTable->)
								End if 
							End if 
							
						Else 
							DB_SaveRecord($_ptr_LBTable)
							READ WRITE:C146($_ptr_LBTable->)
							QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Row})
						End if 
					End if 
				End if 
			End if 
			If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=0)
				[STOCK_MOVEMENT_ITEMS:27]x_ID:16:=AA_GetNextIDinMethod(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
			End if 
			
			DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27])
			AA_CheckFileUnlocked(->[STOCK_MOVEMENT_ITEMS:27]x_ID:16)
		End if 
		If (OK=1)
			//TRACE
			
			DB_SaveRecord(->[STOCK_MOVEMENTS:40])
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
						//This movement has copied from on order items where those items were allocated.
						STK_bAllocateReady:=False:C215
						QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=[STOCK_MOVEMENTS:40]Movement_Code:1)
						//the allocation has been taken off the on order items and now the stock is in we can allocate the stock when this Process_Ends
						//however the quantities may have been changed so STK_ar_AUTOALLOCATEQTY could be wrong
						FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
						For ($_l_ValidateQuantityIndex; 1; Records in selection:C76([STOCK_MOVEMENT_ITEMS:27]))
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
								GET PROCESS VARIABLE:C371($_l_Process; STK_bo_RestReadytoreceive; $Ready)
							Until ($Ready)
							VARIABLE TO VARIABLE:C635($_l_Process; STK_al_DeleteItems; STK_al_DeleteItems)
							SET PROCESS VARIABLE:C370($_l_Process; STK_bo_RestReady; True:C214)
						End if 
					End if 
				End if 
				
				If (([STOCK_MOVEMENTS:40]Posted_Date:7=!00-00-00!) & ([STOCK_MOVEMENTS:40]Movement_Type:6#""))
					Move_InLPACheck
					If (OK=1)
						//TRACE
						
						Movement_CodeUp
						If (OK=1)
							If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENTS:40]Movement_Type:6)
								QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENTS:40]Movement_Type:6)
							End if 
							If ([MOVEMENT_TYPES:60]Trans_Code:17#"")
								
								Gen_Confirm("Do you want to post this Movement to the Ledgers?"; "Post it"; "Try again")
								If (OK=1)
									Move_InLPAPost
								End if 
							Else 
								Move_InLPAPost
							End if 
							
						End if 
					End if 
					
				Else 
					ACCEPT:C269
				End if 
			End if 
		Else 
			If ([STOCK_MOVEMENTS:40]Movement_Type:6="ISO")
				//Gen_Alert ("Re-allocation wont happen!!")
				
			End if 
		End if 
		If (STK_bo_LineTrackerActive)
			ARRAY LONGINT:C221(STK_al_ModifiedLineIDS; 0)
		End if 
		
	End if 
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
End if 
STK_bo_MoveOnOrderAllocation:=False:C215
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
STK_bo_AllocCLog:=False:C215
<>STK_bo_AllocationLog:=False:C215
ERR_MethodTrackerReturn("Move_InLPA"; $_t_oldMethodName)
