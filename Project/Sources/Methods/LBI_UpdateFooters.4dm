//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_UpdateFooters
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/04/2013 16:22
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
	ARRAY POINTER:C280($_aPtr_FooterVars; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_FooterVarNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_LONGINT:C283($_l_CountParameters; $_l_D4DType; $_l_Index; $2; $3)
	C_POINTER:C301($_ptr_ColumnVar; $_ptr_FooterVar; $_Ptr_Table; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_UpdateFooters")

$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>=2)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	ARRAY TEXT:C222($_at_FooterVarNames; 0)
	ARRAY POINTER:C280($_aPtr_FooterVars; 0)
	
	LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles; $_at_FooterVarNames; $_aPtr_FooterVars)
	For ($_l_Index; 1; Size of array:C274($_at_FooterVarNames))
		If ($_at_FooterVarNames{$_l_Index}#"")
			$_l_D4DType:=LISTBOX Get footer calculation:C1150(*; $_at_FooterVarNames{$_l_Index})
			If ($_l_D4DType=1)
				$_ptr_FooterVar:=$_aPtr_FooterVars{$_l_Index}
				Case of 
					: ($2=3)
						$_Ptr_Table:=Table:C252($3)
						Case of 
							: (Type:C295($_ptr_FooterVar->)=Is text:K8:3)
								$_ptr_FooterVar->:=String:C10(Records in selection:C76($_Ptr_Table->))
							Else 
								$_ptr_FooterVar->:=Records in selection:C76($_Ptr_Table->)
						End case 
					Else 
						$_ptr_ColumnVar:=$_aptr_ColumnVariables{$_l_Index}
						Case of 
							: (Type:C295($_ptr_FooterVar->)=Is text:K8:3)
								$_ptr_FooterVar->:=String:C10(Size of array:C274($_ptr_ColumnVar->))
								
							Else 
								$_ptr_FooterVar->:=Size of array:C274($_ptr_ColumnVar->)
						End case 
				End case 
			End if 
		End if 
	End for 
	
End if 
ERR_MethodTrackerReturn("LBI_UpdateFooters"; $_t_oldMethodName)