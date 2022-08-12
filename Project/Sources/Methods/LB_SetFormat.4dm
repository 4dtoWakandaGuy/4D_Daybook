//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_SetFormat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/01/2010 13:14
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
	C_LONGINT:C283($_l_ColumnCount; $_l_ColumnIndex; $2; $4; $5; $6)
	C_POINTER:C301($1; $7)
	C_TEXT:C284($_t_oldMethodName; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetFormat")
// this is similar to AL_Setformat

// example: LB_SetFormat (->INV_lb_ALLOCATIONS;2;"";3;0;2)


//Align default Longint 1
//Align left Longint 2
//Center Longint 3
//Align right Longint 4

If (Count parameters:C259>=3)
	ARRAY TEXT:C222($_at_ColumnNames; 0)
	ARRAY TEXT:C222($_at_HeaderNames; 0)
	ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
	ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
	ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
	ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
	LISTBOX GET ARRAYS:C832($1->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
	//ARRAY POINTER($arrFooterVars;0)
	//LISTBOX GET ARRAYS($1->;$_at_ColumnNames;$_at_HeaderNames;$_aptr_ColumnVariables;$_aptr_HeaderVariables;$_abo_ColumnsVisible;$_aptr_ColumnStyles;$ArrFooterNames;$arrFooterVars)
	
	Case of 
		: (Count parameters:C259=3)  // all columns
			$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
			//If (Num($3)=0)
			For ($_l_ColumnIndex; 1; $_l_ColumnCount)
				Case of 
					: ($2=1)
						OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
						
						
					: ($2=2)
						OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
				End case 
			End for 
			//Else
			
			//End if
		: (Count parameters:C259=4)  // one column
			
			If ($4>0)
				
				
				Case of 
					: ($2=1)
						If (Size of array:C274($_at_HeaderNames)>=$4)
							OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$4}; $3)
						End if 
					: ($2=2)
						If (Size of array:C274($_at_HeaderNames)>=$4)
							OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$4}; $3)
						End if 
				End case 
				
			Else 
				//all columns
				$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
				For ($_l_ColumnIndex; 1; $_l_ColumnCount)
					Case of 
						: ($2=1)
							OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; ($3))
						: ($2=2)
							OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; ($3))
							
					End case 
				End for 
				
			End if 
			
		: (Count parameters:C259=5)  // column $3 to column $4
			Case of 
				: ($4>0)
					If ($5>0)
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						If ($_l_ColumnCount>$5)
							$_l_ColumnCount:=$5
						End if 
						For ($_l_ColumnIndex; $4; $_l_ColumnCount)
							Case of 
								: ($2=1)
									OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
								: ($2=2)
									OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
							End case 
						End for 
						
					Else 
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						
						For ($_l_ColumnIndex; $4; $_l_ColumnCount)
							Case of 
								: ($2=1)
									OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
								: ($2=2)
									OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
							End case 
						End for 
						
					End if 
				Else 
					If ($5>0)
						// to column
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						If ($_l_ColumnCount>$5)
							$_l_ColumnCount:=$5
						End if 
						For ($_l_ColumnIndex; 1; $_l_ColumnCount)
							Case of 
								: ($2=1)
									OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
								: ($2=2)
									OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
							End case 
						End for 
						
					Else 
						//all columns
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						
						For ($_l_ColumnIndex; 1; $_l_ColumnCount)
							Case of 
								: ($2=1)
									OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
								: ($2=2)
									OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
							End case 
						End for 
						
					End if 
			End case 
			
			
		: (Count parameters:C259=6)  // `set justification as well($3 may be empty)
			Case of 
				: ($4>0)
					If ($5>0)
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						If ($_l_ColumnCount>$5)
							$_l_ColumnCount:=$5
						End if 
						For ($_l_ColumnIndex; $4; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_HeaderNames{$_l_ColumnIndex}; $6)
									End if 
								: ($2=2)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
									
							End case 
						End for 
						
					Else 
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						
						For ($_l_ColumnIndex; $4; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_HeaderNames{$_l_ColumnIndex}; $6)
									End if 
								: ($2=2)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
							End case 
						End for 
						
					End if 
				Else 
					If ($5>0)
						// to column
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						If ($_l_ColumnCount>$5)
							$_l_ColumnCount:=$5
						End if 
						For ($_l_ColumnIndex; 1; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_HeaderNames{$_l_ColumnIndex}; $6)
									End if 
								: ($2=2)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
							End case 
						End for 
						
					Else 
						//all columns
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						
						For ($_l_ColumnIndex; 1; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $3)
									End if 
								: ($2=2)
									If ($3#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $3)
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
									
							End case 
						End for 
						
					End if 
			End case 
			
		: (Count parameters:C259=7)  // styles are in $7
			
			Case of 
				: ($4>0)
					If ($5>0)
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						If ($_l_ColumnCount>$5)
							$_l_ColumnCount:=$5
						End if 
						For ($_l_ColumnIndex; $4; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_HeaderNames{$_l_ColumnIndex}; $6)
									End if 
								: ($2=2)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
									
							End case 
						End for 
						
					Else 
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						
						For ($_l_ColumnIndex; $4; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_HeaderNames{$_l_ColumnIndex}; $6)
									End if 
								: ($2=2)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
							End case 
						End for 
						
					End if 
				Else 
					If ($5>0)
						// to column
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						If ($_l_ColumnCount>$5)
							$_l_ColumnCount:=$5
						End if 
						For ($_l_ColumnIndex; 1; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_HeaderNames{$_l_ColumnIndex}; $6)
									End if 
								: ($2=2)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
							End case 
						End for 
						
					Else 
						//all columns
						$_l_ColumnCount:=LISTBOX Get number of columns:C831($1->)
						
						For ($_l_ColumnIndex; 1; $_l_ColumnCount)
							Case of 
								: ($2=1)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_HeaderNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
								: ($2=2)
									If ($7->{$_l_ColumnIndex}#"")
										OBJECT SET FORMAT:C236(*; $_at_ColumnNames{$_l_ColumnIndex}; $7->{$_l_ColumnIndex})
									End if 
									If ($6>0)
										OBJECT SET HORIZONTAL ALIGNMENT:C706(*; $_at_ColumnNames{$_l_ColumnIndex}; $6)
									End if 
									
							End case 
						End for 
						
					End if 
			End case 
			
	End case 
End if 
ERR_MethodTrackerReturn("LB_SetFormat"; $_t_oldMethodName)