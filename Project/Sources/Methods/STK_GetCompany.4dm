//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetCompany
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CallBackProcess; $3)
	C_REAL:C285($1)
	C_TEXT:C284($_t_CompanyAddress; $_t_CompanyCode; $_t_CompanyName; $_t_Contacts; $_t_oldMethodName; $_t_OrderCode; $_t_ReturnData; $2; STK_t_Company)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetCompany")

If (Count parameters:C259>=3)
	READ ONLY:C145(*)
	$_l_CallBackProcess:=$1
	Case of 
		: ($2="SO Item Number")
			If ($3>0)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=$3)
				$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
				QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
				
			Else 
				REDUCE SELECTION:C351([ORDER_ITEMS:25]; 0)
				
				$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
				REDUCE SELECTION:C351([ORDERS:24]; 0)
			End if 
			$_t_OrderCode:="Order code: "+$_t_OrderCode
			$_t_Contacts:=""
			If ([ORDERS:24]Contact_Code:2#"")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[ORDERS:24]Contact_Code:2)
				$_t_Contacts:=[CONTACTS:1]Contact_Name:31+Char:C90(13)
			End if 
			$_t_CompanyCode:=[ORDERS:24]Company_Code:1
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
			$_t_CompanyName:=""
			If ([COMPANIES:2]Company_Name:2#"")
				$_t_CompanyName:=[COMPANIES:2]Company_Name:2+Char:C90(13)
			End if 
			
			$_t_CompanyAddress:=[COMPANIES:2]ADDRESS:60
			$_t_ReturnData:=$_t_OrderCode+Char:C90(13)+$_t_Contacts+$_t_CompanyName+$_t_CompanyAddress
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; STK_t_Company; $_t_ReturnData)
		: ($2="PO Item Number")
			QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]POitemID:16=$3)
			QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=[PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18)
			
			$_t_OrderCode:="Purchase Order : "+[PURCHASE_ORDERS:57]Purchase_Order_Number:2
			
			$_t_CompanyCode:=[PURCHASE_ORDERS:57]Company_Code:1
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_t_CompanyCode)
			$_t_CompanyName:=""
			If ([COMPANIES:2]Company_Name:2#"")
				$_t_CompanyName:=[COMPANIES:2]Company_Name:2+Char:C90(13)
			End if 
			
			$_t_CompanyAddress:=[COMPANIES:2]ADDRESS:60
			$_t_ReturnData:=$_t_OrderCode+Char:C90(13)+$_t_CompanyName+$_t_CompanyAddress
			SET PROCESS VARIABLE:C370($_l_CallBackProcess; STK_t_Company; $_t_ReturnData)
	End case 
End if 
ERR_MethodTrackerReturn("STK_GetCompany"; $_t_oldMethodName)