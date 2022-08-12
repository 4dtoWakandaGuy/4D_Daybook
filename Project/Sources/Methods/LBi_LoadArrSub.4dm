//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_LoadArrSub
	//------------------ Method Notes ------------------
	//This method is not used because it uses subtables-we had loads-i have left it in the databse for reference as the mechanism may work in a way for Object data
	//----------/-------- Revision Control ----------------
	//Date Created: 23/10/2013 12:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_FieldNumber; 0)
	ARRAY LONGINT:C221($_al_FieldOrder; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedTable; 0)
	ARRAY TEXT:C222($_at_ArrayName; 0)
	C_BOOLEAN:C305($_bo_isFIeld)
	C_LONGINT:C283($_l_Index; $_l_NumberofColumns; $_l_NumberofRows; $_l_ScriptPosition)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_ListBoxSetup; $_Ptr_SubTable; $_Ptr_ThisColumnArray; $1; vPtr)
	C_REAL:C285(VTextNUM)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_oldMethodName; $_t_oldMethodName2; $_t_ThisColumnFormula; Vtext; VText_2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_LoadArrSub")

//This method is a direct replacement for ALLoadArrSub
//ALLoadArrSub - for subfiles
$_ptr_ListBoxSetup:=$1
$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
$_Ptr_ArrayofColumnFormulas:=$_ptr_ListBoxSetup->{6}
$_Ptr_SubTable:=$_ptr_ListBoxSetup->{8}
$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}

$_l_NumberofColumns:=Size of array:C274($_ptr_ArrayFieldPointers->)
//or ALMinOf (Size of array($_ptr_ArrayFieldPointers»);Size of array($_ptr_ArrayofArrayPointers»))
//but they'd never get out of synch

