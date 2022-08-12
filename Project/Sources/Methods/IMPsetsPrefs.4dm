//%attributes = {}
If (False:C215)
	//Project Method Name:      IMPsetsPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 06:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $_l_ItemID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IMPsetsPrefs")

ALL RECORDS:C47([PERSONNEL_GROUPS:92])
READ WRITE:C146([PREFERENCES:116])

CREATE EMPTY SET:C140([PREFERENCES:116]; "$TEMP")
For ($_l_Index; 1; Records in selection:C76([PERSONNEL_GROUPS:92]))
	$_l_ItemID:=PREF_GetPreferenceID([PERSONNEL_GROUPS:92]Group_Code:1+" Sets"; False:C215)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])>0)
		ADD TO SET:C119([PREFERENCES:116]; "$TEMP")
	End if 
	NEXT RECORD:C51([PERSONNEL_GROUPS:92])
End for 

$_l_ItemID:=PREF_GetPreferenceID("Universal Sets"; False:C215)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])>0)
	ADD TO SET:C119([PREFERENCES:116]; "$TEMP")
End if 
ALL RECORDS:C47([PERSONNEL:11])
For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
	$_l_ItemID:=PREF_GetPreferenceID([PERSONNEL:11]Initials:1+" Sets"; False:C215)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])>0)
		ADD TO SET:C119([PREFERENCES:116]; "$TEMP")
	End if 
	NEXT RECORD:C51([PERSONNEL:11])
End for 
//TRACE
USE SET:C118("$TEMP")
DELETE SELECTION:C66([PREFERENCES:116])

SET CHANNEL:C77(10; "")
While (OK=1)
	RECEIVE RECORD:C79([PREFERENCES:116])
	AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
	
	SAVE RECORD:C53([PREFERENCES:116])
	
End while 
SET CHANNEL:C77(11)
ERR_MethodTrackerReturn("IMPsetsPrefs"; $_t_oldMethodName)