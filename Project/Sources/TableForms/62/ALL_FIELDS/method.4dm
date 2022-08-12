If (False:C215)
	//Table Form Method Name: [CURRENT_STOCK]ALL_FIELDS
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


$_t_oldMethodName:=ERR_MethodTracker("FM [CURRENT_STOCK].ALL_FIELDS"; Form event code:C388)
//ORDER BY([CURRENT STOCK];[CURRENT STOCK]XREC_ID;>)
ERR_MethodTrackerReturn("FM [CURRENT_STOCK].ALL_FIELDS"; $_t_oldMethodName)