//%attributes = {}

If (False:C215)
	//Project Method Name:      LOG_SimpleLog
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/05/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>LOG_at_LogLines;0)
	C_BOOLEAN:C305(<>LOG_bo_Inited; <>SYS_bo_LogisOn)
	C_LONGINT:C283($_l_Execute; $_l_Origin; $_l_ProcessMode; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueID; $10; $11; $12; $13)
	C_LONGINT:C283($3; $9)
	C_OBJECT:C1216($_obj_Cache; $4)
	C_REAL:C285($_r_milliseconds; $7)
	C_TEXT:C284($_t_Action; $_t_LogsPath; $_t_Machine; $_t_MethodName; $_t_processName; $_t_SendString; $_t_SourcePath; $_t_User; $1; $2; $5)
	C_TEXT:C284($6; $8)
	C_TIME:C306($_ti_Document)
End if 
//Code Starts Here
//$_t_oldMethodName:=ERR_MethodTracker ("LOG_SimpleLog")
<>SYS_bo_LogisOn:=False:C215
If (True:C214)
	If (<>SYS_bo_LogisOn)
		//MESSAGE("4+A")
		If (Count parameters:C259>=2)
			
			$_r_milliseconds:=Milliseconds:C459
			$_t_MethodName:=$1
			$_t_Action:=$2
			If ($_t_MethodName#"UTIL_DelayTicks") & ($_t_MethodName#"Log_SimpleLog")
				
				If (Count parameters:C259>=3)
					$_l_ProcessNumber:=$3
					$_obj_Cache:=$4
					$_t_User:=$5
					$_t_Machine:=$6
					$_r_milliseconds:=$7
					$_t_processName:=$8
					$_l_ProcessState:=$9
					$_l_ProcessTime:=$10
					$_l_ProcessMode:=$11
					$_l_UniqueID:=$12
					$_l_Origin:=$13
					
				Else 
					//MESSAGE("4B")
					$_l_ProcessNumber:=Current process:C322
					PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_l_ProcessMode; $_l_UniqueID; $_l_Origin)
					$_obj_Cache:=Cache info:C1402
					$_t_User:=Current user:C182
					$_t_Machine:=Current machine:C483
					//C_OBJECT($_obj_LogData)
					//OB SET($_obj_LogData;
				End if 
				If ($_t_processName#"$@")
					//MESSAGE("4D")
					While (Semaphore:C143("$onelogatatime"))
						//MESSAGE("4E")
						UTIL_DelayTicks(2)
					End while 
					
					If (Application type:C494=4D Remote mode:K5:5)
						$_l_Execute:=Execute on server:C373("LOG_ServerSide"; 128000; "Log Action"; $_t_MethodName; $_t_Action; $_l_ProcessNumber; $_obj_Cache; $_t_User; $_t_Machine; $_r_milliseconds; $_t_processName; $_l_ProcessState; $_l_ProcessTime; $_l_ProcessMode; $_l_UniqueID; $_l_Origin)
					Else 
						If (Not:C34(<>LOG_bo_Inited))
							ARRAY TEXT:C222(<>LOG_at_LogLines; 0)
							<>LOG_bo_Inited:=True:C214
						End if 
						$_t_SendString:=String:C10($_r_milliseconds)+Char:C90(Tab:K15:37)+String:C10($_l_UniqueID)+Char:C90(Tab:K15:37)+$_t_MethodName+Char:C90(Tab:K15:37)+$_t_Action+Char:C90(Tab:K15:37)+$_t_User+Char:C90(Tab:K15:37)+$_t_Machine+Char:C90(Tab:K15:37)+$_t_processName+Char:C90(13)+Char:C90(10)
						APPEND TO ARRAY:C911(<>LOG_at_LogLines; $_t_SendString)
						
						If (Size of array:C274(<>LOG_at_LogLines)>1000)
							
							$_t_SourcePath:=Get 4D folder:C485(Current resources folder:K5:16)
							$_t_LogsPath:=$_t_SourcePath+"LOGS"+Folder separator:K24:12
							If (Test path name:C476($_t_LogsPath+"SpeedLog.txt")#Is a document:K24:1)
								$_ti_Document:=Create document:C266($_t_LogsPath+"SpeedLog.txt")
							Else 
								$_ti_Document:=Append document:C265($_t_LogsPath+"SpeedLog.txt")
							End if 
							SEND PACKET:C103($_ti_Document; $_t_SendString)
							CLOSE DOCUMENT:C267($_ti_Document)
							BEEP:C151
							ARRAY TEXT:C222(<>LOG_at_LogLines; 0)
						End if 
						
						
						
					End if 
					CLEAR SEMAPHORE:C144("$onelogatatime")
				End if 
			End if 
		End if 
		
	End if 
End if 
//MESSAGE("4X")
//ERR_MethodTrackerReturn ("LOG_SimpleLog";$_t_oldMethodName)
