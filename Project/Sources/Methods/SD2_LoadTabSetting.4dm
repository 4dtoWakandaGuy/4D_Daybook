//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadTabSetting
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 11:29
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_FormIDS; 0)
	ARRAY LONGINT:C221($_al_TabIDS; 0)
	//ARRAY LONGINT(SD_al_TabIncludeIndex;0)
	//ARRAY LONGINT(SD_al_TabIncludes;0)
	C_BOOLEAN:C305($_bo_load; $_bo_loadContext; $_bo_OK; $1)
	C_LONGINT:C283($_l_ArraySize; $_l_DelayFactor; $_l_Delete; $_l_DeletePoint; $_l_index; $_l_index2; $_l_Index3; $_l_Insert; $_l_insertPoint; $_l_ItemID; $_l_Offset)
	C_LONGINT:C283($_l_Repeats; $_l_SIze2; $_l_TabColumn; $_l_TablePosition; $_l_TableRow; $_l_TabTable; $2; SD2_l_TabID)
	C_POINTER:C301($_Ptr_DocIncludesArray; $_ptr_FormIDS; $_ptr_OutputFormIDS; $_ptr_TabContIncludDocs; $_ptr_TabIDS; $_ptr_TabIDSArray; $_Ptr_TabIncludesArray; $_Ptr_TableContexts; $_Ptr_TableContName; $_ptr_TableNamesArray; $3)
	C_POINTER:C301($4; $5; $6; $7)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadTabSetting")

$_bo_load:=True:C214
If (Count parameters:C259>=1)
	$_bo_load:=$1
End if 
$_l_TabTable:=$2
$_bo_loadContext:=False:C215
If (Count parameters:C259>=5) & ($_l_TabTable>0)
	// load for this context
	$_bo_loadContext:=True:C214
	$_ptr_TableNamesArray:=$3
	$_Ptr_TabIncludesArray:=$4  //note this is a 2d Array
	$_Ptr_DocIncludesArray:=$5
	ARRAY LONGINT:C221($_al_TabIDS; 0)
	ARRAY LONGINT:C221($_al_FormIDS; 0)
	
	
	If (Count parameters:C259>=6)
		$_ptr_TabIDSArray:=$6
	Else 
		$_ptr_TabIDSArray:=->$_al_TabIDS
		
	End if 
	If (Count parameters:C259>=7)
		$_ptr_OutputFormIDS:=$7
	Else 
		$_ptr_OutputFormIDS:=->$_al_FormIDS
		
	End if 
	If ($_bo_load)
		ARRAY TEXT:C222($_ptr_TableNamesArray->; 0)
		ARRAY LONGINT:C221($_Ptr_TabIncludesArray->; 0; 0)
		ARRAY LONGINT:C221($_Ptr_DocIncludesArray->; 0)
		ARRAY LONGINT:C221($_ptr_TabIDSArray->; 0)
		ARRAY LONGINT:C221($_ptr_OutputFormIDS->; 0)
	End if 
End if 

//NG March 2005
// New method to load diary action classes
While (Semaphore:C143("LoadingDiaryTabs"))
	DelayTicks
End while 
$_l_ItemID:=PREF_GetPreferenceID("Diary Tabs")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
If (Records in selection:C76([PREFERENCES:116])>0)
	$_bo_OK:=False:C215
	$_l_Repeats:=0
	$_l_DelayFactor:=1
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 0)
		If (Not:C34($_bo_OK))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_DelayFactor:=$_l_DelayFactor+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_DelayFactor)
		End if 
	Until ($_bo_OK=True:C214)
	
End if 

If (Records in selection:C76([PREFERENCES:116])=0)
	//add the the preferences list here
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	DB_SaveRecord(->[PREFERENCES:116])
End if 

