//%attributes = {}
If (False:C215)
	//Project Method Name:      PDF_EncyptLoadPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2011 22:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604(PDF_Bl_NameInBlob; PDF_blb_PublicKey)
	C_BOOLEAN:C305($_bo_Save; $1; PDF_bo_IsLicenced; PDF_bo_PrefsLoaded; PDF_bo_PreventCopy; PDF_bo_PreventEdit; PDF_bo_PreventPrinting; PDF_bo_SecurityActive; PDF_bo_UserPassword)
	C_LONGINT:C283($_l_ItemID; $_l_offset)
	C_TEXT:C284($_t_oldMethodName; PDF_T_OwnerPassword)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PDF_EncyptLoadPrefs")

If (Count parameters:C259>=1)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 
If (Not:C34(PDF_bo_PrefsLoaded)) | ($_bo_Save)
	READ WRITE:C146([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("PDF encryption")
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(PDF_bo_SecurityActive; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(PDF_bo_PreventCopy; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(PDF_bo_PreventEdit; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(PDF_bo_PreventPrinting; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(PDF_bo_UserPassword; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(PDF_T_OwnerPassword; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(PDF_Bl_NameInBlob; [PREFERENCES:116]DataBlob:2; *)
		BLOB TO VARIABLE:C533(PDF_blb_PublicKey; [PREFERENCES:116]DataBlob:2)
		
		DB_SaveRecord(->[PREFERENCES:116])
		
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	Else 
		If ($_bo_Save)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(PDF_bo_SecurityActive; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PDF_bo_PreventCopy; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PDF_bo_PreventEdit; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PDF_bo_PreventPrinting; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PDF_bo_UserPassword; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PDF_T_OwnerPassword; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PDF_Bl_NameInBlob; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(PDF_blb_PublicKey; [PREFERENCES:116]DataBlob:2; *)
			
			DB_SaveRecord(->[PREFERENCES:116])
			
		Else 
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_bo_SecurityActive; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_bo_PreventCopy; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_bo_PreventEdit; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_bo_PreventPrinting; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_bo_UserPassword; $_l_offset)
			
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_T_OwnerPassword; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_Bl_NameInBlob; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_blb_PublicKey; $_l_offset)
		End if 
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	End if 
	PDF_bo_PrefsLoaded:=True:C214
End if 
ERR_MethodTrackerReturn("PDF_EncyptLoadPrefs"; $_t_oldMethodName)
