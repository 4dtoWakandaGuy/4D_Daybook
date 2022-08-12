//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SETFONT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_FooterVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_FontNames; 0)
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_ColumnNamePosition; $_l_ColumnNames; $_l_ColumnorHeader; $_l_EndColumn; $_l_FontColor; $_l_FontRow; $_l_FontSize; $_l_FontStyle; $_l_FooterNamePosition; $_l_FooterNames; $_l_HeaderNamePosition)
	C_LONGINT:C283($_l_Index; $_l_ListboxColumns; $_l_StartColumn; $3; $5; $6; $7; $8; $9)
	C_POINTER:C301($_ptr_ListBox; $1)
	C_TEXT:C284($_t_ColumnNames; $_t_FontName; $_t_FooterNames; $_t_HeaderNames; $_t_ObjectName; $_t_ObjectPrefix; $_t_ObjectSuffix; $_t_oldMethodName; $2; $4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SETFONT")
//`TRACE


If (Count parameters:C259>=4)
	$_ptr_ListBox:=$1
	$_l_ListboxColumns:=LISTBOX Get number of columns:C831($_ptr_ListBox->)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY POINTER:C280($_aptr_FooterVars; 0)
	LISTBOX GET ARRAYS:C832($_ptr_ListBox->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles; $_at_FooterNames; $_aptr_FooterVars)
	
	//HERE WE SHOULD GET FONTS AND CHECK IT EXISTS
	ARRAY TEXT:C222($_at_FontNames; 0)
	FONT LIST:C460($_at_FontNames)
	$_l_FontRow:=Find in array:C230($_at_FontNames; $4)
	If ($_l_FontRow>0)
		$_t_FontName:=$4
	Else 
		$_t_FontName:="Marker Felt"
	End if 
	
	If ($_l_ListboxColumns>0)
		If (Count parameters:C259>=9)  //CANNOT DO THIS??-NO WAY TO PROGRAMMATICALLY SET A FONT COLOR? YES SEE  LB_SETCOLOURS
			
			$_l_FontColor:=$9
			$_l_FontColor:=-256+(256*1)
		Else 
			
			$_l_FontColor:=-256+(256*200)
			
		End if 
		If (Size of array:C274($_at_HeaderNames)>0)
			$_t_HeaderNames:=$_at_HeaderNames{1}
			$_l_HeaderNamePosition:=Length:C16($_t_HeaderNames)
			//TRACE  //
			Repeat 
				If ((String:C10(Num:C11($_t_HeaderNames[[$_l_HeaderNamePosition]])))=$_t_HeaderNames[[$_l_HeaderNamePosition]])
					$_l_HeaderNamePosition:=$_l_HeaderNamePosition-1
				End if 
			Until ((String:C10(Num:C11($_t_HeaderNames[[$_l_HeaderNamePosition]])))#$_t_HeaderNames[[$_l_HeaderNamePosition]])
			$_t_HeaderNames:=Substring:C12($_t_HeaderNames; 1; $_l_HeaderNamePosition)
		End if 
		If (Size of array:C274($_at_FooterNames)>0)
			$_t_FooterNames:=$_at_FooterNames{1}
			$_l_FooterNamePosition:=Length:C16($_t_FooterNames)
			//
			Repeat 
				If ((String:C10(Num:C11($_t_FooterNames[[$_l_FooterNamePosition]])))=$_t_FooterNames[[$_l_FooterNamePosition]])
					$_l_FooterNamePosition:=$_l_FooterNamePosition-1
				End if 
			Until ((String:C10(Num:C11($_t_FooterNames[[$_l_FooterNamePosition]])))#$_t_FooterNames[[$_l_FooterNamePosition]])
			$_t_FooterNames:=Substring:C12($_t_FooterNames; 1; $_l_FooterNamePosition)
		End if 
		If (Size of array:C274($_at_ColumnNames)>0)
			$_t_ColumnNames:=$_at_ColumnNames{1}
			$_l_ColumnNamePosition:=Length:C16($_t_ColumnNames)
			//
			Repeat 
				If ((String:C10(Num:C11($_t_ColumnNames[[$_l_ColumnNamePosition]])))=$_t_ColumnNames[[$_l_ColumnNamePosition]])
					$_l_ColumnNamePosition:=$_l_ColumnNamePosition-1
				End if 
			Until ((String:C10(Num:C11($_t_ColumnNames[[$_l_ColumnNamePosition]])))#$_t_ColumnNames[[$_l_ColumnNamePosition]])
			$_t_ColumnNames:=Substring:C12($_t_ColumnNames; 1; $_l_ColumnNamePosition)
		End if 
		
		
		
		
		Case of 
			: (Count parameters:C259=4)  //ALL COLUMNS
				$_l_ColumnorHeader:=$3
				Case of 
					: ($_l_ColumnorHeader=1)
						OBJECT SET FONT:C164(*; $_t_HeaderNames+"@"; $_t_FontName)
						OBJECT SET FONT:C164(*; $_t_FooterNames+"@"; $_t_FontName)
					Else 
						OBJECT SET FONT:C164(*; $_t_ColumnNames+"@"; $_t_FontName)
						
				End case 
				If (False:C215)
					For ($_l_Index; 1; $_l_ListboxColumns)
						
						Case of 
							: ($_l_ColumnorHeader=1)
								OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
								End if 
								//`set color(*;$_at_HeaderNames{$_l_Index};$_l_FontColor)
							: ($_l_ColumnorHeader=2)
								OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
						End case 
						
					End for 
				End if 
			: (Count parameters:C259=5)  // FROM COLUMN NO
				$_l_ColumnorHeader:=$3
				$_l_StartColumn:=$5
				If ($_l_StartColumn=0)
					$_l_StartColumn:=1
				End if 
				For ($_l_Index; $_l_StartColumn; $_l_ListboxColumns)
					Case of 
						: ($_l_ColumnorHeader=1)
							OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
							End if 
						: ($_l_ColumnorHeader=2)
							OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
					End case 
					
				End for 
				
			: (Count parameters:C259>=6)  //FROM COL TO COL
				$_l_ColumnorHeader:=$3
				$_l_StartColumn:=$5
				$_l_EndColumn:=$6
				Case of 
					: ($_l_StartColumn=0) & ($_l_EndColumn=0)  //all columns
						$_l_StartColumn:=1
						$_l_EndColumn:=$_l_ListboxColumns
					: ($_l_StartColumn=0)  //start at beginning
						$_l_StartColumn:=1
					: ($_l_EndColumn=0)  //end at end
						$_l_EndColumn:=$_l_ListboxColumns
				End case 
				If ($_l_EndColumn>$_l_ListboxColumns)  //just in case end was greater than number of columns
					$_l_EndColumn:=$_l_ListboxColumns
				End if 
				If ($_l_StartColumn>$_l_EndColumn)  //just in case start was greater than end
					$_l_StartColumn:=$_l_EndColumn
				End if 
				
				
				For ($_l_Index; $_l_StartColumn; $_l_EndColumn)
					Case of 
						: ($_l_ColumnorHeader=1)
							OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
							End if 
						: ($_l_ColumnorHeader=2)
							OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
					End case 
					If (Count parameters:C259>=7)
						//LB_SetFontSize ($1;$2;$3;$7;$_l_Index;$_l_Index)
						$_l_fontSIze:=$7
						If ($_l_Index=$_l_StartColumn)
							Case of 
								: ($_l_ColumnorHeader=1)
									OBJECT SET FONT SIZE:C165(*; $_t_HeaderNames+"@"; $_l_fontSIze)
									OBJECT SET FONT SIZE:C165(*; $_t_FooterNames+"@"; $_l_fontSIze)
								Else 
									OBJECT SET FONT SIZE:C165(*; $_t_ColumnNames+"@"; $_l_fontSIze)
									
							End case 
						End if 
						If (False:C215)
							Case of 
									
								: ($_l_ColumnorHeader=1)
									OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_fontSIze)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
									If ($_at_FooterNames{$_l_Index}#"")
										OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_fontSIze)
									End if 
								Else 
									If ($_l_Index=$_l_StartColumn)
										OBJECT SET FONT SIZE:C165($_ptr_ListBox->; $_l_FontSize)
									End if 
									
									//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_fontSIze)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
									
							End case 
						End if 
						If (Count parameters:C259>=8)
							//LB_SetFontStyle ($1;$2;$3;$8;$_l_Index;$_l_Index)
							$_l_FontStyle:=$8
							Case of 
								: ($_l_ColumnorHeader=1)
									OBJECT SET FONT STYLE:C166(*; $_at_HeaderNames{$_l_Index}; $_l_FontStyle)
									If ($_at_FooterNames{$_l_Index}#"")
										OBJECT SET FONT STYLE:C166(*; $_at_FooterNames{$_l_Index}; $_l_FontStyle)
									End if 
								: ($_l_ColumnorHeader=2)
									OBJECT SET FONT STYLE:C166(*; $_at_ColumnNames{$_l_Index}; $_l_FontStyle)
							End case 
						End if 
					End if 
					
				End for 
				
				
				
				
		End case 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("LB_SETFONT"; $_t_oldMethodName)
