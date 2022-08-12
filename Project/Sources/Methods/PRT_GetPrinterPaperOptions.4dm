//%attributes = {}
If (False:C215)
	//Project Method Name:      PRT_GetPrinterPaperOptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/15 1:28 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_SizeHeights; 0)
	ARRAY LONGINT:C221($_al_SizeWIdths; 0)
	ARRAY LONGINT:C221($_al_WindowIDS; 0)
	//ARRAY LONGINT(PRT_al_OrientationOption;0)
	//ARRAY LONGINT(PRT_al_PaperHeights;0)
	//ARRAY LONGINT(PRT_al_PaperScaling;0)
	//ARRAY LONGINT(PRT_al_PaperWidths;0)
	ARRAY TEXT:C222($_at_PaperNames; 0)
	ARRAY TEXT:C222($_at_PaperSources; 0)
	//ARRAY TEXT(PRT_at_PaperSizes;0)
	//ARRAY TEXT(PRT_at_PaperSources;0)
	//ARRAY TEXT(PRT_at_PrinterNames;0)
	C_BOOLEAN:C305(SR_bo_PageSetupFound)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_PersonRow; $_l_PrinterPosition; PRT_l_OrientationOption; PRT_l_PaperHeight; PRT_l_PaperWidth; PRT_l_ScaleOption)
	C_TEXT:C284($_t_oldMethodName; $_t_PrinterandDocument; $_t_PrinterName; $1; $2; PRT_S255_PaperName; PRT_t_PaperSource)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRT_GetPrinterPaperOptions")
// This method can overwrite the functionality of PRINT_SetSize
//instead of using the form settings of a given form this will enable the user preferences to be used
//this means we can allow different print sources and sizes other than A4 without creating additional forms
//this is therefore called by PRINT_SetSize after setting the default
//there is a second method called PRT_SetPrinterPaperOptions
//that method stores the setting if the user wants them retained.

ARRAY TEXT:C222($_at_PaperNames; 0)
ARRAY LONGINT:C221($_al_SizeHeights; 0)
ARRAY LONGINT:C221($_al_SizeWIdths; 0)
ARRAY TEXT:C222($_at_PaperSources; 0)
ARRAY LONGINT:C221($_al_WindowIDS; 0)
$_t_PrinterName:=Get current printer:C788
PRINT OPTION VALUES:C785(1; $_at_PaperNames; $_al_SizeHeights; $_al_SizeWIdths)
PRINT OPTION VALUES:C785(5; $_at_PaperSources; $_al_WindowIDS)
PRT_S255_PaperName:=""
PRT_t_PaperSource:=""

PRT_l_PaperWidth:=0
PRT_l_PaperHeight:=0
PRT_Load_SetPreferences
SR_bo_PageSetupFound:=False:C215
$_l_PersonRow:=Find in array:C230(PRT_al_UserIDs; <>PER_l_CurrentUserID)
If ($_l_PersonRow<0)
	
	//No preferences currently stored for this user
Else 
	If (Count parameters:C259<2)
		$_t_PrinterandDocument:=$_t_PrinterName
	Else 
		$_t_PrinterandDocument:=$_t_PrinterName+"_"+$2
	End if 
	
	$_l_PrinterPosition:=Find in array:C230(PRT_at_PrinterNames{$_l_PersonRow}; $_t_PrinterandDocument)
	If ($_l_PrinterPosition<0)
		//nothing currently stored for this printer
	Else 
		SR_bo_PageSetupFound:=True:C214  // for super report only
		If (Size of array:C274(PRT_at_PaperSizes{$_l_PersonRow})>=$_l_PrinterPosition)
			PRT_S255_PaperName:=PRT_at_PaperSizes{$_l_PersonRow}{$_l_PrinterPosition}
		End if 
		If (Size of array:C274(PRT_at_PaperSources{$_l_PersonRow})>=$_l_PrinterPosition)
			PRT_t_PaperSource:=PRT_at_PaperSources{$_l_PersonRow}{$_l_PrinterPosition}
		End if 
		If (Size of array:C274(PRT_al_PaperWidths{$_l_PersonRow})>=$_l_PrinterPosition)
			PRT_l_PaperWidth:=PRT_al_PaperWidths{$_l_PersonRow}{$_l_PrinterPosition}
		End if 
		If (Size of array:C274(PRT_al_PaperHeights{$_l_PersonRow})>=$_l_PrinterPosition)
			PRT_l_PaperHeight:=PRT_al_PaperHeights{$_l_PersonRow}{$_l_PrinterPosition}
		End if 
		If (Size of array:C274(PRT_al_OrientationOption{$_l_PersonRow})>=$_l_PrinterPosition)
			PRT_l_OrientationOption:=PRT_al_OrientationOption{$_l_PersonRow}{$_l_PrinterPosition}
		End if 
		If (Size of array:C274(PRT_al_PaperScaling{$_l_PersonRow})>=$_l_PrinterPosition)
			PRT_l_ScaleOption:=PRT_al_PaperScaling{$_l_PersonRow}{$_l_PrinterPosition}
		End if 
	End if 
End if 
If (PRT_S255_PaperName="") & (PRT_l_PaperWidth=0) & (PRT_l_PaperHeight=0)
	//get the setting from the form
	
	GET PRINT OPTION:C734(1; PRT_S255_PaperName)
	GET PRINT OPTION:C734(1; PRT_l_PaperWidth; PRT_l_PaperHeight)
	
End if 

If (False:C215)
	If (PRT_l_PaperWidth=0) & (PRT_l_PaperHeight=0)
		SET PRINT OPTION:C733(1; PRT_S255_PaperName)
	Else 
		//TRACE
		SET PRINT OPTION:C733(1; PRT_l_PaperWidth; PRT_l_PaperHeight)
		//SET PRINT OPTION(1;PRT_S255_PaperName)  `added 18/08/08 -kmw - need to gfigure out whats going on here???? print option  seems to get wiped out by above command at least on my tets in windows...or at least not used properly).
		
		//eg...on mac is it getting wiped out also??? or is it just that i know i know have a blank in the value due to other bug causing blank gettign stored in prefs?
	End if 
End if 
//************************** above block of code  altered  to this19/08/08 -kmw *************************
If (PRT_l_PaperWidth#0) & (PRT_l_PaperHeight#0)
	SET PRINT OPTION:C733(1; PRT_l_PaperWidth; PRT_l_PaperHeight)
End if 
If (PRT_S255_PaperName#"")
	If (Find in array:C230($_at_PaperNames; PRT_S255_PaperName)>0)
		SET PRINT OPTION:C733(1; PRT_S255_PaperName)
	End if 
End if 
If (PRT_l_OrientationOption#0)
	SET PRINT OPTION:C733(2; PRT_l_OrientationOption)
Else 
	//************************************************************************************************************
	
	If (Count parameters:C259>=1)
		If ($1="P")  // portrait
			SET PRINT OPTION:C733(2; 1)
		Else 
			SET PRINT OPTION:C733(2; 2)
		End if 
	End if 
End if 


If (PRT_t_PaperSource#"")
	$_l_PersonRow:=Find in array:C230($_at_PaperSources; PRT_t_PaperSource)
	If ($_l_PersonRow>0)
		SET PRINT OPTION:C733(5; $_al_WindowIDS{$_l_PersonRow})
		
	End if 
End if 
If (PRT_l_ScaleOption>0)
	SET PRINT OPTION:C733(Scale option:K47:3; PRT_l_ScaleOption)
End if 
ERR_MethodTrackerReturn("PRT_GetPrinterPaperOptions"; $_t_oldMethodName)
