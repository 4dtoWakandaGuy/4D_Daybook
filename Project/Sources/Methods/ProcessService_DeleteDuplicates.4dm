//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_DeleteDuplicates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled; $_bo_boolean4; $_bo_Continue; $9)
	C_DATE:C307($_d_Date; $3)
	C_LONGINT:C283($_l_Count; $_l_Long1; $_l_Long2; $_l_Long3; $_l_ProcessIndex; $_l_ProcessRecordNumber; $_l_RecordNumber; $_l_TableNumber; $0; $1; $2)
	C_LONGINT:C283($5; $6; $7; $8)
	C_TEXT:C284($_t_oldMethodName; $_t_ServiceType; $4)
	C_TIME:C306($_ti_Time; $10)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_DeleteDuplicates")
$_l_Count:=0

READ WRITE:C146([PROCESSES_TO_HANDLE:115])
If (Count parameters:C259>=10) & (Not:C34(<>SYS_bo_QuitCalled))
	
	$_l_ProcessRecordNumber:=$1
	$_l_TableNumber:=$2
	$_d_Date:=$3
	$_t_ServiceType:=$4
	$_l_RecordNumber:=$5
	$_l_Long1:=$6
	$_l_Long2:=$7
	$_l_Long3:=$8
	$_bo_boolean4:=$9
	$_ti_Time:=$10
	$_bo_Continue:=True:C214
	//TRACE
	While (Semaphore:C143("Deletion"+String:C10($_l_RecordNumber)))
		DelayTicks(60)
		$_bo_Continue:=False:C215
	End while 
	
	If ($_bo_Continue)
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]ServiceType:6=$_t_ServiceType)
		CREATE SET:C116([PROCESSES_TO_HANDLE:115]; "$typeMatch")
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_TableNumber)
		CREATE SET:C116([PROCESSES_TO_HANDLE:115]; "$tableMatch")
		INTERSECTION:C121("$tableMatch"; "$typematch"; "$typeMatch")
		CLEAR SET:C117("$TableMatch")
		
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]RecordNumber:7=$_l_RecordNumber)
		CREATE SET:C116([PROCESSES_TO_HANDLE:115]; "$recordMatch")
		INTERSECTION:C121("$recordMatch"; "$typematch"; "$typeMatch")
		CLEAR SET:C117("$RecordMatch")
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2#2)
		CREATE SET:C116([PROCESSES_TO_HANDLE:115]; "$statusMatch")
		INTERSECTION:C121("$statusMatch"; "$typematch"; "$typeMatch")
		CLEAR SET:C117("$statusMatch")
		USE SET:C118("$typeMatch")
		CLEAR SET:C117("$TypeMatch")
		
		If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
			FIRST RECORD:C50([PROCESSES_TO_HANDLE:115])
			For ($_l_ProcessIndex; 1; Records in selection:C76([PROCESSES_TO_HANDLE:115]))
				If (Record number:C243([PROCESSES_TO_HANDLE:115])#$_l_ProcessRecordNumber)
					If (BLOB size:C605([PROCESSES_TO_HANDLE:115]Data5Blob:12)=0)
						If ([PROCESSES_TO_HANDLE:115]DateCreated:4<=$_d_Date) & ([PROCESSES_TO_HANDLE:115]TimeCreated:5<$_ti_Time)
							If ($_l_Long1=[PROCESSES_TO_HANDLE:115]Data1Longint:8) & ($_l_Long2=[PROCESSES_TO_HANDLE:115]Data2Longint:9) & ($_l_Long3=[PROCESSES_TO_HANDLE:115]Data3Longint:10) & ($_bo_boolean4=[PROCESSES_TO_HANDLE:115]Data4Boolean:11)
								[PROCESSES_TO_HANDLE:115]Status:2:=2
								$_l_Count:=$_l_Count+1
								DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
							End if 
						End if 
					End if 
				End if 
				
				NEXT RECORD:C51([PROCESSES_TO_HANDLE:115])
			End for 
			REDUCE SELECTION:C351([PROCESSES_TO_HANDLE:115]; 0)
		End if 
	End if 
	
	CLEAR SEMAPHORE:C144("Deletion"+String:C10($_l_RecordNumber))
Else 
	
End if 

$0:=$_l_Count
ERR_MethodTrackerReturn("ProcessService_DeleteDuplicates"; $_t_oldMethodName)
