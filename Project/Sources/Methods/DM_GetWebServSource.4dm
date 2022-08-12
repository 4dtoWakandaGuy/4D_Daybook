//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_GetWebServSource
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
	//ARRAY LONGINT(DM_al_DBFieldNumbers;0;0)
	//ARRAY LONGINT(DM_al_DBTableNumbers;0;0)
	ARRAY TEXT:C222($_at_KnownFieldNames; 0)
	ARRAY TEXT:C222($_at_SentFieldNames; 0)
	//ARRAY TEXT(DM_at_SourceNameFields;0;0)
	//ARRAY TEXT(DM_at_SourceNames;0)
	C_BOOLEAN:C305($_bo_OK; $0)
	C_LONGINT:C283($_l_FieldRow; $_l_ItemID; $_l_offset; $_l_Offset2; $_l_SentFieldsIndex; $_l_SourceFieldsIndex; $_l_SourceIndex; $_l_SourceRow)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $1; $SourceName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_GetWebServSource")
//DM_GetWebServSource this method will get the ID of the data map to use
READ ONLY:C145([PREFERENCES:116])

$_l_ItemID:=PREF_GetPreferenceID("Web Page Sources")
If ($_l_ItemID>0)
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		//There is no record
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		DB_SaveRecord(->[PREFERENCES:116])
	End if 
	$_l_offset:=0
	ARRAY TEXT:C222(DM_at_SourceNames; 0)
	ARRAY TEXT:C222(DM_at_SourceNameFields; 0; 0)
	ARRAY LONGINT:C221(DM_al_DBTableNumbers; 0; 0)
	ARRAY LONGINT:C221(DM_al_DBFieldNumbers; 0; 0)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_SourceNames; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			$_l_SourceRow:=Size of array:C274(DM_at_SourceNames)
			ARRAY TEXT:C222(DM_at_SourceNameFields; $_l_SourceRow; 0)
			ARRAY LONGINT:C221(DM_al_DBTableNumbers; $_l_SourceRow; 0)
			ARRAY LONGINT:C221(DM_al_DBFieldNumbers; $_l_SourceRow; 0)
			For ($_l_SourceIndex; 1; $_l_SourceRow)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_SourceNameFields{$_l_SentFieldsIndex}; $_l_offset)
				End if 
			End for 
			For ($_l_SourceIndex; 1; $_l_SourceRow)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DBTableNumbers{$_l_SentFieldsIndex}; $_l_offset)
				End if 
			End for 
			For ($_l_SourceIndex; 1; $_l_SourceRow)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DBFieldNumbers{$_l_SentFieldsIndex}; $_l_offset)
				End if 
			End for 
		End if 
	End if 
	$_l_SourceRow:=Find in array:C230(DM_at_SourceNames; $1)
	If ($_l_SourceRow>0)
		//Now get the source field names from $2 and compare them to the source field names in the map
		$_l_Offset2:=0
		ARRAY TEXT:C222($_at_SentFieldNames; 0)
		If (BLOB size:C605($2->)>$_l_Offset2)
			BLOB TO VARIABLE:C533($2->; $SourceName; $_l_Offset2)
			If (BLOB size:C605($2->)>$_l_Offset2)
				BLOB TO VARIABLE:C533($2->; $_at_SentFieldNames; $_l_Offset2)
				
			End if 
		End if 
		ARRAY TEXT:C222($_at_KnownFieldNames; 0)
		If (Size of array:C274(DM_at_SourceNameFields)>=$_l_SourceRow)
			ARRAY TEXT:C222($_at_KnownFieldNames; Size of array:C274(DM_at_SourceNameFields{$_l_SourceRow}))
			For ($_l_SourceFieldsIndex; 1; Size of array:C274(DM_at_SourceNameFields{$_l_SourceRow}))
				$_at_knownFieldNames{$_l_SourceFieldsIndex}:=DM_at_SourceNameFields{$_l_SourceRow}{$_l_SourceFieldsIndex}
			End for 
			//Now compare known field names with received
			$_bo_OK:=True:C214
			For ($_l_SentFieldsIndex; 1; Size of array:C274($_at_SentFieldNames))
				$_l_FieldRow:=Find in array:C230($_at_knownFieldNames; $_at_SentFieldNames{$_l_SentFieldsIndex})
				If ($_l_FieldRow<0)
					$_bo_OK:=False:C215
					$0:=False:C215
					$_l_SentFieldsIndex:=Size of array:C274($_at_SentFieldNames)
				End if 
			End for 
			If ($_bo_OK)
				//The field map matches
				//so set$3 and 4 with with the map
				ARRAY TEXT:C222($3->; Size of array:C274(DM_at_SourceNameFields{$_l_SourceRow}))
				ARRAY POINTER:C280($4->; Size of array:C274(DM_at_SourceNameFields{$_l_SourceRow}))
				For ($_l_SourceFieldsIndex; 1; Size of array:C274(DM_at_SourceNameFields{$_l_SourceRow}))
					$3->{$_l_SourceFieldsIndex}:=DM_at_SourceNameFields{$_l_SourceRow}{$_l_SourceFieldsIndex}
					If ($_l_SourceFieldsIndex<Size of array:C274(DM_al_DBTableNumbers{$_l_SourceRow})) & ($_l_SourceFieldsIndex<Size of array:C274(DM_al_DBFieldNumbers{$_l_SourceRow}))
						$4->{$_l_SourceFieldsIndex}:=Field:C253(DM_al_DBTableNumbers{$_l_SourceRow}{$_l_SourceFieldsIndex}; DM_al_DBFieldNumbers{$_l_SourceRow}{$_l_SourceFieldsIndex})
					Else 
						$0:=False:C215
						$_l_SourceFieldsIndex:=99999999
					End if 
				End for 
				
				
			End if 
		Else 
			//Map not setup!(alhough the source was known)
			$0:=False:C215
			
		End if 
	Else 
		//Data source map currently unknown
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("DM_GetWebServSource"; $_t_oldMethodName)