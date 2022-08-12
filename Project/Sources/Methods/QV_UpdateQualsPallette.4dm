//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_UpdateQualsPallette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 09:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_AutoShowQualities; $_bo_ProcessVisible; QV_bo_BlockPalette)
	C_LONGINT:C283(<>QV_QualitiesPalleteProcess; $_l_ProcessState; $_l_ProcessTime; $_l_Repeats; $1; $2; $3; $4; QV_l_CallActionID; QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_UpdateQualsPallette")
//C_LONGINT($_l_ProcessTime)
//C_TEXT($_t_processName)
//C_LONGINT($_l_ProcessState)


//$1=1  `opening a record
//$1=2 `closing a record
//first check if the pallette is running
//$3=record ID
//$2=current table
//$4=action(for closing)

If (<>QV_QualitiesPalleteProcess>0)
	
	PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
	If ($_l_ProcessState<0)
		<>QV_QualitiesPalleteProcess:=0
	Else 
		If ($_t_ProcessName#"Qualitative Values")
			<>QV_QualitiesPalleteProcess:=0
		End if 
	End if 
End if 
Case of 
	: ($1=1)
		If (<>QV_QualitiesPalleteProcess>0)
			If (<>SYS_bo_AutoShowQualities)
				While (Semaphore:C143("$QVlock"))
					//MESSAGE("Waiting for QV lock")
					DelayTicks(10)
				End while 
				$_l_Repeats:=0
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					IDLE:C311
					//MESSAGE("get Owner")
					DelayTicks(10)
					GET PROCESS VARIABLE:C371(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerID; QV_l_SelectedOwnerID)
					GET PROCESS VARIABLE:C371(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID)
					//MESSAGE(String(QV_l_SelectedOwnerID)+" "+String(QV_l_SelectedOwnerTableID))
				Until (QV_l_SelectedOwnerID=0) | ($_l_Repeats>100)
				//we now have control and can set the values
				PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
				If ($_l_ProcessState>=0)  // 30/05/02 pb
					$_ptr_Table:=Table:C252($2)
					//MESSAGE("Set Owner")
					SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerID; $3)
					SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerTableID; $2)
					SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_bo_AddAllowed; (Not:C34(Read only state:C362($_ptr_Table->))))
				End if 
				CLEAR SEMAPHORE:C144("$QVlock")
				POST OUTSIDE CALL:C329(<>QV_QualitiesPalleteProcess)
			Else 
				//not autoshow
				//is it showing though
				PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
				If ($_bo_ProcessVisible)
					While (Semaphore:C143("$QVlock"))
						DelayTicks(10)
					End while 
					Repeat 
						IDLE:C311
						GET PROCESS VARIABLE:C371(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerID; QV_l_SelectedOwnerID)
						GET PROCESS VARIABLE:C371(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerTableID; QV_l_SelectedOwnerTableID)
						DelayTicks(10)
					Until (QV_l_SelectedOwnerID=0) | ($_l_Repeats>100)
					//we now have control and can set the values
					PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
					If ($_l_ProcessState>=0)  // 30/05/02 pb
						$_ptr_Table:=Table:C252($2)
						SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerID; $3)
						SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerTableID; $2)
						SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_bo_AddAllowed; (Not:C34(Read only state:C362($_ptr_Table->))))
					End if 
					CLEAR SEMAPHORE:C144("$QVlock")
					POST OUTSIDE CALL:C329(<>QV_QualitiesPalleteProcess)
				End if 
				
			End if 
			
		Else 
			//Process_Not running
			If (<>SYS_bo_AutoShowQualities)
				$_ptr_Table:=Table:C252($2)
				<>QV_QualitiesPalleteProcess:=New process:C317("QV_QualitiesPalletteProcess"; 256000; "Qualitative Values"; $3; $2)
				DelayTicks(1*60)
				PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
				If ($_l_ProcessState>=0)  // 30/05/02 pb
					SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_bo_AddAllowed; (Not:C34(Read only state:C362($_ptr_Table->))))
				End if 
			Else 
				//not autoshow
				//do nothing
			End if 
		End if 
		
		
		
	: ($1=2)
		//$4 is the action
		If (<>QV_QualitiesPalleteProcess>0)
			While (Semaphore:C143("$QVlock"))
				DelayTicks(10)
			End while 
			$_l_Repeats:=0
			Repeat 
				$_l_Repeats:=$_l_Repeats+1
				GET PROCESS VARIABLE:C371(<>QV_QualitiesPalleteProcess; QV_l_CallActionID; QV_l_CallActionID)
			Until (QV_l_CallActionID=0) | ($_l_Repeats>100)
			//we now have control and can set the values
			PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
			If ($4=4)
				
			End if 
			
			If ($_l_ProcessState>=0)  // 30/05/02 pb
				SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_l_CallActionID; $4)
			End if 
			CLEAR SEMAPHORE:C144("$QVlock")
			POST OUTSIDE CALL:C329(<>QV_QualitiesPalleteProcess)
		End if 
		
		
		
		
End case 

//this method is called when we open or close a record

// on opening a record the following happens

//if the pallette exists and is to AUTOSHOW
//this will call the pallette to refresh and display

//if the pallette is already showing(eg next record)
//and autoshow is not set then keep showing and update

//on closing a record
//if save-send save command to pallette
//if cancel-send cancel command to pallette
ERR_MethodTrackerReturn("QV_UpdateQualsPallette"; $_t_oldMethodName)