If ($_bo_load=False:C215)  // save updated values
	If ($_l_TabTable>0)
		SD3_GetContexts(->$_Ptr_TableContexts; ->$_Ptr_TableContName; ->$_ptr_TabContIncludDocs; ->$_ptr_TabIDS; ->$_ptr_FormIDS)
		
		
		$_l_TablePosition:=Find in array:C230($_Ptr_TableContexts->; $_l_TabTable)
		If ($_l_TablePosition<0)
			INSERT IN ARRAY:C227($_Ptr_TableContexts->; Size of array:C274($_Ptr_TableContexts->)+1; 1)
			INSERT IN ARRAY:C227($_Ptr_TableContName->; Size of array:C274($_Ptr_TableContName->)+1; 1)
			INSERT IN ARRAY:C227($_ptr_TabContIncludDocs->; Size of array:C274($_ptr_TabContIncludDocs->)+1; 1)
			INSERT IN ARRAY:C227($_ptr_TabIDS->; Size of array:C274($_ptr_TabIDS->)+1; 1)
			INSERT IN ARRAY:C227($_ptr_FormIDS->; Size of array:C274($_ptr_FormIDS->)+1; 1)
			$_Ptr_TableContexts->{Size of array:C274($_Ptr_TableContexts->)}:=$_l_TabTable
			$_l_TablePosition:=Size of array:C274($_Ptr_TableContexts->)
		End if 
		Case of 
			: (Size of array:C274($_Ptr_TableContName->{$_l_TablePosition})<Size of array:C274($_ptr_TableNamesArray->))
				$_l_Insert:=(Size of array:C274($_ptr_TableNamesArray->))-(Size of array:C274($_Ptr_TableContName->{$_l_TablePosition}))
				$_l_insertPoint:=Size of array:C274($_Ptr_TableContName->{$_l_TablePosition})+1
				INSERT IN ARRAY:C227($_Ptr_TableContName->{$_l_TablePosition}; $_l_insertPoint; $_l_Insert)
				INSERT IN ARRAY:C227($_ptr_TabContIncludDocs->{$_l_TablePosition}; $_l_insertPoint; $_l_Insert)
				INSERT IN ARRAY:C227($_ptr_TabIDS->{$_l_TablePosition}; $_l_insertPoint; $_l_Insert)
				INSERT IN ARRAY:C227($_ptr_FormIDS->{$_l_TablePosition}; $_l_insertPoint; $_l_Insert)
			: (Size of array:C274($_Ptr_TableContName->{$_l_TablePosition})>Size of array:C274($_ptr_TableNamesArray->))
				$_l_DeletePoint:=Size of array:C274($_Ptr_TableContName->{$_l_TablePosition})
				$_l_Delete:=(Size of array:C274($_ptr_TableNamesArray->))-(Size of array:C274($_Ptr_TableContName->{$_l_TablePosition}))
				DELETE FROM ARRAY:C228($_Ptr_TableContName->{$_l_TablePosition}; $_l_DeletePoint; $_l_Delete)
				DELETE FROM ARRAY:C228($_ptr_TabContIncludDocs->{$_l_TablePosition}; $_l_DeletePoint; $_l_Delete)
				DELETE FROM ARRAY:C228($_ptr_TabIDS->{$_l_TablePosition}; $_l_DeletePoint; $_l_Delete)
				DELETE FROM ARRAY:C228($_ptr_FormIDS->{$_l_TablePosition}; $_l_DeletePoint; $_l_Delete)
		End case 
		For ($_l_index; 1; Size of array:C274($_ptr_TableNamesArray->))
			$_Ptr_TableContName->{$_l_TablePosition}{$_l_index}:=$_ptr_TableNamesArray->{$_l_index}
			$_ptr_TabContIncludDocs->{$_l_TablePosition}{$_l_index}:=$_ptr_DocIncludesArray->{$_l_index}
			If ($_ptr_TabIDSArray->{$_l_index}=0)
				$_ptr_TabIDSArray->{$_l_index}:=AA_GetNextID(->SD2_l_TabID)
			End if 
			If ($_l_index>Size of array:C274($_ptr_TabIDS->{$_l_TablePosition}))
				Repeat 
					INSERT IN ARRAY:C227($_ptr_TabIDS->{$_l_TablePosition}; Size of array:C274($_ptr_TabIDS->{$_l_TablePosition})+1; 1)
				Until ($_l_index=Size of array:C274($_ptr_TabIDS->{$_l_TablePosition}))
			End if 
			If ($_l_index>Size of array:C274($_ptr_FormIDS->{$_l_TablePosition}))
				Repeat 
					INSERT IN ARRAY:C227($_ptr_FormIDS->{$_l_TablePosition}; Size of array:C274($_ptr_FormIDS->{$_l_TablePosition})+1; 1)
				Until ($_l_index=Size of array:C274($_ptr_FormIDS->{$_l_TablePosition}))
			End if 
			
			$_ptr_TabIDS->{$_l_TablePosition}{$_l_index}:=$_ptr_TabIDSArray->{$_l_index}
			$_ptr_FormIDS->{$_l_TablePosition}{$_l_index}:=$_ptr_OutputFormIDS->{$_l_index}
			$_l_index2:=Find in array:C230(SD_al_TabIncludeIndex; $_ptr_TabIDS->{$_l_TablePosition}{$_l_index})
			If ($_l_index2<0)
				INSERT IN ARRAY:C227(SD_al_TabIncludeIndex; Size of array:C274(SD_al_TabIncludeIndex)+1; 1)
				INSERT IN ARRAY:C227(SD_al_TabIncludes; Size of array:C274(SD_al_TabIncludes)+1; 1)
				SD_al_TabIncludeIndex{Size of array:C274(SD_al_TabIncludeIndex)}:=$_ptr_TabIDS->{$_l_TablePosition}{$_l_index}
				$_l_index2:=Size of array:C274(SD_al_TabIncludeIndex)
			End if 
			Case of 
				: (Size of array:C274(SD_al_TabIncludes{$_l_index2})<Size of array:C274($_Ptr_TabIncludesArray->{$_l_index}))
					$_l_insert:=(Size of array:C274($_Ptr_TabIncludesArray->{$_l_index}))-Size of array:C274(SD_al_TabIncludes{$_l_index2})
					INSERT IN ARRAY:C227(SD_al_TabIncludes{$_l_index2}; Size of array:C274(SD_al_TabIncludes{$_l_index2})+1; $_l_insert)
				: (Size of array:C274(SD_al_TabIncludes{$_l_index2})>Size of array:C274($_Ptr_TabIncludesArray->{$_l_index}))
					$_l_Delete:=Size of array:C274(SD_al_TabIncludes{$_l_index2})-(Size of array:C274($_Ptr_TabIncludesArray->{$_l_index}))
					DELETE FROM ARRAY:C228(SD_al_TabIncludes{$_l_index2}; Size of array:C274($_Ptr_TabIncludesArray->{$_l_index})+1; $_l_Delete)
			End case 
			For ($_l_Index3; 1; Size of array:C274($_Ptr_TabIncludesArray->{$_l_index}))
				SD_al_TabIncludes{$_l_index2}{$_l_Index3}:=$_Ptr_TabIncludesArray->{$_l_index}{$_l_Index3}
			End for 
			
		End for 
		
	End if 
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ WRITE:C146([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	While (Not:C34(Check_Locked(->[PREFERENCES:116]; 0)))
		DelayTicks(10)
	End while 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532($_Ptr_TableContexts->; [PREFERENCES:116]DataBlob:2; *)
	For ($_l_index; 1; Size of array:C274($_Ptr_TableContName->))
		VARIABLE TO BLOB:C532($_Ptr_TableContName->{$_l_index}; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_TabContIncludDocs->{$_l_index}; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532($_ptr_TabIDS->{$_l_index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	VARIABLE TO BLOB:C532(SD_al_TabIncludeIndex; [PREFERENCES:116]DataBlob:2; *)
	For ($_l_index; 1; Size of array:C274(SD_al_TabIncludes))
		VARIABLE TO BLOB:C532(SD_al_TabIncludes{$_l_index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_index; 1; Size of array:C274($_ptr_FormIDS->))
		VARIABLE TO BLOB:C532($_ptr_FormIDS->{$_l_index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	$_l_Offset:=0
	SD3_GetContexts(->$_Ptr_TableContexts; ->$_Ptr_TableContName; ->$_ptr_TabContIncludDocs; ->$_ptr_TabIDS; ->$_ptr_FormIDS)
	ARRAY LONGINT:C221(SD_al_TabIncludeIndex; 0)
	ARRAY LONGINT:C221(SD_al_TabIncludes; 0; 0)  // LIST oF INCLUDES FOR TAB IDS(SD_AL_TABIDS{N})
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_Ptr_TableContexts->; $_l_Offset)
		$_l_ArraySize:=Size of array:C274($_Ptr_TableContexts->)
		ARRAY TEXT:C222($_Ptr_TableContName->; $_l_ArraySize; 0)  //LIST OF NAMES FOR EACH CONTEXT
		ARRAY LONGINT:C221($_ptr_TabContIncludDocs->; $_l_ArraySize; 0)  //LIST OF NAMES FOR EACH CONTEXT
		ARRAY LONGINT:C221($_ptr_TabIDS->; $_l_ArraySize; 0)  // LIST OF IDS FOR EACH CONTEXT
		$_l_SIze2:=0
		For ($_l_index; 1; $_l_ArraySize)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_Ptr_TableContName->{$_l_index}; $_l_Offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_TabContIncludDocs->{$_l_index}; $_l_Offset)
					
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_TabIDS->{$_l_index}; $_l_Offset)
					Else 
						$_l_index:=$_l_ArraySize
					End if 
				Else 
					$_l_index:=$_l_ArraySize
				End if 
			Else 
				$_l_index:=$_l_ArraySize
			End if 
		End for 
		
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_TabIncludeIndex; $_l_Offset)
		$_l_SIze2:=Size of array:C274(SD_al_TabIncludeIndex)
		ARRAY LONGINT:C221(SD_al_TabIncludes; $_l_SIze2; 0)  // LIST oF INCLUDES FOR TAB IDS(SD_AL_TABIDS{N})
		For ($_l_index; 1; $_l_SIze2)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_TabIncludes{$_l_index}; $_l_Offset)
			Else 
				$_l_index:=$_l_SIze2
			End if 
		End for 
		//Because I added this in After the array has to be stored in the blob at the end-should have structured it different
		
		ARRAY LONGINT:C221($_ptr_FormIDS->; $_l_ArraySize; 0)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			For ($_l_index; 1; $_l_ArraySize)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_ptr_FormIDS->{$_l_index}; $_l_Offset)
				Else 
					$_l_index:=$_l_ArraySize
				End if 
			End for 
		End if 
		
	End if 
	If ($_l_TabTable>0)
		// load for this context
		
		$_l_TableRow:=Find in array:C230($_Ptr_TableContexts->; $_l_TabTable)
		If ($_l_TableRow>0)
			If (Count parameters:C259>=6)
				ARRAY LONGINT:C221($_ptr_TabIDSArray->; Size of array:C274($_Ptr_TableContName->{$_l_TableRow}))
			End if 
			If (Count parameters:C259>=6)
				ARRAY LONGINT:C221($_ptr_OutputFormIDS->; Size of array:C274($_Ptr_TableContName->{$_l_TableRow}))
			End if 
			ARRAY TEXT:C222($_ptr_TableNamesArray->; Size of array:C274($_Ptr_TableContName->{$_l_TableRow}))
			ARRAY LONGINT:C221($_Ptr_TabIncludesArray->; Size of array:C274($_Ptr_TableContName->{$_l_TableRow}); 0)
			ARRAY LONGINT:C221($_ptr_DocIncludesArray->; Size of array:C274($_Ptr_TableContName->{$_l_TableRow}))
			For ($_l_index; 1; Size of array:C274($_Ptr_TableContName->{$_l_TableRow}))
				If (Count parameters:C259>=6)
					$_ptr_TabIDSArray->{$_l_index}:=$_ptr_TabIDS->{$_l_TableRow}{$_l_index}
				End if 
				If (Count parameters:C259>=7)
					If ($_l_index<=Size of array:C274($_ptr_OutputFormIDS->))
						$_ptr_OutputFormIDS->{$_l_index}:=$_ptr_FormIDS->{$_l_TableRow}{$_l_index}
					Else 
						$_ptr_OutputFormIDS->{$_l_index}:=0
					End if 
				End if 
				$_ptr_TableNamesArray->{$_l_index}:=$_Ptr_TableContName->{$_l_TableRow}{$_l_index}
				$_ptr_DocIncludesArray->{$_l_index}:=$_ptr_TabContIncludDocs->{$_l_TableRow}{$_l_index}
				$_l_TabColumn:=Find in array:C230(SD_al_TabIncludeIndex; $_ptr_TabIDS->{$_l_TableRow}{$_l_index})
				If ($_l_TabColumn>0)
					INSERT IN ARRAY:C227($_Ptr_TabIncludesArray->{$_l_index}; 1; Size of array:C274(SD_al_TabIncludes{$_l_TabColumn}))
					For ($_l_index2; 1; Size of array:C274(SD_al_TabIncludes{$_l_TabColumn}))
						$_Ptr_TabIncludesArray->{$_l_index}{$_l_index2}:=SD_al_TabIncludes{$_l_TabColumn}{$_l_index2}
					End for 
					
				End if 
				
			End for 
			
		Else 
			//set one tab
			
			APPEND TO ARRAY:C911($_ptr_TableNamesArray->; "Diary")
			If (Count parameters:C259>=6)
				APPEND TO ARRAY:C911($_ptr_TabIDSArray->; AA_GetNextID(->SD2_l_TabID))
				
			End if 
			If (Count parameters:C259>=5)
				APPEND TO ARRAY:C911($_ptr_DocIncludesArray->; 0)
			End if 
			If (Count parameters:C259>=7)
				APPEND TO ARRAY:C911($_ptr_OutputFormIDS->; 0)  //no default??
			End if 
			ARRAY LONGINT:C221($_Ptr_TabIncludesArray->; 1; 0)
		End if 
		
	End if 
	
End if 
CLEAR SEMAPHORE:C144("LoadingDiaryTabs")
ERR_MethodTrackerReturn("SD2_LoadTabSetting"; $_t_oldMethodName)
