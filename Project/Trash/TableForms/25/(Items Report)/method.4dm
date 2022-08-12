If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]Items Report
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
	C_LONGINT:C283($_l_event)
	C_REAL:C285(vAmount; vPrice; vQuantity)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].Items Report"; Form event code:C388)
//Items Print
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		vCompName:=[COMPANIES:2]Company_Name:2
		Case of 
			: ([ORDER_ITEMS:25]Sales_Price:4=0)
				OBJECT SET FONT SIZE:C165(vPrice; 1)
				OBJECT SET FONT SIZE:C165(vQuantity; 1)
				OBJECT SET FONT SIZE:C165(vAmount; 1)
			: (([ORDER_ITEMS:25]Sales_Price:4<0) & (DB_t_CurrentFormUsage="Credit"))
				vPrice:=Abs:C99([ORDER_ITEMS:25]Sales_Price:4)
				vQuantity:=[ORDER_ITEMS:25]Quantity:3
				vAmount:=Abs:C99([ORDER_ITEMS:25]Sales_Amount:7)
			Else 
				vPrice:=[ORDER_ITEMS:25]Sales_Price:4
				vQuantity:=[ORDER_ITEMS:25]Quantity:3
				vAmount:=[ORDER_ITEMS:25]Sales_Amount:7
		End case 
End case 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].Items Report"; $_t_oldMethodName)
