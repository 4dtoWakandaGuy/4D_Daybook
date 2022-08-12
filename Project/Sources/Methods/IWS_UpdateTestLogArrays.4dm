//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_UpdateTestLogArrays
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
	//ARRAY LONGINT(IWS_al_ProcessTicks;0)
	//ARRAY TEXT(IWS_at_ProcessName;0)
	//ARRAY TEXT(IWS_at_ProcessState;0)
	C_BOOLEAN:C305($_bo_ProcessVisible)
	C_LONGINT:C283($_l_Processstate; $_l_ProcessTime; $_l_Row; $i)
	C_TEXT:C284(<>IWS_t_HandlerProcess; $_t_oldMethodName; $_t_ProcessName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_UpdateTestLogArrays")

ARRAY TEXT:C222(IWS_at_ProcessName; 0)
ARRAY TEXT:C222(IWS_at_ProcessState; 0)
ARRAY LONGINT:C221(IWS_al_ProcessTicks; 0)

For ($i; 1; Count tasks:C335)
	PROCESS PROPERTIES:C336($i; $_t_ProcessName; $_l_Processstate; $_l_ProcessTime; $_bo_ProcessVisible)
	If ($_t_ProcessName=(<>IWS_t_HandlerProcess+"@"))
		$_l_Row:=Size of array:C274(IWS_at_ProcessName)+1
		ARRAY TEXT:C222(IWS_at_ProcessName; $_l_Row)
		ARRAY TEXT:C222(IWS_at_ProcessState; $_l_Row)
		ARRAY LONGINT:C221(IWS_al_ProcessTicks; $_l_Row)
		
		IWS_at_ProcessName{$_l_Row}:=$_t_ProcessName
		Case of 
			: ($_l_Processstate=-1)
				IWS_at_ProcessState{$_l_Row}:="Aborted"
			: ($_l_Processstate=1)
				IWS_at_ProcessState{$_l_Row}:="Delayed"
			: ($_l_Processstate=-100)
				IWS_at_ProcessState{$_l_Row}:="Does not exist"
			: ($_l_Processstate=0)
				IWS_at_ProcessState{$_l_Row}:="Executing"
			: ($_l_Processstate=5)
				IWS_at_ProcessState{$_l_Row}:="Paused"
			: ($_l_Processstate=6)
				IWS_at_ProcessState{$_l_Row}:="Hidden modal dialog"
			: ($_l_Processstate=3)
				IWS_at_ProcessState{$_l_Row}:="Waiting for input output"
			: ($_l_Processstate=4)
				IWS_at_ProcessState{$_l_Row}:="Waiting for internal flag"
			: ($_l_Processstate=2)
				IWS_at_ProcessState{$_l_Row}:="Waiting for user event"
				
		End case 
		
		IWS_al_ProcessTicks{$_l_Row}:=$_l_ProcessTime
	End if 
	IDLE:C311
	
End for 
SORT ARRAY:C229(IWS_at_ProcessName; IWS_at_ProcessState; IWS_al_ProcessTicks; >)
ERR_MethodTrackerReturn("IWS_UpdateTestLogArrays"; $_t_oldMethodName)