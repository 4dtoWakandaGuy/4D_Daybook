//%attributes = {}
If (False:C215)
	//Project Method Name:      PriceT_CheckCo2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2010 16:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT_CheckCo2")
If (Records in selection:C76([PRICE_TABLE:28])>1)  //If >1 check to see if one is for this company
	COPY NAMED SELECTION:C331([PRICE_TABLE:28]; "$Sel")
	QUERY SELECTION:C341([PRICE_TABLE:28]; [PRICE_TABLE:28]Company_Code:8=$1)
	PriceT_FilterDates
	If (Records in selection:C76([PRICE_TABLE:28])=0)
		USE NAMED SELECTION:C332("$Sel")
	End if 
	CLEAR NAMED SELECTION:C333("$Sel")
End if 
ERR_MethodTrackerReturn("PriceT_CheckCo2"; $_t_oldMethodName)