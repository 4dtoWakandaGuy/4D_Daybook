//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_Ord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/03/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cList; rOrd; vNo; vNo2; vOrd; vP)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_Ord")
//Mail_Orders
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Start_Process
Start_ProcMail
Orders_File
FORM SET INPUT:C55([ORDERS:24]; "Order_In")  //NG April 2004 removed reference to ◊screen
//NG may 2004 removed the usage of the 'v' form here
WIN_t_CurrentInputForm:="Order_In"
READ ONLY:C145([ORDERS:24])

READ ONLY:C145([ORDER_ITEMS:25])
READ ONLY:C145([COMPANIES:2])
READ ONLY:C145([CONTACTS:1])
rOrd:=1
While (vOrd=1)
	Orders_Sel
	If (vOrd=1)
		If (Records in selection:C76([ORDERS:24])>0)
			//vNo:=Records in selection([ORDERS])
			//vNo2:=vNo
			//ORDER BY([ORDERS];[ORDERS]Company Code;>)
			//v`Layout:="Print"
			//Open_Pro_Window ("Mail_Orders";0;1;->[ORDERS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[ORDERS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([ORDERS];*)  `NG may 2004 added table
			
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDERS:24])); True:C214)
			If (OK=1)
				vNo:=Records in selection:C76([ORDERS:24])
				If (vNo2#vNo)
					ORDER BY:C49([ORDERS:24]Company_Code:1; >)
				End if 
				
				MAsk_Print(->[ORDERS:24])
				
				If (vP=1)
					MAsk_MS(->[ORDERS:24])
					If (OK=1)
						If (cList=1)
							FORM SET OUTPUT:C54([ORDERS:24]; "Orders_List")
							MList_Print(->[ORDERS:24])
						End if 
						MailP_Let(->[ORDERS:24])
						MailP_Lab(->[ORDERS:24])
						MailP_Env(->[ORDERS:24])
						MailP_Exp(->[ORDERS:24])
					End if 
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
ERR_MethodTrackerReturn("Mail_Ord"; $_t_oldMethodName)
