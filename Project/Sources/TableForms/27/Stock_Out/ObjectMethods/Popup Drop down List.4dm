If (False:C215)
	//object Name: [STOCK_MOVEMENT_ITEMS]Stock Out.Popup Drop down List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/06/2012 23:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(STK_at_Types;0)
	//ARRAY TEXT(STK_at_TypesCode;0)
	C_BOOLEAN:C305(STK_bo_currentSelectionKnown; STK_bo_ExcludeZero)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENT_ITEMS].Stock Out.Popup Drop down List"; Form event code:C388)
If (STK_at_Types>0)
	If (Not:C34(STK_bo_currentSelectionKnown))
		COPY NAMED SELECTION:C331([STOCK_MOVEMENT_ITEMS:27]; "UNfilteredSelection")
		STK_bo_currentSelectionKnown:=True:C214
	End if 
	If (STK_at_Types>2)
		USE NAMED SELECTION:C332("UNfilteredSelection")
		QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_Add_To_Stock_Type:31=STK_at_TypesCode{STK_at_Types})
		If (STK_bo_ExcludeZero)
			QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]X_Residual_Stock_Quantity:37>0)
		End if 
	Else 
		USE NAMED SELECTION:C332("UNfilteredSelection")
	End if 
	
	
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENT_ITEMS].Stock Out.Popup Drop down List"; $_t_oldMethodName)
