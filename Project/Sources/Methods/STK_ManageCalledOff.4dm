//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ManageCalledOff
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2012 16:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AwaitingProcess; 0)
	ARRAY LONGINT:C221($_al_AwaitUniqueID; 0)
	ARRAY LONGINT:C221($_al_SetRecord; 0)
	//ARRAY LONGINT(STK_al_AwaitingProcess;0)
	//ARRAY LONGINT(STK_al_AwaitUniqueID;0)
	//ARRAY LONGINT(STK_al_SetRecord;0)
	ARRAY TEXT:C222($_at_AwaitProcessName; 0)
	//ARRAY TEXT(STK_at_AwaitProcessName;0)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_CarryOn; $_bo_CarryOn2; $_bo_Continue; $_bo_Exit; $_bo_ProcessVisible)
	C_LONGINT:C283($_l_Index; $_l_NewProcessRef; $_l_NextProcessRow; $_l_ProcessID; $_l_ProcessState; $_l_ProcessTime; $_l_RecordID; $_l_RecordRow; $_l_UniqueProcessID; $_l_WaitForProcess; $1)
	C_LONGINT:C283($2; STK_l_addCallingProcess; STK_l_addID; STK_l_Resume)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ManageCalledOff")




If (Count parameters:C259>=2)
	//TRACE
	
	ARRAY LONGINT:C221(STK_al_AwaitingProcess; 0)
	ARRAY LONGINT:C221(STK_al_SetRecord; 0)
	ARRAY TEXT:C222(STK_at_AwaitProcessName; 0)
	ARRAY LONGINT:C221(STK_al_AwaitUniqueID; 0)
	APPEND TO ARRAY:C911(STK_al_AwaitingProcess; $1)
	APPEND TO ARRAY:C911(STK_al_SetRecord; $2)
	PROCESS PROPERTIES:C336($1; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
	APPEND TO ARRAY:C911(STK_at_AwaitProcessName; $_t_processName)
	APPEND TO ARRAY:C911(STK_al_AwaitUniqueID; $_l_UniqueProcessID)
	$_bo_Exit:=False:C215
	Repeat 
		If (Size of array:C274(STK_al_AwaitingProcess)>0)
			SORT ARRAY:C229(STK_al_SetRecord; STK_al_AwaitUniqueID; STK_al_AwaitingProcess; STK_at_AwaitProcessName)
			While (Semaphore:C143("STKbVCM"))
				DelayTicks(2)
			End while 
			ARRAY LONGINT:C221($_al_SetRecord; 0)
			ARRAY LONGINT:C221($_al_AwaitUniqueID; 0)
			ARRAY LONGINT:C221($_al_AwaitingProcess; 0)
			ARRAY TEXT:C222($_at_AwaitProcessName; 0)
			COPY ARRAY:C226(STK_al_SetRecord; $_al_SetRecord)
			COPY ARRAY:C226(STK_al_AwaitUniqueID; $_al_AwaitUniqueID)
			COPY ARRAY:C226(STK_al_AwaitingProcess; $_al_AwaitingProcess)
			COPY ARRAY:C226(STK_at_AwaitProcessName; $_at_AwaitProcessName)
			
			CLEAR SEMAPHORE:C144("STKbVCM")
			
			For ($_l_Index; Size of array:C274($_al_AwaitingProcess); 1; -1)
				
				Repeat 
					$_bo_CarryOn:=False:C215
					If ($_l_Index>1)
						If ($_al_SetRecord{$_l_Index}=$_al_SetRecord{$_l_Index-1})
							$_l_Index:=$_l_Index-1
						Else 
							$_bo_CarryOn:=True:C214
						End if 
					Else 
						$_bo_CarryOn:=True:C214
					End if 
				Until ($_bo_CarryOn)
				$_l_NextProcessRow:=$_l_Index
				$_bo_Continue:=True:C214
				
				$_bo_CarryOn2:=True:C214
				$_l_ProcessState:=Process state:C330($_al_AwaitingProcess{$_l_Index})
				$_l_ProcessID:=($_al_AwaitingProcess{$_l_Index})
				If ($_l_ProcessID>0) & ($_l_ProcessState>=0)
					Repeat 
						$_bo_CarryOn2:=True:C214
						
						$_l_ProcessState:=Process state:C330($_al_AwaitingProcess{$_l_NextProcessRow})
						$_l_ProcessID:=($_al_AwaitingProcess{$_l_NextProcessRow})
						$_l_WaitForProcess:=$_al_AwaitingProcess{$_l_NextProcessRow}
						PROCESS PROPERTIES:C336($_l_ProcessID; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
						If ($_t_processName="ValidateCurrentStock") | ("ValidateCalledoff"=$_t_processName) | ("Validate Stock"=$_t_processName) | ("Application Process"=$_t_processName) | ("SP for"+"@"=$_t_processName) | ("Service Process"=$_t_processName) | ($_t_processName="Setup Stock") | ($_t_processName="Verify Stock")
							$_l_WaitForProcess:=0
						End if 
						$_bo_Continue:=False:C215
						If ($_l_WaitForProcess>0)
							If ($_l_ProcessState>0)
								If ($_l_UniqueProcessID#$_al_AwaitUniqueID{$_l_Index}) | ($_t_processName#$_at_AwaitProcessName{$_l_Index})
									$_bo_Continue:=True:C214
								End if 
							Else 
								$_bo_Continue:=True:C214
							End if 
						Else 
							$_bo_Continue:=True:C214
						End if 
						If ($_l_NextProcessRow+1<Size of array:C274($_al_SetRecord))
							If ($_al_SetRecord{$_l_Index}=$_al_SetRecord{$_l_NextProcessRow+1})
								$_bo_CarryOn2:=False:C215
								$_l_NextProcessRow:=$_l_NextProcessRow+1
							End if 
						End if 
						
					Until ($_bo_Continue=False:C215) | ($_bo_CarryOn2=True:C214)
					If ($_bo_Continue)
						
						STK_UpdateCalledOffQuantity(-$_al_SetRecord{$_l_Index})
						While (Semaphore:C143("STKbVCM"))
							DelayTicks(2)
						End while 
						$_l_RecordRow:=Find in array:C230(STK_al_SetRecord; $_al_SetRecord{$_l_Index})
						If ($_l_RecordRow>0)
							DELETE FROM ARRAY:C228(STK_al_AwaitingProcess; $_l_Index)
							DELETE FROM ARRAY:C228(STK_al_SetRecord; $_l_Index)
							DELETE FROM ARRAY:C228(STK_at_AwaitProcessName; $_l_Index)
							DELETE FROM ARRAY:C228(STK_al_AwaitUniqueID; $_l_Index)
						End if 
						CLEAR SEMAPHORE:C144("STKbVCM")
					End if 
				Else 
					//TRACE
					If ($_al_SetRecord{$_l_Index}#0)
						STK_UpdateCalledOffQuantity(-$_al_SetRecord{$_l_Index})
					End if 
					While (Semaphore:C143("STKbVCM"))
						DelayTicks(2)
					End while 
					$_l_RecordRow:=Find in array:C230(STK_al_SetRecord; $_al_SetRecord{$_l_Index})
					If ($_l_RecordRow>0)
						DELETE FROM ARRAY:C228(STK_al_AwaitingProcess; $_l_RecordRow)
						DELETE FROM ARRAY:C228(STK_al_SetRecord; $_l_RecordRow)
						DELETE FROM ARRAY:C228(STK_at_AwaitProcessName; $_l_RecordRow)
						DELETE FROM ARRAY:C228(STK_al_AwaitUniqueID; $_l_RecordRow)
					End if 
					CLEAR SEMAPHORE:C144("STKbVCM")
				End if 
				If (STK_l_addCallingProcess>0)
					$_l_NewProcessRef:=STK_l_addCallingProcess
					$_l_RecordID:=STK_l_addID
					STK_l_addID:=0
					STK_l_addCallingProcess:=0
					If ($_l_NewProcessRef>0)
						//RESUME PROCESS($_l_NewProcessRef)
						//$_l_NewProcessRef:=0
					End if 
					$_l_RecordRow:=Find in array:C230(STK_al_SetRecord; $_l_RecordID)
					If ($_l_RecordRow<0)
						While (Semaphore:C143("STKbVCM"))
							DelayTicks(2)
						End while 
						APPEND TO ARRAY:C911(STK_al_AwaitingProcess; $_l_NewProcessRef)
						APPEND TO ARRAY:C911(STK_al_SetRecord; $_l_RecordID)
						PROCESS PROPERTIES:C336($_l_NewProcessRef; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
						APPEND TO ARRAY:C911(STK_at_AwaitProcessName; $_t_processName)
						APPEND TO ARRAY:C911(STK_al_AwaitUniqueID; $_l_UniqueProcessID)
						CLEAR SEMAPHORE:C144("STKbVCM")
					Else 
						PROCESS PROPERTIES:C336($_l_NewProcessRef; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
						If ($_l_UniqueProcessID#STK_al_AwaitUniqueID{$_l_RecordRow})
							While (Semaphore:C143("STKbVCM"))
								DelayTicks(2)
							End while 
							APPEND TO ARRAY:C911(STK_al_AwaitingProcess; $_l_NewProcessRef)
							APPEND TO ARRAY:C911(STK_al_SetRecord; $_l_RecordID)
							PROCESS PROPERTIES:C336($_l_NewProcessRef; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
							APPEND TO ARRAY:C911(STK_at_AwaitProcessName; $_t_processName)
							APPEND TO ARRAY:C911(STK_al_AwaitUniqueID; $_l_UniqueProcessID)
							CLEAR SEMAPHORE:C144("STKbVCM")
						End if 
					End if 
					$_l_Index:=0
				End if 
				DelayTicks(30)
			End for 
			
		End if 
		
		If (STK_l_addCallingProcess>0)
			$_l_NewProcessRef:=STK_l_addCallingProcess
			$_l_RecordID:=STK_l_addID
			STK_l_addID:=0
			If ($_l_NewProcessRef>0)
				//RESUME PROCESS($_l_NewProcessRef)
				$_l_NewProcessRef:=0
			End if 
			STK_l_addCallingProcess:=0
			$_l_RecordRow:=Find in array:C230(STK_al_SetRecord; $_l_RecordID)
			If ($_l_RecordRow<0)
				While (Semaphore:C143("STKbVCM"))
					DelayTicks(2)
				End while 
				APPEND TO ARRAY:C911(STK_al_AwaitingProcess; $_l_NewProcessRef)
				APPEND TO ARRAY:C911(STK_al_SetRecord; $_l_RecordID)
				PROCESS PROPERTIES:C336($_l_NewProcessRef; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
				APPEND TO ARRAY:C911(STK_at_AwaitProcessName; $_t_processName)
				APPEND TO ARRAY:C911(STK_al_AwaitUniqueID; $_l_UniqueProcessID)
				CLEAR SEMAPHORE:C144("STKbVCM")
			Else 
				PROCESS PROPERTIES:C336($_l_NewProcessRef; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
				If ($_l_UniqueProcessID#STK_al_AwaitUniqueID{$_l_RecordRow})
					While (Semaphore:C143("STKbVCM"))
						DelayTicks(2)
					End while 
					APPEND TO ARRAY:C911(STK_al_AwaitingProcess; $_l_NewProcessRef)
					APPEND TO ARRAY:C911(STK_al_SetRecord; $_l_RecordID)
					PROCESS PROPERTIES:C336($_l_NewProcessRef; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
					APPEND TO ARRAY:C911(STK_at_AwaitProcessName; $_t_processName)
					APPEND TO ARRAY:C911(STK_al_AwaitUniqueID; $_l_UniqueProcessID)
					CLEAR SEMAPHORE:C144("STKbVCM")
				End if 
				
			End if 
		End if 
		If (Size of array:C274(STK_al_AwaitingProcess)=0)
			DelayTicks(30*60)
		End if 
	Until (<>SYS_bo_QuitCalled)
	
End if 
ERR_MethodTrackerReturn("STK_ManageCalledOff"; $_t_oldMethodName)
