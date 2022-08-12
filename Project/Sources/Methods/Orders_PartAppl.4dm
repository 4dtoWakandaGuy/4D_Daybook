//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PartAppl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2009 06:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0)
	C_DATE:C307($2; vDelDate)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PartAppl")
If ([ORDER_ITEMS:25]Product_Code:2#[PRODUCTS:9]Product_Code:1)
	RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
End if 
If ([PRODUCTS:9]Maintain_Stock:14)
	Case of 
		: ($1="D")
			[ORDER_ITEMS:25]Delivered:51:=Gen_Round(([ORDER_ITEMS:25]Delivered:51+([ORDER_ITEMS:25]Allocated:28-[ORDER_ITEMS:25]Delivered:51)); 2; 6)
			If ([ORDER_ITEMS:25]Delivered:51=[ORDER_ITEMS:25]Quantity:3)
				[ORDER_ITEMS:25]Delivery_Date:11:=vDelDate
			End if 
	End case 
Else 
	[ORDER_ITEMS:25]Delivered:51:=[ORDER_ITEMS:25]Quantity:3
	If (Count parameters:C259<2)
		[ORDER_ITEMS:25]Delivery_Date:11:=vDelDate
	Else 
		[ORDER_ITEMS:25]Delivery_Date:11:=$2
	End if 
End if 
ERR_MethodTrackerReturn("Orders_PartAppl"; $_t_oldMethodName)
