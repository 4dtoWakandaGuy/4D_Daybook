If (False:C215)
	//object Name: [ORDERS]Forecasts.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vStatus; vTitle2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Forecasts.Variable5"; Form event code:C388)
vStatus:=[TABLE_RECORD_STATES:90]Listing_Name:2
vTitle2:="Subtotals for "+vStatus
ERR_MethodTrackerReturn("OBJ [ORDERS].Forecasts.Variable5"; $_t_oldMethodName)