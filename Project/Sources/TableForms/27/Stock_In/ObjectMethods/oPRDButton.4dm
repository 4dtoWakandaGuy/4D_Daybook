If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]Stock_in.oPRDButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2013 15:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ProcessState; STK_SubProcPRD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oPRDButton"; Form event code:C388)

If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#"")
	If (STK_SubProcPRD=0)
		
		DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); Module_StockControl; ""; ->[PRODUCTS:9]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		
	Else 
		$_l_ProcessState:=Process state:C330(STK_SubProcPRD)
		If ($_l_ProcessState<0)
			DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); Module_StockControl; ""; ->[PRODUCTS:9]Product_Code:1; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
			
		Else 
			BRING TO FRONT:C326(STK_SubProcPRD)
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].Stock_in.oPRDButton"; $_t_oldMethodName)
