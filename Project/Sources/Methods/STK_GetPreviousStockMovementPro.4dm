//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetPreviousStockMovementPro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     28/06/2011 23:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STK_al_CalledoffByID;0)
	//ARRAY LONGINT(STK_al_CalledoffFromID;0)
	//ARRAY REAL(STK_ar_CalledOffQuantity;0)
	C_BOOLEAN:C305(<>FilterInAllocated; <>SYS_bo_QuitCalled; $13; $14; $16; $19; $20; STK_bo_CalledBACK; STK_bo_CallisPreTry; STK_bo_EXIT; STK_bo_isAllocation)
	C_BOOLEAN:C305(STK_bo_isStockReceipt; STK_bo_isUnallocation; STK_bo_PrevisReady; STK_bo_UseOnlyAllocated; STK_bo_UseOnlyFree)
	C_DATE:C307($9; STK_d_pTakeFrommaxHeaderDate)
	C_LONGINT:C283(<>STK_l_PreviousProcess; $_l_ApplicationType; $_l_Retries; $1; STK_l_CurrentPostingProcess; STK_l_pCallBackProcess; STK_l_pCopiedFromID; STK_l_pNotFromSIID; STK_l_pTakeFromCSID; STK_l_pTakeFromItemID; STK_l_TakeFromPOItemNumber)
	C_REAL:C285($10; $11; $12; $15; $18; $2; $3; STK_r_pTakeFromCostPrice; STK_r_pTakeQuantity)
	C_TEXT:C284($_t_oldMethodName; $17; $4; $5; $6; $7; $8; STK_t_pProductCode; STK_t_pTakeFromAnalysis; STK_t_pTakeFromCurrency; STK_t_pTakeFromLayer)
	C_TEXT:C284(STK_t_pTakeFromStockType; STK_t_TakePONumber; STKp_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("STK_GetPreviousStockMovementPro")

//Open window(20;Screen height-200;120;Screen height-100;-Palette window )
$_l_Retries:=0
While (Semaphore:C143("GetPrevious"))
	//GOTO XY(0;0)
	//MESSAGE("Waiting for semaphore  "+"GetPrevious"+String($_l_Retries))
	$_l_Retries:=$_l_Retries+1
	DelayTicks(2*$_l_Retries)
End while 
//CLOSE WINDOW
STK_l_pCallBackProcess:=$1
If (Count parameters:C259>=16)
	STK_l_pCopiedFromID:=$2
	STK_l_pTakeFromCSID:=$3
	STK_t_pProductCode:=$4
	STK_t_pTakeFromStockType:=$5
	STK_t_pTakeFromCurrency:=$6
	STK_t_pTakeFromAnalysis:=$7
	STK_t_pTakeFromLayer:=$8
	STK_d_pTakeFrommaxHeaderDate:=$9
	STK_r_pTakeFromCostPrice:=$10
	STK_r_pTakeQuantity:=$11
	STK_l_pNotFromSIID:=$12
	STK_bo_isAllocation:=$13
	STK_bo_isUnallocation:=$14
	STK_l_pTakeFromItemID:=$15
	STK_bo_UseOnlyAllocated:=$16
	STK_bo_isStockReceipt:=False:C215
	If (Count parameters:C259>=18)
		STK_t_TakePONumber:=$17
		STK_l_TakeFromPOItemNumber:=$18
	End if 
	If (Count parameters:C259>=19)
		STK_bo_CallisPreTry:=$19
	Else 
		STK_bo_CallisPreTry:=False:C215
	End if 
	If (Count parameters:C259>=20)
		STK_bo_UseOnlyFree:=$20
	Else 
		STK_bo_UseOnlyFree:=False:C215
	End if 
	$_l_ApplicationType:=Application type:C494
	If ($_l_ApplicationType=4D Server:K5:6)
		//Open window(20;60;400;250;-720)
	End if 
	
	Repeat 
		//GOTO XY(0;0)
		//MESSAGE("Running Get Previous Stock Movement")
		If (STK_l_pCallBackProcess>0)
			If (STK_l_CurrentPostingProcess#STK_l_pCallBackProcess)
				//STK_l_CurrentPostingProcess remembers which item ids have been added to and copied from in this process
				//so if we call off from the same item multiple time the residual gets set correctly
				STK_l_CurrentPostingProcess:=STK_l_pCallBackProcess
				ARRAY LONGINT:C221(STK_al_CalledoffByID; 0)
				ARRAY LONGINT:C221(STK_al_CalledoffFromID; 0)
				ARRAY REAL:C219(STK_ar_CalledOffQuantity; 0)
				
			End if 
			
			STK_bo_CalledBACK:=False:C215
			STK_GetPreviousStockMovement(STK_l_pCallBackProcess; STK_l_pCopiedFromID; STK_l_pTakeFromCSID; STK_t_pProductCode; STK_t_pTakeFromStockType; STK_t_pTakeFromCurrency; STK_t_pTakeFromAnalysis; STK_t_pTakeFromLayer; STK_d_pTakeFrommaxHeaderDate; STK_r_pTakeFromCostPrice; STK_r_pTakeQuantity; STK_l_pNotFromSIID; STK_bo_isAllocation; STK_bo_isUnallocation; STK_l_pTakeFromItemID; STK_bo_UseOnlyAllocated; STK_t_TakePONumber; STK_l_TakeFromPOItemNumber; STK_bo_isStockReceipt)
			STK_bo_CallisPreTry:=False:C215
			STK_bo_UseOnlyFree:=False:C215
			
		End if 
		//SET PROCESS VARIABLE(STK_l_pCallBackProcess;STK_bo_PreviousSet;True)
		//dont need to call back from the process because the above method does the call back
		STK_l_pCallBackProcess:=0
		STK_l_pCopiedFromID:=0
		STK_l_pTakeFromCSID:=0
		STK_t_pProductCode:=""
		STK_t_pTakeFromStockType:=""
		STK_t_pTakeFromCurrency:=""
		STK_t_pTakeFromAnalysis:=""
		STK_t_pTakeFromLayer:=""
		STK_d_pTakeFrommaxHeaderDate:=!00-00-00!
		STK_r_pTakeFromCostPrice:=0
		STK_r_pTakeQuantity:=0
		STK_l_pNotFromSIID:=0
		STK_bo_isAllocation:=False:C215
		STK_bo_isUnallocation:=False:C215
		STK_l_pTakeFromItemID:=0
		STK_bo_UseOnlyAllocated:=False:C215
		STK_t_TakePONumber:=""
		STK_l_TakeFromPOItemNumber:=0
		STK_bo_isStockReceipt:=False:C215
		//GOTO XY(0;0)
		//MESSAGE("Clearing Semaphore")
		CLEAR SEMAPHORE:C144("GetPrevious")
		
		STK_bo_EXIT:=False:C215
		Repeat 
			UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
			UNLOAD RECORD:C212([CURRENT_STOCK:62])
			UNLOAD RECORD:C212([STOCK_LEVELS:58])
			
			PAUSE PROCESS:C319(Current process:C322)
			If (<>SYS_bo_QuitCalled)
				STK_bo_EXIT:=True:C214
			End if 
		Until (STK_bo_EXIT) | (STK_l_pCallBackProcess>0)
		//Open window(20;Screen height-200;120;Screen height-100;-Palette window )
		$_l_Retries:=0
		While (Semaphore:C143("GetPrevious"; 60))
			$_l_Retries:=$_l_Retries+1
			
			DelayTicks(2*$_l_Retries)
		End while 
		//CLOSE WINDOW
	Until (STK_bo_EXIT) | (<>SYS_bo_QuitCalled)
	
End if 
CLEAR SEMAPHORE:C144("GetPrevious")
<>STK_l_PreviousProcess:=0
ERR_MethodTrackerReturn("STK_GetPreviousStockMovementPro"; $_t_oldMethodName)
