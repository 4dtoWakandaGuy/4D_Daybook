//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_100
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
	C_LONGINT:C283(Macro_MRECORDNO)
	C_REAL:C285(Macro_DEL; Macro_DELRETAIL; Macro_EQTAMT)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_100")
//Macro CodeCalc Delivery

Macro_MRECORDNO:=[ORDER_ITEMS:25]Item_Number:27
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)

If (Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)>1500)
	Macro_EQTAMT:=Sum:C1([ORDER_ITEMS:25]Sales_Amount:7)
	Macro_DEL:=Round:C94(Macro_EQTAMT/250; 0)*2.5
Else 
	Macro_DEL:=15
End if 
Macro_DELRETAIL:=Macro_DEL
Gen_Confirm("Yes"; "No")
If (OK=1)
Else 
	Macro_DEL:=Num:C11(Request:C163("Enter your delivery charge"))
End if 
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=Macro_MRECORDNO)
FIRST RECORD:C50([ORDER_ITEMS:25])
ERR_MethodTrackerReturn("Macro_100"; $_t_oldMethodName)