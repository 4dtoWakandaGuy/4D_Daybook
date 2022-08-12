//%attributes = {}
If (False:C215)
	//Project Method Name:      AUTO_AUDIT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
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
	C_BOOLEAN:C305(<>SYS_bo_DataChangeLog; $_bo_AuditProcessRunning)
	C_DATE:C307($_d_CurrentDate)
	C_LONGINT:C283($_l_AuditProcess; $_l_AuditProcessState; $_l_AuditProcessTime; $_l_CountTasks; $_l_FIeldID; $_l_Index; $_l_ProcessPosition; $_l_Retries; $_l_TableNumber; $_l_UnusedRow; $2)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_AuditProcessessName; $_t_CurrentMachineOwner; $_t_CurrentUser; $_t_ModifiedText; $_t_oldMethodName; $_t_ProcessName; $_t_ProcessNameTEST; $_t_RecordID; $_t_ServerUser; $_t_UserName; $3)
	C_TEXT:C284($4; DB_t_Methodname)
	C_TIME:C306($_ti_CurrentTime)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("AUTO_AUDIT")
DB_t_Methodname:=Current method name:C684
//NG I am putting this call here as it saves putting it in all the triggers

READ ONLY:C145([CLIENT_SERVERMESSAGES:123])
LOAD RECORD:C52([CLIENT_SERVERMESSAGES:123])

