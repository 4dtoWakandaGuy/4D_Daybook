//%attributes = {}
If (False:C215)
	//Project Method Name:      Move_PostLev
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 11:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>StockAnal)
	C_LONGINT:C283($2)
	C_POINTER:C301($1)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move_PostLev")
//Move_PostLev - this is now the old method - see MovePostLevArr & Move_PostLevCur
//This method should not be getting called at all. i am only leaving it here in case called from macros

If (Count parameters:C259<3)
	Move_PostLevCur($1; $2; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [CURRENT_STOCK:62]Analysis_Code:10; [CURRENT_STOCK:62]Currency_Code:11; [CURRENT_STOCK:62]Layer_Code:12; [CURRENT_STOCK:62]Item_Number:5; [CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
Else 
	QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; *)
	QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$1->; *)
	If (<>StockAnal)
		QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Analysis_Code:7=[CURRENT_STOCK:62]Analysis_Code:10)
	Else 
		QUERY:C277([STOCK_LEVELS:58])  //]; & ;[STOCK LEVELS]Analysis Code="")
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
		If ([CURRENT_STOCK:62]Currency_Code:11=<>SYS_t_BaseCurrency)
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11; *)
			QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Currency_Code:8="")
		Else 
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=[CURRENT_STOCK:62]Currency_Code:11)
		End if 
	End if 
	If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
		If ([CURRENT_STOCK:62]Layer_Code:12=DB_GetLedgerActualLayer)
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12; *)
			QUERY SELECTION:C341([STOCK_LEVELS:58];  | ; [STOCK_LEVELS:58]Layer_Code:9="")
		Else 
			QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=[CURRENT_STOCK:62]Layer_Code:12)
		End if 
	End if 
	
	READ WRITE:C146([STOCK_LEVELS:58])
	If (Records in selection:C76([STOCK_LEVELS:58])=0)
		CREATE RECORD:C68([STOCK_LEVELS:58])
		[STOCK_LEVELS:58]Product_Code:1:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
		[STOCK_LEVELS:58]Stock_Type:2:=$1->
		If (<>StockAnal)
			[STOCK_LEVELS:58]Analysis_Code:7:=[CURRENT_STOCK:62]Analysis_Code:10
		End if 
		[STOCK_LEVELS:58]Currency_Code:8:=[CURRENT_STOCK:62]Currency_Code:11
		[STOCK_LEVELS:58]Layer_Code:9:=[CURRENT_STOCK:62]Layer_Code:12
	Else 
		Check_LockMess(->[STOCK_LEVELS:58]; "Stock Level")
	End if 
	If (OK=1)
		If ([CURRENT_STOCK:62]Item_Number:5=0)
			[STOCK_LEVELS:58]Free_Level:3:=Gen_Round(([STOCK_LEVELS:58]Free_Level:3+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*$2)); 2; 2)
			If ($2=1)
				[STOCK_LEVELS:58]Free_Cost:5:=Gen_Round(([STOCK_LEVELS:58]Free_Cost:5+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
			Else 
				[STOCK_LEVELS:58]Free_Cost:5:=Gen_Round(([STOCK_LEVELS:58]Free_Cost:5-[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
			End if 
		Else 
			[STOCK_LEVELS:58]Allocated_Level:4:=Gen_Round(([STOCK_LEVELS:58]Allocated_Level:4+(Abs:C99([STOCK_MOVEMENT_ITEMS:27]Quantity:12)*$2)); 2; 2)
			If ($2=1)
				[STOCK_LEVELS:58]Allocated_Cost:6:=Gen_Round(([STOCK_LEVELS:58]Allocated_Cost:6+[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
			Else 
				[STOCK_LEVELS:58]Allocated_Cost:6:=Gen_Round(([STOCK_LEVELS:58]Allocated_Cost:6-[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13); 2; 2)
			End if 
		End if 
		DB_SaveRecord(->[STOCK_LEVELS:58])
		AA_CheckFileUnlocked(->[STOCK_LEVELS:58]X_ID:10)
	End if 
	UNLOAD RECORD:C212([STOCK_LEVELS:58])
End if 
ERR_MethodTrackerReturn("Move_PostLev"; $_t_oldMethodName)
