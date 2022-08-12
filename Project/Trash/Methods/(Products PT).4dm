//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products PT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/06/2010 12:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283(DB_l_ButtonClickedFunction; vNo)
	C_TEXT:C284(<>GenPrice; <>ProdCode; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products PT")
//Products PT
Menu_Record("Products PT"; "Price Table")
If ((DB_GetModuleSettingByNUM(Module_PriceTable))<2)
	Gen_Alert("You do not have access to the Price Table Module"; "Cancel")
Else 
	If ([PRODUCTS:9]Product_Code:1="")
		Gen_Alert("Please first create the Product"; "Try again")
	Else 
		DB_SaveRecord(->[PRODUCTS:9])
		AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
		CUT NAMED SELECTION:C334([PRODUCTS:9]; "Products")
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
		QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Group_Code:6=[PRODUCTS:9]Group_Code:3; *)
		QUERY:C277([PRICE_TABLE:28];  | ; [PRICE_TABLE:28]Brand_Code:7=[PRODUCTS:9]Brand_Code:4)
		CREATE SET:C116([PRICE_TABLE:28]; "Extra")
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=""; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Group_Code:6=""; *)
		QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Brand_Code:7="")
		If (<>GenPrice#"")
			QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Price_Code:2#<>GenPrice)
		End if 
		CREATE SET:C116([PRICE_TABLE:28]; "Extra2")
		UNION:C120("Extra2"; "Extra"; "Extra")
		USE SET:C118("Extra")
		CLEAR SET:C117("Extra")
		CLEAR SET:C117("Extra2")
		<>ProdCode:=[PRODUCTS:9]Product_Code:1
		DB_l_ButtonClickedFunction:=0
		$_bo_OK:=PriceT_File
		If ($_bo_OK)
			Open_Pro_Window("Products Price Table"; 0; 1; ->[PRICE_TABLE:28]; WIN_t_CurrentOutputform)
			If (Records in selection:C76([PRODUCTS:9])>0)
				CREATE SET:C116([PRICE_TABLE:28]; "Master")
				ORDER BY:C49([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1; <; [PRICE_TABLE:28]Group_Code:6; <; [PRICE_TABLE:28]Brand_Code:7; <; [PRICE_TABLE:28]Company_Code:8; <)
				FS_SetFormSort(WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[PRICE_TABLE:28]; WIN_t_CurrentOutputform)
				MODIFY SELECTION:C204([PRICE_TABLE:28]; *)
			Else 
				DB_MenuNewRecord("Price Table")
				
			End if 
			<>ProdCode:=""
			Close_ProWin
		End if 
		//DEFAULT TABLE([PRODUCTS])
		READ WRITE:C146([PRODUCTS:9])
		USE NAMED SELECTION:C332("Products")
		CREATE SET:C116([PRODUCTS:9]; "Master")
		vNo:=Records in selection:C76([PRODUCTS:9])
	End if 
End if 
ERR_MethodTrackerReturn("Products PT"; $_t_oldMethodName)
