//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls SerSrch
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/11/2010 09:39
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_CurrentOutputform; $_t_oldMethodName; $_t_Search; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls SerSrch")
//Calls Serial Search
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
Menu_Record("Calls SerSrch"; "Items by Serial No")
If ([SERVICE_CALLS:20]Call_Code:4="")
	Calls_Code
End if 
If (Modified record:C314([SERVICE_CALLS:20]))
	DB_SaveRecord(->[SERVICE_CALLS:20])
End if 
If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
$_t_Search:=Gen_Request("Serial No to find:")
If ((OK=1) & ($_t_Search#""))
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Serial_Number:24=$_t_Search)
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		OK:=1
		If (Records in selection:C76([ORDER_ITEMS:25])>1)
			//OUTPUT FORM([ORDER ITEMS];"Items Out")
			//WIN_t_CurrentOutputform:="Items Out"
			//Userset_Empty (->[ORDER ITEMS])
			//$`Lay:=DB_t_CurrentFormUsage
			//DB_t_CurrentFormUsage:="Select"
			//vNo:=Records in selection([ORDER ITEMS])`
			//Open_Pro_Window ("Select a Serial No";0;1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
			//FS_SetFormSort (WIN_t_CurrentOutputform)
			//WIn_SetFormSize (1;->[ORDER ITEMS];WIN_t_CurrentOutputform)
			
			//D`ISPLAY SELECTION([ORDER ITEMS];*)
			//Close_ProWin
			//DB_t_CurrentFormUsage:=$Lay
			//Userset
			DBI_MenuSelectRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])); True:C214)  //True opens the selection in another process
			
		End if 
		If ((Records in selection:C76([ORDER_ITEMS:25])>0) & (OK=1))
			FIRST RECORD:C50([ORDER_ITEMS:25])
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			Gen_Confirm("Add "+[ORDER_ITEMS:25]Product_Name:13+" to the Call?"; "Yes"; "No")
			If (OK=1)
				CREATE RECORD:C68([SERVICE_CALLS_PRODUCTS:152])
				[SERVICE_CALLS_PRODUCTS:152]ID:7:=AA_GetNextID(->[SERVICE_CALLS_PRODUCTS:152]ID:7)
				[SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8:=[SERVICE_CALLS:20]Call_Code:4
				[SERVICE_CALLS_PRODUCTS:152]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
				[SERVICE_CALLS_PRODUCTS:152]Product_Name:5:=[ORDER_ITEMS:25]Product_Name:13
				[SERVICE_CALLS_PRODUCTS:152]Serial_Number:2:=[ORDER_ITEMS:25]Serial_Number:24
				[SERVICE_CALLS_PRODUCTS:152]Contract_Code:3:=[ORDER_ITEMS:25]Contract_Code:29
				DB_SaveRecord(->[SERVICE_CALLS_PRODUCTS:152])
				
				RELATE ONE:C42([ORDER_ITEMS:25]Contract_Code:29)
				RELATE ONE:C42([CONTRACTS:17]Contract_Type_Code:4)
				Calls_ContCharg
				If ([SERVICE_CALLS:20]Company_Code:1="")
					RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
					[SERVICE_CALLS:20]Company_Code:1:=[ORDERS:24]Company_Code:1
					[SERVICE_CALLS:20]Contact_Code:2:=[ORDERS:24]Contact_Code:2
				End if 
				DB_SaveRecord(->[SERVICE_CALLS:20])
			End if 
		End if 
	Else 
		Gen_Alert("Serial No not found"; "")
	End if 
	WIN_t_CurrentOutputform:=$_t_CurrentOutputform
	Calls_InLPB2
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
	QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
	
	REDRAW:C174([SERVICE_CALLS:20])
	GOTO OBJECT:C206([SERVICE_CALLS:20]Call_Date:5)
End if 
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
vNo:=Records in selection:C76([SERVICE_CALLS:20])
ERR_MethodTrackerReturn("Calls SerSrch"; $_t_oldMethodName)