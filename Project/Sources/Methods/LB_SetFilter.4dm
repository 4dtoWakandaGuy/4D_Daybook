//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetFilter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2011 23:26
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
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	C_BOOLEAN:C305($_bo_TableBased)
	C_LONGINT:C283($_l_AssocitatedTableNum; $_l_Index; $_l_ListboxColumns; $2; $4; $5)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_HeaderName; $_t_oldMethodName; $_t_VariableName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetFilter")
// added 8/2/07 -kmw
//kmw - basically a rip off of LB_SetFormat (sets filters instead of formats)



// example: LB_SetFilter (->INV_lb_ALLOCATIONS;2;"&/5";3;3)

If (Count parameters:C259>=3)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	$_l_AssocitatedTableNum:=-1
	If (Not:C34(Is nil pointer:C315($1)))
		LISTBOX GET TABLE SOURCE:C1014($1->; $_l_AssocitatedTableNum)
	End if 
	$_bo_TableBased:=($_l_AssocitatedTableNum>0)
	If (Not:C34($_bo_TableBased))
		LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
		
		Case of 
			: (Count parameters:C259=3)  // all columns
				$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
				For ($_l_Index; 1; $_l_ListboxColumns)
					Case of 
						: ($2=1)
							OBJECT SET FILTER:C235(*; $_at_HeaderNames{$_l_Index}; $3)
						: ($2=2)
							OBJECT SET FILTER:C235(*; $_at_ColumnNames{$_l_Index}; $3)
					End case 
				End for 
				
			: (Count parameters:C259=4)  // one column
				If ($4>0)
					Case of 
						: ($2=1)
							OBJECT SET FILTER:C235(*; $_at_HeaderNames{$4}; $3)
						: ($2=2)
							OBJECT SET FILTER:C235(*; $_at_ColumnNames{$4}; $3)
					End case 
				Else 
					//all columns
					$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
					For ($_l_Index; 1; $_l_ListboxColumns)
						Case of 
							: ($2=1)
								OBJECT SET FILTER:C235(*; $_at_HeaderNames{$_l_Index}; $3)
							: ($2=2)
								OBJECT SET FILTER:C235(*; $_at_ColumnNames{$_l_Index}; $3)
						End case 
					End for 
					
				End if 
				
			: (Count parameters:C259=5)  // column $3 to column $4
				Case of 
					: ($4>0)
						If ($5>0)
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							If ($_l_ListboxColumns>$5)
								$_l_ListboxColumns:=$5
							End if 
							For ($_l_Index; $4; $_l_ListboxColumns)
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_at_HeaderNames{$_l_Index}; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_at_ColumnNames{$_l_Index}; $3)
								End case 
							End for 
							
						Else 
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							
							For ($_l_Index; $4; $_l_ListboxColumns)
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_at_HeaderNames{$_l_Index}; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_at_ColumnNames{$_l_Index}; $3)
								End case 
							End for 
							
						End if 
					Else 
						If ($5>0)
							// to column
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							If ($_l_ListboxColumns>$5)
								$_l_ListboxColumns:=$5
							End if 
							For ($_l_Index; 1; $_l_ListboxColumns)
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_at_HeaderNames{$_l_Index}; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_at_ColumnNames{$_l_Index}; $3)
								End case 
							End for 
							
						Else 
							//all columns
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							
							For ($_l_Index; 1; $_l_ListboxColumns)
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_at_HeaderNames{$_l_Index}; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_at_ColumnNames{$_l_Index}; $3)
								End case 
							End for 
							
						End if 
				End case 
				
		End case 
	Else 
		$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
		Case of 
			: (Count parameters:C259=3)  // all columns
				$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
				For ($_l_Index; 1; $_l_ListboxColumns)
					$_t_HeaderName:="Header"+String:C10($_l_Index)
					$_t_VariableName:="Column"+String:C10($_l_Index)
					Case of 
						: ($2=1)
							OBJECT SET FILTER:C235(*; $_t_HeaderName; $3)
						: ($2=2)
							OBJECT SET FILTER:C235(*; $_t_VariableName; $3)
					End case 
				End for 
				
			: (Count parameters:C259=4)  // one column
				If ($4>0)
					$_t_HeaderName:="Header"+String:C10($4)
					$_t_VariableName:="Column"+String:C10($4)
					Case of 
						: ($2=1)
							OBJECT SET FILTER:C235(*; $_t_HeaderName; $3)
						: ($2=2)
							OBJECT SET FILTER:C235(*; $_t_VariableName; $3)
					End case 
				Else 
					//all columns
					$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
					For ($_l_Index; 1; $_l_ListboxColumns)
						$_t_HeaderName:="Header"+String:C10($_l_Index)
						$_t_VariableName:="Column"+String:C10($_l_Index)
						Case of 
							: ($2=1)
								OBJECT SET FILTER:C235(*; $_t_HeaderName; $3)
							: ($2=2)
								OBJECT SET FILTER:C235(*; $_t_VariableName; $3)
						End case 
					End for 
					
				End if 
				
			: (Count parameters:C259=5)  // column $3 to column $4
				Case of 
					: ($4>0)
						
						If ($5>0)
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							If ($_l_ListboxColumns>$5)
								$_l_ListboxColumns:=$5
							End if 
							For ($_l_Index; $4; $_l_ListboxColumns)
								$_t_HeaderName:="Header"+String:C10($_l_Index)
								$_t_VariableName:="Column"+String:C10($_l_Index)
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_t_HeaderName; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_t_VariableName; $3)
								End case 
							End for 
							
						Else 
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							
							For ($_l_Index; $4; $_l_ListboxColumns)
								$_t_HeaderName:="Header"+String:C10($_l_Index)
								$_t_VariableName:="Column"+String:C10($_l_Index)
								
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_t_HeaderName; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_t_VariableName; $3)
								End case 
							End for 
							
						End if 
					Else 
						If ($5>0)
							// to column
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							If ($_l_ListboxColumns>$5)
								$_l_ListboxColumns:=$5
							End if 
							For ($_l_Index; 1; $_l_ListboxColumns)
								$_t_HeaderName:="Header"+String:C10($_l_Index)
								$_t_VariableName:="Column"+String:C10($_l_Index)
								
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_t_HeaderName; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_t_VariableName; $3)
								End case 
							End for 
							
						Else 
							//all columns
							$_l_ListboxColumns:=LISTBOX Get number of columns:C831($1->)
							
							For ($_l_Index; 1; $_l_ListboxColumns)
								$_t_HeaderName:="Header"+String:C10($_l_Index)
								$_t_VariableName:="Column"+String:C10($_l_Index)
								
								Case of 
									: ($2=1)
										OBJECT SET FILTER:C235(*; $_t_HeaderName; $3)
									: ($2=2)
										OBJECT SET FILTER:C235(*; $_t_VariableName; $3)
								End case 
							End for 
							
						End if 
				End case 
				
		End case 
		
	End if 
End if 
ERR_MethodTrackerReturn("LB_SetFilter"; $_t_oldMethodName)