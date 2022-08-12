//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_CurrentSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 11:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY TEXT(<>PRC_at_ProcessName;0)
	C_BOOLEAN:C305($_bo_Found)
	C_LONGINT:C283($_l_MonitorCall; $_l_ProcessIndex; $_l_ProcessTable; $_l_TableNumber)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; SM_t_UseSetName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_CurrentSelection")
// EW_CurrentSelection
// 2/12/02 pb
// finds the crrent seleciton of records in the designated table
// Only when exporting "live" -- i.e.,
// not when exporting on a scheduled export
// Parameters: $1=pointer to the table to export from


$_bo_Found:=False:C215
$_l_TableNumber:=Table:C252($1)
$_l_ProcessTable:=0
For ($_l_ProcessIndex; 1; Size of array:C274(<>PRC_al_ProcessNum))
	IDLE:C311
	If (<>PRC_al_ProcessNum{$_l_ProcessIndex}#Current process:C322)
		//NG_REWRITE THIS OCT 2012
		GET PROCESS VARIABLE:C371(<>PRC_al_ProcessNum{$_l_ProcessIndex}; WS_l_DefaultTable; $_l_ProcessTable)
		If ($_l_ProcessTable=$_l_TableNumber) & ((<>PRC_at_ProcessName{$_l_ProcessIndex}#"Set Manager") & (<>PRC_at_ProcessName{$_l_ProcessIndex}#"Design Process") & (<>PRC_at_ProcessName{$_l_ProcessIndex}#"thermometer"))
			GET PROCESS VARIABLE:C371(<>PRC_al_ProcessNum{$_l_ProcessIndex}; SM_l_MonitorCall; $_l_MonitorCall)
			While ($_l_MonitorCall#0)
				DelayTicks(30)
				GET PROCESS VARIABLE:C371(<>PRC_al_ProcessNum{$_l_ProcessIndex}; SM_l_MonitorCall; $_l_MonitorCall)
			End while 
			SM_t_UseSetName:=""
			SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_ProcessIndex}; SM_l_MonitorCall; 1)
			SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_ProcessIndex}; DB_l_OutCallBack; Current process:C322)
			BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_ProcessIndex})
			POST OUTSIDE CALL:C329(<>PRC_al_ProcessNum{$_l_ProcessIndex})
			DelayTicks(30)
			
			While (SM_t_UseSetName="")
				IDLE:C311
				//      SM_l_MonitorCall:=1  ` experimental 08/10/03 pb
				SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_ProcessIndex}; DB_l_OutCallBack; Current process:C322)
				SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_ProcessIndex}; SM_l_MonitorCall; 1)
				BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_ProcessIndex})
				POST OUTSIDE CALL:C329(<>PRC_al_ProcessNum{$_l_ProcessIndex})
				DelayTicks(60*5)
			End while 
			USE SET:C118(SM_t_UseSetName)
			$_bo_Found:=True:C214
			$_l_ProcessIndex:=Size of array:C274(<>PRC_al_ProcessNum)
			SET PROCESS VARIABLE:C370(<>PRC_al_ProcessNum{$_l_ProcessIndex}; SM_l_MonitorCall; 0)
			BRING TO FRONT:C326(Current process:C322)
		End if 
		
	End if 
End for 

If ($_bo_Found=False:C215)  // 14/10/03 pb
	REDUCE SELECTION:C351($1->; 0)
End if 
ERR_MethodTrackerReturn("EW_CurrentSelection"; $_t_oldMethodName)