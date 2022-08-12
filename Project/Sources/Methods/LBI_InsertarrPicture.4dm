//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_InsertarrPicture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/06/2010 14:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Exit)
	C_LONGINT:C283($_l_AreaType; $_l_ArrayNumber; $_l_InsertAt; $_l_ListboxLevel; $_l_offset; $3)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_ptr_ArrayOfColumnFormulas; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags)
	C_POINTER:C301($_ptr_ArrayofColumnWIdths; $_ptr_ColumnVarToAdd; $_ptr_EnterabilityArray; $_ptr_ListboxSetup; $1; $2)
	C_REAL:C285($0; $4)
	C_TEXT:C284($_t_FirstArrayName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_InsertarrPicture")
//None of the old Area list stuff had support for a picture array.
//For the new Diary workflow I want to include a picture for threaded items
//this special method adds an array to the setup regardless of the Definitions!
If (Count parameters:C259>=3)
	//note that this column cannot be used for sorting i think
	If (Not:C34(Is nil pointer:C315($1)))
		$_ptr_ListboxSetup:=$1
		If (Size of array:C274($_ptr_ListboxSetup->)>0)
			$_ptr_ArrayOfArrayNames:=$_ptr_ListboxSetup->{4}
			If (Size of array:C274($_ptr_ListboxSetup->)>=19)
				$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
				$_l_AreaType:=$_ptr_areaTypeVariable->
			Else 
				$_l_AreaType:=1
			End if 
			If ($_l_AreaType<3)
				If (Not:C34(Is nil pointer:C315($_ptr_ArrayOfArrayNames)))
					If (Size of array:C274($_ptr_ArrayOfArrayNames->)>0)
						//all just to protect against errrrors
						$_t_FirstArrayName:=$_ptr_ArrayOfArrayNames->{1}
						$_l_ListboxLevel:=Num:C11(Substring:C12($_t_FirstArrayName; 1; 5))
						
						LBI_ArrayDefPic($_l_ListboxLevel)
						$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
						$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
						If ($3>0)
							$_l_InsertAt:=$3
						Else 
							$_l_InsertAt:=Size of array:C274($_ptr_ArrayFieldPointers->)+1
						End if 
						$0:=$_l_InsertAt
						INSERT IN ARRAY:C227($_ptr_ArrayFieldPointers->; $_l_InsertAt; 1)
						$_ptr_ArrayFieldPointers->{$_l_InsertAt}:=->[PICTURES:85]Picture:3
						INSERT IN ARRAY:C227($_ptr_ArrayofArrayPointers->; $_l_InsertAt; 1)
						INSERT IN ARRAY:C227($_ptr_ArrayOfArrayNames->; $_l_InsertAt; 1)
						$_bo_Exit:=False:C215
						$_l_ArrayNumber:=1
						Repeat 
							If ($_l_ListboxLevel<10)
								$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_aPic_0"+String:C10($_l_ListboxLevel)+"_"+String:C10($_l_ArrayNumber))
							Else 
								$_l_offset:=Find in array:C230($_ptr_ArrayOfArrayNames->; "LB_aPic_"+String:C10($_l_ListboxLevel)+"_"+String:C10($_l_ArrayNumber))
							End if 
							If ($_l_offset<0)
								$_bo_Exit:=True:C214
							Else 
								$_l_ArrayNumber:=$_l_ArrayNumber+1
							End if 
						Until ($_bo_Exit)
						If ($_l_ListboxLevel<10)
							$_ptr_ColumnVarToAdd:=Get pointer:C304("LB_aPic_0"+String:C10($_l_ListboxLevel)+"_"+String:C10($_l_ArrayNumber))
						Else 
							$_ptr_ColumnVarToAdd:=Get pointer:C304("LB_aPic_"+String:C10($_l_ListboxLevel)+"_"+String:C10($_l_ArrayNumber))
						End if 
						$_ptr_ArrayofArrayPointers->{$_l_InsertAt}:=$_ptr_ColumnVarToAdd
						If ($_l_ListboxLevel<10)
							$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_aPic_0"+String:C10($_l_ListboxLevel)+"_"+String:C10($_l_ArrayNumber)
						Else 
							$_ptr_ArrayOfArrayNames->{$_l_InsertAt}:="LB_aPic_"+String:C10($_l_ListboxLevel)+"_"+String:C10($_l_ArrayNumber)
						End if 
						$_ptr_ArrayOfColumFormats:=$_ptr_ListboxSetup->{5}
						INSERT IN ARRAY:C227($_ptr_ArrayOfColumFormats->; $_l_InsertAt; 1)
						$_ptr_ArrayOfColumFormats->{$_l_InsertAt}:="3"
						$_ptr_ArrayOfColumnFormulas:=$_ptr_ListboxSetup->{6}
						INSERT IN ARRAY:C227($_ptr_ArrayOfColumnFormulas->; $_l_InsertAt; 1)
						$_ptr_ArrayOfColumnFormulas->{$_l_InsertAt}:="LBI_SetPicture"
						$_ptr_ArrayofColumnLabels:=$_ptr_ListboxSetup->{12}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLabels->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnLabels->{$_l_InsertAt}:=""
						$_ptr_ArrayofColumnWIdths:=$_ptr_ListboxSetup->{13}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnWIdths->; $_l_InsertAt; 1)
						If (Count parameters:C259>=4)
							$_ptr_ArrayofColumnWIdths->{$_l_InsertAt}:=$4
						Else 
							
							$_ptr_ArrayofColumnWIdths->{$_l_InsertAt}:=150
						End if 
						$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
						INSERT IN ARRAY:C227($_ptr_EnterabilityArray->; $_l_InsertAt; 1)
						$_ptr_EnterabilityArray->{$_l_InsertAt}:=False:C215
						$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLockFlags->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnLockFlags->{$_l_InsertAt}:=False:C215
						$_ptr_ArrayofColumnLockFlags:=$_ptr_ListboxSetup->{15}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnLockFlags->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnLockFlags->{$_l_InsertAt}:=False:C215
						$_ptr_ArrayofColumnFonts:=$_ptr_ListboxSetup->{16}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFonts->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnFonts->{$_l_InsertAt}:=9
						$_ptr_ArrayofColumnColors:=$_ptr_ListboxSetup->{17}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnColors->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnColors->{$_l_InsertAt}:="Black"
						$_ptr_ArrayofColumnFooters:=$_ptr_ListboxSetup->{18}
						INSERT IN ARRAY:C227($_ptr_ArrayofColumnFooters->; $_l_InsertAt; 1)
						$_ptr_ArrayofColumnFooters->{$_l_InsertAt}:=1
						
					End if 
					
				End if 
			Else 
				//TRACE
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBI_InsertarrPicture"; $_t_oldMethodName)