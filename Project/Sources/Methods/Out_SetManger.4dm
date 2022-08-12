//%attributes = {}
If (False:C215)
	//Project Method Name:      Out_SetManger
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
	C_BOOLEAN:C305(<>SM_isHidden)
	C_LONGINT:C283(<>newSetsProcess; $_l_MonitorCall; $_l_ProcessState; $_l_ProcessTime; $_l_TableNumber; $selection; SM_l_CallBack; SM_l_MonitorCall; SM_l_TableNumber; SM_Recordsinselection)
	C_POINTER:C301($_ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName; $TName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Out_SetManger")
//this method will send calls from an output form to
//update the set manager(if it is open)
If (Count parameters:C259=0)
	$_ptr_Table:=Current default table:C363
Else 
	$_ptr_Table:=$1
End if 
If (Not:C34(Is nil pointer:C315($_ptr_Table)))
	
	$_l_TableNumber:=Table:C252($_ptr_Table)
	If ($_l_TableNumber>0)
		$selection:=Records in selection:C76($_ptr_Table->)
		
		If (<>newSetsProcess>0)
			
			PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
			
			If ($_l_ProcessState>=0)  // 30/05/02 pb
				
				SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_TableNumber; $_l_TableNumber)
				SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_Recordsinselection; $selection)
				SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_CallBack; Current process:C322)
				POST OUTSIDE CALL:C329(<>newSetsProcess)
				If (Not:C34(<>SM_isHidden))
					SHOW PROCESS:C325(<>newSetsProcess)
					BRING TO FRONT:C326(<>newSetsProcess)
				End if 
				
			End if 
			
		End if 
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("Out_SetManger"; $_t_oldMethodName)
