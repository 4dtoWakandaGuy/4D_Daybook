//%attributes = {}
If (False:C215)
	//Project Method Name:      StockI_CurrDisp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   11/11/2010 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_BOOLEAN:C305(<>STK_bo_TypesInited)
	C_LONGINT:C283($_l_StockTypeRow; vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $1; $LAY; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vStatus; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockI_CurrDisp")
$_t_CurrentOutputform:=WIN_t_CurrentOutputform

If (Not:C34(<>STK_bo_TypesInited))
	Order_Buttons
	<>STK_bo_TypesInited:=True:C214
End if 
$_l_StockTypeRow:=Find in array:C230(STK_at_AllStockTypes; vStatus)
If ($_l_StockTypeRow>0)
	STK_at_AllStockTypes:=$_l_StockTypeRow
End if 

vNo:=Records in selection:C76([CURRENT_STOCK:62])
//StockCurr_FileI
//StockCurr_FileO
//If (Count parameters=1)
//Open_Pro_Window ($1;0;1;->[CURRENT STOCK];WIN_t_CurrentOutputform)
//Else
//Open_Pro_Window ("Select Current Stock for Movement";0;1;->[CURRENT STOCK];WIN_t_CurrentOutputform)
//End if
//$Lay:=DB_t_CurrentFormUsage
//DB_t_CurrentFormUsage:="Select"
//Userset_Empty (->[CURRENT STOCK])
//FS_SetFormSort (WIN_t_CurrentOutputform)
//WIn_SetFormSize (1;->[CURRENT STOCK];WIN_t_CurrentOutputform)
//D`ISPLAY SELECTION([CURRENT STOCK];*)
//Userset
//FIRST RECORD([CURRENT STOCK])
//Close_ProWin
//v`Layout:=$Lay

DBI_MenuSelectRecords(Table name:C256(Table:C252(->[CURRENT_STOCK:62])); True:C214)


vNo:=Records in selection:C76([CURRENT_STOCK:62])
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("StockI_CurrDisp"; $_t_oldMethodName)
