//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_InclSetupQ
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_FontDefined; $_bo_FooterUsed; $_bo_HideLastColumn; $_bo_ReadOnly; DB_bo_FontsInited)
	C_LONGINT:C283(<>ALselectinEntryMode; <>SYS_l_DefaultBoldFontSize; <>SYS_l_DefaultPlainFontSize; <>vALMode; $_l_AreaEnterability; $_l_ColumnNumber; $_l_DataType; $_l_Error; $_l_FieldNumber; $_l_Ftr9Pt; $_l_Increase)
	C_LONGINT:C283($_l_Index; $_l_Multiply; $_l_NumberofColumns; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_ObJWidth; $_l_Size9; $_l_TableNumber; $_l_TotalColumnsWidth)
	C_LONGINT:C283($_l_VisibleColumnsWidth; $_l_WidthIndex)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths; $_ptr_ArrayReferences)
	C_POINTER:C301($_ptr_EnterabilityArray; $_Ptr_KeyField; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnHeaderButton; $1)
	C_TEXT:C284(<>SYS_t_DefaultFontBold; <>SYS_t_DefaultFontPlain; $_t_ButtonNamePrefix; $_t_ButtonPrefix; $_t_ColourName; $_t_ColumnPrefix; $_t_DataFormat; $_t_HeaderName; $_t_HeaerPrefix; $_t_ObjectPrefix; $_t_oldMethodName)
	C_TEXT:C284($_t_ThisColumnColor; $_t_VariableName; ObjectPrefix)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclSetupQ")

//NG 21/07/06 This method is a replacement for ALInclSetupQ
//This is now identical to LBi_inclSetup...there were very few differences between ALInclSetupand ALInclSetupQ

//ALInclSetupQ - key field method
$_t_ColourName:=""
$_ptr_ListboxSetup:=$1
$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
$_ptr_ArrayofColumnLabels:=$_ptr_ListboxSetup->{12}

$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayOfArrayNames->)

