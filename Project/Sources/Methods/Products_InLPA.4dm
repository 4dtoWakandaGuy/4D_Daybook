//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 14:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLPA")
//TRACE

PROD_SaveSubEnitities


If ((DB_GetModuleSettingByNUM(1))#5)
	DB_SaveRecord(->[CONTRACT_RECORD_ANALYSIS:88])
	DB_SaveRecord(->[COMPONENTS:86])
	UNLOAD RECORD:C212([CONTRACT_RECORD_ANALYSIS:88])
	UNLOAD RECORD:C212([COMPONENTS:86])
End if 
If (DB_GetModuleSettingByNUM(Module_StockControl)>0)
	
	If (Not:C34([PRODUCTS:9]x_Product_Stock_is_Setup:59))
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[PRODUCTS:9]Product_Code:1)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
			[PRODUCTS:9]x_Product_Stock_is_Setup:59:=True:C214
		Else 
			//Gen_Confirm ("This product has not had stock items updated for the revised stock management. Would you like to do this now?";"Yes";"Later")
			
			If (OK=1)
				//STK_Manage2011Updates ([PRODUCTS]Product_Code)
				
				
			End if 
			OK:=1
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Products_InLPA"; $_t_oldMethodName)
