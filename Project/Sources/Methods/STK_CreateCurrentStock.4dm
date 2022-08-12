//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_CreateCurrentStock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  06/01/2011 14:19 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CSready)
	//C_UNKNOWN(STK_tCreateor)
	ARRAY POINTER:C280($_aptr_CurrentStockFields; 0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_CallBack; $_bo_NoQuery; $12; CSCreated; STK_bo_CombinedIndex; STK_bo_CreateCS)
	C_LONGINT:C283($_l_ApplicationType; $_l_CurrentStockID; $_l_CurrentStockItemNumber; $_l_MillisecondsNow; $_l_ProcessState; $_l_Retries; $11; STK_l_SpeedTest)
	C_REAL:C285($1; $10; $4; CSID)
	C_TEXT:C284($_t_CallBackProcessName; $_t_oldMethodName; $_t_ProcessName; $2; $3; $5; $6; $7; $8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_CreateCurrentStock"; Form event code:C388)
STK_tCreateor:=""


$_l_ApplicationType:=Application type:C494
If ($_l_ApplicationType=4D Local mode:K5:1)
	
	$_l_ApplicationType:=4D Server:K5:6
End if 
If (Count parameters:C259>=9)
	$_l_MillisecondsNow:=Milliseconds:C459
	$_l_Retries:=0
	While (Semaphore:C143("CreateCS"+$3+$2))
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*$_l_Retries)
	End while 
	//CLOSE WINDOW
	$_bo_NoQuery:=False:C215
	If (Count parameters:C259>=12)
		$_bo_NoQuery:=$12
	End if 
	$_bo_CallBack:=False:C215
	If (Count parameters:C259>=11)
		$_bo_CallBack:=($11#Current process:C322)
		$_t_CallBackProcessName:=Process_Name($11)
	End if 
	If (Not:C34($_bo_NoQuery))
		If (Not:C34(STK_bo_CombinedIndex))
			
			ARRAY POINTER:C280($_aptr_CurrentStockFields; 8)
			$_aptr_CurrentStockFields{1}:=->[CURRENT_STOCK:62]Product_Code:1
			$_aptr_CurrentStockFields{2}:=->[CURRENT_STOCK:62]Stock_Type:3
			$_aptr_CurrentStockFields{3}:=->[CURRENT_STOCK:62]Item_Number:5
			$_aptr_CurrentStockFields{4}:=->[CURRENT_STOCK:62]Currency_Code:11
			$_aptr_CurrentStockFields{5}:=->[CURRENT_STOCK:62]Layer_Code:12
			$_aptr_CurrentStockFields{6}:=->[CURRENT_STOCK:62]Analysis_Code:10
			$_aptr_CurrentStockFields{7}:=->[CURRENT_STOCK:62]Location:8
			$_aptr_CurrentStockFields{8}:=->[CURRENT_STOCK:62]Serial_Number:2
			CREATE INDEX:C966([CURRENT_STOCK:62]; $_aptr_CurrentStockFields; Standard BTree index:K58:3; "currentstockcombined")
			
			STK_bo_CombinedIndex:=True:C214
		End if 
		
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$3; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$2; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Item_Number:5=$10; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Cost_Price:6=$4; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Currency_Code:11=$7; *)
		If (<>StockAnal)
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$5; *)
		Else 
			QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=""; *)
		End if 
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$6; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Location:8=$8; *)
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Serial_Number:2=$9)
		If ($4#0) & (Records in selection:C76([CURRENT_STOCK:62])>0)
			QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Cost_Price:6=$4)
		End if 
	Else 
		REDUCE SELECTION:C351([CURRENT_STOCK:62]; 0)
	End if 
	If (Records in selection:C76([CURRENT_STOCK:62])=0)
		
		$_l_CurrentStockItemNumber:=$10
		CREATE RECORD:C68([CURRENT_STOCK:62])
		[CURRENT_STOCK:62]Item_Number:5:=$_l_CurrentStockItemNumber
		If (<>StockAnal)
			[CURRENT_STOCK:62]Analysis_Code:10:=$5
		End if 
		[CURRENT_STOCK:62]Cost_Price:6:=$4
		[CURRENT_STOCK:62]Currency_Code:11:=$7
		[CURRENT_STOCK:62]Layer_Code:12:=$6
		[CURRENT_STOCK:62]Location:8:=$8
		[CURRENT_STOCK:62]Product_Code:1:=$3
		[CURRENT_STOCK:62]Serial_Number:2:=$9
		[CURRENT_STOCK:62]Stock_Number:7:=Gen_Code(18; ->[CURRENT_STOCK:62]Stock_Number:7)
		[CURRENT_STOCK:62]Stock_Type:3:=$2
		[CURRENT_STOCK:62]UniqueConstruct:14:=STOCK_BuildUnique([CURRENT_STOCK:62]Product_Code:1; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Stock_Type:3; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Location:8)
		If ($1#0)
			[CURRENT_STOCK:62]X_ID:13:=$1
		Else 
			[CURRENT_STOCK:62]X_ID:13:=AA_GetNextIDinMethod(->[CURRENT_STOCK:62]X_ID:13)
		End if 
		DB_SaveRecord(->[CURRENT_STOCK:62]; False:C215)
		//DB_SaveRecord (->[CURRENT STOCK])
		
		
	Else 
		If ($_bo_CallBack)
			SET PROCESS VARIABLE:C370($11; CSID; [CURRENT_STOCK:62]X_ID:13)
		End if 
		
		
	End if 
	
	
	
	STK_bo_CreateCS:=False:C215
	
	If ($_bo_CallBack)
		Repeat 
			GET PROCESS VARIABLE:C371($11; CSready; CSready)
			If (Not:C34(CSready))
				DelayTicks(2)
			End if 
		Until (CSready)
		SET PROCESS VARIABLE:C370($11; CSCreated; True:C214)
		RESUME PROCESS:C320($11)
		CLEAR SEMAPHORE:C144("CreateCS"+$3+$2)
		
		//Open window(300;Screen height-200;600;Screen height-100;-Palette window )
		
		//CLOSE WINDOW
		SAVE RECORD:C53([CURRENT_STOCK:62])
		$_l_CurrentStockID:=[CURRENT_STOCK:62]X_ID:13
		
		UNLOAD RECORD:C212([CURRENT_STOCK:62])
		STK_UpdateCurrentStock2011(-$_l_CurrentStockID)
		
		$_l_Retries:=0
		Repeat 
			$_l_ProcessState:=Process state:C330($11)
			If ($_l_ProcessState#Aborted:K13:1)
				$_t_ProcessName:=Process_Name($11)
				If ($_t_ProcessName=$_t_CallBackProcessName)
					SET PROCESS VARIABLE:C370($11; CSCreated; True:C214)
					RESUME PROCESS:C320($11)
					$_l_Retries:=$_l_Retries+1
					If (Not:C34(STK_bo_CreateCS))
						
						DelayTicks(2*$_l_Retries)
						
					End if 
				Else 
					STK_bo_CreateCS:=True:C214
				End if 
			Else 
				STK_bo_CreateCS:=True:C214
			End if 
		Until (STK_bo_CreateCS) | ($_l_Retries>10)
		
		
		
		
	Else 
		CLEAR SEMAPHORE:C144("CreateCS"+$3+$2)
	End if 
	
End if 
ERR_MethodTrackerReturn("STK_CreateCurrentStock"; $_t_oldMethodName)