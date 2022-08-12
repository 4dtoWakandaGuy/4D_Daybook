//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_ProdName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2010 13:45
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

$_t_oldMethodName:=ERR_MethodTracker("Calls_ProdName")
Are_You_Sure
If (OK=1)
	
	ALL RECORDS:C47([SERVICE_CALLS:20])
	FIRST RECORD:C50([SERVICE_CALLS:20])
	While (Not:C34(End selection:C36([SERVICE_CALLS:20])))
		QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
		
		
		While (Not:C34(End selection:C36([SERVICE_CALLS_PRODUCTS:152])))
			RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Product_Code:1)
			[SERVICE_CALLS_PRODUCTS:152]Product_Name:5:=[PRODUCTS:9]Product_Name:2
			DB_SaveRecord(->[SERVICE_CALLS_PRODUCTS:152])
			NEXT RECORD:C51([SERVICE_CALLS_PRODUCTS:152])
		End while 
		DB_SaveRecord(->[SERVICE_CALLS:20])
		NEXT RECORD:C51([SERVICE_CALLS:20])
	End while 
End if 
ERR_MethodTrackerReturn("Calls_ProdName"; $_t_oldMethodName)