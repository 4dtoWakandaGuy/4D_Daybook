If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.oButtonContinue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/05/2012 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(Prt_al_labelobjectFontStyle;0)
	//ARRAY LONGINT(Prt_al_labelobjectFramecolour;0)
	//ARRAY LONGINT(Prt_al_labelobjectFrameOption;0)
	//ARRAY TEXT(PRT_at_FontStyles;0)
	//ARRAY TEXT(Prt_at_FrameOptions;0)
	//ARRAY TEXT(Prt_at_labelobjectFontStyle;0)
	//ARRAY TEXT(Prt_at_labelobjectFramecolour;0)
	//ARRAY TEXT(Prt_at_labelobjectFrameOption;0)
	C_BOOLEAN:C305($_bo_Continue; PRT_bo_IncludeDateTime)
	C_LONGINT:C283($_l_FrameRow; $_l_Index; PRT_l_NumberofCopies; PRT_l_Save)
	C_TEXT:C284($_t_oldMethodName; PRT_T_DateFormat; PRT_t_LabelTemplate; Prt_t_LabelTray; PRT_t_PrintOrientation)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/PRT_DymoLabelProject/oButtonContinue"; Form event code:C388)
For ($_l_Index; 1; Size of array:C274(Prt_at_labelobjectFramecolour))
	Case of 
		: (Prt_at_labelobjectFramecolour{$_l_Index}="Black")
			Prt_al_labelobjectFramecolour{$_l_Index}:=Black:K11:16
		: (Prt_at_labelobjectFramecolour{$_l_Index}="Grey")
			Prt_al_labelobjectFramecolour{$_l_Index}:=Grey:K11:15
		: (Prt_at_labelobjectFramecolour{$_l_Index}="light grey")
			Prt_al_labelobjectFramecolour{$_l_Index}:=Light grey:K11:13
	End case 
End for 
For ($_l_Index; 1; Size of array:C274(Prt_at_labelobjectFontStyle))
	Case of 
			
		: (Prt_at_labelobjectFontStyle{$_l_Index}=PRT_at_FontStyles{1})
			Prt_al_labelobjectFontStyle{$_l_Index}:=Plain:K14:1
		: (Prt_at_labelobjectFontStyle{$_l_Index}=PRT_at_FontStyles{2})
			Prt_al_labelobjectFontStyle{$_l_Index}:=Bold:K14:2
		: (Prt_at_labelobjectFontStyle{$_l_Index}=PRT_at_FontStyles{3})
			Prt_al_labelobjectFontStyle{$_l_Index}:=Italic:K14:3
		: (Prt_at_labelobjectFontStyle{$_l_Index}=PRT_at_FontStyles{4})
			Prt_al_labelobjectFontStyle{$_l_Index}:=Italic:K14:3+Bold:K14:2
		: (Prt_at_labelobjectFontStyle{$_l_Index}=PRT_at_FontStyles{5})
			Prt_al_labelobjectFontStyle{$_l_Index}:=Underline:K14:4
		: (Prt_at_labelobjectFontStyle{$_l_Index}=PRT_at_FontStyles{6})
			
			Prt_al_labelobjectFontStyle{$_l_Index}:=Underline:K14:4+Bold:K14:2
		: (Prt_at_labelobjectFontStyle{$_l_Index}=PRT_at_FontStyles{7})
			Prt_al_labelobjectFontStyle{$_l_Index}:=Underline:K14:4+Bold:K14:2+Italic:K14:3
			
	End case 
End for 
For ($_l_Index; 1; Size of array:C274(Prt_at_labelobjectFrameOption))
	$_l_FrameRow:=Find in array:C230(Prt_at_FrameOptions; Prt_at_labelobjectFrameOption{$_l_Index})
	If ($_l_FrameRow<0)
		$_l_FrameRow:=1
	End if 
	Prt_al_labelobjectFrameOption{$_l_Index}:=$_l_FrameRow-1
End for 
If (PRT_l_NumberofCopies=0)
	PRT_l_NumberofCopies:=1
End if 



If (PRT_t_LabelTemplate#"")
	If (Prt_t_LabelTray#"")
		If (PRT_t_PrintOrientation#"")
			$_bo_Continue:=False:C215
			If (PRT_bo_IncludeDateTime)
				If (PRT_T_DateFormat#"")
					$_bo_Continue:=True:C214
				Else 
					Gen_Alert("You must set the date format")
				End if 
			Else 
				$_bo_Continue:=True:C214
			End if 
		Else 
			Gen_Alert("You must set the print orientation")
		End if 
	Else 
		Gen_Alert("You must set how to select the printer tray")
	End if 
Else 
	Gen_Alert("You must set a template to use for the label")
	
End if 
If ($_bo_Continue)
	ACCEPT:C269
	PRT_l_Save:=1
End if 
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.oButtonContinue"; $_t_oldMethodName)
