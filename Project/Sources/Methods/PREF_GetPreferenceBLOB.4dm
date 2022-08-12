//%attributes = {}
If (False:C215)
	//Project Method Name:      PREF_GetPreferenceBLOB
	//------------------ Method Notes ------------------
	//this method returns the CURRENT blob of the preference.
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2012 08:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_ReturnBlob; $0)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_PreferenceID; $_l_Process; $1; $3; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; $_t_PreferenceName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PREF_GetPreferenceBLOB")

If (Count parameters:C259>=2)
	$_l_PreferenceID:=$1
	$_t_PreferenceName:=$2
	
	If (Count parameters:C259>=3)
		DB_l_CurrentOwnerRequest:=$3
	End if 
	If ($_l_PreferenceID=0)
		If ($_t_PreferenceName#"")
			If (Application type:C494=4D Server:K5:6)
				
				If (DB_l_CurrentOwnerRequest>0)
					$_l_PreferenceID:=PREF_GetPreferenceID($_t_PreferenceName; True:C214; DB_l_CurrentOwnerRequest)
				Else 
					$_l_PreferenceID:=PREF_GetPreferenceID($_t_PreferenceName; True:C214; <>PER_l_CurLoggedinDataOwnerID)
				End if 
			Else 
				$_l_PreferenceID:=PREF_GetPreferenceID($_t_PreferenceName; True:C214; <>PER_l_CurLoggedinDataOwnerID)
			End if 
			
			
		Else 
			$0:=$_blb_ReturnBlob
		End if 
	Else 
	End if 
	If ($_l_PreferenceID>0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
		If (Records in selection:C76([PREFERENCES:116])=0)
			If (In transaction:C397)
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						$_l_Process:=New process:C317("PREF_GetPreferenceBLOB"; 128000; "Create Preference"; False:C215; True:C214; DB_l_CurrentOwnerRequest)
					Else 
						$_l_Process:=New process:C317("PREF_GetPreferenceBLOB"; 128000; "Create Preference"; False:C215; True:C214)
					End if 
				Else 
					$_l_Process:=New process:C317("PREF_GetPreferenceBLOB"; 128000; "Create Preference"; False:C215; True:C214)
				End if 
				
				While (Process state:C330($_l_Process)>=0)
					DelayTicks(5)
				End while 
			Else 
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
				If (Application type:C494=4D Server:K5:6)
					If (DB_l_CurrentOwnerRequest>0)
						[PREFERENCES:116]Preference_DataID:7:=DB_l_CurrentOwnerRequest
					Else 
						[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
					End if 
				Else 
					[PREFERENCES:116]Preference_DataID:7:=<>PER_l_CurLoggedinDataOwnerID
				End if 
				SAVE RECORD:C53([PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
			End if 
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
		End if 
		$0:=[PREFERENCES:116]DataBlob:2
	End if 
	
Else 
	$0:=$_blb_ReturnBlob
End if 
ERR_MethodTrackerReturn("PREF_GetPreferenceBLOB"; $_t_oldMethodName)
