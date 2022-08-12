//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_isSourceStockType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  16/06/2011 09:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(STK_ab_typeisSource;0)
	//ARRAY TEXT(STK_at_SourceStockTypes;0)
	C_BOOLEAN:C305($_bo_UseSelection; $0; STK_bo_SourceTypesInited)
	C_LONGINT:C283($_l_SelectedRecordNumber; $_l_StockTypeRow)
	C_TEXT:C284($_t_oldMethodName; $_t_StockType; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_isSourceStockType")
If (Not:C34(STK_bo_SourceTypesInited))
	ARRAY TEXT:C222(STK_at_SourceStockTypes; 0)
	ARRAY BOOLEAN:C223(STK_ab_typeisSource; 0)
	STK_bo_SourceTypesInited:=True:C214
End if 
$0:=False:C215
If (Count parameters:C259>=1)
	$_l_StockTypeRow:=Find in array:C230(STK_at_SourceStockTypes; $1)
	If ($_l_StockTypeRow<0)
		$_bo_UseSelection:=False:C215
		If (Records in selection:C76([STOCK_TYPES:59])>1)
			$_bo_UseSelection:=True:C214
			COPY NAMED SELECTION:C331([STOCK_TYPES:59]; "$STTemp")
			$_l_SelectedRecordNumber:=Selected record number:C246([STOCK_TYPES:59])
			$_t_StockType:=""
		Else 
			$_t_StockType:=[STOCK_TYPES:59]Type_Code:1
		End if 
		QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$1)
		$0:=[STOCK_TYPES:59]Source_Stock:10
		APPEND TO ARRAY:C911(STK_at_SourceStockTypes; $1)
		APPEND TO ARRAY:C911(STK_ab_typeisSource; [STOCK_TYPES:59]Source_Stock:10)
		UNLOAD RECORD:C212([STOCK_TYPES:59])
		
		
		If ($_bo_UseSelection)
			USE NAMED SELECTION:C332("$STTemp")
			GOTO SELECTED RECORD:C245([STOCK_TYPES:59]; $_l_SelectedRecordNumber)
		Else 
			If ($_t_StockType#"") & ($_t_StockType#$1)
				QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]Type_Code:1=$_t_StockType)
			End if 
		End if 
	Else 
		$0:=STK_ab_typeisSource{$_l_StockTypeRow}
	End if 
End if 
ERR_MethodTrackerReturn("STK_isSourceStockType"; $_t_oldMethodName)
