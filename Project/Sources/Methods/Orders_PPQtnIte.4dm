//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPQtnIte
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($Tot)
	C_TEXT:C284($_t_FieldDelimiter; $_t_oldMethodName; $Rec; Enclosures; Products; ProductsD)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPQtnIte")
If ((Documents_4DWriteAccessType(False:C215))="W")
	$_t_FieldDelimiter:=Char:C90(9)
Else 
	$_t_FieldDelimiter:=", "
End if 
$Rec:=Char:C90(13)
$Tot:=0
Products:=""
ProductsD:=""
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	$Tot:=Round:C94(($Tot+[ORDER_ITEMS:25]Sales_Amount:7); 2)
	Products:=Products+[ORDER_ITEMS:25]Product_Name:13+$_t_FieldDelimiter+String:C10([ORDER_ITEMS:25]Quantity:3)+$_t_FieldDelimiter+String:C10([ORDER_ITEMS:25]Sales_Amount:7; "|Accounts")+$Rec
	ProductsD:=ProductsD+[ORDER_ITEMS:25]Product_Name:13+$_t_FieldDelimiter+String:C10([ORDER_ITEMS:25]Quantity:3)+$_t_FieldDelimiter+String:C10([ORDER_ITEMS:25]Sales_Amount:7; "|Accounts")+$Rec
	If ([ORDER_ITEMS:25]Print_Description:45)
		ProductsD:=ProductsD+"   "+[ORDER_ITEMS:25]Description:44+$Rec+$Rec
	Else 
		ProductsD:=ProductsD+$Rec
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
Products:=Products+$Rec+"TOTAL"+$_t_FieldDelimiter+$_t_FieldDelimiter+String:C10($Tot; "|Accounts")+$Rec
ProductsD:=ProductsD+$Rec+"TOTAL"+$_t_FieldDelimiter+$_t_FieldDelimiter+String:C10($Tot; "|Accounts")+$Rec
Enclosures:=[ORDERS:24]Enclosures:21
ERR_MethodTrackerReturn("Orders_PPQtnIte"; $_t_oldMethodName)