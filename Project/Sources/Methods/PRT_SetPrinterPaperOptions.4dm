//%attributes = {}
If (False:C215)
	//Project Method Name:      PRT_SetPrinterPaperOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	//C_UNKNOWN(PRT_ArraysDeclared)
	_O_C_STRING:C293(255; PRT_S255_PaperSource2)
	//ARRAY LONGINT(PRT_al_OrientationOption;0)
	//ARRAY LONGINT(PRT_al_PaperHeights;0)
	//ARRAY LONGINT(PRT_al_PaperScaling;0)
	//ARRAY LONGINT(PRT_al_PaperWidths;0)
	//ARRAY LONGINT(PRT_al_UserIDs;0)
	//ARRAY TEXT(PRT_at_PaperSizes;0)
	//ARRAY TEXT(PRT_at_PaperSources;0)
	//ARRAY TEXT(PRT_at_PrinterNames;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Save; $_bo_SharedPrinter; $_bo_Ask; $_bo_Continue; $_bo_Save; $_bo_SharedPrinter)
	C_LONGINT:C283($_l_Orientation; $_l_P1; $_l_P2; $_l_P3; $_l_PrinterColumn; $_l_PrintTrayID; $_l_Scale; $_l_Size; $_l_Size2; $_l_SizeofArray1; PRT_ArraysDeclared)
	C_LONGINT:C283(PRT_l_PaperOrientation2; PRT_l_PaperScaling2; PRT_l_PaperWidth2; <>PER_l_CurrentUserID; $_l_Orientation; $_l_P1; $_l_P2; $_l_P3; $_l_PrinterColumn; $_l_PrintTrayID; $_l_Scale)
	C_LONGINT:C283($_l_Size; $_l_Size2; $_l_SizeofArray1; $_l_UserRow; PRT_l_PaperHeight2; PRT_l_PaperOrientation2; PRT_l_PaperScaling2; PRT_l_PaperWidth2)
	C_TEXT:C284($_t_oldMethodName2; $_t_PaperName; $_t_PrinterName; $_t_PrintTrayName; $1; PRT_S255_PaperSource2; PRT_t_PaperName2; $_t_oldMethodName; $_t_oldMethodName2; $_t_PaperName; $_t_PrinterName)
	C_TEXT:C284($_t_PrintTrayName; PRT_t_PaperName2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("PRT_SetPrinterPaperOptions")

//Gen_Alert ("1")
$_t_PrinterName:=Get current printer:C788
$_bo_SharedPrinter:=False:C215
$_bo_Save:=False:C215

//Gen_Alert ("2")
$_t_PaperName:=""
$_l_P3:=0
//TRACE
GET PRINT OPTION:C734(Scale option:K47:3; $_l_Scale)
//kmw 18/08/08 - on mac the following seems to return blank?
GET PRINT OPTION:C734(Paper option:K47:1; $_t_PaperName)
//GET PRINT OPTION(Paper option ;$_l_P3)
GET PRINT OPTION:C734(Orientation option:K47:2; $_l_Orientation)
$_l_P1:=0
$_l_P2:=0
GET PRINT OPTION:C734(Paper option:K47:1; $_l_P1; $_l_P2)
//Gen_Alert ("3")
If (Is Windows:C1573)
	$_t_PrintTrayName:=""
	$_l_PrintTrayID:=0
	GET PRINT OPTION:C734(5; $_l_PrintTrayID)
	//$_t_PrintTrayName;$_l_PrintTrayID)
Else 
	$_t_PrintTrayName:=""
	$_l_PrintTrayID:=0
End if 
//Gen_Alert ("4")

$_bo_Ask:=False:C215
$_l_UserRow:=Find in array:C230(PRT_al_UserIDs; <>PER_l_CurrentUserID)
If ($_l_UserRow>0)
	If (Count parameters:C259>=1)
		$_l_PrinterColumn:=Find in array:C230(PRT_at_PrinterNames{$_l_UserRow}; $_t_PrinterName+"_"+$1)
	Else 
		$_l_PrinterColumn:=Find in array:C230(PRT_at_PrinterNames{$_l_UserRow}; $_t_PrinterName)
	End if 
	//Gen_Alert ("5")
	If ($_l_PrinterColumn>0)
		PRT_t_PaperName2:=""
		PRT_S255_PaperSource2:=""
		PRT_l_PaperWidth2:=0
		PRT_l_PaperHeight2:=0
		
		PRT_l_PaperOrientation2:=0
		PRT_l_PaperScaling2:=100
		//Gen_Alert ("6")
		If (Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})>=$_l_PrinterColumn)
			PRT_t_PaperName2:=PRT_at_PaperSizes{$_l_UserRow}{$_l_PrinterColumn}
		End if 
		//Gen_Alert ("6")
		If (Size of array:C274(PRT_at_PaperSources{$_l_UserRow})>=$_l_PrinterColumn)
			PRT_S255_PaperSource2:=PRT_at_PaperSources{$_l_UserRow}{$_l_PrinterColumn}
		End if 
		//Gen_Alert ("7")
		If (Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})>=$_l_PrinterColumn)
			PRT_l_PaperWidth2:=PRT_al_PaperWidths{$_l_UserRow}{$_l_PrinterColumn}
		End if 
		//Gen_Alert ("8")
		If (Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})>=$_l_PrinterColumn)
			PRT_l_PaperHeight2:=PRT_al_PaperHeights{$_l_UserRow}{$_l_PrinterColumn}
		End if 
		//Gen_Alert ("9")
		If (Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})>=$_l_PrinterColumn)
			PRT_l_PaperOrientation2:=PRT_al_OrientationOption{$_l_UserRow}{$_l_PrinterColumn}
		End if 
		//Gen_Alert ("10")
		If (Size of array:C274(PRT_al_PaperScaling{$_l_UserRow})>=$_l_PrinterColumn)
			PRT_l_PaperScaling2:=PRT_al_PaperScaling{$_l_UserRow}{$_l_PrinterColumn}
		End if 
		//Gen_Alert ("11")
		//kmw 18/08/08 - seems to be accidentally checking for change in PRT_S255_PaperName twice in this next if statement...also perhaps this should be checking for height and width changes?
		//If ($_t_PaperName#PRT_S255_PaperName) | (PRT_t_PaperSource#$_t_PrintTrayName) | ($_t_PaperName#PRT_S255_PaperName)
		If ($_t_PaperName#PRT_t_PaperName2) | (PRT_S255_PaperSource2#$_t_PrintTrayName) | (PRT_l_PaperWidth2#$_l_P1) | (PRT_l_PaperHeight2#$_l_P2) | (PRT_l_PaperOrientation2#$_l_Orientation) | (PRT_l_PaperScaling2#$_l_Scale)
			//TRACE
			$_bo_Ask:=True:C214
			$_bo_Save:=True:C214
		End if 
		//Gen_Alert ("12")
	Else 
		//Gen_Alert ("SAVE IS TRUE")
		$_bo_Save:=True:C214
	End if 
Else 
	//Gen_Alert ("SAVE IS TRUE")
	$_bo_Save:=True:C214
End if 
//The print settings have been 'localized'
//Gen_Alert ("13")
If ($_bo_Save)
	While (Semaphore:C143("$CheckingPrintPrefs"))  //only need to lock this user out at this point
		DelayTicks
	End while 
	$_l_UserRow:=Find in array:C230(PRT_al_UserIDs; <>PER_l_CurrentUserID)
	//Gen_Alert ("14")
	If ($_l_UserRow<0)
		If (PRT_ArraysDeclared=0)  //the arrays dont exist
			PRT_Load_SetPreferences
			
		End if 
		//Gen_Alert ("The user does not exist")
		$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_A")
		
		$_bo_Ask:=False:C215
		$_l_Size:=Size of array:C274(PRT_al_UserIDs)
		//Gen_Alert ("The size of the array is currently "+String($_l_Size))
		
		If (Size of array:C274(PRT_at_PrinterNames)<$_l_Size)
			//Gen_Alert ("Printer Names is too small ")
			$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_B")
			Repeat 
				INSERT IN ARRAY:C227(PRT_at_PrinterNames; Size of array:C274(PRT_at_PrinterNames)+1; 1)
			Until (Size of array:C274(PRT_at_PrinterNames)=$_l_Size)
		End if 
		If (Size of array:C274(PRT_at_PaperSources)<$_l_Size)
			//Gen_Alert ("Printer Sources is too small ")
			$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_C")
			Repeat 
				INSERT IN ARRAY:C227(PRT_at_PaperSources; Size of array:C274(PRT_at_PaperSources)+1; 1)
			Until (Size of array:C274(PRT_at_PaperSources)=$_l_Size)
		End if 
		If (Size of array:C274(PRT_at_PaperSizes)<$_l_Size)
			//Gen_Alert ("Printer SIzes is too small ")
			$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_D")
			Repeat 
				INSERT IN ARRAY:C227(PRT_at_PaperSizes; Size of array:C274(PRT_at_PaperSizes)+1; 1)
			Until (Size of array:C274(PRT_at_PaperSizes)=$_l_Size)
		End if 
		If (Size of array:C274(PRT_al_PaperWidths)<$_l_Size)
			//Gen_Alert ("Printer widths is too small ")
			$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_E")
			Repeat 
				INSERT IN ARRAY:C227(PRT_al_PaperWidths; Size of array:C274(PRT_al_PaperWidths)+1; 1)
			Until (Size of array:C274(PRT_al_PaperWidths)=$_l_Size)
		End if 
		If (Size of array:C274(PRT_al_PaperHeights)<$_l_Size)
			//Gen_Alert ("Printer heights is too small ")
			$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_F")
			Repeat 
				INSERT IN ARRAY:C227(PRT_al_PaperHeights; Size of array:C274(PRT_al_PaperHeights)+1; 1)
			Until (Size of array:C274(PRT_al_PaperHeights)=$_l_Size)
		End if 
		If (Size of array:C274(PRT_al_OrientationOption)<$_l_Size)
			//Gen_Alert ("Printer Orientation is too small ")
			$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_G")
			Repeat 
				INSERT IN ARRAY:C227(PRT_al_OrientationOption; Size of array:C274(PRT_al_OrientationOption)+1; 1)
			Until (Size of array:C274(PRT_al_OrientationOption)=$_l_Size)
		End if 
		If (Size of array:C274(PRT_al_PaperScaling)<$_l_Size)
			//Gen_Alert ("Printer Scaling is too small ")
			$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_H")
			Repeat 
				INSERT IN ARRAY:C227(PRT_al_PaperScaling; Size of array:C274(PRT_al_PaperScaling)+1; 1)
			Until (Size of array:C274(PRT_al_PaperScaling)=$_l_Size)
		End if 
		$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_U")
		INSERT IN ARRAY:C227(PRT_al_UserIDs; Size of array:C274(PRT_al_UserIDs)+1; 1)
		INSERT IN ARRAY:C227(PRT_at_PrinterNames; Size of array:C274(PRT_at_PrinterNames)+1; 1)
		INSERT IN ARRAY:C227(PRT_at_PaperSources; Size of array:C274(PRT_at_PaperSources)+1; 1)
		INSERT IN ARRAY:C227(PRT_at_PaperSizes; Size of array:C274(PRT_at_PaperSizes)+1; 1)
		INSERT IN ARRAY:C227(PRT_al_PaperWidths; Size of array:C274(PRT_al_PaperWidths)+1; 1)
		INSERT IN ARRAY:C227(PRT_al_PaperHeights; Size of array:C274(PRT_al_PaperHeights)+1; 1)
		INSERT IN ARRAY:C227(PRT_al_OrientationOption; Size of array:C274(PRT_al_OrientationOption)+1; 1)
		INSERT IN ARRAY:C227(PRT_al_PaperScaling; Size of array:C274(PRT_al_PaperScaling)+1; 1)
		//Gen_Alert ("15")
		$_l_UserRow:=Size of array:C274(PRT_al_UserIDs)
		PRT_al_UserIDs{$_l_UserRow}:=<>PER_l_CurrentUserID
	End if 
	$_t_oldMethodName2:=ERR_MethodTracker("PRT_SetPaperOptions_SET")
	
	If (Size of array:C274(PRT_al_PaperHeights)<$_l_UserRow)
		Repeat 
			$_l_SizeofArray1:=Size of array:C274(PRT_al_PaperHeights)+1
			INSERT IN ARRAY:C227(PRT_al_PaperHeights; $_l_SizeofArray1; 1)
		Until (Size of array:C274(PRT_al_PaperHeights)=$_l_UserRow)
	End if 
	//Gen_Alert ("17")
	If (Size of array:C274(PRT_al_PaperWidths)<$_l_UserRow)
		Repeat 
			$_l_SizeofArray1:=Size of array:C274(PRT_al_PaperWidths)+1
			INSERT IN ARRAY:C227(PRT_al_PaperWidths; $_l_SizeofArray1; 1)
		Until (Size of array:C274(PRT_al_PaperWidths)=$_l_UserRow)
	End if 
	//Gen_Alert ("18")
	If (Size of array:C274(PRT_at_PaperSizes)<$_l_UserRow)
		Repeat 
			$_l_SizeofArray1:=Size of array:C274(PRT_at_PaperSizes)+1
			INSERT IN ARRAY:C227(PRT_at_PaperSizes; $_l_SizeofArray1; 1)
		Until (Size of array:C274(PRT_at_PaperSizes)=$_l_UserRow)
	End if 
	//Gen_Alert ("19")
	If (Size of array:C274(PRT_at_PaperSources)<$_l_UserRow)
		Repeat 
			$_l_SizeofArray1:=Size of array:C274(PRT_at_PaperSources)+1
			INSERT IN ARRAY:C227(PRT_at_PaperSources; $_l_SizeofArray1; 1)
		Until (Size of array:C274(PRT_at_PaperSources)=$_l_UserRow)
	End if 
	//Gen_Alert ("20")
	If (Size of array:C274(PRT_at_PrinterNames)<$_l_UserRow)
		Repeat 
			$_l_SizeofArray1:=Size of array:C274(PRT_at_PrinterNames)+1
			INSERT IN ARRAY:C227(PRT_at_PrinterNames; $_l_SizeofArray1; 1)
		Until (Size of array:C274(PRT_at_PrinterNames)=$_l_UserRow)
	End if 
	//Gen_Alert ("21")
	If (Size of array:C274(PRT_al_OrientationOption)<$_l_UserRow)
		Repeat 
			$_l_SizeofArray1:=Size of array:C274(PRT_al_OrientationOption)+1
			INSERT IN ARRAY:C227(PRT_al_OrientationOption; $_l_SizeofArray1; 1)
		Until (Size of array:C274(PRT_al_OrientationOption)=$_l_UserRow)
	End if 
	//Gen_Alert ("22")
	If (Size of array:C274(PRT_al_PaperScaling)<$_l_UserRow)
		Repeat 
			$_l_SizeofArray1:=Size of array:C274(PRT_al_PaperScaling)+1
			INSERT IN ARRAY:C227(PRT_al_PaperScaling; $_l_SizeofArray1; 1)
		Until (Size of array:C274(PRT_al_PaperScaling)=$_l_UserRow)
	End if 
	//Gen_Alert ("23")
	If (Count parameters:C259>=1)
		$_l_PrinterColumn:=Find in array:C230(PRT_at_PrinterNames{$_l_UserRow}; $_t_PrinterName+"_"+$1)
	Else 
		$_l_PrinterColumn:=Find in array:C230(PRT_at_PrinterNames{$_l_UserRow}; $_t_PrinterName)
	End if 
	//Gen_Alert ("24")
	If ($_l_PrinterColumn<0)
		//Gen_Alert ("25")
		$_bo_Ask:=False:C215
		$_l_Size:=Size of array:C274(PRT_at_PrinterNames{$_l_UserRow})
		INSERT IN ARRAY:C227(PRT_at_PrinterNames{$_l_UserRow}; $_l_Size+1; 1)
		INSERT IN ARRAY:C227(PRT_at_PaperSources{$_l_UserRow}; $_l_Size+1; 1)
		INSERT IN ARRAY:C227(PRT_at_PaperSizes{$_l_UserRow}; $_l_Size+1; 1)
		INSERT IN ARRAY:C227(PRT_al_PaperWidths{$_l_UserRow}; $_l_Size+1; 1)
		INSERT IN ARRAY:C227(PRT_al_PaperHeights{$_l_UserRow}; $_l_Size+1; 1)
		INSERT IN ARRAY:C227(PRT_al_OrientationOption{$_l_UserRow}; $_l_Size+1; 1)
		INSERT IN ARRAY:C227(PRT_al_PaperScaling{$_l_UserRow}; $_l_Size+1; 1)
		$_l_PrinterColumn:=Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})
	End if 
	//Gen_Alert ("26")
	$_l_Size:=Size of array:C274(PRT_at_PrinterNames{$_l_UserRow})
	If (Size of array:C274(PRT_at_PaperSources{$_l_UserRow})>$_l_Size)
		$_l_Size:=Size of array:C274(PRT_at_PaperSources{$_l_UserRow})
	End if 
	//Gen_Alert ("27")
	If (Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})>$_l_Size)
		$_l_Size:=Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})
	End if 
	//Gen_Alert ("28")
	If (Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})>$_l_Size)
		$_l_Size:=Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})
	End if 
	//Gen_Alert ("29")
	If (Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})>$_l_Size)
		$_l_Size:=Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})
	End if 
	//Gen_Alert ("30")
	If (Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})>$_l_Size)
		$_l_Size:=Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})
	End if 
	//Gen_Alert ("31")
	If (Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})<$_l_PrinterColumn)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_PaperWidths{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})=$_l_PrinterColumn)
	End if 
	//Gen_Alert ("32")
	If (Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})<$_l_Size)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_PaperWidths{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_PaperWidths{$_l_UserRow})=$_l_Size)
	End if 
	//Gen_Alert ("33")
	If (Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})<$_l_PrinterColumn)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_PaperHeights{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})=$_l_PrinterColumn)
	End if 
	//Gen_Alert ("34")
	If (Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})<$_l_Size)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_PaperHeights{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_PaperHeights{$_l_UserRow})=$_l_Size)
	End if 
	//Gen_Alert ("35")
	If (Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})<$_l_PrinterColumn)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_at_PaperSizes{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})=$_l_PrinterColumn)
	End if 
	//Gen_Alert ("36")
	If (Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})<$_l_Size)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_at_PaperSizes{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_at_PaperSizes{$_l_UserRow})=$_l_Size)
	End if 
	//Gen_Alert ("37")
	If (Size of array:C274(PRT_at_PaperSources{$_l_UserRow})<$_l_PrinterColumn)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_at_PaperSources{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_at_PaperSources{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_at_PaperSources{$_l_UserRow})=$_l_PrinterColumn)
	End if 
	//Gen_Alert ("38")
	If (Size of array:C274(PRT_at_PaperSources{$_l_UserRow})<$_l_Size)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_at_PaperSources{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_at_PaperSources{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_at_PaperSources{$_l_UserRow})=$_l_Size)
	End if 
	//Gen_Alert ("39")
	
	If (Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})<$_l_PrinterColumn)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_OrientationOption{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})=$_l_PrinterColumn)
	End if 
	//Gen_Alert ("40")
	If (Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})<$_l_Size)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_OrientationOption{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_OrientationOption{$_l_UserRow})=$_l_Size)
	End if 
	//Gen_Alert ("41")
	If (Size of array:C274(PRT_al_PaperScaling{$_l_UserRow})<$_l_PrinterColumn)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_PaperScaling{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_PaperScaling{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_PaperScaling{$_l_UserRow})=$_l_PrinterColumn)
	End if 
	//Gen_Alert ("42")
	If (Size of array:C274(PRT_al_PaperScaling{$_l_UserRow})<$_l_Size)
		Repeat 
			$_l_Size2:=Size of array:C274(PRT_al_PaperScaling{$_l_UserRow})+1
			INSERT IN ARRAY:C227(PRT_al_PaperScaling{$_l_UserRow}; $_l_Size2; 1)
		Until (Size of array:C274(PRT_al_PaperScaling{$_l_UserRow})=$_l_Size)
	End if 
	//Gen_Alert ("43")
	
	
	If ($_bo_Ask)  //only ask if change an existing preference-not first time
		//Gen_Alert ("44")
		$_bo_Continue:=False:C215
		Gen_Confirm("You have modified the paper size or printer tray settings. "+Char:C90(13)+"Do you wish to update the default settings used when printing this report to this"+" pr"+"inter?"; "Yes"; "No")
		If (OK=1)
			//Nigel not 100% sure what every aspect of the printer options functionality is doing but I suspect this next line unneccesarily causes an update to Preferences and should actually be set $_bo_Continue to False -kmw 30/06/08
			//kmw 30/06/08 - actually upon relfection this now looks ok? problem is occuring earlier in tthat system is thinking there has been a change to prefereernces when there hasn't....a4 seen as blank?
			$_bo_Continue:=True:C214
		End if 
	Else 
		$_bo_Continue:=True:C214
	End if 
	//Gen_Alert ("45")
	If ($_bo_Continue)
		If (Count parameters:C259>=1)
			//Gen_Alert ("46")
			PRT_at_PrinterNames{$_l_UserRow}{$_l_PrinterColumn}:=$_t_PrinterName+"_"+$1
		Else 
			//Gen_Alert ("47")
			PRT_at_PrinterNames{$_l_UserRow}{$_l_PrinterColumn}:=$_t_PrinterName
		End if 
		//Gen_Alert ("48")
		PRT_at_PaperSources{$_l_UserRow}{$_l_PrinterColumn}:=$_t_PrintTrayName
		PRT_at_PaperSizes{$_l_UserRow}{$_l_PrinterColumn}:=$_t_PaperName
		PRT_al_PaperWidths{$_l_UserRow}{$_l_PrinterColumn}:=$_l_P1
		PRT_al_PaperHeights{$_l_UserRow}{$_l_PrinterColumn}:=$_l_P2
		PRT_al_OrientationOption{$_l_UserRow}{$_l_PrinterColumn}:=$_l_Orientation
		PRT_al_PaperScaling{$_l_UserRow}{$_l_PrinterColumn}:=$_l_Scale
		//Gen_Alert ("49")
		PRT_Load_SetPreferences(True:C214)
	End if 
	
	CLEAR SEMAPHORE:C144("$CheckingPrintPrefs")
	//Gen_Alert ("50")
End if 
//Gen_Alert ("Exiting PRT_SetPaperOptions")
ERR_MethodTrackerReturn("PRT_SetPrinterPaperOptions"; $_t_oldMethodName)
