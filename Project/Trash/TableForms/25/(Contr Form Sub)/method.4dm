If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Contr Form Sub
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
	C_LONGINT:C283(<>DataSize)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Contr Form Sub"; Form event code:C388)
If (Form event code:C388=On Printing Detail:K2:18)
	SetFontsByPointerParameter(<>DataSize; ""; 0; ->[ORDER_ITEMS:25]Product_Name:13; ->[ORDER_ITEMS:25]Serial_Number:24; ->[ORDER_ITEMS:25]Contract_Cost:30; ->[ORDER_ITEMS:25]Quantity:3)
	//Set_Fonts ("[ORDER ITEMS]Product Name+[ORDER ITEMS]Serial No+[ORDER ITEMS]Contract Cost";◊DataSize)
	//Set_Fonts ("[ORDER ITEMS]Quantity";◊DataSize)
End if 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Contr Form Sub"; $_t_oldMethodName)
