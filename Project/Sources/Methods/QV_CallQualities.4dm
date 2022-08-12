//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_CallQualities
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
	C_BOOLEAN:C305($_bo_ProcessVisible; QV_bo_BlockPalette)
	C_LONGINT:C283(<>QV_QualitiesPalleteProcess; $_l_ProcessState; $_l_ProcessTime; $_l_Repeats; $1; $2; QV_l_SelectedOwnerID)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_CallQualities")
//this method is called from any table
//C_LONGINT($_l_ProcessTime)
//C_TEXT($_t_processName)
//C_LONGINT($_l_ProcessState)

//this will check if the qualities process is running
//if it is not it will start it
//it is it will pass the values to it and call it to bring it into view/update it
CLEAR SEMAPHORE:C144("$QVlock")
If (Not:C34(QV_bo_BlockPalette))
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
	
	If (<>QV_QualitiesPalleteProcess>0)
		While (Semaphore:C143("$QVlock"))
			DelayTicks(10)
		End while 
		Repeat 
			GET PROCESS VARIABLE:C371(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerID; QV_l_SelectedOwnerID)
			GET PROCESS VARIABLE:C371(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerTableID; QV_l_SelectedOwnerTableID)
		Until (QV_l_SelectedOwnerID=0) | ($_l_Repeats>100)
		//we now have control and can set the values
		PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
		If ($_l_ProcessState>=0)  // 30/05/02 pb
			$_ptr_Table:=Table:C252($1)
			//MESSAGE("Setting QV_l_SelectedOwnerID from QV_CallQualities to "+String($2))
			
			SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerID; $2)
			SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_l_SelectedOwnerTableID; $1)
			SET PROCESS VARIABLE:C370(<>QV_QualitiesPalleteProcess; QV_bo_AddAllowed; (Not:C34(Read only state:C362($_ptr_Table->))))
		End if 
		
		CLEAR SEMAPHORE:C144("$QVlock")
		POST OUTSIDE CALL:C329(<>QV_QualitiesPalleteProcess)
		SHOW PROCESS:C325(<>QV_QualitiesPalleteProcess)
		BRING TO FRONT:C326(<>QV_QualitiesPalleteProcess)
		
	Else 
		//`process is not running
		$_ptr_Table:=Table:C252($1)
		<>QV_QualitiesPalleteProcess:=New process:C317("QV_QualitiesPalletteProcess"; 256000; "Qualitative Values"; $2; $1; (Not:C34(Read only state:C362($_ptr_Table->))))
		
		
		
	End if 
Else 
	QV_HideQualities
End if 
ERR_MethodTrackerReturn("QV_CallQualities"; $_t_oldMethodName)
