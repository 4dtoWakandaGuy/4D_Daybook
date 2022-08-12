//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr OI
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 13:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284(<>CompCode; <>ContCode; <>OrderCode; $_t_CurrentFormUsage; $_t_CurrentFormUsage3; $_t_CurrentOutputForm; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contr OI")
//Contracts
$_t_CurrentOutputForm:=WIN_t_CurrentOutputform
Menu_Record("Contr OI"; "Find Items by Company")
Contr_PP1
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
$_t_CurrentFormUsage3:=DB_t_CurrentFormUsage3
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
<>CompCode:=[CONTRACTS:17]Company_Code:1
<>ContCode:=""
<>OrderCode:=""
DB_t_CurrentFormUsage:="ContrOI"
//SEARCH([ORDERS];[ORDERS]Company Code=[CONTRACTS]Company Code)
Orders_Sel
Project_SelFast(->[ORDERS:24]; ->[ORDERS:24]Order_Code:3; ->[ORDER_ITEMS:25]; ->[ORDER_ITEMS:25]Order_Code:1)
Gen_Confirm("Do you want to show only Items not already allocated to a Contract?"; "Yes"; "No")
If (OK=1)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29="")
End if 
RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
If ([CONTRACT_TYPES:19]Transaction_if_PG:8)
	If ([CONTRACT_TYPES:19]Price_Group:7#"")
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2; >)
		DB_t_CurrentFormUsage3:="sadkjflksjdfkjlsdf234"
		QUERY SELECTION BY FORMULA:C207([ORDER_ITEMS:25]; Contr_OIPTSrc)
	End if 
End if 

If (Records in selection:C76([ORDER_ITEMS:25])>0)
	//vNo:=Records in selection([ORDER ITEMS])
	//DB_t_CurrentFormUsage:="Select"
	//OUTPUT FORM([ORDER ITEMS];"Items Out")
	//WIN_t_CurrentOutputform:="Items Out"
	//Open_Pro_Window ("Select Order Items";0;1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
	//FS_SetFormSort (WIN_t_CurrentOutputform)
	//WIn_SetFormSize (1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
	//D`ISPLAY SELECTION([ORDER ITEMS];*)
	//Close_ProWin
	DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])); True:C214)
	
	If (OK=1)
		//Userset
		If (Records in selection:C76([ORDER_ITEMS:25])>0)
			Gen_Confirm("Apply the Contract Code to "+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+" Order Items?"; "Yes"; "No")
			If (OK=1)
				RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
				FIRST RECORD:C50([ORDER_ITEMS:25])
				While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
					RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
					ContrI_PrGr
					[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					NEXT RECORD:C51([ORDER_ITEMS:25])
				End while 
			End if 
		End if 
	End if 
Else 
	Gen_Alert("No Order Items found"; "Cancel")
End if 
CREATE SET:C116([CONTRACTS:17]; "Master")
Contr_PP2
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
[CONTRACTS:17]Contract_Cost:7:=Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)
REDRAW:C174([CONTRACTS:17])
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
DB_t_CurrentFormUsage3:=$_t_CurrentFormUsage3
vNo:=Records in selection:C76([CONTRACTS:17])
WIN_t_CurrentOutputform:=$_t_CurrentOutputForm
ERR_MethodTrackerReturn("Contr OI"; $_t_oldMethodName)