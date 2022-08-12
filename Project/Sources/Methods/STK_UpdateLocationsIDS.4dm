//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_UpdateLocationsIDS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2012 20:39
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

$_t_oldMethodName:=ERR_MethodTracker("STK_UpdateLocationsIDS")
READ WRITE:C146([LOCATIONS:61])
QUERY:C277([LOCATIONS:61]; [LOCATIONS:61]LocationID:4=0)
APPLY TO SELECTION:C70([LOCATIONS:61]; [LOCATIONS:61]LocationID:4:=AA_GetNextID(->[LOCATIONS:61]LocationID:4))
ERR_MethodTrackerReturn("STK_UpdateLocationsIDS"; $_t_oldMethodName)