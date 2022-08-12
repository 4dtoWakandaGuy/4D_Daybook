If (False:C215)
	//Table Form Method Name: [ORDERS]Forecasts
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(vAmount)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [ORDERS].Forecasts"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	RELATE ONE:C42([ORDERS:24]Company_Code:1)
	RELATE ONE:C42([ORDERS:24]Contact_Code:2)
	Contact_Details
	vAmount:=Round:C94(([ORDERS:24]Total_Amount:6*([ORDERS:24]Forecast_PC:22/100)); 2)
End if 
ERR_MethodTrackerReturn("FM [ORDERS].Forecasts"; $_t_oldMethodName)
