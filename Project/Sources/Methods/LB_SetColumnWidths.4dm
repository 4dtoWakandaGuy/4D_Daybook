//%attributes = {}

If (False:C215)
	//Project Method Name:      LB_SetColumnWidths
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
	C_LONGINT:C283($_l_ColumnWIdth; $_l_CountParameters; $_l_Index; $_l_NextObject; $0; $3)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetColumnWidths")

// $1 = pointer to the listbox area
// $2 = column names prefis
// $3 = starting col. no
// $4 -> n =  widths for the arrays (make sure there are the correct number!)

// example: LB_SetColumnWidths (->QV_LB_Items;"oApplicants";1;35;90;90;40;40;40;50;35) - defines 8 columns
$_t_oldMethodName:=ERR_MethodTracker("LB_SetColumnWidths")

$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>=4)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	
	LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
	$0:=1
	$_l_NextObject:=$3
	For ($_l_Index; 4; $_l_CountParameters)
		If ((Size of array:C274($_at_ColumnNames))<($_l_Index-4+$_l_NextObject))
			//TRACE
		Else 
			If ($_l_Index<=($_l_CountParameters+4))  // just to avoid an error message if the no. of parameters doesn't match the no. of arrays that have been defined
				If (${$_l_Index}<=0)
					LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{$_l_Index-4+$_l_NextObject}; 0)
					OBJECT SET VISIBLE:C603(*; $_at_ColumnNames{$_l_Index-4+$_l_NextObject}; False:C215)
					$_l_ColumnWIdth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Index-4+$_l_NextObject})
					If ($_l_ColumnWIdth>0)
						//TRACE
					End if 
					LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{$_l_Index-4+$_l_NextObject}; 0)
					
					OBJECT SET VISIBLE:C603(*; $_at_ColumnNames{$_l_Index-4+$_l_NextObject}; False:C215)
					
				Else 
					
					LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{$_l_Index-4+$_l_NextObject}; ${$_l_Index})
				End if 
				$0:=$_l_Index-4+$_l_NextObject+1
			Else 
				//TRACE
			End if 
		End if 
	End for 
	
	
End if 
ERR_MethodTrackerReturn("LB_SetColumnWidths"; $_t_oldMethodName)