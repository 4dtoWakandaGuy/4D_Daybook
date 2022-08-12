If (False:C215)
	//Table Form Method Name: [SERVICE_CALLS]Calls_List
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SERVICE_CALLS].Calls_List"; Form event code:C388)
RELATE ONE:C42([SERVICE_CALLS:20]Company_Code:1)
RELATE ONE:C42([SERVICE_CALLS:20]Contact_Code:2)
Contact_Details
RELATE ONE:C42([SERVICE_CALLS:20]Person:11)
RELATE ONE:C42([SERVICE_CALLS:20]Problem_Code:14)
ERR_MethodTrackerReturn("FM [SERVICE_CALLS].Calls_List"; $_t_oldMethodName)