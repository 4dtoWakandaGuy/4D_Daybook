//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetdefaultFilterID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/05/2011 21:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ContextIDs; 0)
	ARRAY LONGINT:C221($_al_DefaultFilterIDS; 0)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ContextID; $_l_ItemID; $_l_offset; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetdefaultFilterID")
ARRAY LONGINT:C221($_al_ContextIDs; 0)
ARRAY LONGINT:C221($_al_DefaultFilterIDS; 0)

While (Semaphore:C143("DefaultFiltersSettings"))
	DelayTicks(2)
End while 
$0:=0

$_l_ItemID:=PREF_GetPreferenceID("Defaults Filter Settings")
If ($_l_ItemID>0)
	READ WRITE:C146([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
	QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
		DB_SaveRecord(->[PREFERENCES:116])
		
	End if 
	$_l_offset:=0
	
	If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_ContextIDs; $_l_offset)
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_DefaultFilterIDS; $_l_offset)
		End if 
	End if 
	$_l_ContextID:=Find in array:C230($_al_ContextIDs; $1)
	If ($_l_ContextID>0)
		$0:=$_al_DefaultFilterIDS{$_l_ContextID}
	End if 
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
End if 
CLEAR SEMAPHORE:C144("DefaultFiltersSettings")
ERR_MethodTrackerReturn("DB_GetdefaultFilterID"; $_t_oldMethodName)