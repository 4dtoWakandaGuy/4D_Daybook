//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_InCan
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2011 09:47
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CountTasks; $_l_ProcessState; $_l_ProcessTime; $_l_TaskIndex; DB_l_ButtonClickedFunction; vAdd)
	C_TEXT:C284(<>JobCode; $_t_oldMethodName; $_t_processName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_InCan")
$_l_CountTasks:=Count tasks:C335
If (False:C215)
	//NG march 2011-this does not appear to be used anywhere so commenting it out.
	//think its supposed to cancel any job stages or order items created from this job???
	
	For ($_l_TaskIndex; 1; $_l_CountTasks)
		If (Process state:C330($_l_TaskIndex)>=Executing:K13:4)
			PROCESS PROPERTIES:C336($_l_TaskIndex; $_t_processName; $_l_ProcessState; $_l_ProcessTime)
			If (Position:C15("Edit "+[JOBS:26]Job_Code:1+" "; $_t_processName)>0)
				//it is a subprocess of this process
				While (Semaphore:C143("$JobInfoUpdate"))  //about to write-stop everyone
					DelayTicks(60)
				End while 
				SET PROCESS VARIABLE:C370($_l_TaskIndex; DB_l_ButtonClickedFunction; 905)
				POST OUTSIDE CALL:C329($_l_TaskIndex)
				CLEAR SEMAPHORE:C144("$JobInfoUpdate")  //release everyone
			End if 
		End if 
	End for 
End if   //
If (vAdd=1)
	DB_SaveRecord(->[JOBS:26])
	AA_CheckFileUnlocked(->[JOBS:26]x_ID:49)
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	DB_SaveRecord(->[JOB_STAGES:47])
	RELATE MANY:C262([JOBS:26]Job_Code:1)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Allocated:28>0)
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		Gen_Alert("Please unallocate items first"; "Try again")
		RELATE MANY:C262([JOBS:26]Job_Code:1)
	Else 
		RELATE MANY:C262([JOBS:26]Job_Code:1)
		OK:=0
		If ((Records in selection:C76([JOB_STAGES:47])>0) | (Records in selection:C76([ORDER_ITEMS:25])>0))
			Gen_Confirm("Are you sure you want to Cancel?"; "Keep it"; "Cancel")
		End if 
		If (OK=0)
			If ([JOBS:26]Job_Code:1#"")
				DELETE SELECTION:C66([ORDER_ITEMS:25])
				DELETE SELECTION:C66([JOB_STAGES:47])
				DELETE SELECTION:C66([JOB PERSONNEL:48])
				
			End if 
			DB_DeletionControl(->[JOBS:26])
			
			DELETE RECORD:C58([JOBS:26])
			DB_DeletionControl(->[JOBS:26])
			
			CANCEL:C270
			<>JobCode:=""
			
		End if 
	End if 
Else 
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	DB_SaveRecord(->[JOB_STAGES:47])
	CANCEL:C270
	<>JobCode:=""
	
End if 
ERR_MethodTrackerReturn("Jobs_InCan"; $_t_oldMethodName)