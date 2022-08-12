//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_FindCurrent
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/04/2010 12:50
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; Stock_bo_StockUpdated)
	C_LONGINT:C283($_l_Index; $1)
	C_REAL:C285(Stock_r_AllocCost; Stock_r_AllocLevel; Stock_r_FreeCost; Stock_r_FreeLevel)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_oldMethodName; $_t_ProductCode; $_t_StockType; $_t_UniqueConstruct; $_t_Values; $2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("STOCK_FindCurrent")
//THIS METHOD WILL FIND THE CURRENT STOCK RECORDS FOR A STOCK LEVEL
Stock_bo_StockUpdated:=False:C215
While (Semaphore:C143("CurrentStock"+$2))  //Prevent any other process from creating the same current stock
	ALERT:C41("in Stock FindCurrent")
	DelayTicks(2)
End while 
QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14=$2+"@")
If (Records in selection:C76([CURRENT_STOCK:62])=0)
	//break it up
	READ WRITE:C146([CURRENT_STOCK:62])
	$_t_ProductCode:=Substring:C12($2; 1; Length:C16($2)-(6*4))
	$_t_Values:=Substring:C12($2; Length:C16($2)-(6*4)+1; Length:C16($2))
	If (Length:C16($_t_Values)<24)
		//TRACE
	End if 
	$_t_CurrencyCode:=Substring:C12($_t_Values; 1; 6)
	Repeat 
		If ($_t_CurrencyCode[[1]]=" ")
			$_t_CurrencyCode:=Substring:C12($_t_CurrencyCode; 2; Length:C16($_t_CurrencyCode))
		End if 
		If (Length:C16($_t_CurrencyCode)>0)
			$_bo_OK:=($_t_CurrencyCode[[1]]#" ")
		Else 
			$_bo_OK:=True:C214
		End if 
	Until ($_bo_OK)
	
	$_t_LayerCode:=Substring:C12($_t_Values; 7; 6)
	Repeat 
		If ($_t_LayerCode[[1]]=" ")
			$_t_LayerCode:=Substring:C12($_t_LayerCode; 2; Length:C16($_t_LayerCode))
		End if 
		If (Length:C16($_t_LayerCode)>0)
			$_bo_OK:=($_t_LayerCode[[1]]#" ")
		Else 
			$_bo_OK:=True:C214
		End if 
	Until ($_bo_OK)
	$_t_StockType:=Substring:C12($_t_Values; 13; 6)
	Repeat 
		If ($_t_StockType[[1]]=" ")
			$_t_StockType:=Substring:C12($_t_StockType; 2; Length:C16($_t_StockType))
		End if 
		If (Length:C16($_t_StockType)>0)
			$_bo_OK:=($_t_StockType[[1]]#" ")
		Else 
			$_bo_OK:=True:C214
		End if 
	Until ($_bo_OK)
	$_t_AnalysisCode:=Substring:C12($_t_Values; 19; 6)
	Repeat 
		If ($_t_AnalysisCode[[1]]=" ")
			$_t_AnalysisCode:=Substring:C12($_t_AnalysisCode; 2; Length:C16($_t_AnalysisCode))
		End if 
		If (Length:C16($_t_AnalysisCode)>0)
			$_bo_OK:=($_t_AnalysisCode[[1]]#" ")
		Else 
			$_bo_OK:=True:C214
		End if 
	Until ($_bo_OK)
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=$_t_ProductCode; *)
	If ($_t_CurrencyCode#"")
		QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Currency_Code:11=$_t_CurrencyCode; *)
	End if 
	If ($_t_LayerCode#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Layer_Code:12=$_t_LayerCode; *)
	End if 
	If ($_t_StockType#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=$_t_StockType; *)
	End if 
	If ($_t_AnalysisCode#"")
		QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Analysis_Code:10=$_t_AnalysisCode; *)
	End if 
	QUERY:C277([CURRENT_STOCK:62])
	If (Not:C34(In transaction:C397))
		DB_lockFile(->[CURRENT_STOCK:62])
		
		$_t_Location:=(" "*(6-Length:C16([CURRENT_STOCK:62]Location:8)))+[CURRENT_STOCK:62]Location:8
		$_t_UniqueConstruct:=$2+$_t_Location
		APPLY TO SELECTION:C70([CURRENT_STOCK:62]; [CURRENT_STOCK:62]UniqueConstruct:14:=$_t_UniqueConstruct)
		
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENT_STOCK:62]))
	Else 
		FIRST RECORD:C50([CURRENT_STOCK:62])
		For ($_l_Index; 1; Records in selection:C76([CURRENT_STOCK:62]))
			$_t_Location:=(" "*(6-Length:C16([CURRENT_STOCK:62]Location:8)))+[CURRENT_STOCK:62]Location:8
			[CURRENT_STOCK:62]UniqueConstruct:14:=$2+$_t_Location
			DB_SaveRecord(->[CURRENT_STOCK:62])
			AA_CheckFileUnlockedByTableNUM(Table:C252(->[CURRENT_STOCK:62]))
			NEXT RECORD:C51([CURRENT_STOCK:62])
		End for 
	End if 
End if 

//here we must now have a collection of current stock??????
Stock_r_FreeLevel:=0
Stock_r_AllocLevel:=0
Stock_r_FreeCost:=0
Stock_r_AllocCost:=0

FIRST RECORD:C50([CURRENT_STOCK:62])
For ($_l_Index; 1; Records in selection:C76([CURRENT_STOCK:62]))
	
	If ([CURRENT_STOCK:62]Item_Number:5=0)
		Stock_r_FreeLevel:=Stock_r_FreeLevel+[CURRENT_STOCK:62]Quantity:4
		Stock_r_FreeCost:=Stock_r_FreeCost+Round:C94([CURRENT_STOCK:62]Total_Cost:9; 2)
		
	Else 
		Stock_r_AllocLevel:=Stock_r_AllocLevel+[CURRENT_STOCK:62]Quantity:4
		Stock_r_AllocCost:=Stock_r_AllocCost+Round:C94([CURRENT_STOCK:62]Total_Cost:9; 2)
	End if 
	NEXT RECORD:C51([CURRENT_STOCK:62])
	
End for 
UNLOAD RECORD:C212([CURRENT_STOCK:62])
READ ONLY:C145([CURRENT_STOCK:62])
CLEAR SEMAPHORE:C144("CurrentStock"+$2)  //Prevent any other process from creating the same current stock

SET PROCESS VARIABLE:C370($1; Stock_r_FreeLevel; Stock_r_FreeLevel)
SET PROCESS VARIABLE:C370($1; Stock_r_FreeCost; Stock_r_FreeCost)
SET PROCESS VARIABLE:C370($1; Stock_r_AllocLevel; Stock_r_AllocLevel)
SET PROCESS VARIABLE:C370($1; Stock_r_AllocCost; Stock_r_AllocCost)
SET PROCESS VARIABLE:C370($1; Stock_bo_StockUpdated; True:C214)
ERR_MethodTrackerReturn("STOCK_FindCurrent"; $_t_oldMethodName)