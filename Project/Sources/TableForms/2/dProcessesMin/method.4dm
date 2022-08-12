If (False:C215)
	//Table Form Method Name: Object Name:      [COMPANIES].dProcessesMin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>PRC_al_ProcessNum;0)
	//ARRAY LONGINT(<>PRC_al_ProcessState;0)
	C_BOOLEAN:C305($_bo_ProcessVIsible; DB_bo_NoLoad)
	C_LONGINT:C283(<>ProcProc; $_l_ArraySize; $_l_CurrentProcess; $_l_event; $_l_Index; $_l_index2; $_l_ProcessState; $_l_ProcessTime; $e)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dProcessesMin"; Form event code:C388)
$_l_CurrentProcess:=Current process:C322
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Outside Call:K2:11)
		If (<>ProcProc=0)
			CANCEL:C270
		Else 
			$_l_ArraySize:=Size of array:C274(<>PRC_al_ProcessNum)
			If ($_l_ArraySize>0)
				$_l_Index:=1
				While ($_l_Index<=Size of array:C274(<>PRC_al_ProcessNum))
					PROC_SetProcess(<>PRC_al_ProcessNum{$_l_Index})
					IDLE:C311  // 03/04/03 pb
					PROCESS PROPERTIES:C336(<>PRC_al_ProcessNum{$_l_Index}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVIsible)
					If ($_l_Index=Size of array:C274(<>PRC_al_ProcessNum))
						If (<>PRC_al_ProcessState{$_l_Index}<0)
							Repeat 
								$_l_Index:=$_l_Index-1
							Until (<>PRC_al_ProcessState{$_l_Index}>=0)
							PROCESS PROPERTIES:C336(<>PRC_al_ProcessNum{$_l_Index}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVIsible)
						End if 
						If ($_bo_ProcessVIsible)
							SHOW PROCESS:C325(<>PRC_al_ProcessNum{$_l_Index})
							BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_Index})
						Else 
							$_l_index2:=$_l_Index
							For ($_l_index2; $_l_Index; 1; -1)
								PROCESS PROPERTIES:C336(<>PRC_al_ProcessNum{$_l_index2}; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVIsible)
								If ($_bo_ProcessVIsible) & ($_l_ProcessState>=0)
									SHOW PROCESS:C325(<>PRC_al_ProcessNum{$_l_index2})
									BRING TO FRONT:C326(<>PRC_al_ProcessNum{$_l_index2})
									$_l_index2:=0
								End if 
							End for 
							
						End if 
						
					End if 
					
					
					
					$_l_Index:=$_l_Index+1
					
					
					
				End while 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dProcessesMin"; $_t_oldMethodName)
