//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetFontByObjectName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  30/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	ARRAY POINTER:C280($_aPtr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_FooterVars; 0)
	ARRAY POINTER:C280($_aPtr_HeaderVars; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_FontNames; 0)
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_CoumnCount; $_l_EndingColumn; $_l_FontNameColor; $_l_FontPosition; $_l_FontSize; $_l_FontStyle; $_l_HeaderorColumn; $_l_Index; $_l_StartingColumn; $3; $5)
	C_LONGINT:C283($6; $7; $8)
	C_TEXT:C284($_t_ColumnObjectName; $_t_FontName; $_t_objectName; $_t_objectPrefix; $_t_OldMethodName; $1; $2; $4; $9)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("Lb_SetFontByObjectName")
//`TRACE


If (Count parameters:C259>=4)
	$_t_objectName:=$1
	$_t_objectPrefix:=$2
	$_l_HeaderorColumn:=$3
	$_t_FontName:=$4
	$_l_StartingColumn:=0
	$_l_EndingColumn:=0
	$_l_FontSize:=0
	If (Count parameters:C259>=5)
		$_l_StartingColumn:=$5
		If (Count parameters:C259>=6)
			$_l_EndingColumn:=$6
			If (Count parameters:C259>=7)
				$_l_FontSize:=$7
				If (Count parameters:C259>=7)
					$_l_FontStyle:=$8
					If (Count parameters:C259>=9)  //CANNOT DO THIS??-NO WAY TO PROGRAMMATICALLY SET A FONT COLOR? YES SEE  LB_SETCOLOURS
						//$_l_FontNameColor:=$9
						$_l_FontNameColor:=-256+(256*1)
					Else 
						$_l_FontNameColor:=-256+(256*200)
					End if 
				End if 
			End if 
		End if 
	End if 
	$_l_CoumnCount:=LISTBOX Get number of columns:C831(*; $_t_objectName)
	LISTBOX GET ARRAYS:C832(*; $_t_objectName; $_at_ColumnNames; $_at_HeaderNames; $_aPtr_ColumnVars; $_aPtr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles; $_at_FooterNames; $_aptr_FooterVars)
	
	//HERE WE SHOULD GET FONTS AND CHECK IT EXISTS
	
	FONT LIST:C460($_at_FontNames)
	$_l_FontPosition:=Find in array:C230($_at_FontNames; $_t_FontName)
	If ($_l_FontPosition<0)
		$_t_FontName:="Marker Felt"
	End if 
	
	If ($_l_CoumnCount>0)
		
		Case of 
			: (Count parameters:C259=4)  //ALL COLUMNS
				
				For ($_l_Index; 1; $_l_CoumnCount)
					
					Case of 
						: ($_l_HeaderorColumn=1)
							OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
							End if 
						: ($_l_HeaderorColumn=2)
							OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
					End case 
					
				End for 
				
			: (Count parameters:C259=5)  // FROM COLUMN NO
				If ($_l_StartingColumn=0)
					For ($_l_Index; 1; $_l_CoumnCount)
						
						Case of 
							: ($_l_HeaderorColumn=1)
								OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
								End if 
							: ($_l_HeaderorColumn=2)
								OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
						End case 
						
					End for 
				Else 
					For ($_l_Index; $_l_StartingColumn; $_l_CoumnCount)
						Case of 
							: ($_l_HeaderorColumn=1)
								OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
								End if 
							: ($_l_HeaderorColumn=2)
								OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
						End case 
						
					End for 
				End if 
			: (Count parameters:C259>=6)  //FROM COL TO COL
				If ($_l_StartingColumn=0) & ($_l_EndingColumn=0)
					For ($_l_Index; 1; $_l_CoumnCount)
						
						Case of 
							: ($_l_HeaderorColumn=1)
								OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
								End if 
							: ($_l_HeaderorColumn=2)
								OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
						End case 
						
					End for 
					If (Count parameters:C259>=7)
						LB_SetFontSizebyObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontSize)
						If (Count parameters:C259>=8)
							LB_SetFontStyleByObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontStyle)
							
						End if 
					End if 
				Else 
					If ($_l_StartingColumn=0)
						If ($_l_EndingColumn<=$_l_CoumnCount)
							
							For ($_l_Index; 1; $_l_EndingColumn)
								Case of 
									: ($_l_HeaderorColumn=1)
										OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
										If ($_at_FooterNames{$_l_Index}#"")
											OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
										End if 
										
									: ($_l_HeaderorColumn=2)
										OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
								End case 
								
								If (Count parameters:C259>=7)
									LB_SetFontSizebyObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontSize; $_l_Index; $_l_Index)
									If (Count parameters:C259>=8)
										LB_SetFontStyleByObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontStyle; $_l_Index; $_l_Index)
										
									End if 
								End if 
							End for 
							
						Else 
							//$OjectPrefix:=$_t_objectPrefix+$Suffix
							For ($_l_Index; 1; $_l_CoumnCount)
								$_t_ColumnObjectName:=$_at_ColumnNames{$_l_Index}
								Case of 
									: ($_l_HeaderorColumn=1)
										OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
										If ($_at_FooterNames{$_l_Index}#"")
											OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
										End if 
									: ($_l_HeaderorColumn=2)
										OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
								End case 
								//`set color(*;$_t_ColumnObjectName;$_l_FontNameColor)
								If (Count parameters:C259>=7)
									LB_SetFontSizebyObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontSize; $_l_Index; $_l_Index)
									If (Count parameters:C259>=8)
										LB_SetFontStyleByObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontStyle; $_l_Index; $_l_Index)
										
									End if 
								End if 
							End for 
						End if 
					Else 
						If ($_l_EndingColumn<=$_l_CoumnCount)
							
							For ($_l_Index; $_l_StartingColumn; $_l_EndingColumn)
								Case of 
									: ($_l_HeaderorColumn=1)
										OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
										If ($_at_FooterNames{$_l_Index}#"")
											OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
										End if 
									: ($_l_HeaderorColumn=2)
										OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
								End case 
								If (Count parameters:C259>=7)
									LB_SetFontSizebyObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontSize; $_l_Index; $_l_Index)
									If (Count parameters:C259>=8)
										LB_SetFontStyleByObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontStyle; $_l_Index; $_l_Index)
										
									End if 
								End if 
								
							End for 
						Else 
							//$OjectPrefix:=$_t_objectPrefix+$Suffix
							For ($_l_Index; $_l_StartingColumn; $_l_CoumnCount)
								Case of 
									: ($_l_HeaderorColumn=1)
										OBJECT SET FONT:C164(*; $_at_HeaderNames{$_l_Index}; $_t_FontName)
										If ($_at_FooterNames{$_l_Index}#"")
											OBJECT SET FONT:C164(*; $_at_FooterNames{$_l_Index}; $_t_FontName)
										End if 
									: ($_l_HeaderorColumn=2)
										OBJECT SET FONT:C164(*; $_at_ColumnNames{$_l_Index}; $_t_FontName)
								End case 
								//`set color(*;$_t_ColumnObjectName;$_l_FontNameColor)
								If (Count parameters:C259>=7)
									LB_SetFontSizebyObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontSize; $_l_Index; $_l_Index)
									If (Count parameters:C259>=8)
										LB_SetFontStyleByObjectName($_t_objectName; $_t_objectPrefix; $_l_HeaderorColumn; $_l_FontStyle; $_l_Index; $_l_Index)
										
									End if 
								End if 
							End for 
						End if 
						
					End if 
				End if 
		End case 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("Lb_SetFontByObjectName"; $_t_OldMethodName)