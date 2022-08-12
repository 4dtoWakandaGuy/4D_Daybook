//%attributes = {}
If (False:C215)
	//Project Method Name:      ORD_DeliveryDatePrefs
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
	C_BOOLEAN:C305($1)
	C_LONGINT:C283($_l_ItemID; $_l_offset; ORD_l_CB_Delivery)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("ORD_DeliveryDatePrefs")
READ ONLY:C145([PREFERENCES:116])
While (Semaphore:C143("LoadingPrefsDelDate"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Delivery Date Preferences")

CLEAR SEMAPHORE:C144("LoadingPrefsDelDate")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	ORD_l_CB_Delivery:=0
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(ORD_l_CB_Delivery; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	If (Count parameters:C259=0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; ORD_l_CB_Delivery; $_l_offset)
		UNLOAD RECORD:C212([PREFERENCES:116])
	Else 
		If ($1)
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			If (Records in selection:C76([PREFERENCES:116])=0)
				
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
			End if 
			$_l_offset:=0
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(ORD_l_CB_Delivery; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("ORD_DeliveryDatePrefs"; $_t_oldMethodName)
