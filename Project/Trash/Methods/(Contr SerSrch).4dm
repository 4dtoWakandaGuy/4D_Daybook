//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr SerSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/11/2010 13:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; $_t_Search; $_t_CurrentOutputform; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contr SerSrch")
//Contracts Serial Search
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Menu_Record("Contr SerSrch"; "Find Items by Serial No")
$_t_Search:=Gen_Request("Serial No to search for:")
If ((OK=1) & ($_t_Search#""))
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	Contr_PP1
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Serial_Number:24=$_t_Search)
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		If (Records in selection:C76([ORDER_ITEMS:25])>1)
			//OUTPUT FORM([ORDER ITEMS];"Items Out")
			//WIN_t_CurrentOutputform:="Items Out"
			
			//v`Layout:="Select"
			//Open_Pro_Window ("Select Order Items";0;1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
			
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
			//D`ISPLAY SELECTION([ORDER ITEMS];*)
			//Close_ProWin
			//Userset
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])); True:C214)
			
		End if 
		If (OK=1)
			If (Records in selection:C76([ORDER_ITEMS:25])>0)
				FIRST RECORD:C50([ORDER_ITEMS:25])
				RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
				Gen_Confirm("Add "+[PRODUCTS:9]Product_Name:2+" to the Contract?"; "Yes"; "No")
				If (OK=1)
					RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
					RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
					ContrI_PrGr
					[ORDER_ITEMS:25]Contract_Code:29:=[CONTRACTS:17]Contract_Code:3
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
					If ([CONTRACTS:17]Company_Code:1="")
						RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
						[CONTRACTS:17]Company_Code:1:=[ORDERS:24]Company_Code:1
						[CONTRACTS:17]Contact_Code:2:=[ORDERS:24]Contact_Code:2
					End if 
				End if 
			End if 
		End if 
	Else 
		Gen_Alert("Serial No not found"; "Cancel")
	End if 
	Contr_PP2
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Contract_Code:29=[CONTRACTS:17]Contract_Code:3)
	[CONTRACTS:17]Contract_Cost:7:=Sum:C1([ORDER_ITEMS:25]Contract_Cost:30)
	REDRAW:C174([CONTRACTS:17])
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
End if 
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Contr SerSrch"; $_t_oldMethodName)