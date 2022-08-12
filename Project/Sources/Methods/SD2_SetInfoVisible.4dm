//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetInfoVisible
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
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
	C_LONGINT:C283($_l_Column; $_l_ColumnsVisible; $_l_ColumnWIdth; $_l_Difference; $_l_Index; $_l_ObjectWidth; $_l_Reduce; $_l_TotalWidth; $_l_Widest; $_l_WidestWidth; $_l_WindowBottom)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_WindowTop)
	C_POINTER:C301($_ptr_ArrayArrayNames; $_ptr_ArrayFieldPointers; $_ptr_ArrayofColumnWIdths; $_Ptr_ListBoxArea; $_Ptr_ThisColumn; $1; $2)
	C_TEXT:C284($_t_DescriptionArray; $_t_InfoArray; $_t_ObjectPrefix; $_t_oldMethodName; $_t_ThreadIDArrayName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetInfoVisible")
If (True:C214)
	If (Count parameters:C259>=2)
		$_Ptr_ListBoxArea:=$2
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		
		$_l_ObjectWidth:=(($_l_WindowRight-25)-$_l_WindowLeft)
		OBJECT GET COORDINATES:C663($_Ptr_ListBoxArea->; $_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		
		//This method will use the current loaded records and set the threads
		
		If (Not:C34(Is nil pointer:C315($1)))
			If (Size of array:C274($1->)>0)
				$_ptr_ArrayArrayNames:=$1->{4}
				If (Not:C34(Is nil pointer:C315($_ptr_ArrayArrayNames)))
					If (Size of array:C274($_ptr_ArrayArrayNames->)>0)
						$_ptr_ArrayFieldPointers:=$1->{2}
						$_ptr_ArrayofColumnWIdths:=$1->{13}
						$_t_DescriptionArray:=""
						$_t_ThreadIDArrayName:=""
						$_t_InfoArray:=$_ptr_ArrayArrayNames->{Size of array:C274($_ptr_ArrayArrayNames->)-3}
						//ALWAYS THE LAST COLUMN
						$_t_DescriptionArray:=$_ptr_ArrayArrayNames->{Size of array:C274($_ptr_ArrayArrayNames->)-4}  //actually i don't care what is displayed in that field..just that it needs to be on screen
						$_l_Widest:=0
						$_l_WidestWidth:=0
						$_l_ColumnsVisible:=0
						$_l_TotalWidth:=0
						ARRAY TEXT:C222($_at_ColumnNames; 0)
						ARRAY TEXT:C222($_at_HeaderNames; 0)
						ARRAY POINTER:C280($_aptr_ColumnVariables; 0)
						ARRAY POINTER:C280($_aptr_HeaderVariables; 0)
						ARRAY BOOLEAN:C223($_abo_ColumnsVisible; 0)
						ARRAY POINTER:C280($_aptr_ColumnStyles; 0)
						LISTBOX GET ARRAYS:C832($_Ptr_ListBoxArea->; $_at_ColumnNames; $_at_HeaderNames; $_aptr_ColumnVariables; $_aptr_HeaderVariables; $_abo_ColumnsVisible; $_aptr_ColumnStyles)
						
						For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
							$_Ptr_ThisColumn:=$_aptr_ColumnVariables{$_l_Index}
							$_l_ColumnWIdth:=LISTBOX Get column width:C834($_Ptr_ThisColumn->)
							If ($_l_ColumnWIdth>$_l_WidestWidth)
								$_l_Widest:=$_l_Index
								$_l_WidestWidth:=$_l_ColumnWIdth
							End if 
							If ($_l_ColumnWIdth>0)
								$_l_ColumnsVisible:=$_l_ColumnsVisible+1
							End if 
							$_l_TotalWidth:=$_l_TotalWidth+$_l_ColumnWIdth
						End for 
						If ($_l_TotalWidth>$_l_ObjectWidth)
							//need to narrow up something to make the right hand column visible
							$_l_Difference:=(($_l_TotalWidth)-($_l_ObjectWidth-10))
							If ($_l_Difference<($_l_WidestWidth/2))
								//just reduce the widest column
								$_t_ObjectPrefix:="OBJ"
								$_ptr_ArrayofColumnWIdths->{$_l_Widest}:=($_ptr_ArrayofColumnWIdths->{$_l_Widest})-$_l_Difference
								LB_SetColumnWidths($_Ptr_ListBoxArea; $_t_ObjectPrefix; $_l_Widest; $_ptr_ArrayofColumnWIdths->{$_l_Widest})
							Else 
								//adjust all the columns by an amount
								$_l_Reduce:=Int:C8($_l_Difference/$_l_ColumnsVisible)
								//reset the column widths
								//then reset the widest by the difference now neededs
								$_t_ObjectPrefix:="OBJ"
								$_l_TotalWidth:=0
								For ($_l_Index; 1; Size of array:C274($_at_ColumnNames))
									If ($_l_Index#(Size of array:C274($_at_ColumnNames)-3))
										If ($_ptr_ArrayofColumnWIdths->{$_l_Index}>0)
											$_ptr_ArrayofColumnWIdths->{$_l_Index}:=($_ptr_ArrayofColumnWIdths->{$_l_Index}-$_l_Reduce)
											$_l_TotalWidth:=$_l_TotalWidth+($_ptr_ArrayofColumnWIdths->{$_l_Index})
											LB_SetColumnWidths($_Ptr_ListBoxArea; $_t_ObjectPrefix; $_l_Index; $_ptr_ArrayofColumnWIdths->{$_l_Index})
										End if 
									End if 
									
								End for 
								//now set the widest
								$_l_Difference:=($_l_TotalWidth-($_l_ObjectWidth-10))
								$_ptr_ArrayofColumnWIdths->{$_l_Widest}:=($_ptr_ArrayofColumnWIdths->{$_l_Widest})-$_l_Difference
								
								LB_SetColumnWidths($_Ptr_ListBoxArea; $_t_ObjectPrefix; $_l_Widest; $_ptr_ArrayofColumnWIdths->{$_l_Widest})
								
							End if 
							
						End if 
						
						
						
					End if 
				End if 
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("SD2_SetInfoVisible"; $_t_oldMethodName)
