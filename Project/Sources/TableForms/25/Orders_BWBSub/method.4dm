If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Orders_BWBSub
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; i)
	C_TEXT:C284($_t_oldMethodName; vTitle3; vTitle4; vTitle6; vTitle7; vTitle8)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Orders_BWBSub"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Printing Detail:K2:18) & (Not:C34(DB_bo_NoLoad))
		
		
		vTitle3:=STR_LeadZeros(String:C10(i); 2)
		i:=i+1
		vTitle4:=Str_TrailSpaces(Uppercase:C13(Substring:C12([ORDER_ITEMS:25]Product_Name:13; 1; 24)); 24)
		vTitle6:=STR_LeadZeros(String:C10(Abs:C99(Int:C8([ORDER_ITEMS:25]Quantity:3))); 5)
		vTitle7:=Str_ZeroAmt(Abs:C99([ORDER_ITEMS:25]Sales_Price:4); 17)
		If ([ORDER_ITEMS:25]TAX_Amount:8#0)
			vTitle8:="Y S"
		Else 
			vTitle8:="N X"
		End if 
End case 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Orders_BWBSub"; $_t_oldMethodName)
