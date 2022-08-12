//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_InLabour
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 16:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($Lab)
	C_TEXT:C284(<>LabAct; <>LabProd; $_t_oldMethodName; $_t_Search)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InLabour")
//Calls_InLabour
Menu_Record("Calls_InLabour"; "Calculate Labour")
$_t_Search:=[SERVICE_CALLS:20]Call_Code:4+"@"
QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_t_Search; *)
QUERY:C277([DIARY:12];  | ; [DIARY:12]Call_Code:25=[SERVICE_CALLS:20]Call_Code:4; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=True:C214; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Action_Code:9=<>LabAct)
If (Records in selection:C76([DIARY:12])>0)
	$Lab:=Sum:C1([DIARY:12]Units:20)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=<>LabProd)
	If (Records in selection:C76([ORDER_ITEMS:25])=0)
		CREATE RECORD:C68([ORDER_ITEMS:25])
		OrderI_No
		[ORDER_ITEMS:25]Order_Code:1:=[SERVICE_CALLS:20]Call_Code:4
		RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
		If ([COMPANIES:2]Default_TAX:41="")
			[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
		Else 
			[ORDER_ITEMS:25]Tax_Code:12:=[COMPANIES:2]Default_TAX:41
		End if 
		[ORDER_ITEMS:25]Product_Code:2:=<>LabProd
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		[ORDER_ITEMS:25]Product_Name:13:=[PRODUCTS:9]Product_Name:2
		[ORDER_ITEMS:25]Quantity:3:=$Lab
		OrderI_SubLPPC2
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	Else 
		If ([ORDER_ITEMS:25]Item_Locked:16=False:C215)
			[ORDER_ITEMS:25]Quantity:3:=$Lab
			Calc_Item
			DB_SaveRecord(->[ORDER_ITEMS:25])
			AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
		Else 
			Gen_Alert("The Labour Item is locked and cannot be updated"; "")
		End if 
	End if 
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
	REDRAW:C174([ORDER_ITEMS:25])
Else 
	Gen_Alert("No suitable Diary Items found (ie Done, Action "+<>LabAct+", with this Call Code)"; "")
End if 
ERR_MethodTrackerReturn("Calls_InLabour"; $_t_oldMethodName)