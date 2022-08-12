//%attributes = {}
If (False:C215)
	//Project Method Name:      LAY_UpdateFonts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/08/2012 16:22
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

$_t_oldMethodName:=ERR_MethodTracker("LAY_UpdateFonts")
READ WRITE:C146([PREFERENCES:116])
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=-10)
If (Records in selection:C76([PREFERENCES:116])=0)
	READ WRITE:C146([LIST_LAYOUTS:96])
	ALL RECORDS:C47([LIST_LAYOUTS:96])
	APPLY TO SELECTION:C70([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Font_Size:11:=12)
	UNLOAD RECORD:C212([LIST_LAYOUTS:96])
	READ ONLY:C145([LIST_LAYOUTS:96])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=-10
	AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
	
	SAVE RECORD:C53([PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
End if 
ERR_MethodTrackerReturn("LAY_UpdateFonts"; $_t_oldMethodName)