//%attributes = {}
If (False:C215)
	//Project Method Name:      StockI_Hist2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  11/11/2010 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; $_t_CurrentOutputform; vProdCode; vSerialNo; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_Hist2")
//StockI_Hist2
If ((vSerialNo#"") & (vProdCode=""))
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=vSerialNo)
Else 
	If ((vProdCode#"") & (vSerialNo=""))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=vProdCode)
	Else 
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=vProdCode; *)
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=vSerialNo)
	End if 
End if 
If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>0)
	vNo:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	FORM SET OUTPUT:C54([STOCK_MOVEMENT_ITEMS:27]; "Stock_Hist")
	WIN_t_CurrentOutputform:="Stock_Hist"
	Open_Pro_Window(Term_StoWT("View Stock_History"); 0; 1; ->[STOCK_MOVEMENT_ITEMS:27]; WIN_t_CurrentOutputform)
	
	FS_SetFormSort(WIN_t_CurrentOutputform)
	WIn_SetFormSize(1; ->[STOCK_MOVEMENT_ITEMS:27]; WIN_t_CurrentOutputform)
	//D  `ISPLAY SELECTION([STOCK ITEMS];*)
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	Close_ProWin
Else 
	Gen_Alert("No History found"; "Cancel")
End if 
ERR_MethodTrackerReturn("StockI_Hist2"; $_t_oldMethodName)