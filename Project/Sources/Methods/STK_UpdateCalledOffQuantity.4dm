//%attributes = {}

If (False:C215)
	//Project Method Name:      STK_UpdateCalledOffQuantity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AlreadyCountedIDS; 0)
	ARRAY REAL:C219($_ar_AlreadyCountedQuantities; 0)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; <>STK_bo_inUpdateCalledOffQuantit; <>SYS_bo_QuitCalled; $_bo_AllocCLog; $_bo_Continue; $_bo_Edits; $_bo_GiveUp; $_bo_inTrigger; $_bo_inUpdateCalledOffQuantities; $_bo_Reload; $_bo_SetValue)
	C_BOOLEAN:C305($_bo_WindowOpen; $_l_ProcessTime; DB_bo_Locked; DB_bo_LockedMessage; STK_bo_CalledoffVALIDATED; STK_bo_Continue; STK_bo_OverAllocated; STK_bo_SetSuccess)
	C_LONGINT:C283($_bo_ProcessVisible; $_l_AddToCurrentStockID; $_l_ApplicationType; $_l_CountTasks; $_l_GetCalledOff; $_l_GetCurrentStockProcess; $_l_ID; $_l_proc; $_l_Process; $_l_procstate; $_l_proctime)
	C_LONGINT:C283($_l_Retries; $_l_RunningProcessCheck; $_l_SemID; $_l_StockMovementItemID; $_l_TakeFromCSID; $_l_Tries; $_l_UniqueProcessID; $1; STK_l_anycalledOff; STK_l_Callback; STK_l_Continue)
	C_LONGINT:C283(STK_l_ID)
	C_REAL:C285($_r_QuantityWas; $_r_Sum; $2; STK_l_Called; STK_R_CALLEDOFF)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_UpdateCalledOffQuantity")



$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)


$_t_oldMethodName:=ERR_MethodTracker("STK_UpdateCalledOffQuantity")
$_l_ApplicationType:=Application type:C494
STK_bo_OverAllocated:=False:C215
If (Trigger level:C398>0)
	$_bo_inTrigger:=True:C214
End if 

