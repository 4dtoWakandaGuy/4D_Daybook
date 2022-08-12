//%attributes = {}

If (False:C215)
	//Database Method Name:      LB_SetColumnWIdthsByObjectName
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  29/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_ColumnVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVars; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_ColumnWIdth; $_l_Index; $_l_NextColumn; $_l_Parameters; $0; $3)
	C_TEXT:C284($_t_LbobjectName; $_t_OldMethodName; $1)
End if 

//Code Starts Here
$_t_OldMethodName:=ERR_MethodTracker("LB_SetColumnWidthsByObjectName")


$_l_Parameters:=Count parameters:C259
If ($_l_Parameters>=4)
	$_t_LbobjectName:=$1
	$_l_NextColumn:=$3
	LISTBOX GET ARRAYS:C832(*; $_t_LbobjectName; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVars; $_aptr_HeaderVars; $_abo_ColumnVisible; $_aptr_ColumnStyles)
	$0:=1
	
	For ($_l_Index; 4; $_l_Parameters)
		If ((Size of array:C274($_at_ColumnNames))<($_l_Index-4+$_l_NextColumn))
			//TRACE
		Else 
			If ($_l_Index<=($_l_Parameters+4))  // just to avoid an error message if the no. of parameters doesn't match the no. of arrays that have been defined
				If (${$_l_Index}<=0)
					LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{$_l_Index-4+$_l_NextColumn}; 0)
					OBJECT SET VISIBLE:C603(*; $_at_ColumnNames{$_l_Index-4+$_l_NextColumn}; False:C215)
					$_l_ColumnWIdth:=LISTBOX Get column width:C834(*; $_at_ColumnNames{$_l_Index-4+$_l_NextColumn})
					If ($_l_ColumnWIdth>0)
						//TRACE
					End if 
					LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{$_l_Index-4+$_l_NextColumn}; 0)
					
					OBJECT SET VISIBLE:C603(*; $_at_ColumnNames{$_l_Index-4+$_l_NextColumn}; False:C215)
					
				Else 
					
					LISTBOX SET COLUMN WIDTH:C833(*; $_at_ColumnNames{$_l_Index-4+$_l_NextColumn}; ${$_l_Index})
				End if 
				$0:=$_l_Index-4+$_l_NextColumn+1
			Else 
				//TRACE
			End if 
		End if 
	End for 
	
	
End if 
ERR_MethodTrackerReturn("LB_SetColumnWidthsByObjectName"; $_t_OldMethodName)