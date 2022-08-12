//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  01/11/2010 20:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_Menu; $1)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName; SerialNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_MenV")
$_bo_OK:=True:C214

If (Count parameters:C259>=1)
	
	$_l_Menu:=Sel_LPmi("StockCurr_MenV")
Else 
	$_l_Menu:=Num:C11($1)
End if 
If (BUT_p_ButtonStringPointer->="O@")
	If (Records in set:C195("Userset")>0)
		CUT NAMED SELECTION:C334([CURRENT_STOCK:62]; "CS")
		USE SET:C118("Userset")
		//◊SerialNo:=[CURRENT STOCK]Serial No
		//◊ProdCode:=[CURRENT STOCK]Product Code
		USE NAMED SELECTION:C332("CS")
		DBI_MenuDisplayRecords("Stock ItemsHistory"; <>MENU_l_BarModule; "CS")
		
		USE NAMED SELECTION:C332("CS")
	Else 
		Gen_Alert("Please first highlight an item"; "Try again")
		$_bo_OK:=False:C215
	End if 
Else 
	SerialNo:=[CURRENT_STOCK:62]Serial_Number:2
	//◊ProdCode:=[CURRENT STOCK]Product Code
	//we are in a record
	DBI_MenuDisplayRecords("Stock ItemsHistory"; <>MENU_l_BarModule; ""; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [CURRENT_STOCK:62]Product_Code:1; ->[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4; [CURRENT_STOCK:62]Serial_Number:2)
	
	
End if 
ERR_MethodTrackerReturn("StockCurr_MenV"; $_t_oldMethodName)
