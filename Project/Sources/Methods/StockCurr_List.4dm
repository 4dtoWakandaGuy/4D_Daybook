//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 16:21
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

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_List")
//Current Stock_List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
If (StockCurr_File)
	FORM SET OUTPUT:C54([CURRENT_STOCK:62]; "StockCurr_Out")
	WIN_t_CurrentOutputform:="StockCurr_Out"
	READ ONLY:C145([CURRENT_STOCK:62])
	
	While (vPu=1)
		StockCurr_Sel
		If (vPu=1)
			If (Records in selection:C76([CURRENT_STOCK:62])>0)
				
				DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])))
				
				
				If (OK=1)
					If (vNo2#vNo)
						ORDER BY:C49([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Layer_Code:12; >; [CURRENT_STOCK:62]Currency_Code:11; >; [CURRENT_STOCK:62]Analysis_Code:10; >; [CURRENT_STOCK:62]Stock_Type:3; >; [CURRENT_STOCK:62]Product_Code:1; >; [CURRENT_STOCK:62]Location:8; >; [CURRENT_STOCK:62]Cost_Price:6; >)
					End if 
					If (Not:C34(SR_ReportOK("StockCuList")))
						FORM SET OUTPUT:C54([CURRENT_STOCK:62]; "StockCurr_List")
						BREAK LEVEL:C302(6)
						ACCUMULATE:C303([CURRENT_STOCK:62]Quantity:4; [CURRENT_STOCK:62]Total_Cost:9)
						PRINT SELECTION:C60([CURRENT_STOCK:62])
						
					End if 
				End if 
				Close_ProWin
				vPu:=0
			Else 
				Gen_None(Term_StoWT("Current Stock"); ->vPu)
			End if 
		End if 
	End while 
End if 

Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("StockCurr_List"; $_t_oldMethodName)