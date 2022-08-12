//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_ContCharg
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
	C_DATE:C307(<>DB_d_CurrentDate; vEDate; vSDate)
	C_TEXT:C284($_t_oldMethodName; vCharge)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_ContCharg")
vEDate:=[CONTRACTS:17]End_Date:6
vSDate:=[CONTRACTS:17]Start_Date:5
If ((<>DB_d_CurrentDate<=vEDate) & (<>DB_d_CurrentDate>=vSDate) & ([CONTRACT_TYPES:19]Contract_Type_Code:1#"NONE"))
	vCharge:="N"
	If ([SERVICE_CALLS:20]Charge:8="")
		[SERVICE_CALLS:20]Charge:8:="N"
	End if 
Else 
	vCharge:="Y"
	[SERVICE_CALLS:20]Charge:8:="Y"
End if 
[SERVICE_CALLS:20]Contract_Type_Code:7:=[CONTRACTS:17]Contract_Type_Code:4
[SERVICE_CALLS:20]Response_Req:22:=Calls_RespCalc([SERVICE_CALLS:20]Call_Date:5)
If ([SERVICE_CALLS:20]Charge:8="Y")
	[SERVICE_CALLS:20]Your_Order_Number:25:="CHARGE"
Else 
	[SERVICE_CALLS:20]Your_Order_Number:25:="CONTRACT"
End if 
ERR_MethodTrackerReturn("Calls_ContCharg"; $_t_oldMethodName)