//%attributes = {}
If (False:C215)
	//Project Method Name:      AUTO_AUDIT_DEL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>SYS_al_DataAuditProcessID;0)
	//ARRAY LONGINT(<>SYS_al_ModifiedTable;0)
	//ARRAY TEXT(<>SYS_at_DataAuditProcessName;0)
	//ARRAY TEXT(<>SYS_at_ModifiedText;0)
	C_BOOLEAN:C305($_bo_ProcessRunning)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283($_l_AuditProcess; $_l_FieldID; $_l_Index; $_l_ProcedureLocation; $_l_ProcessStateTest; $_l_ProcessTimeTest; $_l_Retries; $_l_TableNumber; $_l_TasksCount; $2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_ModifiedText; $_t_oldMethodName; $_t_oldMethodName2; $_t_ProcedureName; $_t_ProcessName; $_t_ProcessName2; $_t_ProcessNameTest; $_t_RecordValue; $_t_ServerUser; $_t_UserName; $3)
	C_TEXT:C284($4; DB_t_Methodname)
	C_TIME:C306($_ti_CurrentTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AUTO_AUDIT_DEL")

//TRACE
DB_t_Methodname:=Current method name:C684
If (True:C214)  //bsw november working on this so will enable it when finished
	READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
	LOAD RECORD:C52([CLIENT_SERVERMESSAGES:123])
	//CALL AUTO_AUTO DELETE IN THE DELETE EVENT
	If (False:C215)
		If (Count parameters:C259>=4)
			$_l_FieldID:=$2
			$_t_ProcessName:=$3
			$_t_UserName:=$4
			If (GenValidatePointer($1))
				$_t_ModifiedText:=""
				$_t_oldMethodName2:=ERR_MethodTracker("$_l_TableNumber")
				$_l_TableNumber:=Table:C252($1)
				For ($_l_Index; 1; Get last field number:C255($_l_TableNumber))
					If ((Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is picture:K8:10) & (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is text:K8:3) & (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is subtable:K8:11) & (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is BLOB:K8:12))
						$_t_oldMethodName2:=ERR_MethodTracker("$_t_ModifiedText")
						//the field is modified
						If ($_t_ModifiedText="")
							$_t_ModifiedText:=Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $_l_Index)
						Else 
							$_t_ModifiedText:=$_t_ModifiedText+Char:C90(13)+Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $_l_Index)
						End if 
						Case of 
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is alpha field:K8:1)
								$_t_oldMethodName2:=ERR_MethodTracker("Alpha"+String:C10($_l_Index))
								
								$_t_ModifiedText:=$_t_ModifiedText+" Was "+(Field:C253($_l_TableNumber; $_l_Index)->)
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is text:K8:3)
								$_t_oldMethodName2:=ERR_MethodTracker("TEXT"+String:C10($_l_Index))
								
								$_t_ModifiedText:=$_t_ModifiedText+" Was "+(Field:C253($_l_TableNumber; $_l_Index)->)
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is real:K8:4)
								$_t_oldMethodName2:=ERR_MethodTracker("Real"+String:C10($_l_Index))
								
								$_t_ModifiedText:=$_t_ModifiedText+" Was"+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is integer:K8:5)
								$_t_oldMethodName2:=ERR_MethodTracker("Int"+String:C10($_l_Index))
								
								$_t_ModifiedText:=$_t_ModifiedText+" Was "+String:C10(Field:C253($_l_TableNumber; $_l_Index)->)
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is longint:K8:6)
								$_t_oldMethodName2:=ERR_MethodTracker("Long"+String:C10($_l_Index))
								
								$_t_ModifiedText:=$_t_ModifiedText+" Was "+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is date:K8:7)
								$_t_oldMethodName2:=ERR_MethodTracker("Date"+String:C10($_l_Index))
								
								$_t_ModifiedText:=$_t_ModifiedText+" Was "+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is time:K8:8)
								$_t_oldMethodName2:=ERR_MethodTracker("Time"+String:C10($_l_Index))
								
								
								$_t_ModifiedText:=$_t_ModifiedText+" Was "+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is boolean:K8:9)
								$_t_oldMethodName2:=ERR_MethodTracker("BOOL"+String:C10($_l_Index))
								
								If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)=False:C215)
									$_t_ModifiedText:=$_t_ModifiedText+" Was  "+"FALSE"
								Else 
									$_t_ModifiedText:=$_t_ModifiedText+" Was  "+"TRUE"
								End if 
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is picture:K8:10)
								$_t_oldMethodName2:=ERR_MethodTracker("PIC"+String:C10($_l_Index))
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is subtable:K8:11)
								$_t_oldMethodName2:=ERR_MethodTracker("SUB"+String:C10($_l_Index))
								
							: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is BLOB:K8:12)
								$_t_oldMethodName2:=ERR_MethodTracker("BLOB"+String:C10($_l_Index))
								
								
						End case 
						
					Else 
						//`
						
					End if 
					
				End for 
				If ($_t_ModifiedText#"")
					$_t_oldMethodName2:=ERR_MethodTracker("$_t_RecordValue")
					Case of 
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldID)->)=Is alpha field:K8:1) | (Type:C295(Field:C253($_l_TableNumber; $_l_FieldID)->)=Is text:K8:3)
							$_t_RecordValue:=Field:C253($_l_TableNumber; $_l_FieldID)->
						: (Type:C295(Field:C253($_l_TableNumber; $_l_FieldID)->)=Is real:K8:4) | (Type:C295(Field:C253($_l_TableNumber; $_l_FieldID)->)=Is integer:K8:5) | (Type:C295(Field:C253($_l_TableNumber; $_l_FieldID)->)=Is longint:K8:6)
							$_t_RecordValue:=String:C10(Field:C253($_l_TableNumber; $_l_FieldID)->)
					End case 
					//record is modified so
					$_t_oldMethodName2:=ERR_MethodTracker("Current user")
					$_t_UserName:=Current user:C182  //--we need the Daybook user name >>  >> /
					$_t_ProcessName2:=$_t_ProcessName  //current Process_Name
					$_t_oldMethodName2:=ERR_MethodTracker("Current Machine Owner")
					$_t_ServerUser:=Current system user:C484
					$_t_oldMethodName2:=ERR_MethodTracker("Time")
					$_ti_CurrentTime:=Current time:C178(*)
					$_t_oldMethodName2:=ERR_MethodTracker("Date")
					$_d_CurrentDate:=Current date:C33(*)
					$_t_ModifiedText:=$_t_RecordValue+Char:C90(9)+String:C10($_d_CurrentDate)+Char:C90(9)+" at "+Char:C90(9)+String:C10($_ti_CurrentTime)+Char:C90(9)+" in process "+Char:C90(9)+$_t_ProcessName2+Char:C90(9)+" user "+Char:C90(9)+[CLIENT_SERVERMESSAGES:123]USER_NAME:2+Char:C90(9)+" "+" USING MACHINE: "+Char:C90(9)+[CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3+Char:C90(9)+" DELETED Record "+Char:C90(9)+$_t_RecordValue+Char:C90(9)+" "+$_t_ModifiedText
					
					
				End if 
				If ($_t_ModifiedText#"")
					If ($_t_ModifiedText#"")
						
						$_t_ProcedureName:="ExportAudit_"+String:C10($_l_TableNumber)
						$_t_oldMethodName2:=ERR_MethodTracker($_t_ProcedureName)
						$_l_Retries:=0
						While (Semaphore:C143("$Start"+$_t_ProcedureName))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*(1+$_l_Retries))
						End while 
						//check if process exists
						$_l_TasksCount:=Count tasks:C335
						$_t_ProcessNameTest:=""
						$_l_ProcessStateTest:=0
						$_l_ProcessTimeTest:=0
						$_l_ProcedureLocation:=Find in array:C230(<>SYS_at_DataAuditProcessName; $_t_ProcedureName)
						If ($_l_ProcedureLocation>0)
							$_t_oldMethodName2:=ERR_MethodTracker("ProcEXISTS")
							PROCESS PROPERTIES:C336(<>SYS_al_DataAuditProcessID; $_t_ProcessNameTest; $_l_ProcessStateTest; $_l_ProcessTimeTest)
							If ($_t_ProcedureName=$_t_ProcessNameTest) & ($_l_ProcessStateTest>=0)
								//process is running
								//don't forget-dont end this process if the semaphore is set
								$_bo_ProcessRunning:=True:C214
								$_l_AuditProcess:=<>SYS_al_DataAuditProcessID{$_l_ProcedureLocation}
							End if 
						Else 
							ARRAY TEXT:C222(<>SYS_at_DataAuditProcessName; Get last table number:C254)
							ARRAY LONGINT:C221(<>SYS_al_DataAuditProcessID; Get last table number:C254)
							$_l_ProcedureLocation:=Find in array:C230(<>SYS_at_DataAuditProcessName; "")
							<>SYS_at_DataAuditProcessName{$_l_ProcedureLocation}:=$_t_ProcedureName
						End if 
						If (Not:C34($_bo_ProcessRunning))
							For ($_l_Index; 1; $_l_TasksCount)
								PROCESS PROPERTIES:C336($_l_Index; $_t_ProcessNameTest; $_l_ProcessStateTest; $_l_ProcessTimeTest)
								If ($_t_ProcedureName=$_t_ProcessNameTest) & ($_l_ProcessStateTest>=0)
									//process is running
									//don't forget-dont end this process if the semaphore is set
									$_bo_ProcessRunning:=True:C214
									$_l_Index:=$_l_TasksCount+1  //break out
									$_l_AuditProcess:=$_l_Index
								End if 
							End for 
						End if 
						$_l_Retries:=0
						While (Semaphore:C143("$writeAudit"))
							$_l_Retries:=$_l_Retries+1
							DelayTicks(2*(1+$_l_Retries))
						End while 
						$_l_ProcedureLocation:=Find in array:C230(<>SYS_al_ModifiedTable; -1)  //done overwrite
						If ($_l_ProcedureLocation<0)
							$_l_ProcedureLocation:=Find in array:C230(<>SYS_al_ModifiedTable; 0)  //empty
						End if 
						If ($_l_ProcedureLocation<0)  //no where to write
							$_l_ProcedureLocation:=Size of array:C274(<>SYS_al_ModifiedTable)+1
							INSERT IN ARRAY:C227(<>SYS_al_ModifiedTable; Size of array:C274(<>SYS_al_ModifiedTable)+1; 100)
							INSERT IN ARRAY:C227(<>SYS_at_ModifiedText; Size of array:C274(<>SYS_at_ModifiedText)+1; 100)
						End if 
						<>SYS_al_ModifiedTable{$_l_ProcedureLocation}:=$_l_TableNumber
						<>SYS_at_ModifiedText{$_l_ProcedureLocation}:=$_t_ModifiedText
						
						CLEAR SEMAPHORE:C144("$writeAudit")
						If ($_bo_ProcessRunning)
							CLEAR SEMAPHORE:C144("$Start"+$_t_ProcedureName)
							RESUME PROCESS:C320($_l_AuditProcess)
						Else 
							$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE ON SERVER")
							$_l_TableNumber:=Table:C252($1)
							If (Application type:C494=4D Remote mode:K5:5)
								$_l_AuditProcess:=Execute on server:C373("AUTO_AUDIT_EXPORT"; 64000; $_t_ProcedureName; $_l_TableNumber; $_t_ModifiedText)
							Else 
								$_l_AuditProcess:=New process:C317("AUTO_AUDIT_EXPORT"; 64000; $_t_ProcedureName; $_l_TableNumber; $_t_ModifiedText)
							End if 
							$_l_ProcedureLocation:=Find in array:C230(<>SYS_at_DataAuditProcessName; $_t_ProcedureName)
							<>SYS_al_DataAuditProcessID{$_l_ProcedureLocation}:=$_l_AuditProcess
							//release the semaphore holding the process
							CLEAR SEMAPHORE:C144("$Start"+$_t_ProcedureName)
						End if 
						
					End if 
					
				End if 
			End if 
		End if 
	End if 
	
	
	
	
End if 
ERR_MethodTrackerReturn("AUTO_AUDIT_DEL"; $_t_oldMethodName)
