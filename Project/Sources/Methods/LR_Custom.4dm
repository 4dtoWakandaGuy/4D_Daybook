//%attributes = {}
If (False:C215)
	//Project Method Name:      LR_Custom
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 11:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(LR_bo_Enable)
	C_LONGINT:C283($_l_ItemID; $_l_offset; LR_l_LicencePortNumber)
	C_POINTER:C301(LIC_ptr_LicenceTable; LR_pLicenceField_AddedBy; LR_ptr_LicenceCode; LR_ptr_LicenceDateAdded; LR_ptr_LicenceDateModified; LR_ptr_LicenceFile; LR_ptr_LicenceID; LR_ptr_LicenceModifiedBy; LR_ptr_LicenceOwnerName; LR_ptr_LicenceTimeAdded; LR_ptr_LicenceTimeModified)
	C_TEXT:C284($_t_oldMethodName; KeyDelim; LR_t_LicenceHost; LR_t_User; LR_T_WebserviceName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LR_Custom")
KeyDelim:="Wp4=md%y'Aoh8}#f$4he*6R1qL"
LR_t_User:="DEFAULTUSER"  //if app using the licensing system has users this can be set to whoever is logged in

//vars storing field pointers (some systems may have their own licence table they wish to integrate instead of using [LR_Licence])
LIC_ptr_LicenceTable:=->[LICENCE_UPDATES:97]  //->[LR_Licence]
LR_pLicenceField_AddedBy:=->[LICENCE_UPDATES:97]Modified_By:9  //In daybook a licence update "ModifiedBy" seems to be actually set when licence is added so i made this pointer point to it also  `[LR_Licence]AddedBy
LR_ptr_LicenceCode:=->[LICENCE_UPDATES:97]Code:6  //->[LR_Licence]Code
LR_ptr_LicenceDateAdded:=->[LICENCE_UPDATES:97]Update_Date:2  //->[LR_Licence]DateAdded
//LR_ptr_LicenceDateModified:=->[LR_Licence]DateModified
LR_ptr_LicenceFile:=->[LICENCE_UPDATES:97]Licence_Blob:10  //->[LR_Licence]LicenceFile
LR_ptr_LicenceModifiedBy:=->[LICENCE_UPDATES:97]Modified_By:9  //->[LR_Licence]ModifiedBy
LR_ptr_LicenceOwnerName:=->[LICENCE_UPDATES:97]Licence_Name:7  //->[LR_Licence]Name
LR_ptr_LicenceTimeAdded:=->[LICENCE_UPDATES:97]Created_Time:8  //->[LR_Licence]TimeAdded
//LR_ptr_LicenceTimeModified:=->[LR_Licence]TimeModified
LR_ptr_LicenceID:=->[LICENCE_UPDATES:97]X_ID:5  //->[LR_Licence]xID
//*****************************************

While (Semaphore:C143("LoadingLicencingPrefs"))
	DelayTicks(2)
End while 
//C_TEXT(LR_t_LicenceHost)
//C_LONGINT(LR_l_LicencePortNumber)
//C_TEXT(LR_T_WebserviceName)
READ ONLY:C145([PREFERENCES:116])
$_l_ItemID:=PREF_GetPreferenceID("Licencing"; True:C214; -1)  //this is a universal setting...
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)


If (Records in selection:C76([PREFERENCES:116])=0)
	//add the the preferences list here
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	DB_SaveRecord(->[PREFERENCES:116])
End if   //this will be ONE record
If (Count parameters:C259=0)
	
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; LR_t_LicenceHost; $_l_offset)
		
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; LR_l_LicencePortNumber; $_l_offset)
			
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; LR_T_WebserviceName; $_l_offset)
				
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; LR_bo_Enable; $_l_offset)
					
				End if 
			End if 
		End if 
	End if 
	If (LR_t_LicenceHost="")
		READ WRITE:C146([PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		LOAD RECORD:C52([PREFERENCES:116])
		
		LR_t_LicenceHost:="81.136.221.70"
		LR_l_LicencePortNumber:=8085
		LR_T_WebserviceName:="DB_LicenceNumberer"
		LR_bo_Enable:=True:C214
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(LR_t_LicenceHost; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(LR_l_LicencePortNumber; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(LR_T_WebserviceName; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(LR_bo_Enable; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		
	End if 
Else 
	READ WRITE:C146([PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	LOAD RECORD:C52([PREFERENCES:116])
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(LR_t_LicenceHost; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(LR_l_LicencePortNumber; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(LR_T_WebserviceName; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(LR_bo_Enable; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
	
End if 

CLEAR SEMAPHORE:C144("LoadingLicencingPrefs")
ERR_MethodTrackerReturn("LR_Custom"; $_t_oldMethodName)  //added 17/01/08 -kmw to balance the tracker call at the top... NOTE: didn't add to other LR methods as they are theoretically unmodifiable component methods. 
