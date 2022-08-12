//%attributes = {}
If (False:C215)
	//Project Method Name:      on_EXitMethodOLD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/01/2010 10:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(<>FS_al_FormSortTableNum;0)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>FS_at_FormSortTextLabelName;0)
	//ARRAY TEXT(<>FS_at_FormSortvariable;0)
	//ARRAY TEXT(<>FS_at_FormSortVarLabelName;0)
	C_BOOLEAN:C305(<>ProcessServicesActive; <>SM_isHidden; <>SM_OUTPUTDELAY; <>SYS_bo_DataChangeLog; $_bo_Exit)
	C_LONGINT:C283(<>newSetsProcess; <>ProcessServicesActiveCOUNT; $_l_Index; $_l_Process; $_l_ProcessState; $_l_ProcessTime; $_l_Repeats)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_processName)
	C_TIME:C306($_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("on_EXitMethodOLD")
// This has been moved to ON EXIT database method
// 25/04/02 pb
// Can be deleted after testing





PROCESS PROPERTIES:C336(<>NewSetsProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
If ($_t_processName#"Set Manager")
	<>newSetsProcess:=0
Else 
	If ($_l_ProcessState<0)
		<>newSetsProcess:=0
	End if 
End if 
If (<>newSetsProcess>0)
	<>SM_OUTPUTDELAY:=True:C214
	SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; 9999)
	POST OUTSIDE CALL:C329(<>newSetsProcess)
	$_l_Repeats:=0
	Repeat 
		POST OUTSIDE CALL:C329(<>newSetsProcess)
		$_l_Repeats:=$_l_Repeats+1
		If ($_l_Repeats>100)
			<>SM_isHidden:=False:C215
			If (<>NewSetsProcess>0)
				SHOW PROCESS:C325(<>NewSetsProcess)
				BRING TO FRONT:C326(<>NewSetsProcess)
			End if 
		End if 
		
		IDLE:C311
	Until (<>SM_OUTPUTDELAY=False:C215) | (<>newSetsProcess=0)
End if 
If (Not:C34(Undefined:C82(<>SYS_al_ModifiedTable)))
	
	If (Application type:C494<4)
		FSetting_savePreferences(<>PER_t_CurrentUserInitials; -><>FS_at_FormReference; -><>FS_al_FormSortDirection; -><>FS_al_FormSortFieldNum; -><>FS_al_FormSortTableNum; -><>FS_at_FormSortvariable; -><>FS_at_FormSortTextLabelName; -><>FS_at_FormSortVarLabelName)
		//ALERT("Here A")
		
		// ALERT("Here B")
		
		$_l_Process:=New process:C317("PW_CHECKUSERS"; 128000; "Saving Passwords")
		Repeat 
			DelayTicks(30)
		Until (Process state:C330($_l_Process)<0)
		// ALERT("Here")
		If (<>SYS_bo_DataChangeLog)
			//ALERT("Here 2")
			Repeat 
				//ALERT("Here 3")
				$_bo_Exit:=True:C214
				For ($_l_Index; 1; Size of array:C274(<>SYS_al_ModifiedTable))
					If (<>SYS_al_ModifiedTable{$_l_Index}>0)
						$_bo_Exit:=False:C215
						IDLE:C311
					End if 
				End for 
				//ALERT("Here 4")
				If ($_bo_Exit=False:C215)
					CONFIRM:C162("Shut Down is delayed whilst data-logs are written"; "Wait"; "Exit now")
					If (ok=0)
						$_bo_Exit:=True:C214
					Else 
						$_ti_Time:=Current time:C178
						Repeat 
							DelayTicks(60)
						Until (Current time:C178>=$_ti_Time+60)
						
					End if 
					
					
				End if 
			Until ($_bo_Exit=True:C214)
		End if 
	Else 
		$_l_Process:=New process:C317("FSetting_savePreferences"; 256000; "Save Form setting"; <>PER_t_CurrentUserInitials; -><>FS_at_FormReference; -><>FS_al_FormSortDirection; -><>FS_al_FormSortFieldNum; -><>FS_al_FormSortTableNum; -><>FS_at_FormSortvariable; -><>FS_at_FormSortTextLabelName; -><>FS_at_FormSortVarLabelName)
		Repeat 
			DelayTicks(10*60)
		Until (Process state:C330($_l_Process)<0)
		
		
	End if 
End if 
//ALERT("end exit")
If ((ApplicationType_isSingleUser))  // 16/4/02 pb
	While (<>ProcessServicesActive) | (<>ProcessServicesActiveCount>0)  // 16/4/02 pb
		DelayTicks(60)
	End while 
End if 

Quit
QUIT 4D:C291
ERR_MethodTrackerReturn("on_EXitMethodOLD"; $_t_oldMethodName)
