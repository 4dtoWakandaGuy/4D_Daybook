//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_ReportAllProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2013 14:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelection)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(MDOC)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_ReportAllProducts")

QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59=True:C214)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_SO_item_if_Allocate:24#0; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]X_CopiedFromID:17=0; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31="P"; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Add_to_Current_Stock_ID:22>0; *)
QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]x_Header_Date:26>!2012-07-01!)
DISTINCT VALUES:C339([STOCK_MOVEMENT_ITEMS:27]Product_Code:1; $_at_ProductCodes)
QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
COPY NAMED SELECTION:C331([PRODUCTS:9]; "TEMP")
MDOC:=Create document:C266(""; "TEXT")
$_l_RecordsinSelection:=Records in selection:C76([PRODUCTS:9])
For ($_l_Index; 1; Records in selection:C76([PRODUCTS:9]))
	USE NAMED SELECTION:C332("TEMP")
	GOTO SELECTED RECORD:C245([PRODUCTS:9]; $_l_Index)
	STK_Outputhistory([PRODUCTS:9]Product_Code:1; Mdoc)
End for 
CLOSE DOCUMENT:C267(mdoc)
ERR_MethodTrackerReturn("STK_ReportAllProducts"; $_t_oldMethodName)
