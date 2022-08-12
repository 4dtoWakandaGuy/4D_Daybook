//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_GetBKSettings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DM_al_DataSources;0)
	//ARRAY TEXT(DM_at_DataSources;0)
	C_BOOLEAN:C305($_bo_Reload)
	C_DATE:C307(DM_D_BkLastUpdateDate)
	C_LONGINT:C283($_l_AddedItemID; $_l_BusinessKitPosition; $_l_Index; $_l_ListID; $_l_offset; $_l_RecordPosition; $_l_SourceType; $7; DM_CB_BkActive; DM_l_BkActive; DM_l_BKDataModelID)
	C_LONGINT:C283(DM_l_BkFrequency; DM_l_BKLastTimeStamp; DM_l_BkLastUpdateTime; DM_l_BkMaxTime; DM_l_BKOptions; DM_l_BKPostAction; DM_l_BkRetrieveType; DM_l_BkserverID; DM_l_BkstoreID; DM_l_BkTimeOut)
	C_POINTER:C301($1; $2; $3; $4; $5; $6)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKFileName; DM_t_BkFrequencyType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_GetBKSettings")
ARRAY LONGINT:C221(DM_al_DataSources; 0)
ARRAY TEXT:C222(DM_at_DataSources; 0)
$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
$_l_BusinessKitPosition:=Find in array:C230(DM_at_DataSources; "Business Kit")
If ($_l_BusinessKitPosition<0)
	$_l_AddedItemID:=AA_ListAddItembyID($_l_ListID; "Business Kit")
	$_l_ListID:=AA_LoadListByName("Defined Data Sources"; ->DM_at_DataSources; ->DM_al_DataSources)
	$_l_BusinessKitPosition:=Find in array:C230(DM_at_DataSources; "Business Kit")
End if 
$_l_SourceType:=DM_al_DataSources{$_l_RecordPosition}


If (Count parameters:C259>=6)
	If (Count parameters:C259>=7)
		$_bo_Reload:=($7>0)
	Else 
		$_bo_Reload:=False:C215
	End if 
	If (Not:C34($_bo_Reload))
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[EW_BK_FieldMap:121]); *)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Pref_OwnerID:4=0)
		FIRST RECORD:C50([PREFERENCES:116])
		For ($_l_Index; 1; Records in selection:C76([PREFERENCES:116]))
			$_l_offset:=0
			DM_BKConnectionBLobtovariables
			
			If (DM_CB_BkActive=1)
				If (DM_l_BKFrequency>0)
					$_l_RecordPosition:=Find in array:C230($2->; Record number:C243([PREFERENCES:116]))
					If ($_l_RecordPosition<0)
						INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 1)
						INSERT IN ARRAY:C227($2->; Size of array:C274($2->)+1; 1)
						INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; 1)
						INSERT IN ARRAY:C227($4->; Size of array:C274($4->)+1; 1)
						INSERT IN ARRAY:C227($5->; Size of array:C274($5->)+1; 1)
						INSERT IN ARRAY:C227($6->; Size of array:C274($6->)+1; 1)
						$1->{Size of array:C274($1->)}:=$_l_SourceType
						$2->{Size of array:C274($2->)}:=Record number:C243([PREFERENCES:116])
						$3->{Size of array:C274($3->)}:=DM_l_BkLastUpdateTime
						$4->{Size of array:C274($4->)}:=DM_D_BkLastUpdateDate
						$5->{Size of array:C274($5->)}:=DM_l_BkFrequency
						$6->{Size of array:C274($6->)}:=DM_t_BkFrequencyType
					Else 
						$1->{$_l_RecordPosition}:=$_l_SourceType
						$2->{$_l_RecordPosition}:=Record number:C243([PREFERENCES:116])
						$3->{$_l_RecordPosition}:=DM_l_BkLastUpdateTime
						$4->{$_l_RecordPosition}:=DM_D_BkLastUpdateDate
						$5->{$_l_RecordPosition}:=DM_l_BkFrequency
						$6->{$_l_RecordPosition}:=DM_t_BkFrequencyType
					End if 
				End if 
			End if 
			NEXT RECORD:C51([PREFERENCES:116])
		End for 
		
	Else 
		//reload
		
		GOTO RECORD:C242([PREFERENCES:116]; $7)
		DM_BKConnectionBLobtovariables
		If (DM_CB_BkActive=1)
			If (DM_l_BKFrequency>0)
				$_l_RecordPosition:=Find in array:C230($2->; Record number:C243([PREFERENCES:116]))
				If ($_l_RecordPosition<0)
					INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 1)
					INSERT IN ARRAY:C227($2->; Size of array:C274($2->)+1; 1)
					INSERT IN ARRAY:C227($3->; Size of array:C274($3->)+1; 1)
					INSERT IN ARRAY:C227($4->; Size of array:C274($4->)+1; 1)
					INSERT IN ARRAY:C227($5->; Size of array:C274($5->)+1; 1)
					INSERT IN ARRAY:C227($6->; Size of array:C274($6->)+1; 1)
					$1->{Size of array:C274($1->)}:=$_l_SourceType
					$2->{Size of array:C274($2->)}:=Record number:C243([PREFERENCES:116])
					$3->{Size of array:C274($3->)}:=DM_l_BkLastUpdateTime
					$4->{Size of array:C274($4->)}:=DM_D_BkLastUpdateDate
					$5->{Size of array:C274($5->)}:=DM_l_BkFrequency
					$6->{Size of array:C274($6->)}:=DM_t_BkFrequencyType
				Else 
					$1->{$_l_RecordPosition}:=$_l_SourceType
					$2->{$_l_RecordPosition}:=Record number:C243([PREFERENCES:116])
					$3->{$_l_RecordPosition}:=DM_l_BkLastUpdateTime
					$4->{$_l_RecordPosition}:=DM_D_BkLastUpdateDate
					$5->{$_l_RecordPosition}:=DM_l_BkFrequency
					$6->{$_l_RecordPosition}:=DM_t_BkFrequencyType
				End if 
			Else 
				//frequency is 0
				$_l_RecordPosition:=Find in array:C230($2->; Record number:C243([PREFERENCES:116]))
				If ($_l_RecordPosition>0)
					//take it out
					DELETE FROM ARRAY:C228($1->; $_l_RecordPosition; 1)
					DELETE FROM ARRAY:C228($2->; $_l_RecordPosition; 1)
					DELETE FROM ARRAY:C228($3->; $_l_RecordPosition; 1)
					DELETE FROM ARRAY:C228($4->; $_l_RecordPosition; 1)
					DELETE FROM ARRAY:C228($5->; $_l_RecordPosition; 1)
					DELETE FROM ARRAY:C228($6->; $_l_RecordPosition; 1)
					
				End if 
			End if 
		Else 
			//de-activated
			$_l_RecordPosition:=Find in array:C230($2->; Record number:C243([PREFERENCES:116]))
			If ($_l_RecordPosition>0)
				//take it out
				DELETE FROM ARRAY:C228($1->; $_l_RecordPosition; 1)
				DELETE FROM ARRAY:C228($2->; $_l_RecordPosition; 1)
				DELETE FROM ARRAY:C228($3->; $_l_RecordPosition; 1)
				DELETE FROM ARRAY:C228($4->; $_l_RecordPosition; 1)
				DELETE FROM ARRAY:C228($5->; $_l_RecordPosition; 1)
				DELETE FROM ARRAY:C228($6->; $_l_RecordPosition; 1)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DM_GetBKSettings"; $_t_oldMethodName)