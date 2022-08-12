//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs WIPStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_DATE:C307(<>DB_d_CurrentDate; $2)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs WIPStart")
//Jobs WIPStart

If ((DB_GetModuleSettingByNUM(Module_NominalLedger))>0)
	DB_bo_RecordModified:=Jobs_WIPCheck
	If (DB_bo_RecordModified)
		READ WRITE:C146([TRANSACTION_BATCHES:30])
		CREATE RECORD:C68([TRANSACTION_BATCHES:30])
		[TRANSACTION_BATCHES:30]Batch_Date:1:=$2
		[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
		[TRANSACTION_BATCHES:30]Description:12:=$1
		vTotal:=0
	End if 
End if 
ERR_MethodTrackerReturn("Jobs WIPStart"; $_t_oldMethodName)