RESOLVE POINTER:C394($_ptr_ArrayFieldPointers; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
Case of 
	: ($_t_VariableName="a01FldP")
		$_t_ObjectPrefix:="o1"
		$_t_ButtonPrefix:="o1_L"
	: ($_t_VariableName="a02FldP")
		$_t_ObjectPrefix:="o2"
		$_t_ButtonPrefix:="o2_L"
		
	: ($_t_VariableName="a03FldP")
		$_t_ObjectPrefix:="o3"
		$_t_ButtonPrefix:="o3_"
	: ($_t_VariableName="a04FldP")
		$_t_ObjectPrefix:="o4"
		$_t_ButtonPrefix:="o4_L"
	: ($_t_VariableName="a05FldP")
		$_t_ObjectPrefix:="o5"
		$_t_ButtonPrefix:="o5_L"
	: ($_t_VariableName="a06FldP")
		$_t_ObjectPrefix:="o6"
		$_t_ButtonPrefix:="o6_L"
End case 
$_t_ColumnPrefix:=$_t_ObjectPrefix+"_COL"
$_t_HeaerPrefix:=$_t_ObjectPrefix+"_HED"
$_t_ButtonNamePrefix:=$_t_ButtonPrefix+"_BUT"
//all this repetitive stuff is in the name of max effic (!!??)
//cos one AL external call is better than 15 etc
//they're in reverse order to give advantage to the otherwise slower ones
$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
$_l_NumberOfColumns:=LISTBOX Get number of columns:C831($_ptr_ListboxArea->)
If ($_l_NumberOfColumns>0)
	LISTBOX DELETE COLUMN:C830($_ptr_ListboxArea->; 1; $_l_NumberOfColumns)
End if 
For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
	//LB_SetupListbox ($_ptr_ListboxArea;$_t_ObjectPrefix;$_t_ButtonNamePrefix;$_l_ColumnNumber;$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber})
	//LB_SetColumnHeaders ($_ptr_ListboxArea;"INV_L";$_l_ColumnNumber;$_ptr_ArrayofColumnLabels->{$_l_ColumnNumber})
	
	//If (False)
	$_t_VariableName:=$_t_ColumnPrefix+String:C10($_l_ColumnNumber)
	$_t_HeaderName:=$_t_HeaerPrefix+String:C10($_l_ColumnNumber)
	$_Ptr_ThisColumnArray:=Get pointer:C304($_ptr_ArrayOfArrayNames->{$_l_ColumnNumber})
	$_Ptr_ThisColumnHeaderButton:=Get pointer:C304($_t_ButtonNamePrefix+String:C10($_l_ColumnNumber))
	LISTBOX INSERT COLUMN:C829($_ptr_ListboxArea->; $_l_ColumnNumber; $_t_VariableName; $_Ptr_ThisColumnArray->; $_t_HeaderName; $_Ptr_ThisColumnHeaderButton->)
	OBJECT SET TITLE:C194($_Ptr_ThisColumnHeaderButton->; $_ptr_ArrayofColumnLabels->{$_l_ColumnNumber})
	//SET LISTBOX COLUMN WIDTH(*;$_t_VariableName;$_ptr_ArrayofColumnWIdths->{$_l_ColumnNumber})
	
	//all this repetitive stuff is in the name of max effic (!!??)
	//cos one AL external call is better than 15 etc
	//they're in reverse order to give advantage to the otherwise slower ones
	//End if
End for 
$_l_TotalColumnsWidth:=0
For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
	$_l_TotalColumnsWidth:=$_l_TotalColumnsWidth+$_ptr_ArrayofColumnWIdths->{$_l_ColumnNumber}
	LB_SetColumnWidths($_ptr_ListboxArea; $_t_ObjectPrefix; $_l_ColumnNumber; $_ptr_ArrayofColumnWIdths->{$_l_ColumnNumber})
End for 

$_bo_HideLastColumn:=False:C215
If ($_l_Error=0)
	If ($_Ptr_KeyField=$_ptr_ArrayFieldPointers->{$_l_NumberofColumns})  //if key field is the last col
		$_bo_HideLastColumn:=True:C214
		LB_SetColumnWidths($_ptr_ListboxArea; $_t_ObjectPrefix; $_l_NumberofColumns; 1)
		
		//AL_SetColOpts ($_ptr_ListboxArea->;Num(Substring($_ptr_ArrayReferences->{4};2;1)#"0");0;Num(Substring($_ptr_ArrayReferences->{4};3;1)#"0");1;0;Num(Substring($_ptr_ArrayReferences->{4};4;1)#"0");0)  `Resize;ResizeInDuring;AllowColLock;HideLastCols;PixWid;DragCol;AcceptDrag
		// $_l_Size9:=1
		$_l_NumberofColumns:=$_l_NumberofColumns-1  //don't do any other settings for the hidden column
	Else 
		//AL_SetColOpts ($_ptr_ListboxArea->;Num(Substring($_ptr_ArrayReferences->{4};2;1)#"0");0;Num(Substring($_ptr_ArrayReferences->{4};3;1)#"0");0;0;Num(Substring($_ptr_ArrayReferences->{4};4;1)#"0");0)
		//  $_l_Size9:=0
	End if   //
	$_l_Size9:=0
	//AL_SetDividers ($_ptr_ListboxArea->;"Black";"";13;"Black";"";13)  `Rollo 15/7/2004
	LB_Setdividers($_ptr_ListboxArea; 0; 4)  //Both on
	//$Div:=Int(65536/256)
	
	LB_StyleSettings($_ptr_ListboxArea; $_ptr_ArrayReferences->{2}; $_ptr_ArrayofColumnFonts->{1}; ObjectPrefix; $_ptr_LBTable)  // set colours, fonts etc. 29/06/06 pb
	
	
	$_bo_FooterUsed:=False:C215
	$_l_Ftr9Pt:=1
	
	For ($_l_Index; 1; $_l_NumberofColumns)
		$_l_DataType:=Type:C295(($_ptr_ArrayFieldPointers->{$_l_Index})->)
		$_t_DataFormat:=$_ptr_ArrayOfColumFormats->{$_l_Index}
		LB_SetFormat($_ptr_ListboxArea; 1; ""; $_l_Index; $_l_Index; 3)
		Case of 
			: (($_l_DataType=1) | ($_l_DataType=8) | ($_l_DataType=9))
				//AL_SetFormat ($_ptr_ListboxArea->;$_l_Index;$_t_DataFormat;0;3;3;0)  `Right Just Hdrs & Ftrs
				LB_SetFormat($_ptr_ListboxArea; 2; ""; $_l_Index; $_l_Index; 4)
				
			: ($_l_DataType=Is time:K8:8)  // 26/06/06
				LB_SetFormat($_ptr_ListboxArea; 2; "&/5"; $_l_Index; $_l_Index; 4)
				
			: ($_l_DataType=4)
				//AL_SetFormat ($_ptr_ListboxArea->;$_l_Index;$_t_DataFormat;1;0;0;0)  `Left Just Lines
				LB_SetFormat($_ptr_ListboxArea; 2; ""; $_l_Index; $_l_Index; 2)
				
			Else 
				If ($_t_DataFormat#"")  //only use if there is a format - will be defaults anyway otherwise
					//AL_SetFormat ($_ptr_ListboxArea->;$_l_Index;$_t_DataFormat;0;0;0;0)  `Defaults
					LB_SetFormat($_ptr_ListboxArea; 2; $_t_DataFormat; $_l_Index; $_l_Index; 0)
				End if 
		End case 
		If (Not:C34(DB_bo_FontsInited))
			DB_SetDefaultFonts
		End if 
		
		If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))  //Enterable=true
			If ($_ptr_ArrayofColumnFonts->{$_l_Index}=9) | (Is Windows:C1573)  //Font Size = 9
				If ($_bo_FontDefined=False:C215)  //don't change it if already defaulted
					LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
					LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
				End if 
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					If ($_bo_FontDefined=False:C215)
						//AL_SetFtrStyle ($_ptr_ListboxArea->;$_l_Index;◊FontPlain;9;0)
					End if 
					$_bo_FooterUsed:=True:C214
				End if 
				$_l_Size9:=$_l_Size9+1
			Else   //Font Size = 10
				If ($_bo_FontDefined)
					LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
					LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
				End if 
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					If ($_bo_FontDefined)
						//AL_SetFtrStyle ($_ptr_ListboxArea->;$_l_Index;◊FontPlain;10;0)
					End if 
					$_l_Ftr9Pt:=0
					$_bo_FooterUsed:=True:C214
				End if 
			End if 
		Else 
			If ($_ptr_ArrayofColumnFonts->{$_l_Index}=9) | (Is Windows:C1573)  //Font Size = 9
				LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
				
				If ($_bo_FontDefined=False:C215)
					LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
				End if 
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					If ($_bo_FontDefined=False:C215)
						LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
					End if 
					$_bo_FooterUsed:=True:C214
				End if 
				$_l_Size9:=$_l_Size9+1
			Else 
				LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 1; <>SYS_t_DefaultFontBold; 0; 0; <>SYS_l_DefaultBoldFontSize)
				If ($_bo_FontDefined)
					LB_SETFONT($_ptr_ListboxArea; $_t_ObjectPrefix; 2; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
				End if 
				If ($_ptr_ArrayofColumnFooters->{$_l_Index}>1)
					If ($_bo_FontDefined)
						
					End if 
					$_l_Ftr9Pt:=0
					$_bo_FooterUsed:=True:C214
				End if 
			End if 
			
		End if 
		If ($_ptr_ArrayofColumnLockFlags->{$_l_Index})  //Locked = true
			//AL_SetColLock ($_ptr_ListboxArea->;$_l_Index)
		End if 
		$_t_ThisColumnColor:=$_ptr_ArrayofColumnColors->{$_l_Index}
		
		If (($_t_ThisColumnColor#"Black") & ($_t_ThisColumnColor#""))
			
			If (True:C214)
				//AL_SetForeColor ($_ptr_ListboxArea->;$_l_Index;$_t_ColourName;0;$_t_ThisColumnColor;16;$_t_ThisColumnColor;16)
			Else 
				//AL_SetForeColor ($_ptr_ListboxArea->;$_l_Index;"";$colour;$_t_ThisColumnColor;16;$_t_ThisColumnColor;16)
			End if 
		End if 
		
		
	End for 
	
	//AL_SetSortOpts ($_ptr_ListboxArea->;0;Num(Substring($_ptr_ArrayReferences->{4};6;1)#"0");0;"Sort by …";1;Num(Substring($_ptr_ArrayReferences->{4};6;1)#"0"))  `!sort in during, allow sort, allow editor, prompt, !show order
	//AL_SetRowOpts ($_ptr_ListboxArea->;1;0;4*Num((Substring($_ptr_ArrayReferences->{4};7;1)#"0") & ($_bo_ReadOnly=False));0;0)  `multiline, !no selection, !dragline, !acceptdrag, movewithdata
	If (($_ptr_ArrayReferences->{4}="2") | (<>vALMode=2))
		If (<>ALselectinEntryMode=1)
			
			
			//3=entry on double click
			//select on single click....but because there is a form for entry the double click does nothing other than open a subscreen
			//AL_SetEntryOpts ($_ptr_ListboxArea->;3;0;0;0;1)
			For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
				$_ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
				OBJECT SET ENTERABLE:C238($_ptr_ThisColumnArray->; False:C215)
			End for 
			
		End if 
	Else 
		//AL_SetEntryOpts ($_ptr_ListboxArea->;2;0;0;0;1)
		For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
			$_ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}  // 23/06/06 pb
			If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))  //Enterable=true
				//$_ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
				OBJECT SET ENTERABLE:C238($_ptr_ThisColumnArray->; True:C214)
			Else 
				OBJECT SET ENTERABLE:C238($_ptr_ThisColumnArray->; False:C215)
			End if 
			
		End for 
	End if 
	
