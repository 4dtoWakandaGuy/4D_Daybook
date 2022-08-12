//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Move MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/09/2010 22:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut)
	C_LONGINT:C283(<>AutoProc; $_l_Menu)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; <>ProdCode; $_t_oldMethodName; $_t_Parameter; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Move MenV")

If (Count parameters:C259>=1)
	$_t_Parameter:=$1
	$_l_Menu:=Num:C11($_t_Parameter)
Else 
	$_l_Menu:=Sel_LPmi("Move MenV")
End if 
<>ContCode:=""
<>CompCode:=[STOCK_MOVEMENTS:40]Company_From:2
<>ProdCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
UNLOAD RECORD:C212([PRODUCTS:9])
<>DB_bo_AutoOut:=False:C215
<>AutoFind:=True:C214
<>AutoProc:=vProc
<>AutoFile:="Stock Movt"
Case of 
	: ($_l_Menu=1)
		//DBI_MenuDisplayRecords ("Companies";Module_StockControl ;"";->[COMPANIES]Company Code;[STOCK MOVEMENTS]Company From)
		DBI_DisplayRecord(0; Table:C252(->[COMPANIES:2]); ""; [STOCK_MOVEMENTS:40]Company_From:2)
		
	: ($_l_Menu=2)
		If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
			DBI_DisplayRecord(0; Table:C252(->[PRODUCTS:9]); ""; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		End if 
		//DBI_MenuDisplayRecords ("Products";Module_StockControl ;"";->[PRODUCTS]Product Code;[STOCK ITEMS]Product Code)
		//ZProducts_Mod ([STOCK ITEMS]Product Code)
	: ($_l_Menu=4)
		If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
			DBI_MenuDisplayRecords("Stock ItemsHistory"; Module_StockControl; ""; ->[STOCK_MOVEMENT_ITEMS:27]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		End if 
		//StockI_Hist
End case 
ERR_MethodTrackerReturn("Move MenV"; $_t_oldMethodName)