If ($_l_NumberofColumns>0)
	ARRAY POINTER:C280($_ptr_ArrayFieldPointers->; $_l_NumberofColumns)
	ARRAY POINTER:C280($_ptr_ArrayofArrayPointers->; $_l_NumberofColumns)
	//Delete the elements to reset them back to zero - it is not done automatically
	$_l_NumberofRows:=Size of array:C274(($_ptr_ArrayofArrayPointers->{1})->)
	If ($_l_NumberofRows>0)
		For ($_l_Index; 1; $_l_NumberofColumns)
			$_l_NumberofRows:=Size of array:C274(($_ptr_ArrayofArrayPointers->{$_l_Index})->)
			If ($_l_NumberofRows>0)
				DELETE FROM ARRAY:C228(($_ptr_ArrayofArrayPointers->{$_l_Index})->; 1; $_l_NumberofRows)
			End if 
		End for 
	End if 
	
	$_l_NumberofRows:=1
	//_O_ALL SUBRECORDS($_Ptr_SubTable->)
	ARRAY LONGINT:C221($_al_FieldNumber; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	ARRAY LONGINT:C221($_al_RelatedField; 0)
	
	While (Not:C34(_O_End subselection:C37($_Ptr_SubTable->)))
		//IDLE  ` 03/04/03 pb
		For ($_l_Index; 1; $_l_NumberofColumns-1)
			If ($_Ptr_ArrayofColumnFormulas->{$_l_Index}="Relate one@")
				$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+$_Ptr_ArrayofColumnFormulas->{$_l_Index})
				EXECUTE FORMULA:C63($_Ptr_ArrayofColumnFormulas->{$_l_Index})
				INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofRows; 1)
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
				$_Ptr_ThisColumnArray->{$_l_NumberofRows}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
				
			Else 
				$_t_ThisColumnFormula:=$_Ptr_ArrayofColumnFormulas->{$_l_Index}
				If ($_t_ThisColumnFormula#"")
					
					$_bo_isFIeld:=Not:C34($_t_ThisColumnFormula[[1]]="•")
					If ($_bo_isFIeld)
						$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+"vPtr:=->"+$_ptr_ArrayReferences->{8}+"'"+$_Ptr_ArrayofColumnFormulas->{$_l_Index})
						EXECUTE FORMULA:C63("vPtr:=->"+$_ptr_ArrayReferences->{8}+"'"+$_Ptr_ArrayofColumnFormulas->{$_l_Index})  //ptr to the subfield
						$_ptr_ArrayFieldPointers->{$_l_Index}:=vPtr
						INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofRows; 1)
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
						$_Ptr_ThisColumnArray->{$_l_NumberofRows}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
						
					Else 
						//``
						If (Size of array:C274($_al_RelatedTable)=0)
							
							$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}+$_ptr_ArrayReferences->{7}
							
							QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_t_CurrentDefinitionsName)  //Search first by Ref+User
							
							If (Records in selection:C76([LIST_LAYOUTS:96])=0) | ([LIST_LAYOUTS:96]Layout_Reference:1#($_ptr_ArrayReferences->{6}+"@"))
								QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_ptr_ArrayReferences->{6})
							End if 
							//SELECTION TO ARRAY([LIST LAYOUTS]Order;$_al_FieldOrder;[LIST LAYOUTS]xRelateddField;$_al_RelatedField;[LIST LAYOUTS]xRelatedTable;$_al_RelatedTable)  `used for sub tables only
							SELECTION TO ARRAY:C260([LIST_LAYOUTS:96]Order:7; $_al_FieldOrder; [LIST_LAYOUTS:96]X_Related_Field:16; $_al_RelatedField; [LIST_LAYOUTS:96]X_Related_Table:15; $_al_RelatedTable; [LIST_LAYOUTS:96]X_associatedArrayName:17; $_at_ArrayName)  //used for sub tables only
							
							SORT ARRAY:C229($_al_FieldOrder; $_al_RelatedField; $_al_RelatedTable; >)
						End if 
						
						If (Size of array:C274($_al_RelatedField)<$_l_Index)
							ARRAY LONGINT:C221($_al_FieldNumber; $_l_Index)
							ARRAY LONGINT:C221($_al_RelatedField; $_l_Index)
							ARRAY LONGINT:C221($_al_RelatedField; $_l_Index)
							
						End if 
						//``
						If ($_al_RelatedTable{$_l_Index}>0) & ($_al_RelatedField{$_l_Index}>0)
							$_t_ThisColumnFormula:=Substring:C12($_t_ThisColumnFormula; 2; Length:C16($_t_ThisColumnFormula))
							EXECUTE FORMULA:C63($_t_ThisColumnFormula)
							$_ptr_ArrayFieldPointers->{$_l_Index}:=Field:C253($_al_RelatedTable{$_l_Index}; $_al_RelatedField{$_l_Index})
							INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofRows; 1)
							$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
							$_Ptr_ThisColumnArray->{$_l_NumberofRows}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
							
						Else 
							$_t_ThisColumnFormula:=Substring:C12($_t_ThisColumnFormula; 2; Length:C16($_t_ThisColumnFormula))
							$_l_ScriptPosition:=Position:C15("Macro_ResultTxt"; $_t_ThisColumnFormula)
							If ($_l_ScriptPosition>0)
								EXECUTE FORMULA:C63("VText:="+$_t_ThisColumnFormula)
								Vptr:=->Vtext
								$_ptr_ArrayFieldPointers->{$_l_Index}:=Vptr
								INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofRows; 1)
								$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
								$_Ptr_ThisColumnArray->{$_l_NumberofRows}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
								
							Else 
								EXECUTE FORMULA:C63("VTextNUM:="+$_t_ThisColumnFormula)
								VText_2:=String:C10(VTextNUM)
								Vptr:=->Vtext_2
								$_ptr_ArrayFieldPointers->{$_l_Index}:=Vptr
								INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofRows; 1)
								$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
								$_Ptr_ThisColumnArray->{$_l_NumberofRows}:=($_ptr_ArrayFieldPointers->{$_l_Index})->  //fill in the subfield data
								
							End if 
							
						End if 
						
					End if 
				Else 
					INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_Index})->; $_l_NumberofRows; 1)
					
				End if 
			End if 
			
		End for 
		INSERT IN ARRAY:C227(($_ptr_ArrayofArrayPointers->{$_l_NumberofColumns})->; $_l_NumberofRows; 1)
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_NumberofColumns}
		$_Ptr_ThisColumnArray->{$_l_NumberofRows}:=$_l_NumberofRows  //Add on the Key No - ie the subrecord no
		$_l_NumberofRows:=$_l_NumberofRows+1
		///_O_NEXT SUBRECORD($_Ptr_SubTable->)//
	End while 
	
End if 
ERR_MethodTrackerReturn("LBi_LoadArrSub"; $_t_oldMethodName)