If (Count parameters:C259>=2)
	If ($_bo_AllocCLog)
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Parameter Count is >=2"+" "+String:C10(Current time:C178)
		
	End if 
	$_bo_inUpdateCalledOffQuantities:=<>STK_bo_inUpdateCalledOffQuantit
	<>STK_bo_inUpdateCalledOffQuantit:=True:C214
	
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	STK_l_ID:=$1
	STK_l_Callback:=$2
	STK_R_CALLEDOFF:=0
	$_l_AddToCurrentStockID:=0
	$_l_TakeFromCSID:=0
	
	$_l_ID:=(STK_l_ID)
	If (STK_l_Callback>=0)
		If ($_bo_AllocCLog)
			<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"CallBack ID is"+String:C10(STK_l_Callback)+" "+String:C10(Current time:C178)
		End if 
		If (STK_l_ID#0)
			ARRAY REAL:C219($_ar_AlreadyCountedQuantities; 0)
			ARRAY LONGINT:C221($_al_AlreadyCountedIDS; 0)
			
			If (Abs:C99(STK_l_ID)>0)
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=Abs:C99(STK_l_ID))
			Else 
				REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
			End if 
			$_l_SemID:=Abs:C99(STK_l_ID)
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stock Movement Id is "+String:C10($_l_SemID)+" "+String:C10(Current time:C178)
			End if 
			CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$ALL")
			
			$_r_Sum:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold(Abs:C99(STK_l_ID)))
			
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Clear semaphore HoldsInUse"+" "+String:C10(Current time:C178)
			End if 
			$_bo_Continue:=False:C215
			$_bo_GiveUp:=False:C215
			If (STK_l_ID<0)
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Negative ID was passed-direct update in process"+" "+String:C10(Current time:C178)
					
				End if 
				READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
				$_l_AddToCurrentStockID:=0
				$_l_TakeFromCSID:=0
				If (Abs:C99(STK_l_ID)>0)
					QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=Abs:C99(STK_l_ID))
					$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
					$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
					
					$_l_Retries:=0
					//DB_bo_Locked:=True
					$_bo_WindowOpen:=False:C215
					$_l_Retries:=0
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0))) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_Retries<10)
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>2)
							DB_bo_LockedMessage:=True:C214
						End if 
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for record unlock stock movement item"+" "+String:C10(Current time:C178)
							
						End if 
						DelayTicks(60*$_l_Retries)
						If ($_l_Retries>10)
							$_bo_GiveUp:=True:C214
							$_l_Retries:=1000
							$_bo_Continue:=False:C215
						End if 
					End while 
					
					
					If ($_l_Retries<10)
						$_bo_Continue:=True:C214
					End if 
					DB_bo_Locked:=False:C215
				Else 
					$_bo_Continue:=True:C214
					REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
				End if 
				If ($_bo_Continue)
					If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#$_r_Sum) | ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-$_r_Sum))
						If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#$_r_Sum)
							//TRACE
						End if 
						[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=$_r_Sum
						//TRACE
						[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Save Stock movement item with updated called off quantity"+" "+String:C10(Current time:C178)
						End if 
						DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
					End if 
					
					UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
					READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
				Else 
					//Recall the system to do this one again.
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Timed out so recalling in a process"+" "+String:C10(Current time:C178)
					End if 
					If (STK_l_ID#0)
					End if 
					
				End if 
			Else 
				$_bo_Continue:=True:C214
				STK_R_CALLEDOFF:=$_r_Sum
			End if 
		Else 
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stock Movement Id is Zero"+" "+String:C10(Current time:C178)
			End if 
			STK_R_CALLEDOFF:=0
		End if 
	End if 
	If (STK_l_CallBack>0)
		If ($_bo_AllocCLog)
			<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Sending result to process"+String:C10(STK_l_CallBack)+" "+String:C10(Current time:C178)
		End if 
		SET PROCESS VARIABLE:C370(STK_l_CallBack; STK_R_CALLEDOFF; STK_R_CALLEDOFF)
		SET PROCESS VARIABLE:C370(STK_l_Callback; STK_bo_CalledoffVALIDATED; True:C214)
		RESUME PROCESS:C320(STK_l_Callback)
	Else 
		Repeat 
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Checking number of running processes"+" "+String:C10(Current time:C178)
			End if 
			$_l_RunningProcessCheck:=0
			$_l_CountTasks:=Count tasks:C335
			For ($_l_proc; 1; $_l_CountTasks)
				PROCESS PROPERTIES:C336($_l_proc; $_t_ProcessName; $_l_procstate; $_l_proctime; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
				If (Position:C15("ValidateCurrentStock"; $_t_ProcessName)>0)
					If ($_l_procstate>=0)
						$_l_RunningProcessCheck:=$_l_RunningProcessCheck+1
					End if 
				End if 
			End for 
		Until ($_l_RunningProcessCheck<10)
		
		//UNLOAD RECORD([STOCK_LEVELS])
		//UNLOAD RECORD([CURRENT STOCK])
		//UNLOAD RECORD([STOCK ITEMS])
		If ($_l_AddToCurrentStockID>0)
			//$_l_Process:=New process("STK_UpdateCurrentStock2011";128000;"Validate Curre ($_l_AddToCurrentStockID)
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Calling Stock update in a process add to ID"+" "+String:C10(Current time:C178)
			End if 
			STK_bo_SetSuccess:=False:C215
			
			$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 256000; "ValidateCurrentStock"+String:C10($_l_AddToCurrentStockID)+"_"; -$_l_AddToCurrentStockID; *)
			
			
		End if 
		If ($_l_TakeFromCSID>0)
			//STK_UpdateCurrentStock2011 ($_l_TakeFromCSID)
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Calling Stock update in a process take from ID"+" "+String:C10(Current time:C178)
				
			End if 
			
			$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 256000; "ValidateCurrentStock"+String:C10($_l_TakeFromCSID)+"_"; -$_l_TakeFromCSID; *)
			
		End if 
	End if 
	<>STK_bo_inUpdateCalledOffQuantit:=$_bo_inUpdateCalledOffQuantities
Else 
	//Note that the semaphore $lockoffStockCount is only in the section below
	
	If (Count parameters:C259=0)
		If (Not:C34(Test semaphore:C652("$LockOffStockCount")))  //if this semaphore is set we are most likely making a recursive call
			
			
			$_l_Retries:=0
			MESSAGES OFF:C175
			If (Record number:C243([STOCK_MOVEMENT_ITEMS:27])>=0)
				$_l_StockMovementItemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
				SET QUERY DESTINATION:C396(Into variable:K19:4; STK_l_anycalledOff)
				
				QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=$_l_StockMovementItemID)
				SET QUERY DESTINATION:C396(Into current selection:K19:1)
				
				//if(STK_l_anycalledOff>0)
				$_bo_WindowOpen:=False:C215
				$_bo_GiveUp:=False:C215
				If (STK_l_anycalledOff>0)
					While (Not:C34(Check_Locked(->[STOCK_MOVEMENT_ITEMS:27]; 0; False:C215))) & ($_bo_GiveUp=False:C215)
						If ($_bo_AllocCLog)
							<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for Stock movement item record unlock"+"  "+String:C10(Current time:C178)
						End if 
						$_l_Retries:=$_l_Retries+1
						If ($_l_Retries>10)
							DB_bo_LockedMessage:=True:C214
						End if 
						If ($_l_Retries>20)
							$_bo_GiveUp:=True:C214
						End if 
						DelayTicks(9*$_l_Retries)
					End while 
					
					If (Not:C34($_bo_GiveUp))
						While (Semaphore:C143("$LockOffStockCount"+String:C10($_l_StockMovementItemID); 60))
							If ($_bo_AllocCLog)
								<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for semaphhore $LockOffStockCount"+String:C10($_l_StockMovementItemID)+"  "+String:C10(Current time:C178)
							End if 
							$_l_Retries:=$_l_Retries+1
							DelayTicks(9*$_l_Retries)
							If ($_l_Retries>10)
								//dont do if in trigger
								If (Not:C34($_bo_inTrigger))
									UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
									DelayTicks(9*$_l_Retries)
									LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
								Else 
									$_bo_GiveUp:=True:C214
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Gving up waiting for semaphore"+"  "+String:C10(Current time:C178)
									End if 
								End if 
								
							End if 
						End while 
						If (Not:C34($_bo_GiveUp))
							$_l_Retries:=0
							$_l_SemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							
							If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"") & (([STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="") | ([STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32=""))
								
								$_l_Retries:=0
								While (Semaphore:C143("LockOffStockCount"+String:C10($_l_SemID)))
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for semaphhore LockOffStockCount"+String:C10($_l_SemID)+"  "+String:C10(Current time:C178)
									End if 
									$_l_Retries:=$_l_Retries+1
									DelayTicks(9*$_l_Retries)
									
								End while 
								
								$_bo_Edits:=STK_SetHeaderInfo
								If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<0)
									If ([MOVEMENT_TYPES:60]Type_Code:1#[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
										QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
									End if 
									[STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31:=[MOVEMENT_TYPES:60]Stock_Minus:4
									[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Stock_Type:32:=[MOVEMENT_TYPES:60]Stock_Plus:3
									[STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39:=True:C214
									[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
									[STOCK_MOVEMENT_ITEMS:27]Quantity:12:=Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13:=Gen_Round(([STOCK_MOVEMENT_ITEMS:27]Cost_Price:10*Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)); 2; 2)
									
								End if 
								CLEAR SEMAPHORE:C144("LockOffStockCount"+String:C10($_l_SemID))
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Cleared semaphhore LockOffStockCount"+String:C10($_l_SemID)+"  "+String:C10(Current time:C178)
								End if 
							End if 
							STK_bo_CalledoffVALIDATED:=False:C215
							STK_R_CALLEDOFF:=0
							STK_l_ID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
							STK_l_Called:=0
							STK_l_Callback:=Current process:C322
							
							$_l_ApplicationType:=Application type:C494
							
							If ([STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0)
								$_l_Retries:=0
								$_l_SemID:=[STOCK_MOVEMENT_ITEMS:27]x_ID:16
								$_l_Retries:=0
								$_l_Tries:=0
								
								
								If (Not:C34(In transaction:C397))
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Not in transaction"+"  "+String:C10(Current time:C178)
									End if 
									
									
									
									Repeat 
										$_l_Tries:=$_l_Tries+1
										$_l_Retries:=0
										$_bo_WindowOpen:=False:C215
										While (Semaphore:C143("LockOffStockCount"+String:C10($_l_SemID)))
											If ($_bo_AllocCLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for semaphhore LockOffStockCount"+String:C10($_l_SemID)+"  "+String:C10(Current time:C178)
											End if 
											$_l_Retries:=$_l_Retries+1
											DelayTicks(9*$_l_Retries)
										End while 
										
										STK_bo_CalledoffVALIDATED:=False:C215
										STK_l_Callback:=Current process:C322
										STK_l_Called:=0
										$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
										$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
										//
										CLEAR SEMAPHORE:C144("$LockOffStockCount"+String:C10($_l_StockMovementItemID))
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Cleared  semaphhore $LockOffStockCount"+String:C10($_l_StockMovementItemID)+"  "+String:C10(Current time:C178)
										End if 
										CLEAR SEMAPHORE:C144("LockOffStockCount"+String:C10($_l_SemID))
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Cleared  semaphhore LockOffStockCount"+String:C10($_l_SemID)+"  "+String:C10(Current time:C178)
										End if 
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Recalling STK_updateCalledOffQuantity in a process"+"  "+String:C10(Current time:C178)
										End if 
										$_l_GetCalledOff:=New process:C317("STK_UpdateCalledOffQuantity"; 128000; "ValidateCalledoff"; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
										DelayTicks(6)
										$_l_Retries:=0
										$_bo_WindowOpen:=False:C215
										While (Not:C34(STK_bo_CalledoffVALIDATED)) & ($_l_Retries<100)
											If ($_bo_AllocCLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"waiting for STK_bo_CalledoffVALIDATED flag"+"  "+String:C10(Current time:C178)
											End if 
											$_l_Retries:=$_l_Retries+1
											DelayTicks(6*$_l_Retries)
										End while 
										While (Semaphore:C143("$LockOffStockCount"+String:C10($_l_StockMovementItemID); 60))
											If ($_bo_AllocCLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"waiting for  semaphore $LockOffStockCount"+String:C10($_l_StockMovementItemID)+"  "+String:C10(Current time:C178)
											End if 
											$_l_Retries:=$_l_Retries+1
											DelayTicks(9*$_l_Retries)
											If ($_l_Retries>10)
												//dont do if in trigger
												If (Not:C34($_bo_inTrigger))
													UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
													DelayTicks(9*$_l_Retries)
													LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
												Else 
													$_bo_GiveUp:=True:C214
													If ($_bo_AllocCLog)
														<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"giving up waiting for semaphore"+" "+String:C10(Current time:C178)
														
													End if 
												End if 
												
											End if 
										End while 
										
										
										CLEAR SEMAPHORE:C144("LockOffStockCount"+String:C10($_l_SemID))
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"cleared semaphore LockOffStockCount"+String:C10($_l_SemID)+" "+String:C10(Current time:C178)
										End if 
									Until (STK_bo_CalledoffVALIDATED) | ($_l_Tries>20)
								Else 
									//NO NO NO this is nasty moved the current record pointer
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Saving stock movement item"+" "+String:C10(Current time:C178)
									End if 
									DB_SaveRecord(->[STOCK_MOVEMENT_ITEMS:27]; False:C215)
									
									
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=STK_l_ID)
									STK_R_CALLEDOFF:=((Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12))+STK_CountonHold(Abs:C99(STK_l_ID)))
									
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Cleared semaphore HoldsInUse"+" "+String:C10(Current time:C178)
									End if 
									QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=STK_l_ID)
									$_l_AddToCurrentStockID:=[STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22
									$_l_TakeFromCSID:=[STOCK_MOVEMENT_ITEMS:27]x_Take_From_Current_Stock_ID:23
									
									STK_bo_CalledoffVALIDATED:=True:C214
								End if 
								If (STK_bo_CalledoffVALIDATED)
									If (Count parameters:C259=0)
										$_bo_SetValue:=True:C214
									Else 
										$_bo_SetValue:=($1>0)
									End if 
									If ($_bo_SetValue)
										
										UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
										LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
										If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#STK_R_CALLEDOFF)
											//TRACE
										End if 
										[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=STK_R_CALLEDOFF
										//TRACE
										[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
										If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
											If (Not:C34($_bo_inTrigger))
												
												STK_l_Continue:=0
												CLEAR SEMAPHORE:C144("$LockOffStockCount"+String:C10($_l_StockMovementItemID))
												If ($_bo_AllocCLog)
													<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Cleared semaphore $LockOffStockCount"+String:C10($_l_StockMovementItemID)+" "+String:C10(Current time:C178)
												End if   //CLEAR SEMAPHORE("LockOffStockCount"+String($_l_SemID))
												If (In transaction:C397)  // if we are in saving a stock item and it has just assigned this ID as the copied from
													//and we are in a transaction then the reset will not include the item we are saving.
													//so here we need to set a flag(set to false at the top of the method)
													//that method can then use the flag to cause the copied from to be reset
													
													STK_bo_OverAllocated:=True:C214
												End if 
												If ($_bo_AllocCLog)
													<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Calling Reset Called from because of on over allocation"+" "+String:C10(Current time:C178)
												End if 
												$_l_Process:=New process:C317("STK_ItemsResetCalledFrom"; 256000; "Change called from"; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16; Current process:C322)
												UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
												
												//if we are doing this wait till its done
												Repeat 
													If (Process state:C330($_l_Process)>=0) & ((Process_Name($_l_Process))="Change called from")
														
														If ($_bo_AllocCLog)
															<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for reset to end"+" "+String:C10(Current time:C178)
														End if 
														DelayTicks(3*60)
													End if 
												Until (Process state:C330($_l_Process)<0) | (STK_bo_Continue)
												LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
												SAVE RECORD:C53([STOCK_MOVEMENT_ITEMS:27])
												
												
												While (Semaphore:C143("$LockOffStockCount"+String:C10($_l_StockMovementItemID); 60))
													If ($_bo_AllocCLog)
														<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"waiting for semaphore $LockOffStockCount"+String:C10($_l_StockMovementItemID)+" "+String:C10(Current time:C178)
													End if 
													$_l_Retries:=$_l_Retries+1
													DelayTicks(9*$_l_Retries)
												End while 
											End if 
										End if 
									End if 
									UNLOAD RECORD:C212([STOCK_LEVELS:58])
									UNLOAD RECORD:C212([CURRENT_STOCK:62])
									Repeat 
										$_l_RunningProcessCheck:=0
										$_l_CountTasks:=Count tasks:C335
										For ($_l_proc; 1; $_l_CountTasks)
											If ($_bo_AllocCLog)
												<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Checking number of running processes"+" "+String:C10(Current time:C178)
											End if 
											PROCESS PROPERTIES:C336($_l_proc; $_t_ProcessName; $_l_procstate; $_l_proctime; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
											If (Position:C15("ValidateCurrentStock"; $_t_ProcessName)>0)
												If ($_l_procstate>=0)
													$_l_RunningProcessCheck:=$_l_RunningProcessCheck+1
												End if 
											End if 
										End for 
									Until ($_l_RunningProcessCheck<10)
									
									If ($_l_AddToCurrentStockID>0)
										//$_l_Process:=New process("STK_UpdateCurrentStock2011";128000;"Validate Curre ($_l_AddToCurrentStockID)
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Update Add to current stock ID"+String:C10($_l_AddToCurrentStockID)+" "+String:C10(Current time:C178)
										End if 
										
										$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 256000; "ValidateCurrentStock"+String:C10($_l_AddToCurrentStockID)+"_"; -$_l_AddToCurrentStockID; *)
										
									End if 
									If ($_l_TakeFromCSID>0)
										//STK_UpdateCurrentStock2011 ($_l_TakeFromCSID)
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Update Take from current stock ID"+String:C10($_l_TakeFromCSID)+" "+String:C10(Current time:C178)
										End if 
										
										$_l_GetCurrentStockProcess:=New process:C317("STK_UpdateCurrentStock2011"; 256000; "ValidateCurrentStock"+String:C10($_l_TakeFromCSID)+"_"; -$_l_TakeFromCSID; *)
										
									End if 
								End if 
								//CLEAR SEMAPHORE("LockOffStockCount")
							Else 
								If ($_bo_AllocCLog)
									<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stock movment item has no add to current stock id"+"  "+String:C10(Current time:C178)
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18#STK_R_CALLEDOFF)
									//TRACE
								End if 
								[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=STK_R_CALLEDOFF
								//TRACE
								[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=((Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12))-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
								If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37<0)
									If ($_bo_AllocCLog)
										<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stock movment item has too many called off"+"  "+String:C10(Current time:C178)
									End if 
									If (Not:C34($_bo_inTrigger))
										If ($_bo_AllocCLog)
											<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"We are not in a trigger so calling STK_ItemsResetCalledFrom"+"  "+String:C10(Current time:C178)
										End if 
										$_l_Process:=New process:C317("STK_ItemsResetCalledFrom"; 256000; "Change called from"; [STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]x_ID:16)
										UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
										
									End if 
								End if 
								If ([STOCK_MOVEMENT_ITEMS:27]x_Inverted_Movement_Type:39)
									If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40#-([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=-([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									End if 
								Else 
									If ([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40#([STOCK_MOVEMENT_ITEMS:27]Quantity:12))
										[STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40:=([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
									End if 
								End if 
								
							End if 
							CLEAR SEMAPHORE:C144("$LockOffStockCount"+String:C10($_l_StockMovementItemID))
						End if 
					Else 
						//[STOCK_MOVEMENT_ITEMS]Called_Off_Quantity:=0
						//TRACE
						//[STOCK_MOVEMENT_ITEMS]X_Residual_Stock_Quantity:=(([STOCK_MOVEMENT_ITEMS]Quantity)-[STOCK_MOVEMENT_ITEMS]Called_Off_Quantity)
					End if 
				Else 
					
					//TRACE
					If ([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37#(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18))
						//TRACE
					End if 
					[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18:=0
					[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37:=(([STOCK_MOVEMENT_ITEMS:27]Quantity:12)-[STOCK_MOVEMENT_ITEMS:27]Called_Off_Quantity:18)
				End if 
			End if 
		Else 
			
		End if 
		CLEAR SEMAPHORE:C144("$LockOffStockCount"+String:C10($_l_StockMovementItemID))
		
		MESSAGES ON:C181
		
	Else 
		$_l_Retries:=0
		$_l_SemID:=Abs:C99($1)
		//If (Test semaphore("$LockOffStockCount+$_l_SemID")))
		While (Semaphore:C143("$LockOffStockCount"+String:C10($_l_SemID); 60))
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for semaphore $LockOffStockCount"+String:C10($_l_SemID)+" "+String:C10(Current time:C178)
			End if 
			$_l_Retries:=$_l_Retries+1
			DelayTicks(9*$_l_Retries)
			If ($_l_Retries>10)
				UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
				DelayTicks(9*$_l_Retries)
				LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
			End if 
		End while 
		
		
		$_l_SemID:=Abs:C99($1)
		STK_bo_CalledoffVALIDATED:=False:C215
		STK_R_CALLEDOFF:=0
		If ($1>0)
			STK_l_ID:=-$1
		Else 
			STK_l_ID:=$1
		End if 
		STK_l_Called:=0
		STK_l_Callback:=Current process:C322
		$_bo_Reload:=False:C215
		$_r_QuantityWas:=[STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37
		If ([STOCK_MOVEMENT_ITEMS:27]x_ID:16=Abs:C99($1))
			$_bo_Reload:=True:C214
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
		End if 
		$_l_Tries:=0
		Repeat 
			$_l_Tries:=$_l_Tries+1
			$_l_Retries:=0
			$_bo_WindowOpen:=False:C215
			While (Semaphore:C143("LockOffStockCount"+String:C10($_l_SemID)))
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for semaphore LockOffStockCount"+String:C10($_l_SemID)+" "+String:C10(Current time:C178)
				End if 
				$_l_Retries:=$_l_Retries+1
				DelayTicks(9*$_l_Retries)
			End while 
			STK_l_Callback:=Current process:C322
			STK_l_Called:=0
			
			CLEAR SEMAPHORE:C144("$LockOffStockCount"+String:C10($_l_SemID))
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"semaphore $LockOffStockCount"+String:C10($_l_SemID)+" Cleared "+String:C10(Current time:C178)
			End if 
			$_l_GetCalledOff:=New process:C317("STK_UpdateCalledOffQuantity"; 128000; "ValidateCalledoff"; $1; STK_l_CallBack)
			If ($1<0)
				Repeat 
					If ($_bo_AllocCLog)
						<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Waiting for STK_bo_CalledoffVALIDATED flag "+" "+String:C10(Current time:C178)
					End if 
					DelayTicks(2)
				Until (STK_bo_CalledoffVALIDATED)
				
				
			End if 
			
			
			STK_bo_CalledoffVALIDATED:=True:C214
			
			CLEAR SEMAPHORE:C144("LockOffStockCount"+String:C10($_l_SemID))
			If ($_bo_AllocCLog)
				<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"semaphore LockOffStockCount"+String:C10($_l_SemID)+" Cleared "+String:C10(Current time:C178)
			End if 
		Until (STK_bo_CalledoffVALIDATED) | ($_l_Tries>20)
		
		If ($_bo_Reload)
			If (Not:C34(Trigger level:C398>0))
				LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
			End if 
		End if 
		CLEAR SEMAPHORE:C144("$LockOffStockCount"+String:C10($_l_SemID))
		
	End if 
End if 
ERR_MethodTrackerReturn("STK_UpdateCalledOffQuantity"; $_t_oldMethodName)
