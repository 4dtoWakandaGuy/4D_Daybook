//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetUserWidthPreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/02/2013 14:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_MaxFormWidths; 0)
	ARRAY TEXT:C222($_at_FormNames; 0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Save; $1)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_BlobSize; $_l_FormRow; $_l_FormWidth; $_l_offset; $_l_PreferenceID; $0; $3)
	C_TEXT:C284($_t_FormName; $_t_oldMethodName; $2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_GetUserWidthPreference")
$_l_PreferenceID:=PREF_GetPreferenceID("Maximum Widths")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID; *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
	[PREFERENCES:116]Pref_OwnerID:4:=<>PER_l_CurrentUserID
	SAVE RECORD:C53([PREFERENCES:116])
	
End if 
//notethat currently this is only applicable to output listing
$_bo_Save:=False:C215
$0:=0
If (Count parameters:C259>=2)
	//Save preference for form passed in $2 at width in $3
	$_bo_Save:=$1
	$_t_FormName:=$2
	If (Count parameters:C259>=3)
		$_l_FormWidth:=$3  //The width to set it to
	End if 
	$_bo_Continue:=True:C214
Else 
	$_bo_Continue:=False:C215
End if 
If ($_bo_Continue)
	If ($_bo_Save)
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ WRITE:C146([PREFERENCES:116])
		
		ARRAY TEXT:C222($_at_FormNames; 0)
		ARRAY REAL:C219($_ar_MaxFormWidths; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
		$_l_BlobSize:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		$_l_offset:=0
		If ($_l_BlobSize>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_FormNames; $_l_offset)
			ARRAY REAL:C219($_ar_MaxFormWidths; Size of array:C274($_at_FormNames))
			If ($_l_BlobSize>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ar_MaxFormWidths; $_l_offset)
			End if 
		End if 
		$_l_FormRow:=Find in array:C230($_at_FormNames; $_t_FormName)
		
		If ($_l_FormRow>0)
			$_ar_MaxFormWidths{$_l_FormRow}:=$3
		Else 
			APPEND TO ARRAY:C911($_at_FormNames; $_t_FormName)
			APPEND TO ARRAY:C911($_ar_MaxFormWidths; $3)
		End if 
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532($_at_FormNames; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ar_MaxFormWidths; [PREFERENCES:116]DataBlob:2; *)
		SAVE RECORD:C53([PREFERENCES:116])
		
		
	Else 
		ARRAY TEXT:C222($_at_FormNames; 0)
		ARRAY REAL:C219($_ar_MaxFormWidths; 0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=<>PER_l_CurrentUserID)
		$_l_BlobSize:=BLOB size:C605([PREFERENCES:116]DataBlob:2)
		$_l_offset:=0
		If ($_l_BlobSize>0)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_FormNames; $_l_offset)
			ARRAY REAL:C219($_ar_MaxFormWidths; Size of array:C274($_at_FormNames))
			If ($_l_BlobSize>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ar_MaxFormWidths; $_l_offset)
			End if 
			$_l_FormRow:=Find in array:C230($_at_FormNames; $_t_FormName)
			
			If ($_l_FormRow>0)
				$0:=$_ar_MaxFormWidths{$_l_FormRow}
			End if 
		End if 
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
ERR_MethodTrackerReturn("DB_GetUserWidthPreference"; $_t_oldMethodName)