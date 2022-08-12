//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_LoadArrBlob
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ColumnOrder; 0)
	ARRAY LONGINT:C221($_al_FieldDataTypes; 0)
	ARRAY LONGINT:C221($_al_FIeldValuesLong; 0; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedTable; 0)
	ARRAY LONGINT:C221($_al_TableNumber; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_FIeldValuesText; 0; 0)
	C_BOOLEAN:C305($_bo_isFIeld)
	C_LONGINT:C283($_l_FieldRow; $_l_Index; $_l_NumberofArrayColumns; $_l_NumberofColumns; $_l_offset; $_l_ResultPosition; $_l_RowsIndex; $_l_SizeofArray)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_Ptr_FieldPointer; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $1; $pSubfile; Vptr)
	C_TEXT:C284($_t_FieldName; $_t_Formula; $_t_LayoutReference2; $_t_oldMethodName; $_t_oldMethodName2; Vtext)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBI_LoadArrBlob")

//This method is a direct replacement for ALLoadArrSub ...and this one loads from a BLOB field instead of a subtable.
//this is only going to be used where a one field table exists(although i am include the ability for this to handle more complex blobs, by storing the field types and field names in the blob)
//
//NG November 2010 this is probably not needed in this format.

//ALLoadArrSub - for subfiles
//TRACE
If (Count parameters:C259>=1)
	$_ptr_ListboxSetup:=$1
	$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
	$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
	$_Ptr_ArrayofColumnFormulas:=$_ptr_ListboxSetup->{6}
	$_Ptr_FieldPointer:=$_ptr_ListboxSetup->{8}
	$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
	
	$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFieldPointers->)
	//or ALMinOf (Size of array($_ptr_ArrayFieldPointers»);Size of array($_ptr_ArrayofArrayPointers»))
	//but they'd never get out of synch
	
	If ($_l_NumberofColumns>0)
		ARRAY POINTER:C280($_ptr_ArrayFieldPointers->; $_l_NumberofColumns)
		ARRAY POINTER:C280($_ptr_ArrayofArrayPointers->; $_l_NumberofColumns)
		//Delete the elements to reset them back to zero - it is not done automatically
		$_l_NumberofArrayColumns:=Size of array:C274(($_ptr_ArrayofArrayPointers->{1})->)
		If ($_l_NumberofArrayColumns>0)
			For ($_l_Index; 1; $_l_NumberofColumns)
				$_l_NumberofArrayColumns:=Size of array:C274(($_ptr_ArrayofArrayPointers->{$_l_Index})->)
				If ($_l_NumberofArrayColumns>0)
					DELETE FROM ARRAY:C228(($_ptr_ArrayofArrayPointers->{$_l_Index})->; 1; $_l_NumberofArrayColumns)
				End if 
			End for 
		End if 
		
		$_l_NumberofArrayColumns:=1
		//Note: At this moment this is only setup for SIMPLE blobs. Where the subtable being replaced contains multiple fields
		//it is going to be more effecicient to create a seperate table
		ARRAY LONGINT:C221($_al_FieldDataTypes; 0)
		ARRAY TEXT:C222($_at_FieldNames; 0)
		ARRAY LONGINT:C221($_al_FIeldValuesLong; 0; 0)
		ARRAY TEXT:C222($_at_FIeldValuesText; 0; 0)
		$_l_offset:=0
		BLOB TO VARIABLE:C533($_Ptr_FieldPointer->; $_al_FieldDataTypes; $_l_offset)
		BLOB TO VARIABLE:C533($_Ptr_FieldPointer->; $_at_FieldNames; $_l_offset)
		ARRAY LONGINT:C221($_al_FIeldValuesLong; Size of array:C274($_at_FieldNames); 0)
		ARRAY TEXT:C222($_at_FIeldValuesText; Size of array:C274($_at_FieldNames); 0)
		
		//NOTE THAT THIis only set up for the one field at the moment but if there are more than one field types used the order is important
		For ($_l_Index; 1; Size of array:C274($_at_FieldNames))
			Case of 
				: ($_al_FieldDataTypes{$_l_Index}=Is longint:K8:6)
					BLOB TO VARIABLE:C533($_Ptr_FieldPointer->; $_al_FIeldValuesLong{$_l_Index}; $_l_offset)
				: ($_al_FieldDataTypes{$_l_Index}=Is text:K8:3)
					BLOB TO VARIABLE:C533($_Ptr_FieldPointer->; $_at_FIeldValuesText{$_l_Index}; $_l_offset)
			End case 
			//The List box area may however contain more thann one column as it may contain a looked up value(for example [Companies]Furthers. On screen displays the further code+ the further analyis name
		End for 
		//ALL SUBRECORDS($pSubfile->)
		ARRAY LONGINT:C221($_al_TableNumber; 0)
		ARRAY LONGINT:C221($_al_RelatedField; 0)
		ARRAY LONGINT:C221($_al_RelatedTable; 0)
		$_l_SizeofArray:=0
		For ($_l_Index; 1; Size of array:C274($_at_FIeldValuesText))
			If ($_l_SizeofArray<Size of array:C274($_at_FIeldValuesText{$_l_Index}))
				$_l_SizeofArray:=Size of array:C274($_at_FIeldValuesText{$_l_Index})
			End if 
		End for 
		
		For ($_l_Index; 1; Size of array:C274($_al_FIeldValuesLong))
			If ($_l_SizeofArray<Size of array:C274($_al_FIeldValuesLong{$_l_Index}))
				$_l_SizeofArray:=Size of array:C274($_al_FIeldValuesLong{$_l_Index})
			End if 
		End for 
		
		For ($_l_RowsIndex; 1; $_l_SizeofArray)
			//While (Not(End subselection($pSubfile->)))
			// 03/04/03 pb
			For ($_l_Index; 1; $_l_NumberofColumns-1)  // the fields
				If ($_Ptr_ArrayofColumnFormulas->{$_l_Index}="Relate one@")
					$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+$_Ptr_ArrayofColumnFormulas->{$_l_Index})
					EXECUTE FORMULA:C63($_Ptr_ArrayofColumnFormulas->{$_l_Index})
					INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
					$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
					
				Else 
					$_t_Formula:=$_Ptr_ArrayofColumnFormulas->{$_l_Index}
					If ($_t_Formula#"")
						$_bo_isFIeld:=Not:C34($_t_Formula[[1]]="•")
						If ($_bo_isFIeld)
							$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vPtr:=->"+$_ptr_ArrayReferences->{8}+"'"+$_Ptr_ArrayofColumnFormulas->{$_l_Index})
							//$_Ptr_ArrayofColumnFormulas->{$_l_Index} is the 'field' name
							$_t_FieldName:=$_Ptr_ArrayofColumnFormulas->{$_l_Index}
							$_l_FieldRow:=Find in array:C230($_at_FieldNames; $_t_FieldName)
							If ($_l_FieldRow>0)  // it should be!!!
								Case of 
									: ($_al_FieldDataTypes{$_l_FieldRow}=Is longint:K8:6)
										INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
										$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
										$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=$_al_FIeldValuesLong{$_l_FieldRow}{$_l_Index}
									: ($_al_FieldDataTypes{$_l_FieldRow}=Is text:K8:3)
										INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
										$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
										$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=$_at_FIeldValuesText{$_l_FieldRow}{$_l_Index}
								End case 
							End if 
							
						Else 
							//``
							If (Size of array:C274($_al_RelatedTable)=0)
								
								$_t_LayoutReference2:=$_ptr_ArrayReferences->{6}+$_ptr_ArrayReferences->{7}
								
								QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_LayoutReference2)  //Search first by Ref+User
								
								If (Records in selection:C76([LIST_LAYOUTS:96])=0) | ([LIST_LAYOUTS:96]Layout_Reference:1#($_ptr_ArrayReferences->{6}+"@"))
									QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_ptr_ArrayReferences->{6})
								End if 
								SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Order:7; $_al_ColumnOrder; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Table:15; $_al_RelatedTable)  //used for sub tables only
								
								SORT ARRAY:C229($_al_ColumnOrder; $_al_RelatedField; $_al_RelatedTable; >)
							End if 
							
							If (Size of array:C274($_al_RelatedField)<$_l_Index)
								ARRAY LONGINT:C221($_al_TableNumber; $_l_Index)
								ARRAY LONGINT:C221($_al_RelatedField; $_l_Index)
								ARRAY LONGINT:C221($_al_RelatedTable; $_l_Index)
								
								
							End if 
							//``
							If ($_al_RelatedTable{$_l_Index}>0) & ($_al_RelatedField{$_l_Index}>0)
								$_t_Formula:=Substring:C12($_t_Formula; 2; Length:C16($_t_Formula))
								EXECUTE FORMULA:C63($_t_Formula)
								$_ptr_ArrayFieldPointers->{$_l_Index}:=Field:C253($_al_RelatedTable{$_l_Index}; $_al_RelatedField{$_l_Index})
								INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
								$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
								$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
								
							Else 
								$_t_Formula:=Substring:C12($_t_Formula; 2; Length:C16($_t_Formula))
								$_l_ResultPosition:=Position:C15("Macro_ResultTxt"; $_t_Formula)
								If ($_l_ResultPosition>0)
									EXECUTE FORMULA:C63("VText:="+$_t_Formula)
									Vptr:=->Vtext
									$_ptr_ArrayFieldPointers->{$_l_Index}:=Vptr
									INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
									$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
									$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
									
								Else 
									$_t_FieldName:=$_Ptr_ArrayofColumnFormulas->{$_l_Index}
									$_l_FieldRow:=Find in array:C230($_at_FieldNames; $_t_FieldName)
									
									If ($_l_FieldRow>0)  // it should be!!!
										Case of 
											: ($_al_FieldDataTypes{$_l_FieldRow}=Is longint:K8:6)
												INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
												$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
												$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=$_al_FIeldValuesLong{$_l_FieldRow}{$_l_Index}
											: ($_al_FieldDataTypes{$_l_FieldRow}=Is text:K8:3)
												INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
												$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
												$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=$_at_FIeldValuesText{$_l_FieldRow}{$_l_Index}
										End case 
									End if 
									
									
								End if 
								
							End if 
							
						End if 
					Else 
						INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofArrayColumns; 1)
						
					End if 
				End if 
				
			End for 
			INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_NumberofColumns})->; $_l_NumberofArrayColumns; 1)
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_NumberofColumns}
			$_Ptr_ThisColumnArray->{$_l_NumberofArrayColumns}:=$_l_NumberofArrayColumns  //Add on the Key No - ie the subrecord no
			$_l_NumberofArrayColumns:=$_l_NumberofArrayColumns+1
			//NEXT SUBRECORD($pSubfile->)
			//End while
		End for 
	End if 
	
End if 
ERR_MethodTrackerReturn("LBI_LoadArrBlob"; $_t_oldMethodName)