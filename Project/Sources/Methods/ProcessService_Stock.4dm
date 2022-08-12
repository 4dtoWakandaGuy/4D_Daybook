//%attributes = {}
If (False:C215)
	//Project Method Name:      ProcessService_Stock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    17/01/2011 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; STOCK_t_CalledBy)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ProcessService_Stock")
//ProcessService_Stock
// 16/04/02 pb
// Runs various methods called from trigger
$0:=False:C215
Case of 
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Linkitem1")
		//STOCK_t_CalledBy:=BLOB to text([ProcessesToHandle]Data5Blob;3)
		$0:=True:C214
		//GOTO RECORD([STOCK MOVEMENTS];[ProcessesToHandle]RecordNumber)
		//$0:=STOCK_LINKMOVEMENTS ([STOCK MOVEMENTS]Movement Code;[STOCK MOVEMENTS]XPreviousMovtCode;[STOCK MOVEMENTS]XNextMovementCode)
	: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Linkitem2")  //this is called by a second stock movement
		//STOCK_t_CalledBy:=BLOB to text([ProcessesToHandle]Data5Blob;3)
		//GOTO RECORD([STOCK MOVEMENTS];[ProcessesToHandle]RecordNumber)
		//$0:=STOCK_LINKMOVEMENTS ([STOCK MOVEMENTS]Movement Code;[STOCK MOVEMENTS]XPreviousMovtCode;[STOCK MOVEMENTS]XNextMovementCode;STOCK_t_CalledBy)
		//STOCK_t_CalledBy:=
		$0:=True:C214
End case 
ERR_MethodTrackerReturn("ProcessService_Stock"; $_t_oldMethodName)
