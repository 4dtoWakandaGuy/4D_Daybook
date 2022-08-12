//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Locked
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
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; <>SYS_bo_QuitCalled; $_bo_AllocCLog; $_bo_Load; $_bo_Locked; $_bo_ProcessVisible; $_bo_UseLoadRecord; $0; $3; DB_bo_LockedMessage; STK_bo_AllocCLog)
	C_LONGINT:C283(<>Repeat; $_l_LockedProcessState; $_l_Process; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $_l_UniqueProcessID; $_l_UniqueProcessID2)
	C_POINTER:C301($1)
	C_REAL:C285($2)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_Machine; $_t_oldMethodName; $_t_ProcessName; $_t_user; DB_t_Methodname)
	C_TIME:C306($_ti_CurrentTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Locked")
//Check_Locked
//Open window(60;60;250;100;-720)
//MESSAGE("Check for Locked record")


$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)

If (Count parameters:C259>=3)
	$_bo_UseLoadRecord:=$3
	
Else 
	$_bo_UseLoadRecord:=False:C215
End if 

DB_t_Methodname:=Current method name:C684
DB_t_Methodname:="IN Check_Locked"
If (GenValidatePointer($1))
	
	
	$_bo_Load:=(Read only state:C362($1->)=False:C215)
	If ($_bo_Load)
		$_bo_Locked:=Locked:C147($1->)
		
		If ($_bo_Locked)
			If ($_bo_UseLoadRecord)
				LOAD RECORD:C52($1->)
			End if 
			
			LOCKED BY:C353($1->; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
			If (DB_bo_LockedMessage)
				//MESSAGE("Locked by "+$_t_ProcessName+" "+$_t_user+" "+$_t_Machine)
			End if 
			If (($_t_user="") & ($_t_Machine="") & (($_t_ProcessName=Process_Name(Current process:C322)) | ($_t_ProcessName="")))
				
				//its not locked on this machine anyway so don;t check wierd 4D behaviour
				$_l_UniqueProcessID:=99
				$_l_UniqueProcessID2:=99
			Else 
				If (DB_bo_LockedMessage)
					//MESSAGE("Locked by "+$_t_ProcessName+" "+$_t_user+" "+$_t_Machine)
				End if 
				If ($_bo_AllocCLog)
					<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Locked by"+$_t_ProcessName+" "+$_t_user+" "+$_t_Machine+" "+String:C10(Current time:C178)
					
				End if 
				DB_bo_LockedMessage:=False:C215
				PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
				If ($_l_ProcessState=Paused:K13:6)
					RESUME PROCESS:C320($_l_Process)
				End if 
				PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
			End if 
			
			
			
			
			If ($_l_UniqueProcessID=$_l_UniqueProcessID2)
				
				//IT IS NOT LOCKED!
				$_bo_Locked:=False:C215
			End if 
			
			
			If ($_bo_Locked)
				If (Count parameters:C259>1)
					$_ti_CurrentTime:=Current time:C178+$2
				Else 
					$_ti_CurrentTime:=Current time:C178+<>Repeat
					If ($_ti_CurrentTime<=Current time:C178)
						$_ti_CurrentTime:=Current time:C178+60
					End if 
					
				End if 
				
				Repeat 
					IDLE:C311
					If ($_bo_Load)
						If ($_bo_UseLoadRecord)
							UNLOAD RECORD:C212($1->)
							LOAD RECORD:C52($1->)
						End if 
					End if 
					
					
					
					$_bo_Locked:=Locked:C147($1->)
					
					
					$0:=False:C215
					If ($_bo_Locked)
						
						LOCKED BY:C353($1->; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
						
						If ($_t_user#"") & ($_t_Machine#"")
							
							PROCESS PROPERTIES:C336($_l_Process; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID)
							$_l_LockedProcessState:=$_l_ProcessState
							PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_UniqueProcessID2)
							
						Else 
							//its not locked on this machine anyway so don;t check wierd 4D behaviour
							$_l_UniqueProcessID:=99
							$_l_UniqueProcessID2:=99
						End if 
						If ($_l_UniqueProcessID#$_l_UniqueProcessID2)
							If ($_l_LockedProcessState<0)
								$_l_ProcessNumber:=0
								If ($_bo_Load) & ($_bo_UseLoadRecord)
									
									LOAD RECORD:C52($1->)
								End if 
								$_l_UniqueProcessID:=$_l_UniqueProcessID2
								//process is dead so it cant be locked
								//I have seen this return locked on 6.5.8
							End if 
							
							If ($_l_UniqueProcessID#$_l_UniqueProcessID2)
								
								DelayTicks(2)
								If ($_bo_Load) & ($_bo_UseLoadRecord)
									LOAD RECORD:C52($1->)
								End if 
								$_bo_Locked:=Locked:C147($1->)
								$0:=Not:C34(Locked:C147($1->))
							Else 
								
								If ($_bo_Load) & ($_bo_UseLoadRecord)
									LOAD RECORD:C52($1->)
								End if 
								$_bo_Locked:=False:C215
								$0:=Not:C34($_bo_Locked)
							End if 
						Else 
							$_bo_Locked:=False:C215
						End if 
						
						
					Else 
						//MESSAGE("Record is  not Locked")
						If ($_bo_Load) & ($_bo_UseLoadRecord)
							LOAD RECORD:C52($1->)
						End if 
						$_bo_Locked:=False:C215
						$0:=Not:C34($_bo_Locked)
					End if 
					If ($_bo_Locked)
						//MESSAGE("Will try until"+Time string($_ti_CurrentTime))
					End if 
					
					//Until (Not($_bo_Locked)) | (Current time>$_ti_CurrentTime) bsw13/01/04 quiting is missing and it
					//seems to me it's crashing the client on qui
				Until (Not:C34($_bo_Locked)) | (Current time:C178>$_ti_CurrentTime) | (<>SYS_bo_QuitCalled)
			Else 
				//MESSAGE("Record is  not Locked")
				If ($_bo_Load) & ($_bo_UseLoadRecord)
					LOAD RECORD:C52($1->)
				End if 
				
				$0:=True:C214
			End if 
			
		Else 
			// MESSAGE("Record is  not Locked")
			If ($_bo_Load) & ($_bo_UseLoadRecord)
				LOAD RECORD:C52($1->)
			End if 
			
			$0:=True:C214
		End if 
	Else 
		$0:=True:C214
	End if 
	//MESSAGE("4")
Else 
	$0:=True:C214
	//MESSAGE("6")
End if 
///MESSAGE("4Exit")
ERR_MethodTrackerReturn("Check_Locked"; $_t_oldMethodName)
