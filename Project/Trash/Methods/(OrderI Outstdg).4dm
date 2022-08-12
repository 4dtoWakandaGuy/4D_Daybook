//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI Outstdg
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 13:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vOrdI)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI Outstdg")
//OrderI Outstdg
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
OrderI_File
READ ONLY:C145([ORDER_ITEMS:25])
READ ONLY:C145([ORDERS:24])
READ ONLY:C145([COMPANIES:2])
While (vOrdI=1)
	DB_t_CurrentFormUsage:="NotDel"
	
	OrderI_SelP
	If (vOrdI=1)
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			//vNo:=Records in selection([ORDER ITEMS])
			//DB_t_CurrentFormUsage:="Print"
			//Open_Pro_Window ("Outstdg Order Items";0;1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([ORDER ITEMS];*)
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])))
			If (OK=1)
				If (Not:C34(SR_ReportOK("OrdItOut")))
					FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Outstdg Report")
					PRINT SELECTION:C60([ORDER_ITEMS:25])
				End if 
			End if 
			//Close_ProWin
			vOrdI:=0
		Else 
			Gen_None("Order Items"; ->vOrdI)
		End if 
	End if 
End while 
Process_End
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("OrderI Outstdg"; $_t_oldMethodName)
