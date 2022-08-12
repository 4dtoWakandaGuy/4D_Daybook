//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetSalesOrderDate
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
	C_DATE:C307($0)
	C_LONGINT:C283($1; $3)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetSalesOrderDate")
$0:=!00-00-00!
If (Count parameters:C259>=2)
	If ($1>0) & ($2#"")
		Case of 
			: ($1=Table:C252(->[ORDERS:24]))
				
				
				If ([ORDERS:24]Order_Code:3#$2)
					QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$2)
				End if 
				If ($3>0)
					$0:=[ORDERS:24]SORT_Date:57
				Else 
					If ([ORDERS:24]Forecast_Date:23>!00-00-00!)
						$0:=[ORDERS:24]Forecast_Date:23
					End if 
				End if 
				
		End case 
	End if 
	
End if 
ERR_MethodTrackerReturn("SP_GetSalesOrderDate"; $_t_oldMethodName)
