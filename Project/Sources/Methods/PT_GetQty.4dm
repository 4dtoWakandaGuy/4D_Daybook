//%attributes = {}
If (False:C215)
	//Project Method Name:      PT_GetQty
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
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PT_GetQty")
//this method will take the current seleciton of price table
//and reduce it to quantity match
If (Records in selection:C76([PRICE_TABLE:28])>0)
	If ($1>0)
		CREATE SET:C116([PRICE_TABLE:28]; "temp")
		QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9<=$1; *)
		QUERY SELECTION:C341([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Quantity_To:10>=$1)
		If (Records in selection:C76([PRICE_TABLE:28])>0)
			REDUCE SELECTION:C351([PRICE_TABLE:28]; 1)
		Else 
			USE SET:C118("temp")
			CLEAR SET:C117("temp")
			QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0)
		End if 
	Else 
		QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Quantity_From:9=0)
	End if 
End if 
ERR_MethodTrackerReturn("PT_GetQty"; $_t_oldMethodName)
