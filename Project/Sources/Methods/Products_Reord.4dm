//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_Reord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/06/2010 15:02
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vP; vStockLevel; vStockUA)
	C_REAL:C285(vStockVal; vStockValUA)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_Reord")
//Products_Reord
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Products_File
READ ONLY:C145([PRODUCTS:9])
While (vP=1)
	DB_t_CurrentFormUsage:="Stock"
	Prod_SelP
	If (vP=1)
		If (Records in selection:C76([PRODUCTS:9])>0)
			//vNo:=Records in selection([PRODUCTS])
			
			//v`Layout:="Print"
			//MESSAGES OFF
			//ORDER BY([PRODUCTS];[PRODUCTS]Product Code;>)
			//Open_Pro_Window ("Re-Ordering Report";0;1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[PRODUCTS];WIN_t_CurrentOutputform)
			//MESSAGES ON
			//D`ISPLAY SELECTION([PRODUCTS];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])))
			If (OK=1)
				QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]ReOrdering:5=True:C214)
				If (Records in selection:C76([STOCK_TYPES:59])=0)
					Gen_Alert(Term_StoWT("Please specify Stock Types to be included for Re-Ordering in the Data Manager"); "Cancel")
				Else 
					Gen_Confirm(Term_StoWT("Do you want to only print Products with Stock Levels less than their Minimum?"); "Yes"; "As selected")
					If (OK=1)
						QUERY SELECTION BY FORMULA:C207([PRODUCTS:9]; (([PRODUCTS:9]Minimum:11>0) & ([PRODUCTS:9]Maintain_Stock:14=True:C214)))
						QUERY SELECTION BY FORMULA:C207([PRODUCTS:9]; Products_ReordS)
					End if 
					If (Records in selection:C76([PRODUCTS:9])>0)
						If (Not:C34(SR_ReportOK("ProdReord")))
							FORM SET OUTPUT:C54([PRODUCTS:9]; "Products_Stock")
							ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]Group_Code:3; >; [PRODUCTS:9]Brand_Code:4; >; [PRODUCTS:9]Model_Code:5; >)
							BREAK LEVEL:C302(2)
							ACCUMULATE:C303(vStockLevel; vStockVal; vStockUA; vStockValUA)
							vTitle:="RE-ORDERING REPORT"
							PRINT SELECTION:C60([PRODUCTS:9])
						End if 
					Else 
						Gen_Alert("None of the selected Products need Re-ordering"; "")
					End if 
				End if 
			End if 
			//Close_ProWin
			vP:=0
		Else 
			Gen_None("Products"; ->vP)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Products_Reord"; $_t_oldMethodName)