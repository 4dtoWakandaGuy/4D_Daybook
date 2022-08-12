//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_ProdName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 05:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_ProdName")
vNo:=Records in selection:C76([ORDER_ITEMS:25])
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
CREATE SET:C116([ORDER_ITEMS:25]; "Master")
//DB_t_CurrentFormUsage:="Select"
//OUTPUT FORM([PRODUCTS];"Products_Out")
//WIN_t_CurrentOutputform:="Products_Out"
//FS_SetFormSort (WIN_t_CurrentOutputform)
//WIn_SetFormSize (1;->[PRODUCTS];WIN_t_CurrentOutputform)
//D`ISPLAY SELECTION([PRODUCTS];*)
//If (Records in set("Userset")>0)
//USE SET("Userset")
//End if

DBI_MenuSelectRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); True:C214)
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
DB_t_CurrentFormUsage:=""
[ORDER_ITEMS:25]Product_Code:2:=[PRODUCTS:9]Product_Code:1
[ORDER_ITEMS:25]Product_Name:13:=[PRODUCTS:9]Product_Name:2
ERR_MethodTrackerReturn("OrderI_ProdName"; $_t_oldMethodName)
