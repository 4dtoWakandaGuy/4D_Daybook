//%attributes = {}
If (False:C215)
	//Project Method Name:      PROC_SetProcess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/04/2010 10:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(<>PRC_abo_FirstWindow;0)
	//ARRAY LONGINT(<>PRC_al_ProcessCalledBy;0)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	//ARRAY LONGINT(<>PRC_al_UniqueID;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_BOOLEAN:C305(<>PROC_bo_WindowStateProcInited; <>ProcInited; $_bo_ProcessVisible; $_bo_ProcessVisible2; Proc_bo_IgnoreCalledBy)
	C_LONGINT:C283($_l_CheckProcessNumber; $_l_DeadProcessPosition; $_l_Index; $_l_OverrideState; $_l_ProcessCalledBy; $_l_ProcessNumber; $_l_ProcessNumberPosition; $_l_ProcessOrigin; $_l_ProcessOrigin2; $_l_ProcessState; $_l_ProcessState2)
	C_LONGINT:C283($_l_ProcessTime; $_l_ProcessTime2; $_l_ProcessToSet; $_l_ProcessWindowID; $_l_reset; $_l_ReUseRowNumber; $_l_UniqueID2; $_l_UniqueIDPostion; $_l_UniqueIDRepeatedPosition; $_l_UniqueProcessID)
	C_REAL:C285($1; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $_t_ProcessName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROC_SetProcess"; Form event code:C388)

If (Count parameters:C259>=1)
	$_l_ProcessToSet:=$1
	If (Count parameters:C259>=2)
		$_l_ProcessWindowID:=$2
	Else 
		$_l_ProcessWindowID:=0
	End if 
	If (Count parameters:C259>=3)
		$_l_ProcessCalledBy:=$3
	End if 
	If (Count parameters:C259>=4)  //this is so we can set a state (e.g if we are just about to end the process
		$_l_OverrideState:=$4
	Else 
		$_l_OverrideState:=0
	End if 
	If (Not:C34(Is compiled mode:C492))
		If (Current user:C182="Designer") | (Application type:C494=4D Server:K5:6)
			
			
			While (Semaphore:C143("◊testingWinproc"))
				DELAY PROCESS:C323(Current process:C322; 2)
			End while 
			If (Not:C34(<>PROC_bo_WindowStateProcInited))
				<>PROC_bo_WindowStateProcInited:=True:C214
				//<>PROC_l_ProcessStateWindow:=New process("PROC_WindowStates";256000;"Window References";*)
				
				
			End if 
			CLEAR SEMAPHORE:C144("◊testingWinproc")
			
		End if 
	Else 
		If (True:C214)
			If (Application type:C494=4D Server:K5:6)
				While (Semaphore:C143("◊testingWinproc"))
					DELAY PROCESS:C323(Current process:C322; 2)
				End while 
				If (Not:C34(<>PROC_bo_WindowStateProcInited))
					<>PROC_bo_WindowStateProcInited:=True:C214
					//<>PROC_l_ProcessStateWindow:=New process("PROC_WindowStates";256000;"Window References";*)
					
					
				End if 
				CLEAR SEMAPHORE:C144("◊testingWinproc")
				
				
			End if 
		End if 
	End if 
	If (Not:C34(<>ProcInited))
		While (Semaphore:C143("$InitingProcs"))
			DelayTicks(6)
		End while 
		If (Not:C34(<>ProcInited))
			ARRAY BOOLEAN:C223(<>PRC_abo_FirstWindow; 0)
			ARRAY LONGINT:C221(<>PRC_al_ProcessNum; 0)
			ARRAY TEXT:C222(<>PRC_at_ProcessName; 0)
			//ARRAY INTEGER(◊aProcMess;$1)
			ARRAY LONGINT:C221(<>PRC_al_ProcessCalledBy; 0)
			ARRAY LONGINT:C221(<>PRC_al_WindowReference; 0)
			ARRAY LONGINT:C221(<>PRC_al_UniqueID; 0)
			ARRAY LONGINT:C221(<>PRC_al_ProcessState; 0)
			<>ProcInited:=True:C214
		End if 
		CLEAR SEMAPHORE:C144("$InitingProcs")
		
	End if 
	
	
	If ($_l_ProcessToSet>0)
		PROCESS PROPERTIES:C336($_l_ProcessToSet; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID; $_l_ProcessOrigin)
		
		
		If ($_l_ProcessCalledBy>0)
			PROCESS PROPERTIES:C336($_l_ProcessCalledBy; $_t_ProcessName2; $_l_ProcessState2; $_l_ProcessTime2; $_bo_ProcessVisible2; $_l_UniqueID2; $_l_ProcessOrigin2)
			
			If ($_t_ProcessName2="User/Custom Menus process") | ($_t_ProcessName2#"Application Process")
				$_l_ProcessCalledBy:=0
			End if 
		Else 
			$_l_ProcessCalledBy:=0
		End if 
		
		
		While (Semaphore:C143("$ProcArr"))
			DelayTicks(2)
		End while 
		
		If ($_l_UniqueProcessID>0)
			$_l_UniqueIDPostion:=Find in array:C230(<>PRC_al_UniqueID; $_l_UniqueProcessID)
		Else 
			If ($_l_ProcessToSet>0)
				$_l_UniqueIDPostion:=Find in array:C230(<>PRC_al_ProcessNum; $_l_ProcessToSet)
				If ($_l_UniqueIDPostion>0)
					$_l_UniqueProcessID:=<>PRC_al_UniqueID{$_l_UniqueIDPostion}
				End if 
			End if 
		End if 
		If ($_l_UniqueIDPostion>0)
			$_l_CheckProcessNumber:=<>PRC_al_ProcessNum{$_l_UniqueIDPostion}
			//by default the first instance of the process is the first window-but we check to see if the process has a second window recorded that is the 'first' window.
			If (<>PRC_al_WindowReference{$_l_UniqueIDPostion}=0)
				For ($_l_Index; $_l_UniqueIDPostion+1; Size of array:C274(<>PRC_al_WindowReference))
					If (<>PRC_abo_FirstWindow{$_l_Index}) & (<>PRC_al_UniqueID{$_l_Index}=$_l_UniqueProcessID) & (<>PRC_al_ProcessNum{$_l_Index}=$_l_CheckProcessNumber)
						$_l_UniqueIDPostion:=$_l_Index
						$_l_Index:=Size of array:C274(<>PRC_al_WindowReference)
					End if 
				End for 
			End if 
			
			If (<>PRC_al_WindowReference{$_l_UniqueIDPostion}#0) & (<>PRC_al_WindowReference{$_l_UniqueIDPostion}#$_l_ProcessWindowID) & ($_l_ProcessWindowID#0)
				//it is a second window in the same process
				$_l_ReUseRowNumber:=0
				If ($_l_UniqueIDPostion<Size of array:C274(<>PRC_al_WindowReference))
					For ($_l_Index; $_l_UniqueIDPostion; Size of array:C274(<>PRC_al_WindowReference))
						$_l_UniqueIDRepeatedPosition:=Find in array:C230(<>PRC_al_UniqueID; $_l_UniqueProcessID; $_l_Index+1)
						If ($_l_UniqueIDRepeatedPosition>0)
							$_l_Index:=$_l_UniqueIDRepeatedPosition
						Else 
							$_l_Index:=Size of array:C274(<>PRC_al_UniqueID)
						End if 
						If (<>PRC_al_UniqueID{$_l_Index}=$_l_UniqueProcessID)  //same process
							If (<>PRC_al_WindowReference{$_l_Index}#0) & (<>PRC_al_WindowReference{$_l_Index}#$_l_ProcessWindowID) & ($_l_ProcessWindowID#0)
							Else 
								$_l_ReUseRowNumber:=$_l_Index
								$_l_Index:=Size of array:C274(<>PRC_al_WindowReference)
							End if 
						End if 
					End for 
				End if 
				If ($_l_ReUseRowNumber=0)
					$_l_DeadProcessPosition:=Find in array:C230(<>PRC_al_ProcessState; -100)
					If ($_l_DeadProcessPosition>0)
						<>PRC_abo_FirstWindow{$_l_DeadProcessPosition}:=False:C215
						<>PRC_al_ProcessNum{$_l_DeadProcessPosition}:=$_l_ProcessToSet
						<>PRC_at_ProcessName{$_l_DeadProcessPosition}:=$_t_ProcessName
						If ($_l_ProcessCalledBy>0)
							<>PRC_al_ProcessCalledBy{$_l_DeadProcessPosition}:=$_l_ProcessCalledBy
						Else 
							If (Not:C34(Proc_bo_IgnoreCalledBy))
								<>PRC_al_ProcessCalledBy{$_l_DeadProcessPosition}:=Current process:C322
							Else 
								<>PRC_al_ProcessCalledBy{$_l_DeadProcessPosition}:=0
							End if 
						End if 
						<>PRC_al_WindowReference{$_l_DeadProcessPosition}:=$_l_ProcessWindowID
						<>PRC_al_ProcessState{$_l_DeadProcessPosition}:=$_l_ProcessState
						<>PRC_al_UniqueID{$_l_DeadProcessPosition}:=$_l_UniqueProcessID
					Else 
						APPEND TO ARRAY:C911(<>PRC_abo_FirstWindow; False:C215)
						APPEND TO ARRAY:C911(<>PRC_al_ProcessNum; $_l_ProcessToSet)
						APPEND TO ARRAY:C911(<>PRC_at_ProcessName; $_t_ProcessName)
						If ($_l_ProcessCalledBy>0)
							APPEND TO ARRAY:C911(<>PRC_al_ProcessCalledBy; $_l_ProcessCalledBy)
						Else 
							If (Not:C34(Proc_bo_IgnoreCalledBy))
								APPEND TO ARRAY:C911(<>PRC_al_ProcessCalledBy; Current process:C322)
							Else 
								APPEND TO ARRAY:C911(<>PRC_al_ProcessCalledBy; 0)
								
							End if 
						End if 
						APPEND TO ARRAY:C911(<>PRC_al_WindowReference; $_l_ProcessWindowID)
						APPEND TO ARRAY:C911(<>PRC_al_ProcessState; $_l_ProcessState)
						APPEND TO ARRAY:C911(<>PRC_al_UniqueID; $_l_UniqueProcessID)
					End if 
				Else 
					<>PRC_abo_FirstWindow{$_l_ReUseRowNumber}:=False:C215
					If ($_l_ProcessWindowID#0)
						<>PRC_al_WindowReference{$_l_ReUseRowNumber}:=$_l_ProcessWindowID
					End if 
					If ($_l_OverrideState=0)
						<>PRC_al_ProcessState{$_l_ReUseRowNumber}:=$_l_ProcessState
					Else 
						<>PRC_al_ProcessState{$_l_ReUseRowNumber}:=$_l_OverrideState
					End if 
					If ($_l_ProcessCalledBy>0)
						<>PRC_al_ProcessCalledBy{$_l_ReUseRowNumber}:=$_l_ProcessCalledBy
					Else 
						If (Not:C34(Proc_bo_IgnoreCalledBy))
							<>PRC_al_ProcessCalledBy{$_l_ReUseRowNumber}:=Current process:C322
						Else 
							<>PRC_al_ProcessCalledBy{$_l_ReUseRowNumber}:=0
							
						End if 
					End if 
					<>PRC_al_UniqueID{$_l_ReUseRowNumber}:=$_l_UniqueProcessID
					
				End if 
			Else 
				
				If ($_l_ProcessWindowID#0)
					<>PRC_al_WindowReference{$_l_UniqueIDPostion}:=$_l_ProcessWindowID
				End if 
				If ($_l_OverrideState=0)
					<>PRC_al_ProcessState{$_l_UniqueIDPostion}:=$_l_ProcessState
					If (<>PRC_al_ProcessState{$_l_UniqueIDPostion}=Aborted:K13:1)
						<>PRC_al_WindowReference{$_l_UniqueIDPostion}:=0
					End if 
				Else 
					<>PRC_al_ProcessState{$_l_UniqueIDPostion}:=$_l_OverrideState
				End if 
				$_l_ProcessNumber:=<>PRC_al_ProcessNum{$_l_UniqueIDPostion}
				For ($_l_reset; 1; Size of array:C274(<>PRC_al_ProcessNum))
					If (<>PRC_al_ProcessNum{$_l_reset}=$_l_ProcessNumber) & ($_l_reset#$_l_UniqueIDPostion)
						
						If (<>PRC_al_UniqueID{$_l_reset}=$_l_UniqueProcessID)
							
							<>PRC_al_ProcessState{$_l_reset}:=<>PRC_al_ProcessState{$_l_UniqueIDPostion}
							
						End if 
					End if 
				End for 
				
				If ($_l_ProcessCalledBy>0)
					<>PRC_al_ProcessCalledBy{$_l_UniqueIDPostion}:=$_l_ProcessCalledBy
				Else 
					If (Not:C34(Proc_bo_IgnoreCalledBy))
						If (<>PRC_abo_FirstWindow{$_l_UniqueIDPostion}#True:C214)
							
							<>PRC_al_ProcessCalledBy{$_l_UniqueIDPostion}:=Current process:C322
						End if 
					Else 
						<>PRC_al_ProcessCalledBy{$_l_UniqueIDPostion}:=0
						//Here-and only here we set any other row in the array that has the same process number but not the same unique id to -100
						$_l_ProcessNumber:=<>PRC_al_ProcessNum{$_l_UniqueIDPostion}
						For ($_l_Reset; 1; Size of array:C274(<>PRC_al_ProcessNum))
							If (<>PRC_al_ProcessNum{$_l_Reset}=$_l_ProcessNumber) & ($_l_Reset#$_l_UniqueIDPostion)
								
								If (<>PRC_al_UniqueID{$_l_Reset}#$_l_UniqueProcessID) & (<>PRC_al_UniqueID{$_l_Reset}#0)
									
									<>PRC_al_ProcessState{$_l_Reset}:=-<>PRC_al_ProcessState{$_l_UniqueIDPostion}
									<>PRC_al_WindowReference{$_l_Reset}:=0
									<>PRC_al_ProcessCalledBy{$_l_Reset}:=0
									<>PRC_al_UniqueID{$_l_Reset}:=0
								End if 
							End if 
						End for 
					End if 
				End if 
				
			End if 
		Else 
			$_l_ProcessNumberPosition:=Find in array:C230(<>PRC_al_ProcessNum; $1)
			If ($_l_ProcessNumberPosition>0)
				//This process number existed-but it is a different unique id so behave as if it is a new row-overwrite the details as they must be wrong
				<>PRC_abo_FirstWindow{$_l_ProcessNumberPosition}:=True:C214
				<>PRC_al_ProcessNum{$_l_ProcessNumberPosition}:=$_l_ProcessToSet
				<>PRC_at_ProcessName{$_l_ProcessNumberPosition}:=$_t_ProcessName
				If ($_l_ProcessCalledBy>0)
					<>PRC_al_ProcessCalledBy{$_l_ProcessNumberPosition}:=$_l_ProcessCalledBy
				Else 
					If (Not:C34(Proc_bo_IgnoreCalledBy))
						<>PRC_al_ProcessCalledBy{$_l_ProcessNumberPosition}:=Current process:C322
					Else 
						<>PRC_al_ProcessCalledBy{$_l_ProcessNumberPosition}:=0
					End if 
				End if 
				
				<>PRC_al_WindowReference{$_l_ProcessNumberPosition}:=$_l_ProcessWindowID
				<>PRC_al_ProcessState{$_l_ProcessNumberPosition}:=$_l_ProcessState
				<>PRC_al_UniqueID{$_l_ProcessNumberPosition}:=$_l_UniqueProcessID
				
			Else 
				$_l_DeadProcessPosition:=Find in array:C230(<>PRC_al_ProcessState; -100)
				If ($_l_DeadProcessPosition>0)
					<>PRC_abo_FirstWindow{$_l_DeadProcessPosition}:=True:C214
					<>PRC_al_ProcessCalledBy{$_l_DeadProcessPosition}:=0
					<>PRC_al_ProcessNum{$_l_DeadProcessPosition}:=$_l_ProcessToSet
					<>PRC_at_ProcessName{$_l_DeadProcessPosition}:=$_t_ProcessName
					If ($_l_ProcessCalledBy>0)
						<>PRC_al_ProcessCalledBy{$_l_DeadProcessPosition}:=$_l_ProcessCalledBy
					Else 
						If (Not:C34(Proc_bo_IgnoreCalledBy))
							<>PRC_al_ProcessCalledBy{$_l_DeadProcessPosition}:=Current process:C322
						Else 
							<>PRC_al_ProcessCalledBy{$_l_DeadProcessPosition}:=0
						End if 
					End if 
					
					<>PRC_al_WindowReference{$_l_DeadProcessPosition}:=$_l_ProcessWindowID
					<>PRC_al_ProcessState{$_l_DeadProcessPosition}:=$_l_ProcessState
					<>PRC_al_UniqueID{$_l_DeadProcessPosition}:=$_l_UniqueProcessID
				Else 
					APPEND TO ARRAY:C911(<>PRC_abo_FirstWindow; True:C214)
					APPEND TO ARRAY:C911(<>PRC_al_ProcessNum; $_l_ProcessToSet)
					APPEND TO ARRAY:C911(<>PRC_at_ProcessName; $_t_ProcessName)
					If ($_l_ProcessCalledBy>0)
						APPEND TO ARRAY:C911(<>PRC_al_ProcessCalledBy; $_l_ProcessCalledBy)
					Else 
						If (Not:C34(Proc_bo_IgnoreCalledBy))
							APPEND TO ARRAY:C911(<>PRC_al_ProcessCalledBy; Current process:C322)
						Else 
							APPEND TO ARRAY:C911(<>PRC_al_ProcessCalledBy; 0)
						End if 
					End if 
					
					APPEND TO ARRAY:C911(<>PRC_al_WindowReference; $_l_ProcessWindowID)
					APPEND TO ARRAY:C911(<>PRC_al_ProcessState; $_l_ProcessState)
					APPEND TO ARRAY:C911(<>PRC_al_UniqueID; $_l_UniqueProcessID)
				End if 
			End if 
		End if 
		CLEAR SEMAPHORE:C144("$ProcArr")
	End if 
End if 
ERR_MethodTrackerReturn("PROC_SetProcess"; $_t_oldMethodName)