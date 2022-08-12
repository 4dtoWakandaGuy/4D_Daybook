If (False:C215)
	//Table Form Method Name: [STOCK_LEVELS]StockLev_List
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
	C_REAL:C285(vQuantity; vT1; vT2; vT3; vT4; vTotal)
	C_TEXT:C284($_t_oldMethodName; vTitleR)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_LEVELS].StockLev_List"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: (Form event code:C388=On Header:K2:17)
		
		vTitleR:=Uppercase:C13(Term_StoWT("Stock Levels & Values"))
	: ($_l_event=On Load:K2:1)
		
		vQuantity:=Round:C94(([STOCK_LEVELS:58]Free_Level:3+[STOCK_LEVELS:58]Allocated_Level:4); 2)
		vTotal:=Round:C94(([STOCK_LEVELS:58]Free_Cost:5+[STOCK_LEVELS:58]Allocated_Cost:6); 2)
	: ($_l_event=On Printing Break:K2:19)
		
		vT1:=Round:C94((Subtotal:C97([STOCK_LEVELS:58]Free_Level:3)); 2)
		vT2:=Round:C94((Subtotal:C97([STOCK_LEVELS:58]Free_Cost:5)); 2)
		vT3:=Round:C94((Subtotal:C97([STOCK_LEVELS:58]Allocated_Level:4)); 2)
		vT4:=Round:C94((Subtotal:C97([STOCK_LEVELS:58]Allocated_Cost:6)); 2)
		vQuantity:=Round:C94((vT1+vT3); 2)
		vTotal:=Round:C94((vT2+vT4); 2)
End case 
ERR_MethodTrackerReturn("FM [STOCK_LEVELS].StockLev_List"; $_t_oldMethodName)
