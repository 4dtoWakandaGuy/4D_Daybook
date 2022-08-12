//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetStockTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/01/2011 18:31 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Codes; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	//ARRAY TEXT(DB_at_StockTypesCodes;0)
	//ARRAY TEXT(DB_at_StockTypesNames;0)
	C_BOOLEAN:C305(DB_bo_StockTypesReady)
	C_LONGINT:C283($_l_BlankRow; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetStockTypes")
If (Count parameters:C259>=1)
	READ ONLY:C145([STOCK_TYPES:59])
	ALL RECORDS:C47([STOCK_TYPES:59])
	
	SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; $_at_Codes; [STOCK_TYPES:59]Type_Name:2; $_at_Names)
	$_l_BlankRow:=Find in array:C230($_at_Codes; "")
	If ($_l_BlankRow>0)
		DELETE FROM ARRAY:C228($_at_Codes; $_l_BlankRow)
		DELETE FROM ARRAY:C228($_at_Names; $_l_BlankRow)
	End if 
	
	
	VARIABLE TO VARIABLE:C635($1; DB_at_StockTypesNames; $_at_Names; DB_at_StockTypesCodes; $_at_Codes)
	SET PROCESS VARIABLE:C370($1; DB_bo_StockTypesReady; True:C214)
End if 
ERR_MethodTrackerReturn("DB_GetStockTypes"; $_t_oldMethodName)