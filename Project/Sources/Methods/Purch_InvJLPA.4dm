//%attributes = {}
If (False:C215)
	//Project Method Name:      Purch_InvJLPA
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InvJLPA")
DB_SaveRecord(->[ORDER_ITEMS:25])
AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
ERR_MethodTrackerReturn("Purch_InvJLPA"; $_t_oldMethodName)