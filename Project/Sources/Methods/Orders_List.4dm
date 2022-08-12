//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 13:20
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vOrd)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_List")
//Orders_List
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Orders_File
READ ONLY:C145([ORDERS:24])
READ ONLY:C145([ORDER_ITEMS:25])
While (vOrd=1)
	Orders_Sel
	If (vOrd=1)
		If (Records in selection:C76([ORDERS:24])>0)
			//vNo:=Records in selection([ORDERS])
			//DB_t_CurrentFormUsage:="Print"
			//Open_Pro_Window ("List Orders";0;1;->[ORDERS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[ORDERS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([ORDERS];*)
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDERS:24])))
			
			If (OK=1)
				If (Not:C34(SR_ReportOK("OrdList")))
					FORM SET OUTPUT:C54([ORDERS:24]; "Orders_List")
					ORDER BY:C49([ORDERS:24]; [ORDERS:24]Company_Code:1; >; [ORDERS:24]Order_Date:4; >)
					BREAK LEVEL:C302(1)
					ACCUMULATE:C303([ORDERS:24]Total_Amount:6; [ORDERS:24]Total_TAX:7; [ORDERS:24]Total_Total:8; [ORDERS:24]Total_Cost:11; [ORDERS:24]Total_Margin:12)
					PRINT SELECTION:C60([ORDERS:24])
				End if 
			End if 
			//Close_ProWin
			vOrd:=0
		Else 
			Gen_None("Orders"; ->vOrd)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Orders_List"; $_t_oldMethodName)
