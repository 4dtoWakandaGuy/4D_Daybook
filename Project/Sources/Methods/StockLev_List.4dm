//%attributes = {}
If (False:C215)
	//Project Method Name:      StockLev_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: StockLev_List
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo; vNo2; vPu)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_List")
//StockLev_List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform

Start_Process
If (StockLev_File)
	READ ONLY:C145([STOCK_LEVELS:58])
	
	While (vPu=1)
		StockLev_Sel
		If (vPu=1)
			If (Records in selection:C76([STOCK_LEVELS:58])>0)
				QUERY:C277([STOCK_TYPES:59]; [STOCK_TYPES:59]User_Owned:4=True:C214)
				If (Records in selection:C76([STOCK_TYPES:59])>0)
					Gen_Confirm(Term_StoWT("Do you want to check that you are only printing Stock Types ")+"owned by your Company?"; "Yes"; "No")
					If (OK=1)
						FIRST RECORD:C50([STOCK_TYPES:59])
						CREATE SET:C116([STOCK_TYPES:59]; "Master")
						CREATE EMPTY SET:C140([STOCK_TYPES:59]; "Master2")
						While (Not:C34(End selection:C36([STOCK_TYPES:59])))
							USE SET:C118("Master")
							QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Stock_Type:2=[STOCK_TYPES:59]Type_Code:1)
							CREATE SET:C116([STOCK_LEVELS:58]; "Extra")
							UNION:C120("Master2"; "Extra"; "Master2")
							NEXT RECORD:C51([STOCK_TYPES:59])
						End while 
						USE SET:C118("Master2")
					End if 
				End if 
				If (Records in selection:C76([STOCK_LEVELS:58])>0)
					CREATE SET:C116([STOCK_LEVELS:58]; "Master")
					//vNo:=Records in selection([STOCK LEVELS])
					//DB_t_CurrentFormUsage:="Print"
					//ORDER BY([STOCK LEVELS];[STOCK LEVELS]Layer Code;>;[STOCK LEVELS]Currency Code;>;[STOCK LEVELS]Analysis Code;>;[STOCK LEVELS]Stock Type;>;[STOCK LEVELS]Product Code;>)
					
					//vNo2:=vNo
					//Open_Pro_Window (Term_StoWT ("Stock Levels & Values");0;1;->[STOCK LEVELS];WIN_t_CurrentOutputform)
					//FS_SetFormSort (WIN_t_CurrentOutputform)
					//WIn_SetFormSize (1;->[STOCK LEVELS];WIN_t_CurrentOutputform)
					//D`ISPLAY SELECTION([STOCK LEVELS];*)
					
					DBI_MenuSelectRecords(Table name:C256(Table:C252(->[STOCK_LEVELS:58])))
					If (OK=1)
						If (vNo2#vNo)
							ORDER BY:C49([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9; >; [STOCK_LEVELS:58]Currency_Code:8; >; [STOCK_LEVELS:58]Analysis_Code:7; >; [STOCK_LEVELS:58]Stock_Type:2; >; [STOCK_LEVELS:58]Product_Code:1; >)
						End if 
						If (Not:C34(SR_ReportOK("StockLevVal")))
							FORM SET OUTPUT:C54([STOCK_LEVELS:58]; "StockLev_List")
							BREAK LEVEL:C302(4)
							ACCUMULATE:C303([STOCK_LEVELS:58]Free_Level:3; [STOCK_LEVELS:58]Free_Cost:5; [STOCK_LEVELS:58]Allocated_Level:4; [STOCK_LEVELS:58]Allocated_Cost:6)
							PRINT SELECTION:C60([STOCK_LEVELS:58])
						End if 
					End if 
					//Close_ProWin
					vPu:=0
				Else 
					Gen_None(Term_StoWT("Stock Levels"); ->vPu)
				End if 
			Else 
				Gen_None(Term_StoWT("Stock Levels"); ->vPu)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("StockLev_List"; $_t_oldMethodName)