//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_GettransType
	//------------------ Method Notes ------------------
	//CCM_GetCCTransType
	//this method will go to the audit record find out which CC clearance was used an go to the preferences to find out what Trans_Type to use
	//the default is to return the default
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 18:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_GettransType")
$0:=DB_GetLedgerTRANSRECpost
ERR_MethodTrackerReturn("CCM_GettransType"; $_t_oldMethodName)