Else 
	$_l_AreaEnterability:=Num:C11(Substring:C12($_ptr_ArrayReferences->{4}; 1; 1))
	If ($_l_AreaEnterability=2) & (<>ALselectinEntryMode=1)
		//AL_SetEntryOpts ($_ptr_ListboxArea->;3;0;0;0;0)
		For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
			OBJECT SET ENTERABLE:C238($_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}->; False:C215)
		End for 
	Else 
		//AL_SetEntryOpts ($_ptr_ListboxArea->;Num(Substring($_ptr_ArrayReferences->{4};1;1));0;0;0;0)  `2= Single-click for entry - no selection 4=CmdDC for entry, single click select
		//AL_SetEntryOpts ($_ptr_ListboxArea->;2;0;0;0;1)
		For ($_l_ColumnNumber; 1; $_l_NumberofColumns)
			If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnNumber}))  //Enterable=true
				$_ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
				OBJECT SET ENTERABLE:C238($_ptr_ThisColumnArray->; True:C214)
			Else 
				OBJECT SET ENTERABLE:C238($_ptr_ThisColumnArray->; False:C215)
			End if 
			
		End for 
	End if 
End if 
OBJECT GET COORDINATES:C663($_ptr_ListboxArea->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_ObJWidth:=$_l_ObjectRight-$_l_ObjectLeft
If ($_l_ObJWidth<($_l_TotalColumnsWidth+10))
	LB_SetScroll($_ptr_ListboxArea; -1; -1)
Else 
	LB_SetScroll($_ptr_ListboxArea; -3; -1)
End if 
If (True:C214)
	If ($_bo_HideLastColumn)
		If ($_l_NumberofColumns>0)
			$_l_VisibleColumnsWidth:=0
			For ($_l_WidthIndex; 1; $_l_NumberofColumns-1)
				$_l_VisibleColumnsWidth:=$_l_VisibleColumnsWidth+$_ptr_ArrayofColumnWIdths->{$_l_WidthIndex}
			End for 
			$_l_Increase:=$_l_ObJWidth-$_l_VisibleColumnsWidth
			If ($_l_Increase>0)
				//inc 50
				//tot 100
				//tot/100*inc
				
				$_l_Multiply:=$_l_ObJWidth/$_l_VisibleColumnsWidth
				For ($_l_WidthIndex; 1; $_l_NumberofColumns-1)
					$_ptr_ArrayofColumnWIdths->{$_l_WidthIndex}:=$_ptr_ArrayofColumnWIdths->{$_l_WidthIndex}*$_l_Multiply
					LB_SetColumnWidths($_ptr_ListboxArea; $_t_ObjectPrefix; $_l_WidthIndex; $_ptr_ArrayofColumnWIdths->{$_l_WidthIndex})
				End for 
			End if 
			$_ptr_ArrayofColumnWIdths->{$_l_NumberofColumns}:=1
			ARRAY TEXT:C222($_at_ColumnNames; 0)
			ARRAY TEXT:C222($_at_HeaderNames; 0)
			ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
			ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
			ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
			ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
			LISTBOX GET ARRAYS:C832($_ptr_ListboxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
			
			LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{Size of array:C274($_at_ColumnNames)}; 1)
			
			//LB_SetColumnWidths ($_ptr_ListboxArea;$_t_ObjectPrefix;$_l_NumberofColumns;1)
		End if 
	End if 
End if 

//AL_UpdateArrays ($_ptr_ListboxArea»;-2)
ERR_MethodTrackerReturn("LBi_InclSetupQ"; $_t_oldMethodName)