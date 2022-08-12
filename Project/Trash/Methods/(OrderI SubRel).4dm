//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI SubRel
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI SubRel")
Case of 
	: (DB_t_CurrentFormUsage="NAT")
		If ([SERVICE_CALLS:20]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
		End if 
	: (DB_t_CurrentFormUsage="Job")
		If ([JOBS:26]Company_Code:3#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([JOBS:26]Company_Code:3)
		End if 
	Else 
		If ([ORDERS:24]Company_Code:1#[COMPANIES:2]Company_Code:1)
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
		End if 
End case 
ERR_MethodTrackerReturn("OrderI SubRel"; $_t_oldMethodName)