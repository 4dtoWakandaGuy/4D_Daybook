//%attributes = {}
If (False:C215)
	//Project Method Name:      PT_GetPO
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PT_GetPO")
//this method will make sure we are not using cost prices on sales orders
If (Count parameters:C259>=1)
	If ($1)  //purchase-so want only cost prices
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			CREATE SET:C116([PRICE_TABLE:28]; "Temp")
			RELATE ONE SELECTION:C349([PRICE_TABLE:28]; [PRICE_GROUPS:18])
			QUERY SELECTION:C341([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Cost_Prices:4=True:C214)
			If (Records in selection:C76([PRICE_GROUPS:18])>0)
				RELATE MANY SELECTION:C340([PRICE_TABLE:28]Price_Code:2)
				CREATE SET:C116([PRICE_TABLE:28]; "Temp2")
				INTERSECTION:C121("Temp2"; "Temp"; "Temp")
				CLEAR SET:C117("Temp2")
			Else 
				REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
				CREATE SET:C116([PRICE_TABLE:28]; "Temp")
			End if 
			USE SET:C118("Temp")
			CLEAR SET:C117("Temp")
			
		End if 
		
	Else 
		//sale so only want sales prices
		CREATE SET:C116([PRICE_TABLE:28]; "Temp")
		RELATE ONE SELECTION:C349([PRICE_TABLE:28]; [PRICE_GROUPS:18])
		QUERY SELECTION:C341([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Cost_Prices:4=False:C215)
		If (Records in selection:C76([PRICE_GROUPS:18])>0)
			RELATE MANY SELECTION:C340([PRICE_TABLE:28]Price_Code:2)
			CREATE SET:C116([PRICE_TABLE:28]; "Temp2")
			INTERSECTION:C121("Temp2"; "Temp"; "Temp")
			CLEAR SET:C117("Temp2")
		Else 
			REDUCE SELECTION:C351([PRICE_TABLE:28]; 0)
			CREATE SET:C116([PRICE_TABLE:28]; "Temp")
		End if 
		USE SET:C118("Temp")
		CLEAR SET:C117("Temp")
		
	End if 
	
	
End if 
ERR_MethodTrackerReturn("PT_GetPO"; $_t_oldMethodName)