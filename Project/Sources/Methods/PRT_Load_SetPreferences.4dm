//%attributes = {}
If (False:C215)
	//Project Method Name:      PRT_Load_SetPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/01/2010 18:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(PRT_at_PaperSizes;0;0)
	//Array Text(PRT_at_PaperSources;0;0)
	//Array Text(PRT_at_PrinterNames;0;0)
	ARRAY LONGINT:C221($_al_OrientationOption; 0; 0)
	ARRAY LONGINT:C221($_al_PaperHeight; 0; 0)
	ARRAY LONGINT:C221($_al_PaperScaling; 0; 0)
	ARRAY LONGINT:C221($_al_PaperWidths; 0; 0)
	ARRAY LONGINT:C221($_al_UserIds; 0)
	//ARRAY LONGINT(PRT_al_OrientationOption;0;0)
	//ARRAY LONGINT(PRT_al_PaperHeights;0;0)
	//ARRAY LONGINT(PRT_al_PaperScaling;0;0)
	//ARRAY LONGINT(PRT_al_PaperWidths;0;0)
	//ARRAY LONGINT(PRT_al_UserIDs;0)
	ARRAY TEXT:C222($_at_PaperSizes; 0; 0)
	ARRAY TEXT:C222($_at_PaperSources; 0; 0)
	ARRAY TEXT:C222($_at_PrinterNames; 0; 0)
	C_BOOLEAN:C305($_bo_Save; $1)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ArraySize; $_l_ArraySize2; $_l_Index; $_l_Insert; $_l_LocalUserPosition; $_l_Offset; $_l_PreferenceItemID; $_l_UserPosition; PRT_ArraysDeclared)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRT_Load_SetPreferences"; Form event code:C388)
READ ONLY:C145([PREFERENCES:116])


While (Semaphore:C143("LoadingPrefsPrinting"))
	DelayTicks(2)
End while 
If (PRT_ArraysDeclared=0)
	ARRAY LONGINT:C221(PRT_al_UserIDs; 0)
	ARRAY TEXT:C222(PRT_at_PrinterNames; 0; 0)
	ARRAY TEXT:C222(PRT_at_PaperSources; 0; 0)
	ARRAY LONGINT:C221(PRT_al_PaperWidths; 0; 0)
	ARRAY LONGINT:C221(PRT_al_PaperHeights; 0; 0)
	ARRAY TEXT:C222(PRT_at_PaperSizes; 0; 0)
	ARRAY LONGINT:C221(PRT_al_OrientationOption; 0; 0)
	ARRAY LONGINT:C221(PRT_al_PaperScaling; 0; 0)
	PRT_ArraysDeclared:=1
End if 
$_l_PreferenceItemID:=PREF_GetPreferenceID("Printing Preferences")
CLEAR SEMAPHORE:C144("LoadingPrefsPrinting")
While (Semaphore:C143("CheckingPrintPrefs"))
	DelayTicks(2)
