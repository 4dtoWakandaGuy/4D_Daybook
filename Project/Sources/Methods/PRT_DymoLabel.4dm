//%attributes = {}
If (False:C215)
	//Project Method Name:      PRT_DymoLabel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/05/2012 11:42
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRT_al_DymoLabelProjects;0)
	//ARRAY LONGINT(Prt_al_labelobjectFontsize;0)
	//ARRAY LONGINT(Prt_al_labelobjectFontStyle;0)
	//ARRAY LONGINT(Prt_al_LabelobjectHeight;0)
	//ARRAY LONGINT(Prt_al_labelobjectLeftPos;0)
	//ARRAY LONGINT(Prt_al_LabelobjectTopPos;0)
	//ARRAY LONGINT(Prt_al_LabelobjectWidth;0)
	//ARRAY LONGINT(PRT_al_LabelProject;0)
	ARRAY TEXT:C222($_at_DymoPaths; 0)
	ARRAY TEXT:C222($_at_MachineNames; 0)
	ARRAY TEXT:C222($_at_DateFormat; 0)
	//ARRAY TEXT(PRT_at_DymoLabelProjects;0)
	//ARRAY TEXT(Prt_at_LabelobjectAlignment;0)
	//ARRAY TEXT(Prt_at_LabelObjectFont;0)
	//ARRAY TEXT(Prt_at_labelobjectFontStyle;0)
	//ARRAY TEXT(PRT_At_LabelObjects;0)
	//ARRAY TEXT(PRT_at_LabelObjectType;0)
	C_BOOLEAN:C305(PRT_bo_CreateApplescripts; PRT_bo_IncludeCount; PRT_bo_IncludeDateTime; PRT_bo_IncludeTime; PRT_bo_TwentyFour)
	C_LONGINT:C283($_l_CRCount; $_l_DymoPrefsID; $_l_EndofLinePosition; $_l_FormatRow; $_l_HorizontalOffset; $_l_ItemsIndex; $_l_Iterations; $_l_IterationsIndex; $_l_ObjectWidth; $_l_offset; $_l_RowHeight)
	C_LONGINT:C283($_l_TextWidth; $_l_VerticalOffset; $3; Prt_l_Copies; Prt_l_Counter; PRT_l_CounterIncrementValue; PRT_l_CounterLeadingZeros; PRT_l_CounterobjectLeft; PRT_l_CounterobjectTop; PRT_l_CounterobjectWidth; PRT_l_CounterStartingValue)
	C_LONGINT:C283(PRT_l_DateLeft; PRT_l_DateTop; PRT_l_DateWidth; PRT_l_NumberofCopies; PRT_l_Save)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_BeforeContent; $_t_Content; Folder separator:K24:12; $_t_DymoPath; $_t_LabelPath; $_t_MachineName; $_t_oldMethodName; $_t_PrintAddress; $_t_PrintAddressLine; $_t_ScriptText; $1)
	C_TEXT:C284(Prt_T_Address; PRT_T_CalcuateNumberofCopies; Prt_T_Counter; PRT_T_CounterAfter; PRT_T_CounterBefore; PRT_T_CounterFormula; PRT_T_DateAfter; PRT_T_DateBefore; PRT_T_DateFormat; Prt_T_DateText; Prt_T_ImagePath)
	C_TEXT:C284(PRT_t_LabelTemplate; Prt_t_LabelTray; PRT_t_PrintOrientation; PRT_t_SetupName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRT_DymoLabel")

If (Count parameters:C259>=1)
	If ($1#"")
		
		$_l_DymoPrefsID:=PREF_GetPreferenceID("Dymo Label Settings")
		
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_DymoPrefsID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3<0)
		SELECTION TO ARRAY:C260([PREFERENCES:116]TempText1:5; PRT_at_DymoLabelProjects; [PREFERENCES:116]Pref_OwnerTable:3; PRT_al_DymoLabelProjects)
		$_l_FormatRow:=Find in array:C230(PRT_at_DymoLabelProjects; $1)
		If ($_l_FormatRow>0)
			PRT_al_LabelProject:=Abs:C99(PRT_al_DymoLabelProjects{$_l_FormatRow})
		Else 
			PRT_al_LabelProject:=0
		End if 
		PRT_bo_CreateApplescripts:=False:C215
		If (Gen_Option) | (PRT_al_LabelProject=0)
			PRT_t_SetupName:=$1
			Open_AnyTypeWindow(730; 865; 8; "Edit Label Setup:"+$1)
			PRT_l_Save:=0
			ARRAY TEXT:C222(Prt_at_labelobjectFontStyle; 0)
			//TRACE
			DIALOG:C40("PRT_DymoLabelProject")
			CLOSE WINDOW:C154
			//TRACE
			If (PRT_l_Save=1)
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ WRITE:C146([PREFERENCES:116])
				If (PRT_al_LabelProject>0)
					QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_DymoPrefsID; *)
					QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=-PRT_al_LabelProject)
				Else 
					CREATE RECORD:C68([PREFERENCES:116])
					If (PRT_al_LabelProject=0)
						PRT_al_LabelProject:=AA_GetNextID(->PRT_al_LabelProject)
					End if 
					[PREFERENCES:116]IDNumber:1:=$_l_DymoPrefsID
					[PREFERENCES:116]Pref_OwnerTable:3:=-PRT_al_LabelProject
					[PREFERENCES:116]TempText1:5:=$1
				End if 
				PRT_ManageDymoSettings(True:C214)
				
				
				SAVE RECORD:C53([PREFERENCES:116])
				
				
			End if 
		Else 
			PRT_l_Save:=1
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_DymoPrefsID; *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=-PRT_al_LabelProject)
			If (Records in selection:C76([PREFERENCES:116])=1)
				PRT_ManageDymoSettings
			End if 
		End if 
		
	Else 
		
		
	End if 
	If (PRT_l_Save=1)
		//TRACE
		$_t_BeforeContent:=""
		$_t_Content:=""
		
		$_l_DymoPrefsID:=PREF_GetPreferenceID("Dymo Labels")
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_DymoPrefsID)
		$_t_MachineName:=Current machine:C483
		ARRAY TEXT:C222($_at_DymoPaths; 0)
		ARRAY TEXT:C222($_at_MachineNames; 0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_DymoPaths; $_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; $_at_MachineNames; $_l_offset)
		If (Size of array:C274($_at_DymoPaths)>0)
			$_l_FormatRow:=Find in array:C230($_at_MachineNames; $_t_MachineName)
			If ($_l_FormatRow>0)
				$_t_DymoPath:=$_at_DymoPaths{$_l_FormatRow}
			End if 
		End if 
		If ($_t_DymoPath#"")
			If (Not:C34(Test path name:C476($_t_DymoPath)=Is a folder:K24:2))
				$_t_DymoPath:=""
			End if 
		End if 
		
		If ($_t_DymoPath#"")
			//Folder separator:=DB_DirSymbol
			$_t_LabelPath:=$_t_DymoPath+Folder separator:K24:12+PRT_t_LabelTemplate
			$_t_LabelPath:=Convert path POSIX to system:C1107($_t_LabelPath)
			If (Position:C15(":Macintosh HD"; $_t_LabelPath)>0)
				$_t_LabelPath:=Replace string:C233($_t_LabelPath; ":Macintosh HD"; "")
			End if 
			If (Prt_t_LabelTray="Select")
				Prt_t_LabelTray:=Gen_RequestWithList("Select The spool to print from"; ""; "Select"; "Left"; 0; 0; "Dymo Printer Tray"; 0; ""; ""; "Left"; "Right")
				If (Prt_t_LabelTray="Select") | (Prt_t_LabelTray="")
					Prt_t_LabelTray:="left"
				End if 
			End if 
			//TRACE
			If (Count parameters:C259>=2)
				If (Count parameters:C259>=3)
					$_l_Iterations:=$3
					
				Else 
					$_l_Iterations:=Records in selection:C76($2->)
				End if 
			Else 
				$_l_Iterations:=1
			End if 
			For ($_l_IterationsIndex; 1; $_l_Iterations)
				If (PRT_bo_CreateApplescripts)
					$_ti_DocumentRef:=Create document:C266("TempScript"+String:C10($_l_IterationsIndex)+".txt"; "TEXT")
					
				End if 
				
				$_t_Content:="if appIsRunning("+Char:C90(34)+"DYMO Label"+Char:C90(34)+") then"+Char:C90(13)
				$_t_Content:=$_t_Content+"tell application "+Char:C90(34)+"DYMO Label"+Char:C90(34)+Char:C90(13)
				
				$_t_Content:=$_t_Content+"Quit"+Char:C90(13)
				$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
				$_t_Content:=$_t_Content+"end if"+Char:C90(13)
				$_t_Content:=$_t_Content+"on appIsRunning(appName)"+Char:C90(13)
				$_t_Content:=$_t_Content+"tell application "+Char:C90(34)+"System Events"+Char:C90(34)+" to(name of processes)contains appName"+Char:C90(13)
				$_t_Content:=$_t_Content+"end appIsRunning"+Char:C90(13)
				
				$_t_Content:=$_t_Content+"tell application "+Char:C90(34)+"DYMO Label"+Char:C90(34)+Char:C90(13)+"newLabel as "+Char:C90(34)
				$_t_Content:=$_t_Content+$_t_LabelPath
				$_t_Content:=$_t_Content+Char:C90(34)+Char:C90(13)
				$_l_VerticalOffset:=0
				$_l_HorizontalOffset:=0
				For ($_l_ItemsIndex; 1; Size of array:C274(PRT_At_LabelObjects))
					Case of 
						: (PRT_at_LabelObjectType{$_l_ItemsIndex}="Address")
							Prt_T_Address:=""
							$_t_ScriptText:="Prt_T_Address:=String("+PRT_At_LabelObjects{$_l_ItemsIndex}+")"
							EXECUTE FORMULA:C63($_t_ScriptText)
							$_l_TextWidth:=0
							$_t_PrintAddress:=Prt_T_Address
							$_l_CRCount:=0
							Repeat 
								$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_PrintAddress)
								If ($_l_EndofLinePosition>0)
									$_l_CRCount:=$_l_CRCount+1
									$_t_PrintAddressLine:=Substring:C12($_t_PrintAddress; 1; $_l_EndofLinePosition-1)
									$_t_PrintAddress:=Substring:C12($_t_PrintAddress; $_l_EndofLinePosition+1)
									If (Length:C16($_t_PrintAddressLine)>$_l_TextWidth)
										$_l_TextWidth:=Length:C16($_t_PrintAddressLine)
									End if 
								End if 
							Until ($_l_EndofLinePosition=0)
							If ($_l_TextWidth=0)
								$_l_TextWidth:=Length:C16(Prt_T_Address)
							End if 
							$_l_ObjectWidth:=((Prt_al_labelobjectFontsize{$_l_ItemsIndex})/1.9)*$_l_TextWidth
							$_l_CRCount:=$_l_CRCount+1
							$_l_RowHeight:=Prt_al_labelobjectFontsize{$_l_ItemsIndex}*$_l_CRCount
							$_t_Content:=$_t_Content+"addAddress "
							If (False:C215)
								Case of 
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Plain:K14:1)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" without isBold without isItal and without isUnd"
										
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Bold:K14:2)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" with isBold without isItal and without isUnd"
										
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Italic:K14:3)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" without isBold with isItal and without isUnd"
										
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Italic:K14:3+Bold:K14:2)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" with isBold with isItal and without isUnd"
										
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" without isBold without isItal and with isUnd"
										
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4+Italic:K14:3)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" without isBold with isItal and with isUnd"
										
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4+Bold:K14:2)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" with isBold without isItal and with isUnd"
										
									: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4+Bold:K14:2+Italic:K14:3)
										$_t_Content:=$_t_Content+"fontName+ "+Prt_at_LabelObjectFont{$_l_ItemsIndex}+"fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})+" with isBold with isItal and with isUnd"
										
								End case 
							End if 
							$_t_Content:=$_t_Content+Char:C90(13)
							$_t_Content:=$_t_Content+"set addr to a reference to last item of print objects"+Char:C90(13)
							$_t_Content:=$_t_Content+"set elem to a reference to last element "+Char:C90(13)
							$_t_Content:=$_t_Content+"tell addr "+Char:C90(13)
							$_t_Content:=$_t_Content+"set content to "+Char:C90(34)+Prt_T_Address+Char:C90(34)+Char:C90(13)
							$_t_Content:=$_t_Content+"set  disableShrinkToFit to yes"+Char:C90(13)
							If (Prt_at_LabelobjectAlignment{$_l_ItemsIndex}#"")
								If (Prt_at_LabelobjectAlignment{$_l_ItemsIndex}="Center")
									$_t_Content:=$_t_Content+"set  alignment to "+"Center"+Char:C90(13)
								Else 
									
									$_t_Content:=$_t_Content+"set  alignment to "+Prt_at_LabelobjectAlignment{$_l_ItemsIndex}+Char:C90(13)
								End if 
							Else 
								$_t_Content:=$_t_Content+"set  alignment to left"+Char:C90(13)
							End if 
							
							$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
							$_t_Content:=$_t_Content+"tell elem"+Char:C90(13)
							If (Prt_al_labelobjectLeftPos{$_l_ItemsIndex}>0)
								$_l_HorizontalOffset:=Prt_al_labelobjectLeftPos{$_l_ItemsIndex}+Prt_al_LabelobjectWidth{$_l_ItemsIndex}
								$_t_Content:=$_t_Content+"set xPosition to "+String:C10(Prt_al_labelobjectLeftPos{$_l_ItemsIndex})+Char:C90(13)
							Else 
								If ($_l_HorizontalOffset=0)
									$_l_HorizontalOffset:=14
								End if 
								$_t_Content:=$_t_Content+"set xPosition to "+String:C10($_l_HorizontalOffset)+Char:C90(13)
								$_l_HorizontalOffset:=$_l_HorizontalOffset+Prt_al_LabelobjectWidth{$_l_ItemsIndex}
							End if 
							If (Prt_al_LabelobjectTopPos{$_l_ItemsIndex}>0)
								$_t_Content:=$_t_Content+Char:C90(13)+"set yPosition to "+String:C10(Prt_al_LabelobjectTopPos{$_l_ItemsIndex})+Char:C90(13)
								$_l_VerticalOffset:=Prt_al_LabelobjectTopPos{$_l_ItemsIndex}+Prt_al_LabelobjectHeight{$_l_ItemsIndex}
							Else 
								If ($_l_VerticalOffset=0)
									$_l_VerticalOffset:=$_l_VerticalOffset+0
								End if 
								$_t_Content:=$_t_Content+"set YPosition to "+String:C10($_l_VerticalOffset)+Char:C90(13)
								$_l_VerticalOffset:=$_l_VerticalOffset+Prt_al_LabelobjectHeight{$_l_ItemsIndex}
							End if 
							If ($_l_ObjectWidth>0)
								$_t_Content:=$_t_Content+Char:C90(13)+"set width to "+String:C10($_l_ObjectWidth)+Char:C90(13)
							Else 
								$_t_Content:=$_t_Content+Char:C90(13)+"set width to 60"+Char:C90(13)
								$_l_HorizontalOffset:=$_l_HorizontalOffset+60
							End if 
							If ($_l_RowHeight>0)
								$_t_Content:=$_t_Content+Char:C90(13)+"set height to "+String:C10($_l_RowHeight)+Char:C90(13)
							Else 
								$_t_Content:=$_t_Content+Char:C90(13)+"set height to 50"+Char:C90(13)
								$_l_VerticalOffset:=$_l_VerticalOffset+50
							End if 
							$_t_Content:=$_t_Content+Char:C90(13)+"end tell"+Char:C90(13)
						: (PRT_at_LabelObjectType{$_l_ItemsIndex}="Image")
							Prt_T_ImagePath:=""
							$_t_ScriptText:="Prt_T_ImagePath:=String("+PRT_At_LabelObjects{$_l_ItemsIndex}+")"
							EXECUTE FORMULA:C63($_t_ScriptText)
							Prt_T_ImagePath:=Replace string:C233(Prt_T_ImagePath; ":"; "/")
							$_t_Content:=$_t_Content+"addImage"+Char:C90(13)
							
							$_t_Content:=$_t_Content+"set img to a reference to last item of print objects"+Char:C90(13)
							
							$_t_Content:=$_t_Content+"tell img"+Char:C90(13)
							$_t_Content:=$_t_Content+"set imageFileName to "+Char:C90(34)+Prt_T_ImagePath+Char:C90(34)+Char:C90(13)
							$_t_Content:=$_t_Content+"set border width to 4"
							$_t_Content:=$_t_Content+"set border color to "+Char:C90(34)+"black"+Char:C90(34)+Char:C90(13)
							$_t_Content:=$_t_Content+"end tell"
							
							$_t_Content:=$_t_Content+"set elem to a reference to last element"
							$_t_Content:=$_t_Content+"tell elem"
							If (Prt_al_labelobjectLeftPos{$_l_ItemsIndex}>0)
								If (Prt_al_LabelobjectWidth{$_l_ItemsIndex}>$_l_ObjectWidth)
									$_l_HorizontalOffset:=Prt_al_labelobjectLeftPos{$_l_ItemsIndex}+Prt_al_LabelobjectWidth{$_l_ItemsIndex}
								Else 
									$_l_HorizontalOffset:=Prt_al_labelobjectLeftPos{$_l_ItemsIndex}+$_l_ObjectWidth
								End if 
								
								$_t_Content:=$_t_Content+"set xPosition to "+String:C10(Prt_al_labelobjectLeftPos{$_l_ItemsIndex})+Char:C90(13)
							Else 
								If ($_l_HorizontalOffset=0)
									$_l_HorizontalOffset:=15
								End if 
								$_t_Content:=$_t_Content+"set xPosition to "+String:C10($_l_HorizontalOffset)+Char:C90(13)
								$_l_HorizontalOffset:=$_l_HorizontalOffset+Prt_al_LabelobjectWidth{$_l_ItemsIndex}
							End if 
							If (Prt_al_LabelobjectTopPos{$_l_ItemsIndex}>0)
								$_t_Content:=$_t_Content+Char:C90(13)+"set yPosition to "+String:C10(Prt_al_LabelobjectTopPos{$_l_ItemsIndex})+Char:C90(13)
								If (Prt_al_LabelobjectHeight{$_l_ItemsIndex}>$_l_RowHeight)
									$_l_VerticalOffset:=Prt_al_LabelobjectTopPos{$_l_ItemsIndex}+Prt_al_LabelobjectHeight{$_l_ItemsIndex}
								Else 
									$_l_VerticalOffset:=Prt_al_LabelobjectTopPos{$_l_ItemsIndex}+$_l_RowHeight
								End if 
							Else 
								$_t_Content:=$_t_Content+"set YPosition to "+String:C10($_l_VerticalOffset)+Char:C90(13)
								$_l_VerticalOffset:=$_l_VerticalOffset+Prt_al_LabelobjectHeight{$_l_ItemsIndex}
							End if 
							If ($_l_ObjectWidth>0)
								If (Prt_al_LabelobjectWidth{$_l_ItemsIndex}>$_l_ObjectWidth)
									$_t_Content:=$_t_Content+Char:C90(13)+"set width to "+String:C10(Prt_al_LabelobjectWidth{$_l_ItemsIndex})+Char:C90(13)
								Else 
									$_t_Content:=$_t_Content+Char:C90(13)+"set width to "+String:C10($_l_ObjectWidth)+Char:C90(13)
								End if 
								
							Else 
								$_t_Content:=$_t_Content+Char:C90(13)+"set width to 60"+Char:C90(13)
								$_l_HorizontalOffset:=$_l_HorizontalOffset+60
							End if 
							If ($_l_RowHeight>0)
								If (Prt_al_LabelobjectHeight{$_l_ItemsIndex}>$_l_RowHeight)
									$_t_Content:=$_t_Content+Char:C90(13)+"set height to "+String:C10(Prt_al_LabelobjectHeight{$_l_ItemsIndex})+Char:C90(13)
								Else 
									$_t_Content:=$_t_Content+Char:C90(13)+"set height to "+String:C10($_l_RowHeight)+Char:C90(13)
								End if 
							Else 
								$_t_Content:=$_t_Content+Char:C90(13)+"set height to 50"+Char:C90(13)
								$_l_VerticalOffset:=$_l_VerticalOffset+50
							End if 
							$_t_Content:=$_t_Content+"end tell"
							
						: (PRT_at_LabelObjectType{$_l_ItemsIndex}="Text")
							Prt_T_Address:=""
							$_t_ScriptText:="Prt_T_Address:=String("+PRT_At_LabelObjects{$_l_ItemsIndex}+")"
							EXECUTE FORMULA:C63($_t_ScriptText)
							$_l_TextWidth:=0
							$_t_PrintAddress:=Prt_T_Address
							$_l_CRCount:=0
							Repeat 
								$_l_EndofLinePosition:=Position:C15(Char:C90(13); $_t_PrintAddress)
								If ($_l_EndofLinePosition>0)
									$_l_CRCount:=$_l_CRCount+1
									$_t_PrintAddressLine:=Substring:C12($_t_PrintAddress; 1; $_l_EndofLinePosition-1)
									$_t_PrintAddress:=Substring:C12($_t_PrintAddress; $_l_EndofLinePosition+1)
									If (Length:C16($_t_PrintAddressLine)>$_l_TextWidth)
										$_l_TextWidth:=Length:C16($_t_PrintAddressLine)
									End if 
								End if 
							Until ($_l_EndofLinePosition=0)
							If ($_l_TextWidth=0)
								$_l_TextWidth:=Length:C16(Prt_T_Address)
							End if 
							$_l_ObjectWidth:=((Prt_al_labelobjectFontsize{$_l_ItemsIndex})/1.9)*$_l_TextWidth
							$_l_CRCount:=$_l_CRCount+1
							$_l_RowHeight:=Prt_al_labelobjectFontsize{$_l_ItemsIndex}*$_l_CRCount
							$_t_Content:=$_t_Content+"set the clipboard to "+Char:C90(34)+Prt_T_Address+Char:C90(34)+Char:C90(13)
							$_t_Content:=$_t_Content+Char:C90(13)+"addSpecifiedText "+"fontName "+Char:C90(34)+Prt_at_LabelObjectFont{$_l_ItemsIndex}+Char:C90(34)+" fontSize "+String:C10(Prt_al_labelobjectFontsize{$_l_ItemsIndex})
							//$_t_Content:=$_t_Content+"set the Line to "+Char(34)
							Case of 
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Plain:K14:1)
									$_t_Content:=$_t_Content+" without isBold without isItal without isUnd"
									
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Bold:K14:2)
									$_t_Content:=$_t_Content+" with isBold without isItal without isUnd"
									
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Italic:K14:3)
									$_t_Content:=$_t_Content+" without isBold with isItal without isUnd"
									
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Italic:K14:3+Bold:K14:2)
									$_t_Content:=$_t_Content+" with isBold with isItal without isUnd"
									
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4)
									$_t_Content:=$_t_Content+" without isBold without isItal and with isUnd"
									
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4+Italic:K14:3)
									$_t_Content:=$_t_Content+" without isBold with isItal and with isUnd"
									
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4+Bold:K14:2)
									$_t_Content:=$_t_Content+" with isBold without isItal and with isUnd"
									
								: (Prt_al_labelobjectFontStyle{$_l_ItemsIndex}=Underline:K14:4+Bold:K14:2+Italic:K14:3)
									$_t_Content:=$_t_Content+" with isBold with isItal and with isUnd"
									
							End case 
							$_t_Content:=$_t_Content+Char:C90(13)
							
							$_t_Content:=$_t_Content+"set elem to a reference to last element "+Char:C90(13)
							$_t_Content:=$_t_Content+"tell elem "+Char:C90(13)
							//$_t_Content:=$_t_Content+"set  disableShrinkToFit to yes"+Char(13)
							//$_t_Content:=$_t_Content+"set  alignment to left"+Char(13)
							
							$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
							$_t_Content:=$_t_Content+"tell elem"+Char:C90(13)
							If (Prt_al_labelobjectLeftPos{$_l_ItemsIndex}>0)
								If (Prt_al_LabelobjectWidth{$_l_ItemsIndex}>$_l_ObjectWidth)
									$_l_HorizontalOffset:=Prt_al_labelobjectLeftPos{$_l_ItemsIndex}+Prt_al_LabelobjectWidth{$_l_ItemsIndex}
								Else 
									$_l_HorizontalOffset:=Prt_al_labelobjectLeftPos{$_l_ItemsIndex}+$_l_ObjectWidth
								End if 
								
								$_t_Content:=$_t_Content+"set xPosition to "+String:C10(Prt_al_labelobjectLeftPos{$_l_ItemsIndex})+Char:C90(13)
							Else 
								If ($_l_HorizontalOffset=0)
									$_l_HorizontalOffset:=15
								End if 
								$_t_Content:=$_t_Content+"set xPosition to "+String:C10($_l_HorizontalOffset)+Char:C90(13)
								$_l_HorizontalOffset:=$_l_HorizontalOffset+Prt_al_LabelobjectWidth{$_l_ItemsIndex}
							End if 
							If (Prt_al_LabelobjectTopPos{$_l_ItemsIndex}>0)
								$_t_Content:=$_t_Content+Char:C90(13)+"set yPosition to "+String:C10(Prt_al_LabelobjectTopPos{$_l_ItemsIndex})+Char:C90(13)
								If (Prt_al_LabelobjectHeight{$_l_ItemsIndex}>$_l_RowHeight)
									$_l_VerticalOffset:=Prt_al_LabelobjectTopPos{$_l_ItemsIndex}+Prt_al_LabelobjectHeight{$_l_ItemsIndex}
								Else 
									$_l_VerticalOffset:=Prt_al_LabelobjectTopPos{$_l_ItemsIndex}+$_l_RowHeight
								End if 
							Else 
								$_t_Content:=$_t_Content+"set YPosition to "+String:C10($_l_VerticalOffset)+Char:C90(13)
								$_l_VerticalOffset:=$_l_VerticalOffset+Prt_al_LabelobjectHeight{$_l_ItemsIndex}
							End if 
							If ($_l_ObjectWidth>0)
								If (Prt_al_LabelobjectWidth{$_l_ItemsIndex}>$_l_ObjectWidth)
									$_t_Content:=$_t_Content+Char:C90(13)+"set width to "+String:C10(Prt_al_LabelobjectWidth{$_l_ItemsIndex})+Char:C90(13)
								Else 
									$_t_Content:=$_t_Content+Char:C90(13)+"set width to "+String:C10($_l_ObjectWidth)+Char:C90(13)
								End if 
								
							Else 
								$_t_Content:=$_t_Content+Char:C90(13)+"set width to 60"+Char:C90(13)
								$_l_HorizontalOffset:=$_l_HorizontalOffset+60
							End if 
							If ($_l_RowHeight>0)
								If (Prt_al_LabelobjectHeight{$_l_ItemsIndex}>$_l_RowHeight)
									$_t_Content:=$_t_Content+Char:C90(13)+"set height to "+String:C10(Prt_al_LabelobjectHeight{$_l_ItemsIndex})+Char:C90(13)
								Else 
									$_t_Content:=$_t_Content+Char:C90(13)+"set height to "+String:C10($_l_RowHeight)+Char:C90(13)
								End if 
							Else 
								$_t_Content:=$_t_Content+Char:C90(13)+"set height to 50"+Char:C90(13)
								$_l_VerticalOffset:=$_l_VerticalOffset+50
							End if 
							$_t_Content:=$_t_Content+Char:C90(13)+"end tell"+Char:C90(13)
							$_t_Content:=$_t_Content+"set txt to a reference to last item of print objects"+Char:C90(13)
							$_t_Content:=$_t_Content+"tell txt"+Char:C90(13)
							
							$_t_Content:=$_t_Content+"set  disableShrinkToFit to yes"+Char:C90(13)
							If (Prt_at_LabelobjectAlignment{$_l_ItemsIndex}#"")
								If (Prt_at_LabelobjectAlignment{$_l_ItemsIndex}="Center")
									$_t_Content:=$_t_Content+"set  alignment to "+"Center"+Char:C90(13)
								Else 
									$_t_Content:=$_t_Content+"set  alignment to "+Prt_at_LabelobjectAlignment{$_l_ItemsIndex}+Char:C90(13)
								End if 
							Else 
								$_t_Content:=$_t_Content+"set  alignment to left"+Char:C90(13)
							End if 
							
							$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
							
					End case 
				End for 
				If (PRT_t_PrintOrientation="Vertical")
					$_t_Content:=$_t_Content+"set verticalLabel to "+"yes"+Char:C90(13)
				Else 
					$_t_Content:=$_t_Content+"set verticalLabel to "+"no"+Char:C90(13)
				End if 
				If (PRT_T_CalcuateNumberofCopies#"")  //if calculate run the calc fomula-this might return a number or a string so MyResult2=string `only set ifmore than 1
					If (PRT_T_CalcuateNumberofCopies="ASK")
						Prt_l_Copies:=Num:C11(Gen_Request("How many copies to print"; "1"))
					Else 
						
						$_t_ScriptText:="Prt_l_Copies:=NUM("+PRT_T_CalcuateNumberofCopies+")"
						EXECUTE FORMULA:C63($_t_ScriptText)
					End if 
					If (Prt_l_Copies>1)
						$_t_Content:=$_t_Content+"set print copies to "+String:C10(Prt_l_Copies)+Char:C90(13)
					End if 
					
				Else 
					If (PRT_l_NumberofCopies>1)
						$_t_Content:=$_t_Content+"set print copies to "+String:C10(PRT_l_NumberofCopies)+Char:C90(13)
					End if 
				End if 
				If (PRT_bo_IncludeCount)
					$_t_Content:=$_t_Content+"addCounter"+Char:C90(13)
					
					$_t_Content:=$_t_Content+"set coun to a reference to last item of print objects"+Char:C90(13)
					
					$_t_Content:=$_t_Content+"set elem to a reference to last element"+Char:C90(13)
					
					$_t_Content:=$_t_Content+"tell elem"+Char:C90(13)
					If (PRT_l_CounterobjectLeft>0)
						$_t_Content:=$_t_Content+"set xPosition to "+String:C10(PRT_l_CounterobjectLeft)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set xPosition to "+String:C10(15)+Char:C90(13)
					End if 
					If (PRT_l_CounterobjectTop>0)
						If (PRT_l_CounterobjectTop<70)
							$_t_Content:=$_t_Content+"set yPosition to "+String:C10(PRT_l_CounterobjectTop)+Char:C90(13)
						Else 
							$_t_Content:=$_t_Content+"set yPosition to "+String:C10(50)+Char:C90(13)
						End if 
					Else 
						$_t_Content:=$_t_Content+"set yPosition to "+String:C10(50)+Char:C90(13)
					End if 
					If (PRT_l_CounterobjectWidth>200)
						$_t_Content:=$_t_Content+"set width to "+String:C10(PRT_l_CounterobjectWidth)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set width to "+String:C10(200)+Char:C90(13)
					End if 
					$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
					$_t_Content:=$_t_Content+"tell coun"+Char:C90(13)
					If (PRT_T_CounterBefore#"")
						Prt_T_Counter:=""
						$_t_ScriptText:="Prt_T_Counter:=String("+PRT_T_CounterBefore+")"
						EXECUTE FORMULA:C63($_t_ScriptText)
						$_t_Content:=$_t_Content+"set beforeText to "+Char:C90(34)+Prt_T_Counter+" "+Char:C90(34)+Char:C90(13)
					End if 
					If (PRT_T_CounterAfter#"")
						Prt_T_Counter:=""
						$_t_ScriptText:="Prt_T_Counter:=String("+PRT_T_CounterAfter+")"
						EXECUTE FORMULA:C63($_t_ScriptText)
						
						$_t_Content:=$_t_Content+"set afterText to "+Char:C90(34)+" "+Prt_T_Counter+Char:C90(34)+Char:C90(13)
					End if 
					If (PRT_l_CounterLeadingZeros>0)
						$_t_Content:=$_t_Content+"set printLeadingZeros to yes"+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set printLeadingZeros to no"+Char:C90(13)
					End if 
					
					$_t_Content:=$_t_Content+"set formatWidth to 3"+Char:C90(13)
					If (PRT_l_CounterStartingValue>0)
						$_t_Content:=$_t_Content+"set startValue to "+String:C10(PRT_l_CounterStartingValue)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set startValue to "+String:C10(1)+Char:C90(13)
					End if 
					If (PRT_l_CounterIncrementValue>0)
						$_t_Content:=$_t_Content+"set stepValue to "+String:C10(PRT_l_CounterIncrementValue)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set stepValue to "+String:C10(1)+Char:C90(13)
					End if 
					Prt_l_Counter:=0
					If (PRT_T_CounterFormula#"")
						Prt_l_Counter:=0
						$_t_ScriptText:="Prt_l_Counter:=NUM("+PRT_T_CounterFormula+")"
						EXECUTE FORMULA:C63($_t_ScriptText)
						If ((Prt_l_Counter)>0)
							$_t_Content:=$_t_Content+"set currentValue to "+String:C10(Prt_l_Counter)+Char:C90(13)
						Else 
							If (PRT_l_CounterStartingValue>0)
								$_t_Content:=$_t_Content+"set currentValue to "+String:C10(PRT_l_CounterStartingValue)+Char:C90(13)
							Else 
								$_t_Content:=$_t_Content+"set currentValue to "+String:C10(1)+Char:C90(13)
							End if 
						End if 
					Else 
						If (PRT_l_CounterStartingValue>0)
							$_t_Content:=$_t_Content+"set currentValue to "+String:C10(PRT_l_CounterStartingValue)+Char:C90(13)
						Else 
							$_t_Content:=$_t_Content+"set currentValue to "+String:C10(1)+Char:C90(13)
						End if 
					End if 
					$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
					
				End if 
				
				If (PRT_bo_IncludeDateTime)
					$_t_Content:=$_t_Content+"addDateTime"+Char:C90(13)
					
					
					$_t_Content:=$_t_Content+"set dt to a reference to last item of print objects"+Char:C90(13)
					
					$_t_Content:=$_t_Content+"set elem to a reference to last element"+Char:C90(13)
					
					$_t_Content:=$_t_Content+"tell elem"+Char:C90(13)
					If (PRT_l_DateLeft>0)
						$_t_Content:=$_t_Content+"set xPosition to "+String:C10(PRT_l_DateLeft)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set xPosition to "+String:C10(15)+Char:C90(13)
					End if 
					If (PRT_l_DateTop>0)
						$_t_Content:=$_t_Content+"set yPosition to "+String:C10(PRT_l_DateTop)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set yPosition to "+String:C10(15)+Char:C90(13)
					End if 
					If (PRT_l_DateWidth>200)
						
						$_t_Content:=$_t_Content+"set width to "+String:C10(PRT_l_DateWidth)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set width to "+String:C10(200)+Char:C90(13)
					End if 
					$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
					
					$_t_Content:=$_t_Content+"tell dt"+Char:C90(13)
					Prt_T_DateText:=""
					If (PRT_T_DateBefore#"")
						Prt_T_DateText:=""
						$_t_ScriptText:="Prt_T_DateText:=String("+PRT_T_CounterBefore+")"
						EXECUTE FORMULA:C63($_t_ScriptText)
						
						$_t_Content:=$_t_Content+"set beforeText to "+Char:C90(34)+Prt_T_DateText+Char:C90(34)+Char:C90(13)
					End if 
					If (PRT_T_DateAfter#"")
						Prt_T_DateText:=""
						$_t_ScriptText:="Prt_T_DateText:=String("+PRT_T_DateAfter+")"
						EXECUTE FORMULA:C63($_t_ScriptText)
						
						$_t_Content:=$_t_Content+"set afterText to "+Char:C90(34)+Prt_T_DateText+Char:C90(34)+Char:C90(13)
					End if 
					ARRAY TEXT:C222($_at_DateFormat; 0)
					APPEND TO ARRAY:C911($_at_DateFormat; "Don't include date")
					APPEND TO ARRAY:C911($_at_DateFormat; "Long System date")
					APPEND TO ARRAY:C911($_at_DateFormat; "Day Name, Month Name Date, Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Day Name,Date Month, Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Date Month Name Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Month-Date-Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Date-Month-Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Month-Date-Short Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Date-Month-Short Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Month.Date.Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Date.Month.Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Long Year-Month-Date")
					APPEND TO ARRAY:C911($_at_DateFormat; "Long Year-Date-Month")
					APPEND TO ARRAY:C911($_at_DateFormat; "Date-Month Name-Long Year")
					APPEND TO ARRAY:C911($_at_DateFormat; "Month Name-Date-Long Year")
					$_l_FormatRow:=Find in array:C230($_at_DateFormat; PRT_T_DateFormat)
					If ($_l_FormatRow>0)
						$_t_Content:=$_t_Content+"set dateFormat to "+String:C10($_l_FormatRow)+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set dateFormat to 2"+Char:C90(13)
					End if 
					If (PRT_bo_IncludeTime)
						$_t_Content:=$_t_Content+"set timePrinted to yes"+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set timePrinted to no"+Char:C90(13)
					End if 
					If (PRT_bo_TwentyFour)
						$_t_Content:=$_t_Content+"set use24HourTimeFormat to yes"+Char:C90(13)
					Else 
						$_t_Content:=$_t_Content+"set use24HourTimeFormat to no"+Char:C90(13)
					End if 
					$_t_Content:=$_t_Content+"end tell"+Char:C90(13)
					
				End if 
				$_t_Content:=$_t_Content+"set paperTray to "+Prt_t_LabelTray+Char:C90(13)
				$_t_Content:=$_t_Content+"redrawLabel"+Char:C90(13)
				$_t_Content:=$_t_Content+"printLabel"+Char:C90(13)
				$_t_Content:=$_t_Content+"Quit"+Char:C90(13)+"end tell"
				If (PRT_bo_CreateApplescripts)
					SEND PACKET:C103($_ti_DocumentRef; $_t_Content)
					CLOSE DOCUMENT:C267($_ti_DocumentRef)
				End if 
				
				//$`OSaScript:="tell application"+Char(34)+"DYMO Label"+Char(34)+Char(13)+" openLabel in "+Char(34)+"/Applications/DYMO Label SDK/SDK Examples/EmptyAddressLabel.label"+Char(34)+CHar(13)+"addAddress"+Char(13)+Char(34)+"print objects "+$_t_Content+Char(34)+Char(13)+" end tell"
				
				LAUNCH EXTERNAL PROCESS:C811("osascript"; $_t_Content)
				If ($_l_Iterations>1)
					If (Count parameters:C259>=2)
						NEXT RECORD:C51($2->)
					End if 
				End if 
				
			End for 
		Else 
			Gen_Alert("Sorry this label could not be printed. The path to the Dymo Label templates is invalid!")
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("PRT_DymoLabel"; $_t_oldMethodName)