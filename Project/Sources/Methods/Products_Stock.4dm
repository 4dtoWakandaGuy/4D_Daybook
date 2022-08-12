//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_Stock
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 15:03
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo; vNo2; vP; vStockLevel; vStockUA)
	C_REAL:C285(vStockVal; vStockValUA)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_StockLevelsName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_Stock")
//Products_Stock
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
$_t_StockLevelsName:=Term_StoWT("Stock Levels & Value")
Start_Process($_t_StockLevelsName)
Products_File
READ ONLY:C145([PRODUCTS:9])
READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
While (vP=1)
	DB_t_CurrentFormUsage:="Stock"
	Prod_SelP
	If (vP=1)
		If (Records in selection:C76([PRODUCTS:9])>0)
			vNo:=Records in selection:C76([PRODUCTS:9])
			vNo2:=vNo
			DB_t_CurrentFormUsage:="Print"
			ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Brand_Code:4; >; [PRODUCTS:9]Model_Code:5; >)
			Open_Pro_Window($_t_StockLevelsName; 0; 1; ->[PRODUCTS:9]; WIN_t_CurrentOutputform)
			// FS_SetFormSort (WIN_t_CurrentOutputform)
			WIn_SetFormSize(1; ->[PRODUCTS:9]; WIN_t_CurrentOutputform)
			DISPLAY SELECTION:C59([PRODUCTS:9]; *)
			If (OK=1)
				FORM SET OUTPUT:C54("Products_Stock")
				If (vNo2#Records in selection:C76([PRODUCTS:9]))
					ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Brand_Code:4; >; [PRODUCTS:9]Model_Code:5; >)
				End if 
				BREAK LEVEL:C302(2)
				ACCUMULATE:C303(vStockLevel; vStockVal; vStockUA; vStockValUA)
				vTitle:=Uppercase:C13(Term_StoWT("STOCK LEVELS & VALUES"))
				PRINT SELECTION:C60([PRODUCTS:9])
				
			End if 
			Close_ProWin
			vP:=0
		Else 
			Gen_None("Products"; ->vP)
		End if 
	End if 
End while 
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Products_Stock"; $_t_oldMethodName)
