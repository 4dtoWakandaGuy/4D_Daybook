//%attributes = {}
If (False:C215)
	//Project Method Name:      MZContr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(zComp)
	C_TEXT:C284($_t_oldMethodName; vCompCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MZContr")
//MZContracts
vCompCode:=[COMPANIES:2]Company_Code:1
NEXT RECORD:C51([COMPANIES:2])
Mail_MSRec
RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
While ((zComp=1) & (Not:C34(End selection:C36([COMPANIES:2]))) & ([COMPANIES:2]Company_Code:1=vCompCode))
	vCompCode:=[COMPANIES:2]Company_Code:1
	NEXT RECORD:C51([COMPANIES:2])
	RELATE ONE:C42([CONTRACTS:17]Company_Code:1)
End while 
ERR_MethodTrackerReturn("MZContr"; $_t_oldMethodName)