//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetFontSizebyObjectName
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
	ARRAY BOOLEAN:C223($_abo_ColumnVIsible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY POINTER:C280($_aPtr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_FooterVars; 0)
	ARRAY POINTER:C280($_aPtr_HeaderVars; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_ColumnCount; $_l_EndColumn; $_l_FontSize; $_l_HeaderOrColumns; $_l_Index; $_l_StartColumn; $3; $4; $5; $6)
	C_TEXT:C284($_t_objectBaseName; $_t_ObjectName; $_t_ObjectPrefix; $_t_ObjectSuffix; $_t_OldMethodName; $1; $2)
End if 
//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_SetFontSizeByObjectName")

//LB_SetFontSizeByObjectName (->CUS_lb_FurtherFields;"FF";2;9)

If (Count parameters:C259>=4)
	$_t_ObjectName:=$1
	$_t_objectBaseName:=$2
	$_l_FontSize:=$4
	$_l_HeaderOrColumns:=$3
	If (Count parameters:C259>=6)
		$_l_StartColumn:=$5
		$_l_EndColumn:=$6
	End if 
	$_l_ColumnCount:=LISTBOX Get number of columns:C831(*; $_t_ObjectName)
	LISTBOX GET ARRAYS:C832(*; $_t_ObjectName; $_at_ColumnNames; $_at_HeaderNames; $_aPtr_ColumnVars; $_aPtr_HeaderVars; $_abo_ColumnVIsible; $_aptr_ColumnStyles; $_at_FooterNames; $_aptr_FooterVars)
	
	//HERE WE SHOULD GET FONTS AND CHECK IT EXISTS
	
	Case of 
		: ($_l_HeaderOrColumns=1)  //Header objects
			$_t_ObjectSuffix:="_HED"
		: ($_l_HeaderOrColumns=2)  //Row objects
			$_t_ObjectSuffix:="_COL"
	End case 
	If ($_l_ColumnCount>0)
		Case of 
			: (Count parameters:C259=4)  //ALL COLUMNS
				
				
				//For ($_l_Index;1;$_l_ColumnCount)  ` kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
				Case of 
					: ($_l_HeaderOrColumns=1)
						For ($_l_Index; 1; $_l_ColumnCount)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
							OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
							End if 
						End for 
					: ($_l_HeaderOrColumns=2)
						
						OBJECT SET FONT SIZE:C165(*; $_t_ObjectName; $_l_FontSize)
						
						//For ($_l_Index;1;$_l_ColumnCount)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
						//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
						//End for   // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
				End case 
				//End for   ` kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
				
				
			: (Count parameters:C259=5)  // FROM COLUMN NO
				
				For ($_l_Index; $_l_StartColumn; $_l_ColumnCount)
					Case of 
						: ($_l_HeaderOrColumns=1)
							OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
							End if 
						: ($_l_HeaderOrColumns=2)
							OBJECT SET FONT SIZE:C165(*; $_t_ObjectName; $_l_FontSize)
							$_l_Index:=$_l_ColumnCount
							//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
					End case 
					
				End for 
			: (Count parameters:C259>=6)  //FROM COL TO COL
				If ($_l_EndColumn<=$_l_ColumnCount)
					
					For ($_l_Index; $_l_StartColumn; $_l_EndColumn)
						Case of 
							: ($_l_HeaderOrColumns=1)
								OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
								End if 
							: ($_l_HeaderOrColumns=2)
								OBJECT SET FONT SIZE:C165(*; $_t_ObjectName; $_l_FontSize)
								$_l_Index:=$_l_EndColumn
								
								//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
						End case 
						
					End for 
				Else 
					$_t_ObjectPrefix:=$_t_objectBaseName+$_t_ObjectSuffix
					For ($_l_Index; $_l_StartColumn; $_l_ColumnCount)
						Case of 
							: ($_l_HeaderOrColumns=1)
								OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
								End if 
							: ($_l_HeaderOrColumns=2)
								OBJECT SET FONT SIZE:C165(*; $_t_ObjectName; $_l_FontSize)
								$_l_Index:=$_l_ColumnCount
								
								//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
						End case 
					End for 
				End if 
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("LB_SetFontSizeByObjectName"; $_t_OldMethodName)
