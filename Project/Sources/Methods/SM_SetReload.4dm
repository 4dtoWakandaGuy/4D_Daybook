//%attributes = {}
If (False:C215)
	//Project Method Name:      SM_SetReload
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/01/2011 14:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_WindowReference;0)
	C_LONGINT:C283(<>newSetsProcess; $_l_Call; $_l_Index; $_l_ProcessState; $_l_ProcessTime; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SM_SetReload")

If (Count parameters:C259>=1)
	//MESSAGE("1")
	If (True:C214)
		$_l_Call:=$1
		If (<>newSetsProcess>0)
			//MESSAGE("2")
			PROCESS PROPERTIES:C336(<>newSetsProcess; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			If ($_l_ProcessState>=0)  // 29/05/02
				SET PROCESS VARIABLE:C370(<>newSetsProcess; SM_l_MonitorCall; $_l_Call)
			End if 
			//MESSAGE("3")
			Repeat 
				If (Application type:C494#4D Server:K5:6)
					POST OUTSIDE CALL:C329(<>newSetsProcess)
				End if 
				DelayTicks(2)
				GET PROCESS VARIABLE:C371(<>newSetsProcess; SM_l_MonitorCall; $_l_Call)
			Until ($_l_Call=0)
			//MESSAGE("4")
		End if 
		//Else
		//MESSAGE("5")
		While (Semaphore:C143("$ProcArr"))
			DelayTicks(2)
		End while 
		//MESSAGE("6")
		For ($_l_Index; 1; Size of array:C274(<>PRC_al_WindowReference))
			If (<>PRC_al_WindowReference{$_l_Index}#0)
				SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_Index}; SM_l_MonitorCall; $_l_Call)
				POST OUTSIDE CALL:C329(<>PRC_al_ProcessNum{$_l_Index})
			End if 
		End for 
		//MESSAGE("7")
		CLEAR SEMAPHORE:C144("$ProcArr")
		//MESSAGE("8")
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("SM_SetReload"; $_t_oldMethodName)
