//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("Contracts_InLPA")
If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
If (Modified record:C314([CONTRACT_RECORD_ANALYSIS:88]))
	DB_SaveRecord(->[CONTRACT_RECORD_ANALYSIS:88])
End if 
CON_SaveSubEntities
ERR_MethodTrackerReturn("Contracts_InLPA"; $_t_oldMethodName)