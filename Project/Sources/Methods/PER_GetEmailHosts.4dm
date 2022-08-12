//%attributes = {}
If (False:C215)
	//Project Method Name:      PER_GetEmailHosts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 22:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PER_at_EmailHostNames;0)
	C_LONGINT:C283($_l_ItemID; $_l_Offset; $2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("PER_GetEmailHosts")
//Modified December 2007 to accomdate the DEFAULT  HOST for the email address...
If (Count parameters:C259>=2)
	If ($1#"")
		While (Semaphore:C143("LoadingPrefsEmail"))
			DelayTicks(2)
		End while 
		$_l_ItemID:=PREF_GetPreferenceID("eMail Host Names")
		If ($_l_ItemID>0)
			
			
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID; *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$2)
			If (Records in selection:C76([PREFERENCES:116])=0)
				READ WRITE:C146([PREFERENCES:116])
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				[PREFERENCES:116]Pref_OwnerID:4:=$2
				DB_SaveRecord(->[PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			End if 
			//this blob contains 2 arrays
			//the array of email names and the array of email addresses
			$_l_Offset:=0
			ARRAY TEXT:C222(PER_at_EmailHostNames; 0)
			
			
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PER_at_EmailHostNames; $_l_Offset)
		End if 
		CLEAR SEMAPHORE:C144("LoadingPrefsEmail")
		//Make sure everything is the same size
		//```````
	Else 
		Gen_Alert("You must enter a user name first")
	End if 
	
End if 
ERR_MethodTrackerReturn("PER_GetEmailHosts"; $_t_oldMethodName)
