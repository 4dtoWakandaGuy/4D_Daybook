//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SubLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 20:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ResetNumber; <>SalesItemDP)
	C_LONGINT:C283(<>OINo; $_l_Clash; $_l_FIeldNumber; $_l_FixNumberProcess; $_l_NextOrderSortReference; $_l_OrderItemNumber; $_l_TableNumber; $1)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubLPB")
//C_LONGINT($_l_Number)
//If ([ORDER ITEMS]Item Number=0)
// [ORDER ITEMS]Item Number:=1000000000+Sequence number([ORDER ITEMS])
// DB_SaveRecord(->[ORDER ITEMS])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
//  $_l_Number:=[ORDER ITEMS]Item Number
//Else
// $_l_Number:=0
//End if
$_l_NextOrderSortReference:=1
If (DB_t_CurrentFormUsage="Job@")
	If (DB_t_CurrentFormUsage#"JobTC")
		If ([ORDER_ITEMS:25]Job_Code:34="")
			[ORDER_ITEMS:25]Job_Code:34:=[JOBS:26]Job_Code:1
			If (BUT_p_ButtonStringPointer->="IS@")
				[ORDER_ITEMS:25]Job_Stage:35:=[JOB_STAGES:47]Stage_Code:2
			End if 
			[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
			$_l_NextOrderSortReference:=JOBs_GetSortref([JOBS:26]Job_Code:1; [JOB_STAGES:47]Stage_Code:2; $_l_NextOrderSortReference)
			//$_l_NextOrderSortReference:=ORDI_GetSortRef ([ORDERS]Order Code;$_l_NextOrderSortReference)
			[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
			[JOBS:26]Sort_No:22:=[ORDER_ITEMS:25]Sort_Order:26
			
			[JOBS:26]Sort_No:22:=[JOBS:26]Sort_No:22+1
			//[ORDER ITEMS]Sort Order:=[JOBS]Sort No
			[ORDER_ITEMS:25]Quantity:3:=1
			[ORDER_ITEMS:25]Price_Per:50:=1
			If ([COMPANIES:2]Company_Code:1#[JOBS:26]Company_Code:3)
				RELATE ONE:C42([JOBS:26]Company_Code:3)
			End if 
		End if 
	End if 
Else 
	If ([ORDER_ITEMS:25]Order_Code:1="")
		If (DB_t_CurrentFormUsage="NAT")
			[ORDER_ITEMS:25]Order_Code:1:=[SERVICE_CALLS:20]Call_Code:4
			[ORDER_ITEMS:25]Required_Date:10:=[SERVICE_CALLS:20]Call_Date:5
			[ORDER_ITEMS:25]Person:14:=[SERVICE_CALLS:20]Person:11
			If ([COMPANIES:2]Company_Code:1#[SERVICE_CALLS:20]Company_Code:1)
				RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
			End if 
		Else 
			[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
			[ORDER_ITEMS:25]Required_Date:10:=[ORDERS:24]Required_Date:9
			[ORDER_ITEMS:25]Person:14:=[ORDERS:24]Person:5
			
			[ORDERS:24]Sort_Number:27:=[ORDERS:24]Sort_Number:27+1
			$_l_NextOrderSortReference:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderSortReference; Records in selection:C76([ORDER_ITEMS:25]))
			
			[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderSortReference
			[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26
			
		End if 
		If (([ORDER_ITEMS:25]Quantity:3=0) & ([ORDER_ITEMS:25]Product_Name:13=""))
			[ORDER_ITEMS:25]Quantity:3:=1
			[ORDER_ITEMS:25]Price_Per:50:=1
		End if 
		If ([COMPANIES:2]Company_Code:1#[ORDERS:24]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
		End if 
	End if 
End if 
If ([ORDER_ITEMS:25]Tax_Code:12="")
	If ([COMPANIES:2]Default_TAX:41="")
		[ORDER_ITEMS:25]Tax_Code:12:=DB_GetLedgerDefaultSalesTax
	Else 
		[ORDER_ITEMS:25]Tax_Code:12:=[COMPANIES:2]Default_TAX:41
	End if 
End if 
If ([ORDER_ITEMS:25]Item_Number:27=0)  //$_l_Number)
	If (<>OINo=0)
		READ ONLY:C145([IDENTIFIERS:16])
		QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]Table_Number:1=14)
		<>OINo:=[IDENTIFIERS:16]Number:2
		UNLOAD RECORD:C212([IDENTIFIERS:16])
	End if 
	Repeat 
		$_l_OrderItemNumber:=<>OINo+AA_GetNextIDinMethod(->[ORDER_ITEMS:25]Item_Number:27; Sequence number:C244([ORDER_ITEMS:25]))
		SET QUERY DESTINATION:C396(3; $_l_Clash)
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$_l_OrderItemNumber)
		SET QUERY DESTINATION:C396(0)
		If ($_l_Clash>0)
			$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
			$_l_FIeldNumber:=Field:C253(->[ORDER_ITEMS:25]Item_Number:27)
			<>ResetNumber:=False:C215
			$_l_FixNumberProcess:=New process:C317("AA_SetNextID"; 256000; "Fixing_Number"; $_l_TableNumber; $_l_FIeldNumber; $_l_OrderItemNumber; <>OINo)
			Repeat 
				DelayTicks(60)
			Until (<>ResetNumber)
			<>ResetNumber:=False:C215
		End if 
		
	Until ($_l_Clash=0)
	[ORDER_ITEMS:25]Item_Number:27:=$_l_OrderItemNumber
	[ORDER_ITEMS:25]Print_Description:45:=<>SalesItemDP
End if 
If ([ORDER_ITEMS:25]State:46="")
	[ORDER_ITEMS:25]State:46:="A"
End if 
If (DB_t_CurrentFormUsage#"None")
	If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3))
		OBJECT SET ENTERABLE:C238([ORDER_ITEMS:25]Serial_Number:24; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_SubLPB"; $_t_oldMethodName)