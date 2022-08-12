//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetFontStyleByObjectName
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
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_FooterVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_ColumnCount; $_l_EndColumn; $_l_FontStyle; $_l_HeaderOrColumn; $_l_Index; $_l_StartColumn; $3; $4; $5; $6)
	C_TEXT:C284($_t_ObjectBaseName; $_t_ObjectName; $_t_OldMethodName; $_t_Suffix; $1; $2)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_SetFontStyleByObjectName")

If (Count parameters:C259>=4)
	$_t_ObjectName:=$1
	$_t_ObjectBaseName:=$2
	$_l_HeaderOrColumn:=$3
	$_l_FontStyle:=$4
	$_l_StartColumn:=1
	If (Count parameters:C259>=5)
		$_l_StartColumn:=$5
		If (Count parameters:C259>=5)
			$_l_EndColumn:=$6
		End if 
	End if 
	$_l_ColumnCount:=LISTBOX Get number of columns:C831(*; $_t_ObjectName)
	//HERE WE SHOULD GET FONTS AND CHECK IT EXISTS
	
	Case of 
		: ($_l_HeaderOrColumn=1)  //Header objects
			$_t_Suffix:="_HED"
		: ($_l_HeaderOrColumn=2)  //Row objects
			$_t_Suffix:="_COL"
	End case 
	//C_POINTER($1)
	//C_TEXT($_t_ObjectBaseName)
	
	LISTBOX GET ARRAYS:C832(*; $_t_ObjectName; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles; $_at_FooterNames; $_aptr_FooterVars)
	
	//HERE WE SHOULD GET FONTS AND CHECK IT EXISTS
	//$_l_FontSize:=$4
	Case of 
		: ($_l_HeaderOrColumn=1)  //Header objects
			$_t_Suffix:="_HED"
		: ($_l_HeaderOrColumn=2)  //Row objects
			$_t_Suffix:="_COL"
	End case 
	If ($_l_ColumnCount>0)
		Case of 
			: (Count parameters:C259=4)  //ALL COLUMNS
				
				For ($_l_Index; 1; $_l_ColumnCount)
					
					Case of 
						: ($_l_HeaderOrColumn=1)
							OBJECT SET FONT STYLE:C166(*; $_at_HeaderNames{$_l_Index}; $_l_FontStyle)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT STYLE:C166(*; $_at_FooterNames{$_l_Index}; $_l_FontStyle)
							End if 
						: ($_l_HeaderOrColumn=2)
							OBJECT SET FONT STYLE:C166(*; $_at_ColumnNames{$_l_Index}; $_l_FontStyle)
					End case 
				End for 
			: (Count parameters:C259=5)  // FROM COLUMN NO
				
				For ($_l_Index; $_l_StartColumn; $_l_ColumnCount)
					Case of 
						: ($_l_HeaderOrColumn=1)
							OBJECT SET FONT STYLE:C166(*; $_at_HeaderNames{$_l_Index}; $_l_FontStyle)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT STYLE:C166(*; $_at_FooterNames{$_l_Index}; $_l_FontStyle)
							End if 
						: ($_l_HeaderOrColumn=2)
							OBJECT SET FONT STYLE:C166(*; $_at_ColumnNames{$_l_Index}; $_l_FontStyle)
					End case 
					
				End for 
			: (Count parameters:C259>=6)  //FROM COL TO COL
				If ($_l_EndColumn<=$_l_ColumnCount)
					
					For ($_l_Index; $_l_StartColumn; $_l_EndColumn)
						Case of 
							: ($_l_HeaderOrColumn=1)
								OBJECT SET FONT STYLE:C166(*; $_at_HeaderNames{$_l_Index}; $_l_FontStyle)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT STYLE:C166(*; $_at_FooterNames{$_l_Index}; $_l_FontStyle)
								End if 
							: ($_l_HeaderOrColumn=2)
								OBJECT SET FONT STYLE:C166(*; $_at_ColumnNames{$_l_Index}; $_l_FontStyle)
						End case 
						
					End for 
				Else 
					//$OjectPrefix:=$_t_ObjectBaseName+$_t_Suffix
					For ($_l_Index; $_l_StartColumn; $_l_ColumnCount)
						Case of 
							: ($_l_HeaderOrColumn=1)
								OBJECT SET FONT STYLE:C166(*; $_at_HeaderNames{$_l_Index}; $_l_FontStyle)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT STYLE:C166(*; $_at_FooterNames{$_l_Index}; $_l_FontStyle)
								End if 
							: ($_l_HeaderOrColumn=2)
								OBJECT SET FONT STYLE:C166(*; $_at_ColumnNames{$_l_Index}; $_l_FontStyle)
						End case 
					End for 
				End if 
				
		End case 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("LB_SetFontStyleByObjectName"; $_t_OldMethodName)