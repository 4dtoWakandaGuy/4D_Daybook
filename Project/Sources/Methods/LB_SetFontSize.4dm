//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetFontSize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 10:02
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
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_FontSize; $_l_Index; $_l_ListboxColumns; $3; $4; $5; $6)
	C_POINTER:C301($_Ptr_ListBox; $1)
	C_TEXT:C284($_t_ObjectPrefix; $_t_ObjectSuffix; $_t_oldMethodName; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetFontSize")

//LB_SetFontSize (->CUS_lb_FurtherFields;"FF";2;9)

If (Count parameters:C259>=4)
	$_Ptr_ListBox:=$1
	
	$_l_ListboxColumns:=LISTBOX Get number of columns:C831($_Ptr_ListBox->)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_FooterNames; 0)
	ARRAY POINTER:C280($_aptr_FooterVars; 0)
	LISTBOX GET ARRAYS:C832($_Ptr_ListBox->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles; $_at_FooterNames; $_aptr_FooterVars)
	
	//HERE WE SHOULD GET FONTS AND CHECK IT EXISTS
	
	$_l_FontSize:=$4
	Case of 
		: ($3=1)  //Header objects
			$_t_ObjectSuffix:="_HED"
		: ($3=2)  //Row objects
			$_t_ObjectSuffix:="_COL"
	End case 
	If ($_l_ListboxColumns>0)
		Case of 
			: (Count parameters:C259=4)  //ALL COLUMNS
				
				
				//For ($_l_Index;1;$_l_ListboxColumns)  ` kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
				Case of 
					: ($3=1)
						For ($_l_Index; 1; $_l_ListboxColumns)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
							OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
							End if 
						End for 
					: ($3=2)
						OBJECT SET FONT SIZE:C165($_Ptr_ListBox->; $_l_FontSize)
						//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
						
						//For ($_l_Index;1;$_l_ListboxColumns)  // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
						//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
						//End for   // kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
				End case 
				//End for   ` kmw05/04/07  micro optimization - moved for loop inside case statement (mind you the compiler probably does this anyway)
				
				
			: (Count parameters:C259=5)  // FROM COLUMN NO
				
				For ($_l_Index; $5; $_l_ListboxColumns)
					Case of 
						: ($3=1)
							OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)
							If ($_at_FooterNames{$_l_Index}#"")
								OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
							End if 
						: ($3=2)
							OBJECT SET FONT SIZE:C165($_Ptr_ListBox->; $_l_FontSize)
							$_l_Index:=$_l_ListboxColumns
							
							//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
					End case 
					
				End for 
			: (Count parameters:C259>=6)  //FROM COL TO COL
				If ($6<=$_l_ListboxColumns)
					
					For ($_l_Index; $5; $6)
						Case of 
							: ($3=1)
								OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
								End if 
							: ($3=2)
								OBJECT SET FONT SIZE:C165($_Ptr_ListBox->; $_l_FontSize)
								$_l_Index:=$6
								//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
						End case 
						
					End for 
				Else 
					$_t_ObjectPrefix:=$2+$_t_ObjectSuffix
					For ($_l_Index; $5; $_l_ListboxColumns)
						Case of 
							: ($3=1)
								OBJECT SET FONT SIZE:C165(*; $_at_HeaderNames{$_l_Index}; $_l_FontSize)
								If ($_at_FooterNames{$_l_Index}#"")
									OBJECT SET FONT SIZE:C165(*; $_at_FooterNames{$_l_Index}; $_l_FontSize)
								End if 
							: ($3=2)
								//OBJECT SET FONT SIZE(*;$_at_ColumnNames{$_l_Index};$_l_FontSize)
								
								OBJECT SET FONT SIZE:C165($_Ptr_ListBox->; $_l_FontSize)
								$_l_Index:=$_l_ListboxColumns
						End case 
					End for 
				End if 
				
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("LB_SetFontSize"; $_t_oldMethodName)
