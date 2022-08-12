//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_DataCheckSubtableUnique
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
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_LONGINT:C283($_l_Index; $_l_RecordNumber; $_l_SubRecordNumber; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_DataCheckSubtableUnique")
Case of 
	: ($1=Table:C252(->[TRANSACTION_BATCHES:30]))
		$_l_RecordNumber:=1
		For ($_l_Index; 1; Records in table:C83([TRANSACTION_BATCHES:30]))  //D
			If (<>SYS_bo_QuitCalled)  //BSW/NG 2/09/03
				$_l_Index:=Records in table:C83([TRANSACTION_BATCHES:30])
			End if 
			ALL RECORDS:C47([TRANSACTION_BATCHES:30])
			GOTO SELECTED RECORD:C245([TRANSACTION_BATCHES:30]; $_l_RecordNumber)
			$_l_RecordNumber:=Record number:C243([TRANSACTION_BATCHES:30])
			$_l_SubRecordNumber:=1
			$_l_RecordNumber:=$_l_RecordNumber+1
		End for   //D
		
		
End case 
ERR_MethodTrackerReturn("DB_DataCheckSubtableUnique"; $_t_oldMethodName)