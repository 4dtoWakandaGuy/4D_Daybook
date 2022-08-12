//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetPOItemNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/05/2012 17:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process; $_l_Retries; $0; $1; $2; STK_l_POITEMITD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("STK_GetPOItemNumber")
If (Count parameters:C259>=1)
	Case of 
		: (Count parameters:C259=1)
			$0:=0
			STK_l_POITEMITD:=0
			
			$_l_Process:=New process:C317("STK_GetPOItemNumber"; 256000; "Get Po Item number"; $1; Current process:C322)
			$_l_Retries:=0
			While (Process state:C330($_l_Process)>=0) & (Process_Name($_l_Process)="Get Po Item number")
				
				$_l_Retries:=$_l_Retries+1
				DelayTicks(60*(1+$_l_Retries))
			End while 
			$0:=STK_l_POITEMITD
		: (Count parameters:C259>1)
			READ ONLY:C145([STOCK_MOVEMENT_ITEMS:27])
			QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
			SET PROCESS VARIABLE:C370($2; STK_l_POITEMITD; [STOCK_MOVEMENT_ITEMS:27]Purchase_Order_ItemNumber:21)
	End case 
	
End if 
ERR_MethodTrackerReturn("STK_GetPOItemNumber"; $_t_oldMethodName)
