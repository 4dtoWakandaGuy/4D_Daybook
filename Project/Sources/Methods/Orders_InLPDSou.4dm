//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPDSou
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(ST_ai_StatusUsage;0)
	C_LONGINT:C283($_l_UsageRow; $_l_NextOrderItemSort; $_l_UsageRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPDSou")
$_l_UsageRow:=Find in array:C230(ST_ai_StatusUsage; 18)
If (([SOURCES:6]Product_Code:6#"") & ($_l_UsageRow>0))
	If (Modified record:C314([ORDER_ITEMS:25]))
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	End if 
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=[SOURCES:6]Product_Code:6)
	If (Records in selection:C76([ORDER_ITEMS:25])=0)
		CREATE RECORD:C68([ORDER_ITEMS:25])
		OrderI_No
		[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
		[ORDER_ITEMS:25]Product_Code:2:=[SOURCES:6]Product_Code:6
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		[ORDER_ITEMS:25]Quantity:3:=1
		$_l_NextOrderItemSort:=1
		[ORDERS:24]Sort_Number:27:=[ORDERS:24]Sort_Number:27+1
		//NextOrderRef:=ORDI_GetSortRef ([ORDERS]Order_Code;$_l_NextOrderItemSort)
		$_l_NextOrderItemSort:=ORDI_GetSortRef([ORDERS:24]Order_Code:3; $_l_NextOrderItemSort; Records in selection:C76([ORDER_ITEMS:25]))
		
		[ORDER_ITEMS:25]Sort_Order:26:=$_l_NextOrderItemSort
		[ORDERS:24]Sort_Number:27:=[ORDER_ITEMS:25]Sort_Order:26
		OrderI_SubVAT
		OrderI_SubLPPC2
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
	End if 
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
	Orders_InLPTot
	ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
End if 
ERR_MethodTrackerReturn("Orders_InLPDSou"; $_t_oldMethodName)
