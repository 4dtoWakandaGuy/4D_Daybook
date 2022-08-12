//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls SerRepLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vContName; vDetails; vTitle)
	C_TIME:C306(vTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls SerRepLP")
If ([SERVICE_CALLS:20]Resolved:9=True:C214)
	vTitle:="RESOLVED SERVICE CALL ("+[SERVICE_CALLS:20]Priority:10+")"
Else 
	vTitle:="UNRESOLVED SERVICE CALL ("+[SERVICE_CALLS:20]Priority:10+")"
End if 
vTime:=(Current time:C178)
RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
RELATE ONE:C42([SERVICE_CALLS:20]Contact_Code:2)
Company_Details
Contact_Details
vDetails:=vContName+Char:C90(13)+vDetails
RELATE ONE:C42([SERVICE_CALLS:20]Problem_Code:14)
RELATE ONE:C42([SERVICE_CALLS:20]Solution_Code:16)
QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
ERR_MethodTrackerReturn("Calls SerRepLP"; $_t_oldMethodName)