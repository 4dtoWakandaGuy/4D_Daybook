//%attributes = {}
If (False:C215)
	//Project Method Name:      Stock_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vSt)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_List")
//Stock_List
Start_Process
If (Stock_File)
	READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
	READ ONLY:C145([STOCK_MOVEMENTS:40])
	While (vSt=1)
		Stock_Sel
		If (vSt=1)
			If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
				CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "Master")
				//vNo:=Records in selection([STOCK ITEMS])
				//DB_t_CurrentFormUsage:="Print"
				//Open_Pro_Window (Term_StoWT ("Stock Items List");0;1;->[STOCK ITEMS];WIN_t_CurrentOutputform)
				
				//FS_SetFormSort (WIN_t_CurrentOutputform)
				//WIn_SetFormSize (1;->[STOCK ITEMS];WIN_t_CurrentOutputform)
				//DISPLAY SELECTION([STOCK ITEMS];*)
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])))
				
				
				If (OK=1)
					If (Not:C34(SR_ReportOK("StockItList")))
						FORM SET OUTPUT:C54([STOCK_MOVEMENT_ITEMS:27]; "Stock_List")
						ACCUMULATE:C303([STOCK_MOVEMENT_ITEMS:27]Quantity:12; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
						PRINT SELECTION:C60([STOCK_MOVEMENT_ITEMS:27])
					End if 
				End if 
				//Close_ProWin
				vSt:=0
			Else 
				Gen_None(Term_StoWT("Stock Items"); ->vSt)
			End if 
		End if 
	End while 
End if 
Process_End
ERR_MethodTrackerReturn("Stock_List"; $_t_oldMethodName)