If (<>SYS_bo_DataChangeLog)  //| (Table($1)=Table(->[ORDERS])) | (Table($1)=Table(->[ORDER ITEMS]))
	
	
	//CALL THIS METHOD IN THE SAVE  NEW RECORD
	//AND SAVE EXISTING RECORD
	//CALL AUTO_AUTO DELETE IN THE DELETE EVENT
	If (Count parameters:C259>=4)
		$_l_FIeldID:=$2
		$_t_AuditProcessessName:=$3
		$_t_UserName:=$4
		If (GenValidatePointer($1))
			$_t_ModifiedText:=""
			$_l_TableNumber:=Table:C252($1)
			For ($_l_Index; 1; Get last field number:C255($_l_TableNumber))
				If (Is field number valid:C1000($_l_TableNumber; $_l_Index))
					If ((Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is picture:K8:10) & (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is text:K8:3) & (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is subtable:K8:11) & (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is BLOB:K8:12) & (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)#Is object:K8:27))
						If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)#(Field:C253($_l_TableNumber; $_l_Index)->))
							//the field is modified
							If ($_t_ModifiedText="")
								$_t_ModifiedText:=Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $_l_Index)
							Else 
								$_t_ModifiedText:=$_t_ModifiedText+Char:C90(9)+Table name:C256($_l_TableNumber)+" field "+Field name:C257($_l_TableNumber; $_l_Index)
							End if 
							Case of 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is alpha field:K8:1)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)="")
										$_t_ModifiedText:=$_t_ModifiedText+"Set to "+(Field:C253($_l_TableNumber; $_l_Index)->)
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)+" to"+(Field:C253($_l_TableNumber; $_l_Index)->)
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is text:K8:3)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)="")
										$_t_ModifiedText:=$_t_ModifiedText+" Set to "+(Field:C253($_l_TableNumber; $_l_Index)->)
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)+" to"+(Field:C253($_l_TableNumber; $_l_Index)->)
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is real:K8:4)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)=0)
										$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_Index)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is integer:K8:5)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)=0)
										$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10(Field:C253($_l_TableNumber; $_l_Index)->)
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_Index)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is longint:K8:6)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)=0)
										$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_Index)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is date:K8:7)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)=!00-00-00!)
										$_t_ModifiedText:=$_t_ModifiedText+" Set to "+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_Index)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is time:K8:8)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)=?00:00:00?)
										$_t_ModifiedText:=$_t_ModifiedText+" Set to"+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+String:C10(Old:C35(Field:C253($_l_TableNumber; $_l_Index)->))+" to"+String:C10((Field:C253($_l_TableNumber; $_l_Index)->))
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is boolean:K8:9)
									If (Old:C35(Field:C253($_l_TableNumber; $_l_Index)->)=False:C215) & (Field:C253($_l_TableNumber; $_l_Index)->=True:C214)
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+"FALSE"+" to"+"TRUE"
									Else 
										$_t_ModifiedText:=$_t_ModifiedText+" Changed from "+"TRUE"+" to"+"FALSE"
									End if 
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is picture:K8:10)
									$_t_ModifiedText:=$_t_ModifiedText+" Picture Changed "
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is subtable:K8:11)
								: (Type:C295(Field:C253($_l_TableNumber; $_l_Index)->)=Is BLOB:K8:12)
									$_t_ModifiedText:=$_t_ModifiedText+" Blob Changed "
									
							End case 
						End if 
					Else 
						//`
						
					End if 
				End if 
			End for 
			If ($_t_ModifiedText#"")
				Case of 
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldID)->)=Is alpha field:K8:1) | (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldID)->)=Is text:K8:3)
						$_t_RecordID:=Field:C253($_l_TableNumber; $_l_FIeldID)->
					: (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldID)->)=Is real:K8:4) | (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldID)->)=Is integer:K8:5) | (Type:C295(Field:C253($_l_TableNumber; $_l_FIeldID)->)=Is longint:K8:6)
						$_t_RecordID:=String:C10(Field:C253($_l_TableNumber; $_l_FIeldID)->)
				End case 
				//record is modified so
				$_t_CurrentUser:=Current user:C182  //--we need the Daybook user name
				
				$_t_AuditProcessessName:=$_t_AuditProcessessName  //current Process_Name
				//I think this will work!
				$_t_ServerUser:=""
				$_t_CurrentMachineOwner:=Current system user:C484
				$_ti_CurrentTime:=Current time:C178(*)
				$_d_CurrentDate:=Current date:C33(*)
				$_t_ModifiedText:=$_t_RecordID+Char:C90(9)+String:C10($_d_CurrentDate)+Char:C90(9)+" at "+Char:C90(9)+String:C10($_ti_CurrentTime)+Char:C90(9)+" in process "+Char:C90(9)+$_t_AuditProcessessName+Char:C90(9)+" user "+Char:C90(9)+[CLIENT_SERVERMESSAGES:123]USER_NAME:2+Char:C90(9)+" "+" USING MACHINE: "+Char:C90(9)+[CLIENT_SERVERMESSAGES:123]MACHINE_NAME:3+Char:C90(9)+" Record "+Char:C90(9)+$_t_RecordID+Char:C90(9)+" "+$_t_ModifiedText
				$_t_ServerUser:="Server"
				
			End if 
			If ($_t_ModifiedText#"")
				$_t_ProcessName:="ExportAudit_"+String:C10($_l_TableNumber)
				$_l_Retries:=0
				While (Semaphore:C143("$Start"+$_t_ProcessName))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				//check if process exists
				$_l_CountTasks:=Count tasks:C335
				$_t_ProcessNameTEST:=""
				$_l_AuditProcessState:=0
				$_l_AuditProcessTime:=0
				$_l_ProcessPosition:=Find in array:C230(<>SYS_at_DataAuditProcessName; $_t_ProcessName)
				If ($_l_ProcessPosition>0)
					PROCESS PROPERTIES:C336(<>SYS_al_DataAuditProcessID; $_t_ProcessNameTEST; $_l_AuditProcessState; $_l_AuditProcessTime)
					If ($_t_ProcessName=$_t_ProcessNameTEST) & ($_l_AuditProcessState>=0)
						//process is running
						//don't forget-dont end this process if the semaphore is set
						$_bo_AuditProcessRunning:=True:C214
					End if 
				Else 
					ARRAY TEXT:C222(<>SYS_at_DataAuditProcessName; Get last table number:C254)
					ARRAY LONGINT:C221(<>SYS_al_DataAuditProcessID; Get last table number:C254)
					$_l_ProcessPosition:=Find in array:C230(<>SYS_at_DataAuditProcessName; "")
					<>SYS_at_DataAuditProcessName{$_l_ProcessPosition}:=$_t_ProcessName
				End if 
				If (Not:C34($_bo_AuditProcessRunning))
					For ($_l_Index; 1; $_l_CountTasks)
						PROCESS PROPERTIES:C336($_l_Index; $_t_ProcessNameTEST; $_l_AuditProcessState; $_l_AuditProcessTime)
						If ($_t_ProcessName=$_t_ProcessNameTEST) & ($_l_AuditProcessState>=0)
							//process is running
							//don't forget-dont end this process if the semaphore is set
							$_bo_AuditProcessRunning:=True:C214
							$_l_Index:=$_l_CountTasks+1  //break out
						End if 
					End for 
				End if 
				$_l_Retries:=0
				While (Semaphore:C143("$writeAudit"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				$_l_UnusedRow:=Find in array:C230(<>SYS_al_ModifiedTable; -1)  //done overwrite
				If ($_l_UnusedRow<0)
					$_l_UnusedRow:=Find in array:C230(<>SYS_al_ModifiedTable; 0)  //empty
				End if 
				If ($_l_UnusedRow<0)  //no where to write
					$_l_UnusedRow:=Size of array:C274(<>SYS_al_ModifiedTable)+1
					INSERT IN ARRAY:C227(<>SYS_al_ModifiedTable; Size of array:C274(<>SYS_al_ModifiedTable)+1; 100)
					INSERT IN ARRAY:C227(<>SYS_at_ModifiedText; Size of array:C274(<>SYS_at_ModifiedText)+1; 100)
				End if 
				<>SYS_al_ModifiedTable{$_l_UnusedRow}:=$_l_TableNumber
				<>SYS_at_ModifiedText{$_l_UnusedRow}:=$_t_ModifiedText
				
				CLEAR SEMAPHORE:C144("$writeAudit")
				If ($_bo_AuditProcessRunning)
					CLEAR SEMAPHORE:C144("$Start"+$_t_ProcessName)
					
				Else 
					$_l_TableNumber:=Table:C252($1)
					If (Application type:C494=4D Remote mode:K5:5)
						$_l_AuditProcess:=Execute on server:C373("AUTO_AUDIT_EXPORT"; 128000; $_t_ProcessName; $_l_TableNumber; $_t_ModifiedText)
					Else 
						$_l_AuditProcess:=New process:C317("AUTO_AUDIT_EXPORT"; 128000; $_t_ProcessName; $_l_TableNumber; $_t_ModifiedText)
						
					End if 
					$_l_ProcessPosition:=Find in array:C230(<>SYS_at_DataAuditProcessName; $_t_ProcessName)
					<>SYS_al_DataAuditProcessID{$_l_ProcessPosition}:=$_l_AuditProcess
					//release the semaphore holding the process
					CLEAR SEMAPHORE:C144("$Start"+$_t_ProcessName)
				End if 
				
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("AUTO_AUDIT"; $_t_oldMethodName)
