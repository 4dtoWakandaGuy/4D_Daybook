//%attributes = {}
If (False:C215)
	//Project Method Name:      DM_CreateWebServSource
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
	ARRAY LONGINT:C221($_al_DBFieldNumbers; 0)
	ARRAY LONGINT:C221($_al_DBFieldRule; 0)
	ARRAY LONGINT:C221($_al_DBTableNumbers; 0)
	//ARRAY LONGINT(DM_al_DBFieldNumbers;0;0)
	//ARRAY LONGINT(DM_al_DBFieldRules;0;0)
	//ARRAY LONGINT(DM_al_DBTableNumbers;0;0)
	ARRAY TEXT:C222($_at_ReceivedVarNames; 0)
	//ARRAY TEXT(DM_at_SourceNameFields;0;0)
	//ARRAY TEXT(DM_at_SourceNames;0)
	C_LONGINT:C283($_l_Index; $_l_Insert; $_l_ItemID; $_l_offset; $_l_Row; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_CreateWebServSource")
//For speed i am going to get this to create the source map. for the KNOWN source
Case of 
	: ($1="SPtimesheet")
		READ ONLY:C145([PREFERENCES:116])
		
		$_l_ItemID:=PREF_GetPreferenceID("Web Page Sources")
		ARRAY TEXT:C222($_at_ReceivedVarNames; 25)
		ARRAY LONGINT:C221($_al_DBTableNumbers; 25)
		ARRAY LONGINT:C221($_al_DBFieldNumbers; 25)
		ARRAY LONGINT:C221($_al_DBFieldRule; 25)
		
		$_l_Row:=1
		$_at_ReceivedVarNames{$_l_Row}:="Engineer"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Person:8)
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Date"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Date_Done_From:5)
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Problem"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Action_Details:10)
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Machine Type"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Action_Details:10)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Serial"
		
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Action_Details:10)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Other Reference"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Action_Details:10)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="StartHr"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=0
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="StartMin"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=0
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="FinHr"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=0
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="FinMin"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=0
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Totatime"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=0
		$_al_DBFieldRule{$_l_Row}:=2
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Where"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Action_Details:10)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Catagory"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=0
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Details"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="CheckBoxLoan"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{16}:="CheckboxPart"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{17}:="CheckboxEscalation"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="CheckboxNFF"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="Status"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="TextFieldName"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="TextFieldEmail"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Result_Description:12)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="mcompanycode"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Company_Code:1)
		$_al_DBFieldRule{$_l_Row}:=1
		
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="mCallno"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Diary_Code:3)
		$_al_DBFieldRule{$_l_Row}:=0
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="mSTART TIME"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Time_Done_From:7)
		$_al_DBFieldRule{$_l_Row}:=0
		$_l_Row:=$_l_Row+1
		$_at_ReceivedVarNames{$_l_Row}:="mEND TIME"
		$_al_DBTableNumbers{$_l_Row}:=Table:C252(->[DIARY:12])
		$_al_DBFieldNumbers{$_l_Row}:=Field:C253(->[DIARY:12]Time_Done_To:36)
		$_al_DBFieldRule{$_l_Row}:=0
		
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
			ARRAY LONGINT:C221(DM_al_DBFieldRules; 0; 0)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_SourceNames; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					$_l_Row:=Size of array:C274(DM_at_SourceNames)
					ARRAY TEXT:C222(DM_at_SourceNameFields; $_l_Row; 0)
					ARRAY LONGINT:C221(DM_al_DBTableNumbers; $_l_Row; 0)
					ARRAY LONGINT:C221(DM_al_DBFieldNumbers; $_l_Row; 0)
					ARRAY LONGINT:C221(DM_al_DBFieldRules; $_l_Row; 0)
					For ($_l_Index; 1; $_l_Row)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_at_SourceNameFields{$_l_Index}; $_l_offset)
						End if 
					End for 
					For ($_l_Index; 1; $_l_Row)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DBTableNumbers{$_l_Index}; $_l_offset)
						End if 
					End for 
					For ($_l_Index; 1; $_l_Row)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DBFieldNumbers{$_l_Index}; $_l_offset)
						End if 
					End for 
					For ($_l_Index; 1; $_l_Row)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DM_al_DBFieldRules{$_l_Index}; $_l_offset)
						End if 
					End for 
				End if 
			End if 
			$_l_Row:=Find in array:C230(DM_at_SourceNames; $1)
			If ($_l_Row<0)
				INSERT IN ARRAY:C227(DM_at_SourceNames; Size of array:C274(DM_at_SourceNames)+1; 1)
				DM_at_SourceNames{Size of array:C274(DM_at_SourceNames)}:=$1
				INSERT IN ARRAY:C227(DM_at_SourceNameFields; Size of array:C274(DM_at_SourceNameFields)+1; 1)
				INSERT IN ARRAY:C227(DM_al_DBTableNumbers; Size of array:C274(DM_al_DBTableNumbers)+1; 1)
				INSERT IN ARRAY:C227(DM_al_DBFieldNumbers; Size of array:C274(DM_al_DBFieldNumbers)+1; 1)
				INSERT IN ARRAY:C227(DM_al_DBFieldRules; Size of array:C274(DM_al_DBFieldRules)+1; 1)
				$_l_Row:=Size of array:C274(DM_at_SourceNames)
				$_l_SizeofArray:=Size of array:C274(DM_at_SourceNameFields{$_l_Row})
				If ($_l_SizeofArray<Size of array:C274($_at_ReceivedVarNames))
					$_l_Insert:=Size of array:C274($_at_ReceivedVarNames)-$_l_SizeofArray
					INSERT IN ARRAY:C227(DM_at_SourceNameFields{$_l_Row}; $_l_SizeofArray+1; $_l_Insert)
				End if 
				$_l_SizeofArray:=Size of array:C274(DM_al_DBTableNumbers{$_l_Row})
				If ($_l_SizeofArray<Size of array:C274($_al_DBTableNumbers))
					$_l_Insert:=Size of array:C274($_al_DBTableNumbers)-$_l_SizeofArray
					INSERT IN ARRAY:C227(DM_al_DBTableNumbers{$_l_Row}; $_l_SizeofArray+1; $_l_Insert)
				End if 
				$_l_SizeofArray:=Size of array:C274(DM_al_DBFieldNumbers{$_l_Row})
				If ($_l_SizeofArray<Size of array:C274($_al_DBFieldNumbers))
					$_l_Insert:=Size of array:C274($_al_DBFieldNumbers)-$_l_SizeofArray
					INSERT IN ARRAY:C227(DM_al_DBFieldNumbers{$_l_Row}; $_l_SizeofArray+1; $_l_Insert)
				End if 
				$_l_SizeofArray:=Size of array:C274(DM_al_DBFieldRules{$_l_Row})
				If ($_l_SizeofArray<Size of array:C274($_al_DBFieldRule))
					$_l_Insert:=Size of array:C274($_al_DBFieldRule)-$_l_SizeofArray
					INSERT IN ARRAY:C227(DM_al_DBFieldRules{$_l_Row}; $_l_SizeofArray+1; $_l_Insert)
				End if 
			Else 
				$_l_Row:=$_l_Row
				
			End if 
			For ($_l_Index; 1; Size of array:C274($_at_ReceivedVarNames))
				DM_at_SourceNameFields{$_l_Row}{$_l_Index}:=$_at_ReceivedVarNames{$_l_Index}
			End for 
			For ($_l_Index; 1; Size of array:C274($_al_DBTableNumbers))
				DM_al_DBTableNumbers{$_l_Row}{$_l_Index}:=$_al_DBTableNumbers{$_l_Index}
			End for 
			For ($_l_Index; 1; Size of array:C274($_al_DBFieldNumbers))
				DM_al_DBFieldNumbers{$_l_Row}{$_l_Index}:=$_al_DBFieldNumbers{$_l_Index}
			End for 
			For ($_l_Index; 1; Size of array:C274($_al_DBFieldRule))
				DM_al_DBFieldRules{$_l_Row}{$_l_Index}:=$_al_DBFieldRule{$_l_Index}
			End for 
			//and now we can save the blob
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
			If (Records in selection:C76([PREFERENCES:116])=0)
				//There is no record
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_ItemID
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(DM_at_SourceNames; [PREFERENCES:116]DataBlob:2; *)
			For ($_l_Index; 1; Size of array:C274(DM_at_SourceNameFields))
				VARIABLE TO BLOB:C532(DM_at_SourceNameFields{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index; 1; Size of array:C274(DM_al_DBTableNumbers))
				VARIABLE TO BLOB:C532(DM_al_DBTableNumbers{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index; 1; Size of array:C274(DM_al_DBFieldNumbers))
				VARIABLE TO BLOB:C532(DM_al_DBFieldNumbers{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			For ($_l_Index; 1; Size of array:C274(DM_al_DBFieldRules))
				VARIABLE TO BLOB:C532(DM_al_DBFieldRules{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
		End if 
		
End case 
ERR_MethodTrackerReturn("DM_CreateWebServSource"; $_t_oldMethodName)