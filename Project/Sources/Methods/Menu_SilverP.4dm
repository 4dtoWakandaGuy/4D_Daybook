//%attributes = {}
If (False:C215)
	//Project Method Name:      Menu_SilverP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 19:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(MENU_bo_Overwrite)
	C_LONGINT:C283(<>BAR; <>BarPos; <>MENU_l_BarModule; <>MenuProc; $_l_MenuProc; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_StockTitle)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Menu_SilverP")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>1)
	$_l_MenuProc:=$1
Else 
	$_l_MenuProc:=<>MenuProc
End if 
CheckModBynumber(30; "Daybook Silver Plus")
If (OK=1)
	If ((<>Bar#45) & (<>Bar#46)) | (MENU_bo_Overwrite)
		Menu_ModEnable
		$_t_StockTitle:=Term_StoWT("Stock")
		If ($_t_StockTitle#"Stock")
			<>Bar:=46
		Else 
			<>Bar:=45
		End if 
		<>MENU_l_BarModule:=30
		<>BarPos:=2
		DB_SetMenuBar(""; <>Bar; $_l_MenuProc)
		Menu_DisFile
		If ((DB_GetModuleSettingByNUM(Module_SalesOrders))<2)
			DB_MenuAction("Orders"; "Enter Sales Orders"; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Orders"; "View Sales Orders"; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Orders"; "  List Orders"; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Orders"; "  List Order Items"; 3; ""; $_l_MenuProc; False:C215)
			//DISABLE MENU ITEM(5;1;◊MenuProc)
			//DISABLE MENU ITEM(5;2;◊MenuProc)
			//DISABLE MENU ITEM(5;8;◊MenuProc)
			//DISABLE MENU ITEM(5;9;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_PurchaseOrders))<2)
			DB_MenuAction("Orders"; "Enter Purchase Orders  "; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Orders"; "ViewPurchase Orders  "; 3; ""; $_l_MenuProc; False:C215)
			DB_MenuAction("Orders"; "List Purchase Orders  "; 3; ""; $_l_MenuProc; False:C215)
			// DISABLE MENU ITEM(5;4;◊MenuProc)
			// DISABLE MENU ITEM(5;5;◊MenuProc)
			//  DISABLE MENU ITEM(5;10;◊MenuProc)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
			DB_MenuAction("Inventory"; ""; 3; ""; $_l_MenuProc; False:C215)
			//  DISABLE MENU ITEM(6;0;◊MenuProc)
		End if 
	End if 
	BRING TO FRONT:C326($_l_MenuProc)
End if 
MENU_bo_Overwrite:=False:C215
ERR_MethodTrackerReturn("Menu_SilverP"; $_t_oldMethodName)
