//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_InLPSol
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306(<>SYS_ti_DefaultSVSResponse)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InLPSol")
If ([SERVICE_CALLS:20]Solution_Date:18=!00-00-00!)
	[SERVICE_CALLS:20]Solution_Date:18:=<>DB_d_CurrentDate
	[SERVICE_CALLS:20]Elapsed_Time:19:=(([SERVICE_CALLS:20]Solution_Date:18-[SERVICE_CALLS:20]Call_Date:5)*<>SYS_ti_DefaultSVSResponse)-[SERVICE_CALLS:20]Call_Time:6+Current time:C178
End if 
ERR_MethodTrackerReturn("Calls_InLPSol"; $_t_oldMethodName)