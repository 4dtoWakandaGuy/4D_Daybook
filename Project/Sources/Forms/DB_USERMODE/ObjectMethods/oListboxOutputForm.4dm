If (False:C215)
	//object Name: Object Name:      DB_USERMODE.oListboxOutputForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/11/2014 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	C_BOOLEAN:C305($_bo_CommandDown; $_bo_LBNoEdit; $_bo_ShiftDown; LBI_bo_NoEdit)
	C_LONGINT:C283($_l_AreaType; $_l_ColumnNumber; $_l_event; $_l_Row; $_l_TableSetupRow; DB_l_CurrentDisplayedForm)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListBoxSetup; $_ptr_Table; $_Ptr_ThisColumn)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_USERMODE/oListboxOutputForm"; Form event code:C388)

ERR_MethodTrackerReturn("OBJ DB_USERMODE.oListboxOutputForm"; $_t_oldMethodName)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
	: ($_l_event=On Clicked:K2:4)
		
		LISTBOX GET CELL POSITION:C971(*; "oListboxOutputForm"; $_l_ColumnNumber; $_l_Row; $_l_ColumnNumber)
		$_l_TableSetupRow:=Find in array:C230(DB_al_ContextTableNumber; DB_l_CurrentDisplayedForm)
		$_ptr_Table:=Table:C252(DB_l_CurrentDisplayedForm)
		
		If ($_l_TableSetupRow>0)  //it shoud be!
			//TRACE
			$_ptr_ListBoxSetup:=DB_aptr_ContextPointers{$_l_TableSetupRow}
			$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
			
			$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
			$_ptr_LBTable:=$_ptr_ListBoxSetup->{10}
			$_ptr_EnterabilityArray:=$_ptr_ListBoxSetup->{14}
			
			$_bo_LBNoEdit:=False:C215  //TRACE
			If (Size of array:C274($_ptr_ListBoxSetup->)>=19)
				$_ptr_areaTypeVariable:=$_ptr_ListBoxSetup->{19}
				$_l_AreaType:=$_ptr_areaTypeVariable->
			Else 
				$_l_AreaType:=1
			End if 
			
			If ($_l_ColumnNumber>0)
				
				If (LBI_bo_NoEdit) | $_bo_LBNoEdit | (Not:C34(($_ptr_EnterabilityArray->{$_l_ColumnNumber})))
					$_bo_CommandDown:=(Macintosh command down:C546 | Windows Ctrl down:C562)
					$_bo_ShiftDown:=Shift down:C543
					If (Not:C34($_bo_ShiftDown | $_bo_CommandDown))
						$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
						$_ptr_ArrayOfArrayNames:=$_ptr_ListBoxSetup->{4}
						$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
						
						If ($_l_AreaType=3)
							$_Ptr_ThisColumn:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
						Else 
							$_Ptr_ThisColumn:=$_ptr_ArrayofArrayPointers->{Find in array:C230($_ptr_ArrayOfArrayNames->; $_l_ColumnNumber)}
						End if 
						READ ONLY:C145($_ptr_Table->)
						
						OBJECT SET ENTERABLE:C238($_Ptr_ThisColumn->; False:C215)
						LISTBOX SELECT ROW:C912($_ptr_ListboxArea->; $_l_Row; 0)
					End if 
				Else 
					
					
					
					
					
					$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
					$_ptr_ArrayOfArrayNames:=$_ptr_ListBoxSetup->{4}
					$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
					
					If ($_l_AreaType=3)
						$_Ptr_ThisColumn:=$_ptr_ArrayFieldPointers->{$_l_ColumnNumber}
					Else 
						$_Ptr_ThisColumn:=$_ptr_ArrayofArrayPointers->{$_l_ColumnNumber}
					End if 
					READ WRITE:C146($_ptr_Table->)
					
					OBJECT SET ENTERABLE:C238($_Ptr_ThisColumn->; True:C214)
					EDIT ITEM:C870($_Ptr_ThisColumn->; $_l_Row)
					
					LB_GoToCell($_ptr_ListboxArea; $_l_ColumnNumber; $_l_Row)
					
					
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_USERMODE/oListboxOutputForm"; $_t_oldMethodName)
