//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_PrintOrdersForecast
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/11/2010 13:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORD_PrintOrdersForecast")
CREATE SET:C116([ORDERS:24]; "$Temp")

If (Records in set:C195("ListboxSet0")>0)
	USE SET:C118("ListboxSet0")
End if 
If (OK=1) & (Records in selection:C76([ORDERS:24])>0)
	If (Not:C34(SR_ReportOK("OrdFore")))
		FORM SET OUTPUT:C54([ORDERS:24]; "Forecasts")
		ORDER BY:C49([ORDERS:24]; [ORDERS:24]State:15; >; [ORDERS:24]Person:5; >; [ORDERS:24]Forecast_Date:23; >)
		BREAK LEVEL:C302(2)
		ACCUMULATE:C303([ORDERS:24]Total_Amount:6; vAmount)
		PRINT SELECTION:C60([ORDERS:24])
	End if 
End if 

USE SET:C118("$temp")
DB_SetFormSortOrder(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
DB_SetFormMenuoptions
ERR_MethodTrackerReturn("ORD_PrintOrdersForecast"; $_t_oldMethodName)