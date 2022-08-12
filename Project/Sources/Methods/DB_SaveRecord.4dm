//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_SaveRecord
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
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_CloseWindow; $_bo_Continue; $_bo_FirstPass; $_bo_HasRecordID; $_bo_newRecord; $_bo_OpenWindow; $_bo_WithManagement; $2; DB_bo_InWFCreate)
	C_LONGINT:C283($_l_ApplicationType; $_l_CurrentRecordID; $_l_Error; $_l_RepeatedCount; $_l_Retries; $_l_TableNumber; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef)
	C_POINTER:C301($_ptr_InputTableorVar; $1)
	C_TEXT:C284(<>SYS_t_LastSavedTableName; $_t_oldMethodName; $_t_OldSemaphoreName; $_t_OldSemaphoreName2; $Sem_t_SemaphoreName; $Sem_t_SemaphoreName2; Sem_t_SemaphoreName; Sem_t_SemaphoreName2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SaveRecord")

//$_t_oldMethodName:=ERR_MethodTracker ("DB_SaveRecord")
//DB_SaveRecord
//This method will replace DB_SaveRecord commands
$_t_OldSemaphoreName2:=Sem_t_SemaphoreName2
$_t_OldSemaphoreName:=Sem_t_SemaphoreName
If (Count parameters:C259>=2)
	$_bo_WithManagement:=$2
Else 
	$_bo_WithManagement:=True:C214
End if 


If (Count parameters:C259>=1)
	If (Not:C34(Is nil pointer:C315($1)))  //Modified to secure it
		
		$_bo_newRecord:=(Record number:C243($1->)=New record:K29:1)
		
		$_ptr_InputTableorVar:=$1
		//
		If (Is a variable:C294($1))
			$_bo_HasRecordID:=AA_CheckFileID($_ptr_InputTableorVar->)
			$_l_TableNumber:=$_ptr_InputTableorVar->
			
		Else 
			$_bo_HasRecordID:=AA_CheckFileID(Table:C252($_ptr_InputTableorVar))
			$_l_TableNumber:=Table:C252($_ptr_InputTableorVar)
		End if 
	Else 
		
		//Invalid pointer
		$_l_TableNumber:=0
		$_bo_HasRecordID:=False:C215
	End if 
	
Else 
	
	If (Not:C34(Is nil pointer:C315(Current default table:C363)))
		
		If ($_l_TableNumber>0)
			<>SYS_t_LastSavedTableName:=Table name:C256($_l_TableNumber)
		End if 
		
		$_l_TableNumber:=Table:C252(Current default table:C363)
		$_bo_HasRecordID:=AA_CheckFileID
	Else 
		$_l_TableNumber:=0
		$_bo_HasRecordID:=False:C215
	End if 
	
End if 
$_bo_Continue:=True:C214
AA_CheckUUID($_l_TableNumber)
If ($_l_TableNumber=Table:C252(->[TRANSACTION_BATCH_ITEMS:155]))
	//TRACE
End if 
If ($_bo_HasRecordID)
	
	$_bo_FirstPass:=True:C214
	AA_SetIDbyTableNum($_l_TableNumber; False:C215; ->$_l_CurrentRecordID)
	If ($_l_CurrentRecordID=0)  //| (<>SYS_bo_DuringInit)
		
		$_l_Retries:=0
		While (Semaphore:C143("Save Record"+String:C10($_l_TableNumber)))
			If (Not:C34($_bo_FirstPass))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
			End if 
			$_bo_FirstPass:=False:C215
		End while 
		Sem_t_SemaphoreName:="Save_"+String:C10($_l_TableNumber)
		$Sem_t_SemaphoreName:=Sem_t_SemaphoreName
		Sem_t_SemaphoreName2:=""
		$Sem_t_SemaphoreName2:=Sem_t_SemaphoreName2
		//Sem_t_SemaphoreName2:="Busy_"+String($_l_TableNumber)
		$_l_ApplicationType:=Application type:C494
		$_bo_OpenWindow:=True:C214
		$_bo_CloseWindow:=False:C215
		$_l_RepeatedCount:=0
		$_bo_FirstPass:=True:C214
		$_bo_Continue:=True:C214
		$_l_Retries:=0
		While (Semaphore:C143(Sem_t_SemaphoreName)) & (Not:C34(<>SYS_bo_QuitCalled)) & ($_l_RepeatedCount<100)
			$_l_RepeatedCount:=$_l_RepeatedCount+1
			If (Not:C34($_l_RepeatedCount=1))
				$_l_Retries:=$_l_Retries+1
				DelayTicks(2*(1+$_l_Retries))
				
				If ($_l_ApplicationType#4D Server:K5:6) & ($_l_RepeatedCount>50)
					//TRACE
					
					If ($_bo_OpenWindow)
						$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
						WIN_l_CurrentWinRef:=Open window:C153(30; 100; 900; 120; -1984)
						$_bo_OpenWindow:=False:C215
						$_bo_CloseWindow:=True:C214
					End if 
					ERASE WINDOW:C160
					MESSAGE:C88("Waiting for record unlocked Flag"+Sem_t_SemaphoreName)
				End if 
				If ($_l_RepeatedCount>=100)
					ALERT:C41("RECORD COULD NOT BE SAVED!")
					$_bo_Continue:=False:C215
				End if 
			End if 
		End while 
		If ($_bo_CloseWindow)
			CLOSE WINDOW:C154
		End if 
		If ($_bo_Continue)
			$_bo_FirstPass:=True:C214
			AA_SetIDbyTableNum($_l_TableNumber)
			AA_GetIDFieldNum
		End if 
	End if 
	CLEAR SEMAPHORE:C144("Save Record"+String:C10($_l_TableNumber))
End if 
If (Count parameters:C259>=1)
	If (Not:C34(Is a variable:C294($_ptr_InputTableorVar)))
		error:=0
		If ($_bo_WithManagement)  // & (False)
			
			
			//DB_TestRecordCodeisUnique (Table($_ptr_InputTableorVar))
			DB_PseudoTrigger(Record number:C243($_ptr_InputTableorVar->); $_l_TableNumber)
		End if 
		
		SAVE RECORD:C53($_ptr_InputTableorVar->)
		$_l_Error:=error
		Case of 
			: ($_l_Error=-10500)
				Gen_Alert("Your database is damaged. You must fix your datafile with 4D tools to continue")
				QUIT 4D:C291
				
		End case 
		
		If ($_bo_HasRecordID)
			
			
			//AA_CheckFileUnlockedByTableNUM (Table($_ptr_InputTableorVar))
			
			
		End if 
		
	End if 
Else 
	
	If ($_l_TableNumber>0)
		<>SYS_t_LastSavedTableName:=Table name:C256($_l_TableNumber)
	Else 
		
	End if 
	error:=0
	SAVE RECORD:C53
	$_l_Error:=error
	Case of 
		: ($_l_Error=-10500)
			Gen_Alert("Your database is damaged. You must fix your datafile with 4D tools to continue")
			QUIT 4D:C291
	End case 
	If ($_l_TableNumber>0)
		If ($_bo_HasRecordID)
			AA_CheckFileUnlockedByTableNUM($_l_TableNumber)
		End if 
	End if 
	
End if 

If (Table:C252($1)#(Table:C252(->[WORKFLOW_CONTROL:51]))) & (Table:C252($1)#(Table:C252(->[DIARY:12]))) & (Table:C252($1)#(Table:C252(->[IDENTIFIERS:16]))) & (Not:C34(DB_bo_InWFCreate))
	
	
	If ($_bo_newRecord)
		//SD2_OnSaveRecord (Table($1);1)
		
	Else 
		//TRACE
		//if orders can also be 3
		//SD2_OnSaveRecord (Table($1);2)
		
	End if 
End if 

If ($Sem_t_SemaphoreName2#"")
	CLEAR SEMAPHORE:C144($Sem_t_SemaphoreName2)
	
	
	
	
End if 
If ($Sem_t_SemaphoreName#"")
	CLEAR SEMAPHORE:C144($Sem_t_SemaphoreName)
	
	
	
	
End if 

Sem_t_SemaphoreName2:=$_t_OldSemaphoreName2
Sem_t_SemaphoreName:=$_t_OldSemaphoreName
//ERR_MethodTrackerReturn ("DB_SaveRecord";$_t_oldMethodName)