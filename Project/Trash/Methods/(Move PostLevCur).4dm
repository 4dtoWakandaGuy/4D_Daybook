//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Move_PostLevCur
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 10:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal)
	C_LONGINT:C283($_l_ItemNumber; $_l_PostingType; $2; $7)
	C_POINTER:C301($1)
	C_REAL:C285($_r_AdjustCost; $_r_AdjustQuantity; $_r_PostingType; $8; $9)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_oldMethodName; $_t_productCode; $_t_StockType; $3; $4; $5; $6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_PostLevCur")
//Move_PostLevCur - this is now the old method - see MovePostLevArr & Move_PostLev

If (Count parameters:C259>=2)
	$_t_StockType:=$1->
	$_l_PostingType:=$2
	If (Count parameters:C259>=3)
		$_t_productCode:=$3
	Else 
		$_t_productCode:=[CURRENT_STOCK:62]Product_Code:1
	End if 
	If (Count parameters:C259>=4)
		$_t_AnalysisCode:=$4
	Else 
		$_t_AnalysisCode:=[CURRENT_STOCK:62]Analysis_Code:10
	End if 
	If (Count parameters:C259>=5)
		$_t_CurrencyCode:=$5
	Else 
		$_t_CurrencyCode:=[CURRENT_STOCK:62]Currency_Code:11
	End if 
	If (Count parameters:C259>=6)
		$_t_LayerCode:=$6
	Else 
		$_t_LayerCode:=[CURRENT_STOCK:62]Layer_Code:12
	End if 
	If (Count parameters:C259>=7)
		$_l_ItemNumber:=$7
	Else 
		$_l_ItemNumber:=[CURRENT_STOCK:62]Item_Number:5
	End if 
	If (Count parameters:C259>=8)
		$_r_AdjustQuantity:=$8
	Else 
		$_r_AdjustQuantity:=[CURRENT_STOCK:62]Quantity:4
	End if 
	If (Count parameters:C259>=9)
		$_r_AdjustCost:=$9
	Else 
		$_r_AdjustCost:=[CURRENT_STOCK:62]Total_Cost:9
	End if 
	While (Semaphore:C143("StockLevel"+$_t_productCode))  //Prevent any other process from creating the same stock level
		DelayTicks(5)
	End while 
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$_t_productCode; *)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$_t_StockType; *)
	If (<>StockAnal)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=$_t_AnalysisCode)
	Else 
		QUERY:C277([STOCK_LEVELS:58])  //; & ;[STOCK LEVELS]Analysis Code="")
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
		If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode; *)
			QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
		Else 
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$_t_CurrencyCode)
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
		If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode; *)
			QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
		Else 
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$_t_LayerCode)
		End if 
	End if 
	
	READ WRITE:C146([STOCK_LEVELS:58])
	If (Not:C34(<>StockAnal))
		$_t_AnalysisCode:=""
	End if 
	If (Records in selection:C76([STOCK_LEVELS:58])=0)
		[STOCK_LEVELS:58]UniqueConstruct:11:=STOCK_BuildUnique($_t_productCode; $_t_CurrencyCode; $_t_LayerCode; $_t_StockType; $_t_AnalysisCode)
		
		CREATE RECORD:C68([STOCK_LEVELS:58])
		[STOCK_LEVELS:58]UniqueConstruct:11:=STOCK_BuildUnique($_t_productCode; $_t_CurrencyCode; $_t_LayerCode; $_t_StockType; $_t_AnalysisCode)
		[STOCK_LEVELS:58]Product_Code:1:=$_t_productCode
		[STOCK_LEVELS:58]Stock_Type:2:=$_t_StockType
		If (<>StockAnal)
			[STOCK_LEVELS:58]Analysis_Code:7:=$_t_AnalysisCode
		End if 
		[STOCK_LEVELS:58]Currency_Code:8:=$_t_CurrencyCode
		[STOCK_LEVELS:58]Layer_Code:9:=$_t_LayerCode
	Else 
		Check_LockMess(->[STOCK_LEVELS:58]; "Stock Level")
	End if 
	If (OK=1)
		If ($_l_ItemNumber=0)
			[STOCK_LEVELS:58]Free_Level:3:=Gen_Round(([STOCK_LEVELS:58]Free_Level:3+($_r_AdjustQuantity*$_l_PostingType)); 2; 6)  //4.0.035/6
			If ($2=1)
				[STOCK_LEVELS:58]Free_Cost:5:=Gen_Round(([STOCK_LEVELS:58]Free_Cost:5+$_r_AdjustCost); 2; 2)
			Else 
				[STOCK_LEVELS:58]Free_Cost:5:=Gen_Round(([STOCK_LEVELS:58]Free_Cost:5-$_r_AdjustCost); 2; 2)
			End if 
		Else 
			[STOCK_LEVELS:58]Allocated_Level:4:=Gen_Round(([STOCK_LEVELS:58]Allocated_Level:4+($_r_AdjustQuantity*$_l_PostingType)); 2; 6)  //4.0.035/6
			If ($2=1)
				[STOCK_LEVELS:58]Allocated_Cost:6:=Gen_Round(([STOCK_LEVELS:58]Allocated_Cost:6+$_r_AdjustCost); 2; 2)
			Else 
				[STOCK_LEVELS:58]Allocated_Cost:6:=Gen_Round(([STOCK_LEVELS:58]Allocated_Cost:6-$_r_AdjustCost); 2; 2)
			End if 
		End if 
		DB_SaveRecord(->[STOCK_LEVELS:58])
		AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
	End if 
	UNLOAD RECORD:C212([STOCK_LEVELS:58])
	CLEAR SEMAPHORE:C144("StockLevel"+$_t_productCode)
	
	
End if 
ERR_MethodTrackerReturn("Move_PostLevCur"; $_t_oldMethodName)
