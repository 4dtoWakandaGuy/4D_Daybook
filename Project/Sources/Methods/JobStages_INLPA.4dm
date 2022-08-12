//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_INLPA
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
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283(vAB)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_INLPA")
If (Modified record:C314([JOB PERSONNEL:48]))
	DB_SaveRecord(->[JOB PERSONNEL:48])
End if 
//Implement the sort order onto the order items.


If (Modified record:C314([ORDER_ITEMS:25]))
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlocked(->[ORDER_ITEMS:25]x_ID:58)
End if 
vAB:=0
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("JobStages_INLPA"; $_t_oldMethodName)