End while 
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	ARRAY LONGINT:C221(PRT_al_UserIDs; 1)
	ARRAY TEXT:C222(PRT_at_PrinterNames; 1; 0)
	ARRAY TEXT:C222(PRT_at_PaperSources; 1; 0)
	ARRAY TEXT:C222(PRT_at_PaperSizes; 1; 0)
	ARRAY LONGINT:C221(PRT_al_PaperWidths; 1; 0)
	ARRAY LONGINT:C221(PRT_al_PaperHeights; 1; 0)
	ARRAY LONGINT:C221(PRT_al_OrientationOption; 1; 0)
	ARRAY LONGINT:C221(PRT_al_PaperScaling; 1; 0)
	PRT_al_UserIDs{1}:=<>PER_l_CurrentUserID
	//When we have created the new reports there will be a preference stored for each report
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_PreferenceItemID
	VARIABLE TO BLOB:C532(PRT_al_UserIDs; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_at_PrinterNames{1}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_at_PaperSources{1}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_at_PaperSizes{1}; [PREFERENCES:116]DataBlob:2; *)
	
	VARIABLE TO BLOB:C532(PRT_al_PaperWidths{1}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_al_PaperHeights{1}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_al_OrientationOption{1}; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(PRT_al_PaperScaling{1}; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
	
End if 

If (Count parameters:C259>=1)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 
If ($_bo_Save)
	
	//we are writing back the prefs.
	//note we have to reload here because other people could have changed their settings..we only change the settings for this user
	READ WRITE:C146([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceItemID)
	$_l_Offset:=0
	ARRAY LONGINT:C221($_al_UserIds; 0)
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_UserIds; $_l_Offset)
	$_l_ArraySize:=Size of array:C274($_al_UserIds)
	ARRAY TEXT:C222($_at_PrinterNames; $_l_ArraySize; 0)
	ARRAY TEXT:C222($_at_PaperSources; $_l_ArraySize; 0)
	ARRAY TEXT:C222($_at_PaperSizes; $_l_ArraySize; 0)
	ARRAY LONGINT:C221($_al_PaperWidths; $_l_ArraySize; 0)
	ARRAY LONGINT:C221($_al_PaperHeight; $_l_ArraySize; 0)
	ARRAY LONGINT:C221($_al_OrientationOption; $_l_ArraySize; 0)
	ARRAY LONGINT:C221($_al_PaperScaling; $_l_ArraySize; 0)
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset) & ($_l_Index<=$_l_ArraySize)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_PrinterNames{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset) & ($_l_Index<=$_l_ArraySize)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_PaperSources{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset) & ($_l_Index<=$_l_ArraySize)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_PaperSizes{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset) & ($_l_Index<=$_l_ArraySize)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_PaperWidths{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset) & ($_l_Index<=$_l_ArraySize)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_PaperHeight{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset) & ($_l_Index<=$_l_ArraySize)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_OrientationOption{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset) & ($_l_Index<=$_l_ArraySize)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_al_PaperScaling{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	$_l_UserPosition:=Find in array:C230(PRT_al_UserIDs; <>PER_l_CurrentUserID)
	If ($_l_UserPosition>0)  //| (True)  `if not nothing to test
		$_l_LocalUserPosition:=Find in array:C230($_al_UserIds; <>PER_l_CurrentUserID)
		If ($_l_LocalUserPosition<0)
			$_l_ArraySize:=Size of array:C274($_al_UserIds)
			INSERT IN ARRAY:C227($_al_UserIds; Size of array:C274($_al_UserIds)+1; 1)
			If (Size of array:C274($_at_PrinterNames)<$_l_ArraySize)
				Repeat 
					INSERT IN ARRAY:C227($_at_PrinterNames; Size of array:C274($_at_PrinterNames)+1; 1)
				Until (Size of array:C274($_at_PrinterNames)=$_l_ArraySize)
			End if 
			INSERT IN ARRAY:C227($_at_PrinterNames; Size of array:C274($_at_PrinterNames)+1; 1)
			If (Size of array:C274($_at_PaperSources)<$_l_ArraySize)
				Repeat 
					INSERT IN ARRAY:C227($_at_PaperSources; Size of array:C274($_at_PaperSources)+1; 1)
				Until (Size of array:C274($_at_PaperSources)=$_l_ArraySize)
			End if 
			
			INSERT IN ARRAY:C227($_at_PaperSources; Size of array:C274($_at_PaperSources)+1; 1)
			If (Size of array:C274($_at_PaperSizes)<$_l_ArraySize)
				Repeat 
					INSERT IN ARRAY:C227($_at_PaperSizes; Size of array:C274($_at_PaperSizes)+1; 1)
				Until (Size of array:C274($_at_PaperSizes)=$_l_ArraySize)
			End if 
			
			INSERT IN ARRAY:C227($_at_PaperSizes; Size of array:C274($_at_PaperSizes)+1; 1)
			If (Size of array:C274($_al_PaperWidths)<$_l_ArraySize)
				Repeat 
					INSERT IN ARRAY:C227($_al_PaperWidths; Size of array:C274($_al_PaperWidths)+1; 1)
				Until (Size of array:C274($_al_PaperWidths)=$_l_ArraySize)
			End if 
			
			INSERT IN ARRAY:C227($_al_PaperWidths; Size of array:C274($_at_PaperSizes)+1; 1)
			If (Size of array:C274($_al_PaperHeight)<$_l_ArraySize)
				Repeat 
					INSERT IN ARRAY:C227($_al_PaperHeight; Size of array:C274($_al_PaperHeight)+1; 1)
				Until (Size of array:C274($_al_PaperHeight)=$_l_ArraySize)
			End if 
			
			INSERT IN ARRAY:C227($_al_PaperHeight; Size of array:C274($_al_PaperHeight)+1; 1)
			If (Size of array:C274($_al_OrientationOption)<$_l_ArraySize)
				Repeat 
					INSERT IN ARRAY:C227($_al_OrientationOption; Size of array:C274($_al_OrientationOption)+1; 1)
				Until (Size of array:C274($_al_OrientationOption)=$_l_ArraySize)
			End if 
			
			INSERT IN ARRAY:C227($_al_OrientationOption; Size of array:C274($_al_OrientationOption)+1; 1)
			If (Size of array:C274($_al_PaperScaling)<$_l_ArraySize)
				Repeat 
					INSERT IN ARRAY:C227($_al_PaperScaling; Size of array:C274($_al_PaperScaling)+1; 1)
				Until (Size of array:C274($_al_PaperScaling)=$_l_ArraySize)
			End if 
			
			INSERT IN ARRAY:C227($_al_PaperScaling; Size of array:C274($_al_PaperScaling)+1; 1)
			$_al_UserIds{Size of array:C274($_al_UserIds)}:=<>PER_l_CurrentUserID
			
			$_l_LocalUserPosition:=Size of array:C274($_al_UserIds)
		End if 
		//`
		$_l_ArraySize:=Size of array:C274(PRT_at_PrinterNames{$_l_UserPosition})
		If (Size of array:C274(PRT_at_PaperSources{$_l_UserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274(PRT_at_PaperSources{$_l_UserPosition})
		End if 
		If (Size of array:C274(PRT_at_PaperSizes{$_l_UserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274(PRT_at_PaperSizes{$_l_UserPosition})
		End if 
		If (Size of array:C274(PRT_al_PaperWidths{$_l_UserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274(PRT_al_PaperWidths{$_l_UserPosition})
		End if 
		If (Size of array:C274(PRT_al_PaperHeights{$_l_UserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274(PRT_al_PaperHeights{$_l_UserPosition})
		End if 
		If (Size of array:C274(PRT_al_OrientationOption{$_l_UserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274(PRT_al_OrientationOption{$_l_UserPosition})
		End if 
		
		If (Size of array:C274(PRT_al_PaperScaling{$_l_UserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274(PRT_al_PaperScaling{$_l_UserPosition})
		End if 
		//That sets $_l_ArraySize to the max width
		//``
		If (Size of array:C274($_at_PrinterNames{$_l_LocalUserPosition})<Size of array:C274(PRT_at_PrinterNames{$_l_UserPosition}))
			$_l_Insert:=(Size of array:C274(PRT_at_PrinterNames{$_l_UserPosition}))-(Size of array:C274($_at_PrinterNames{$_l_LocalUserPosition}))
			$_l_ArraySize:=Size of array:C274($_at_PrinterNames{$_l_LocalUserPosition})
			INSERT IN ARRAY:C227($_at_PrinterNames{$_l_LocalUserPosition}; $_l_ArraySize+1; $_l_Insert)
		End if 
		If (Size of array:C274($_at_PaperSources{$_l_LocalUserPosition})<Size of array:C274(PRT_at_PaperSources{$_l_UserPosition}))
			$_l_Insert:=(Size of array:C274(PRT_at_PaperSources{$_l_UserPosition}))-(Size of array:C274($_at_PaperSources{$_l_LocalUserPosition}))
			$_l_ArraySize:=Size of array:C274($_at_PaperSources{$_l_LocalUserPosition})
			INSERT IN ARRAY:C227($_at_PaperSources{$_l_LocalUserPosition}; $_l_ArraySize+1; $_l_Insert)
		End if 
		If (Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})<Size of array:C274(PRT_at_PaperSizes{$_l_UserPosition}))
			$_l_Insert:=(Size of array:C274(PRT_at_PaperSizes{$_l_UserPosition}))-(Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition}))
			$_l_ArraySize:=Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})
			INSERT IN ARRAY:C227($_at_PaperSizes{$_l_LocalUserPosition}; $_l_ArraySize+1; $_l_Insert)
		End if 
		If (Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition})<Size of array:C274(PRT_al_PaperWidths{$_l_UserPosition}))
			$_l_Insert:=(Size of array:C274(PRT_al_PaperWidths{$_l_UserPosition}))-(Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition}))
			$_l_ArraySize:=Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition})
			INSERT IN ARRAY:C227($_al_PaperWidths{$_l_LocalUserPosition}; $_l_ArraySize+1; $_l_Insert)
		End if 
		If (Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition})<Size of array:C274(PRT_al_PaperHeights{$_l_UserPosition}))
			$_l_Insert:=(Size of array:C274(PRT_al_PaperHeights{$_l_UserPosition}))-(Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition}))
			$_l_ArraySize:=Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition})
			INSERT IN ARRAY:C227($_al_PaperHeight{$_l_LocalUserPosition}; $_l_ArraySize+1; $_l_Insert)
		End if 
		If (Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition})<Size of array:C274(PRT_al_OrientationOption{$_l_UserPosition}))
			$_l_Insert:=(Size of array:C274(PRT_al_OrientationOption{$_l_UserPosition}))-(Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition}))
			$_l_ArraySize:=Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition})
			INSERT IN ARRAY:C227($_al_OrientationOption{$_l_LocalUserPosition}; $_l_ArraySize+1; $_l_Insert)
		End if 
		If (Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition})<Size of array:C274(PRT_al_PaperScaling{$_l_UserPosition}))
			$_l_Insert:=(Size of array:C274(PRT_al_PaperScaling{$_l_UserPosition}))-(Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition}))
			$_l_ArraySize:=Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition})
			INSERT IN ARRAY:C227($_al_PaperScaling{$_l_LocalUserPosition}; $_l_ArraySize+1; $_l_Insert)
		End if 
		$_al_UserIds{$_l_LocalUserPosition}:=PRT_al_UserIDs{$_l_UserPosition}
		$_l_ArraySize:=Size of array:C274($_at_PrinterNames{$_l_LocalUserPosition})
		If (Size of array:C274($_at_PaperSources{$_l_LocalUserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274($_at_PaperSources{$_l_LocalUserPosition})
		End if 
		If (Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})
		End if 
		If (Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition})
		End if 
		If (Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition})
		End if 
		If (Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition})
		End if 
		If (Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition})>$_l_ArraySize)
			$_l_ArraySize:=Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition})
		End if 
		For ($_l_Index; 1; $_l_ArraySize)
			If ($_l_Index<=Size of array:C274(PRT_at_PrinterNames{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_at_PrinterNames{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_at_PrinterNames{$_l_LocalUserPosition}; Size of array:C274($_at_PrinterNames{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_at_PrinterNames{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_at_PrinterNames{$_l_LocalUserPosition}{$_l_Index}:=PRT_at_PrinterNames{$_l_UserPosition}{$_l_Index}
				
			End if 
			If ($_l_Index<=Size of array:C274(PRT_at_PaperSources{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_at_PaperSources{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_at_PaperSources{$_l_LocalUserPosition}; Size of array:C274($_at_PaperSources{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_at_PaperSources{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_at_PaperSources{$_l_LocalUserPosition}{$_l_Index}:=PRT_at_PaperSources{$_l_UserPosition}{$_l_Index}
				
			End if 
			If ($_l_Index<=Size of array:C274(PRT_at_PaperSizes{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_at_PaperSizes{$_l_LocalUserPosition}; Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_at_PaperSizes{$_l_LocalUserPosition}{$_l_Index}:=PRT_at_PaperSizes{$_l_UserPosition}{$_l_Index}
				
			End if 
			If ($_l_Index<=Size of array:C274(PRT_at_PaperSizes{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_at_PaperSizes{$_l_LocalUserPosition}; Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_at_PaperSizes{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_at_PaperSizes{$_l_LocalUserPosition}{$_l_Index}:=PRT_at_PaperSizes{$_l_UserPosition}{$_l_Index}
				
			End if 
			If ($_l_Index<=Size of array:C274(PRT_al_PaperWidths{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_al_PaperWidths{$_l_LocalUserPosition}; Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_al_PaperWidths{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_al_PaperWidths{$_l_LocalUserPosition}{$_l_Index}:=PRT_al_PaperWidths{$_l_UserPosition}{$_l_Index}
				
			End if 
			
			If ($_l_Index<=Size of array:C274(PRT_al_PaperHeights{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_al_PaperHeight{$_l_LocalUserPosition}; Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_al_PaperHeight{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_al_PaperHeight{$_l_LocalUserPosition}{$_l_Index}:=PRT_al_PaperHeights{$_l_UserPosition}{$_l_Index}
			End if 
			If ($_l_Index<=Size of array:C274(PRT_al_OrientationOption{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_al_OrientationOption{$_l_LocalUserPosition}; Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_al_OrientationOption{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_al_OrientationOption{$_l_LocalUserPosition}{$_l_Index}:=PRT_al_OrientationOption{$_l_UserPosition}{$_l_Index}
			End if 
			If ($_l_Index<=Size of array:C274(PRT_al_PaperScaling{$_l_UserPosition}))
				If ($_l_Index>Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition}))
					Repeat 
						INSERT IN ARRAY:C227($_al_PaperScaling{$_l_LocalUserPosition}; Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition})+1; 1)
					Until (Size of array:C274($_al_PaperScaling{$_l_LocalUserPosition})>=$_l_Index)
				End if 
				$_al_PaperScaling{$_l_LocalUserPosition}{$_l_Index}:=PRT_al_PaperScaling{$_l_UserPosition}{$_l_Index}
			End if 
			
		End for 
		//and now write them to the blob
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532($_al_UserIds; [PREFERENCES:116]DataBlob:2; *)
		$_l_ArraySize:=Size of array:C274($_al_UserIds)
		For ($_l_Index; 1; $_l_ArraySize)
			VARIABLE TO BLOB:C532($_at_PrinterNames{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; $_l_ArraySize)
			VARIABLE TO BLOB:C532($_at_PaperSources{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; $_l_ArraySize)
			VARIABLE TO BLOB:C532($_at_PaperSizes{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; $_l_ArraySize)
			VARIABLE TO BLOB:C532($_al_PaperWidths{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; $_l_ArraySize)
			VARIABLE TO BLOB:C532($_al_PaperHeight{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; $_l_ArraySize)
			VARIABLE TO BLOB:C532($_al_OrientationOption{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		For ($_l_Index; 1; $_l_ArraySize)
			VARIABLE TO BLOB:C532($_al_PaperScaling{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
	Else 
		
	End if 
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
	
	
	
	
	
Else 
	//read the prefs
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceItemID)
	$_l_Offset:=0
	ARRAY LONGINT:C221(PRT_al_UserIDs; 0)
	
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_al_UserIDs; $_l_Offset)
	$_l_ArraySize:=Size of array:C274(PRT_al_UserIDs)
	
	ARRAY TEXT:C222(PRT_at_PrinterNames; $_l_ArraySize; 0)
	ARRAY TEXT:C222(PRT_at_PaperSources; $_l_ArraySize; 0)
	ARRAY TEXT:C222(PRT_at_PaperSizes; $_l_ArraySize; 0)
	ARRAY LONGINT:C221(PRT_al_PaperWidths; $_l_ArraySize; 0)
	ARRAY LONGINT:C221(PRT_al_PaperHeights; $_l_ArraySize; 0)
	ARRAY LONGINT:C221(PRT_al_OrientationOption; $_l_ArraySize; 0)
	ARRAY LONGINT:C221(PRT_al_PaperScaling; $_l_ArraySize; 0)
	
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_at_PrinterNames{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_at_PaperSources{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_at_PaperSizes{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_al_PaperWidths{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_al_PaperHeights{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
		
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_al_OrientationOption{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
		
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PRT_al_PaperScaling{$_l_Index}; $_l_Offset)
		Else 
			$_l_Index:=$_l_ArraySize
		End if 
	End for 
	If (Size of array:C274(PRT_at_PrinterNames)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(PRT_at_PrinterNames; Size of array:C274(PRT_at_PrinterNames)+1; 1)
		Until (Size of array:C274(PRT_at_PrinterNames)=$_l_ArraySize)
	End if 
	If (Size of array:C274(PRT_at_PaperSources)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(PRT_at_PaperSources; Size of array:C274(PRT_at_PaperSources)+1; 1)
		Until (Size of array:C274(PRT_at_PaperSources)=$_l_ArraySize)
	End if 
	If (Size of array:C274(PRT_at_PaperSizes)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(PRT_at_PaperSizes; Size of array:C274(PRT_at_PaperSizes)+1; 1)
		Until (Size of array:C274(PRT_at_PaperSizes)=$_l_ArraySize)
	End if 
	If (Size of array:C274(PRT_al_PaperWidths)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(PRT_al_PaperWidths; Size of array:C274(PRT_al_PaperWidths)+1; 1)
		Until (Size of array:C274(PRT_al_PaperWidths)=$_l_ArraySize)
	End if 
	If (Size of array:C274(PRT_al_PaperHeights)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(PRT_al_PaperHeights; Size of array:C274(PRT_al_PaperHeights)+1; 1)
		Until (Size of array:C274(PRT_al_PaperHeights)=$_l_ArraySize)
	End if 
	If (Size of array:C274(PRT_al_OrientationOption)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(PRT_al_OrientationOption; Size of array:C274(PRT_al_OrientationOption)+1; 1)
		Until (Size of array:C274(PRT_al_OrientationOption)=$_l_ArraySize)
		
	End if 
	If (Size of array:C274(PRT_al_PaperScaling)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(PRT_al_PaperScaling; Size of array:C274(PRT_al_PaperScaling)+1; 1)
		Until (Size of array:C274(PRT_al_PaperScaling)=$_l_ArraySize)
		
	End if 
	For ($_l_Index; 1; Size of array:C274(PRT_at_PrinterNames))
		$_l_ArraySize2:=Size of array:C274(PRT_at_PrinterNames{$_l_Index})
		If (Size of array:C274(PRT_at_PaperSources{$_l_Index})#$_l_ArraySize2)
			Case of 
				: (Size of array:C274(PRT_at_PaperSources{$_l_Index})>$_l_ArraySize2)
					Repeat 
						DELETE FROM ARRAY:C228(PRT_at_PaperSources{$_l_Index}; Size of array:C274(PRT_at_PaperSources{$_l_Index}); 1)
						
					Until (Size of array:C274(PRT_at_PaperSources{$_l_Index})=$_l_ArraySize2)
				: (Size of array:C274(PRT_at_PaperSources{$_l_Index})<$_l_ArraySize2)
					Repeat 
						INSERT IN ARRAY:C227(PRT_at_PaperSources{$_l_Index}; Size of array:C274(PRT_at_PaperSources{$_l_Index})+1; 1)
					Until (Size of array:C274(PRT_at_PaperSources{$_l_Index})=$_l_ArraySize2)
					
			End case 
		End if 
		If (Size of array:C274(PRT_at_PaperSizes{$_l_Index})#$_l_ArraySize2)
			Case of 
				: (Size of array:C274(PRT_at_PaperSizes{$_l_Index})>$_l_ArraySize2)
					Repeat 
						DELETE FROM ARRAY:C228(PRT_at_PaperSizes{$_l_Index}; Size of array:C274(PRT_at_PaperSizes{$_l_Index}); 1)
						
					Until (Size of array:C274(PRT_at_PaperSizes{$_l_Index})=$_l_ArraySize2)
				: (Size of array:C274(PRT_at_PaperSizes{$_l_Index})<$_l_ArraySize2)
					Repeat 
						INSERT IN ARRAY:C227(PRT_at_PaperSizes{$_l_Index}; Size of array:C274(PRT_at_PaperSizes{$_l_Index})+1; 1)
					Until (Size of array:C274(PRT_at_PaperSizes{$_l_Index})=$_l_ArraySize2)
					
			End case 
		End if 
		If (Size of array:C274(PRT_al_PaperWidths{$_l_Index})#$_l_ArraySize2)
			Case of 
				: (Size of array:C274(PRT_al_PaperWidths{$_l_Index})>$_l_ArraySize2)
					Repeat 
						DELETE FROM ARRAY:C228(PRT_al_PaperWidths{$_l_Index}; Size of array:C274(PRT_al_PaperWidths{$_l_Index}); 1)
						
					Until (Size of array:C274(PRT_al_PaperWidths{$_l_Index})=$_l_ArraySize2)
				: (Size of array:C274(PRT_al_PaperWidths{$_l_Index})<$_l_ArraySize2)
					Repeat 
						INSERT IN ARRAY:C227(PRT_al_PaperWidths{$_l_Index}; Size of array:C274(PRT_al_PaperWidths{$_l_Index})+1; 1)
					Until (Size of array:C274(PRT_al_PaperWidths{$_l_Index})=$_l_ArraySize2)
					
			End case 
		End if 
		If (Size of array:C274(PRT_al_PaperHeights{$_l_Index})#$_l_ArraySize2)
			Case of 
				: (Size of array:C274(PRT_al_PaperHeights{$_l_Index})>$_l_ArraySize2)
					Repeat 
						DELETE FROM ARRAY:C228(PRT_al_PaperHeights{$_l_Index}; Size of array:C274(PRT_al_PaperHeights{$_l_Index}); 1)
						
					Until (Size of array:C274(PRT_al_PaperHeights{$_l_Index})=$_l_ArraySize2)
				: (Size of array:C274(PRT_al_PaperHeights{$_l_Index})<$_l_ArraySize2)
					Repeat 
						INSERT IN ARRAY:C227(PRT_al_PaperHeights{$_l_Index}; Size of array:C274(PRT_al_PaperHeights{$_l_Index})+1; 1)
					Until (Size of array:C274(PRT_al_PaperHeights{$_l_Index})=$_l_ArraySize2)
					
			End case 
		End if 
		If (Size of array:C274(PRT_al_OrientationOption{$_l_Index})#$_l_ArraySize2)
			Case of 
				: (Size of array:C274(PRT_al_OrientationOption{$_l_Index})>$_l_ArraySize2)
					Repeat 
						DELETE FROM ARRAY:C228(PRT_al_OrientationOption{$_l_Index}; Size of array:C274(PRT_al_OrientationOption{$_l_Index}); 1)
						
					Until (Size of array:C274(PRT_al_OrientationOption{$_l_Index})=$_l_ArraySize2)
				: (Size of array:C274(PRT_al_OrientationOption{$_l_Index})<$_l_ArraySize2)
					Repeat 
						INSERT IN ARRAY:C227(PRT_al_OrientationOption{$_l_Index}; Size of array:C274(PRT_al_OrientationOption{$_l_Index})+1; 1)
					Until (Size of array:C274(PRT_al_OrientationOption{$_l_Index})=$_l_ArraySize2)
					
			End case 
		End if 
		If (Size of array:C274(PRT_al_PaperScaling{$_l_Index})#$_l_ArraySize2)
			Case of 
				: (Size of array:C274(PRT_al_PaperScaling{$_l_Index})>$_l_ArraySize2)
					Repeat 
						DELETE FROM ARRAY:C228(PRT_al_PaperScaling{$_l_Index}; Size of array:C274(PRT_al_PaperScaling{$_l_Index}); 1)
						
					Until (Size of array:C274(PRT_al_PaperScaling{$_l_Index})=$_l_ArraySize2)
				: (Size of array:C274(PRT_al_PaperScaling{$_l_Index})<$_l_ArraySize2)
					Repeat 
						INSERT IN ARRAY:C227(PRT_al_PaperScaling{$_l_Index}; Size of array:C274(PRT_al_PaperScaling{$_l_Index})+1; 1)
					Until (Size of array:C274(PRT_al_PaperScaling{$_l_Index})=$_l_ArraySize2)
					
			End case 
		End if 
	End for 
	$_l_UserPosition:=Find in array:C230(PRT_al_UserIDs; <>PER_l_CurrentUserID)
	If ($_l_UserPosition<0)
		//Gen_Alert ("The current users print preferences are not known")
	End if 
	
End if 
CLEAR SEMAPHORE:C144("CheckingPrintPrefs")
ERR_MethodTrackerReturn("PRT_Load_SetPreferences"; $_t_oldMethodName)