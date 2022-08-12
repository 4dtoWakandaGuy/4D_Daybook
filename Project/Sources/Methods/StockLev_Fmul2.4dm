//%attributes = {}
If (False:C215)
	//Project Method Name:      StockLev_Fmul2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/04/2010 03:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_AllocationMovementTypes; 0)
	C_BOOLEAN:C305(<>StockAnal; $_bo_NoSearch)
	C_REAL:C285($0)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $1; $2; $3; $4; $5; $6)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("StockLev_Fmul2")
//StockLev_Fmul2 - for use in Included Formulae

$0:=0
If (Count parameters:C259>=2)
	
	If ($2="•ALL")
		If ($1#"")
			$_bo_NoSearch:=False:C215
			//QUERY([STOCK_LEVELS];[STOCK_LEVELS]Product Code=$1)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
			
			
		Else 
			$_bo_NoSearch:=True:C214
			REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		End if 
		
	Else 
		If ($1#"")
			$_bo_NoSearch:=False:C215
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$1; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=$2; *)
			
		Else 
			$_bo_NoSearch:=True:C214
			REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; 0)
		End if 
		
	End if 
	If (Count parameters:C259>5)
		//StockLev_ACLS2 ($4;$5;$6)
		If (<>StockAnal)
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Analysis:28=$4)
		Else 
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27])
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))>0)
			If ($5=<>SYS_t_BaseCurrency)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$5; *)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29="")
			Else 
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Currency:29=$5)
			End if 
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))>0)
			If ($6=DB_GetLedgerActualLayer)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$6; *)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27];  | ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27="")
			Else 
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Header_Layer:27=$6)
			End if 
		End if 
	Else 
		If (Not:C34($_bo_NoSearch))
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27])
		End if 
		
	End if 
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
		
	End if 
	If (Count parameters:C259>2)
		Case of 
			: ($3="A")
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8#0)
				
				$0:=Gen_Round((Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)); 2; 2)
			: ($3="F")
				QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Alloc_Type:10=True:C214)
				SELECTION TO ARRAY:C260([MOVEMENT_TYPES:60]Type_Code:1; $_at_AllocationMovementTypes)
				QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
				If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
					CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s1")
					QUERY SELECTION WITH ARRAY:C1050([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30; $_at_AllocationMovementTypes)
					If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
						CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "$s2")
						DIFFERENCE:C122("$s1"; "$s2"; "$s1")
						USE SET:C118("$s1")
					Else 
						USE SET:C118("$s1")
					End if 
				End if 
				
				$0:=Gen_Round((Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)); 2; 2)
			Else 
				$0:=Gen_Round((Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)); 2; 2)
		End case 
	Else 
		$0:=Gen_Round((Sum:C1([STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37)); 2; 2)
	End if 
End if 
UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
ERR_MethodTrackerReturn("StockLev_Fmul2"; $_t_oldMethodName)
