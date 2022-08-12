//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_HideQualities
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ProcessVisible)
	C_LONGINT:C283(<>QV_QualitiesPalleteProcess; $_l_ProcessState; $_l_ProcessTime; $repeats)
	C_TEXT:C284($_t_oldMethodName; $_t_processName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_HideQualities")
//this method will hide the qualities process
//this is called when we are displaying a listing screen

If (<>QV_QualitiesPalleteProcess>0)
	PROCESS PROPERTIES:C336(<>QV_QualitiesPalleteProcess; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible)
	
	If ($_l_ProcessState<0)
		<>QV_QualitiesPalleteProcess:=0
	Else 
		If ($_t_processName#"Qualitative Values")
			<>QV_QualitiesPalleteProcess:=0
		End if 
	End if 
End if 
//note this does not update the data displayed on the screen
//this simply hides it
QV_UpdateQualsPallette(2; 0; 0; 4)
ERR_MethodTrackerReturn("QV_HideQualities"; $_t_oldMethodName)