//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_ModIncl
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 14:07`Method: LBi_ModIncl
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; LB_bo_MinorFromLB)
	C_LONGINT:C283($_l_AreaType; $_l_Column; $_l_KeyFieldColumn; $_l_Row; $_l_THisColumn; $_l_ThisRow; AL_l_Bottom; AL_l_Left; AL_l_Right; AL_l_TOp; bd35)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField; $1)
	C_REAL:C285($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_ModIncl")

// todo: code to come from Nigel
//NG this methoda replacement for
//This method is called  by many of the Call back methods used with area list areas.
$_t_oldMethodName:=ERR_MethodTracker("LBi_ModIncl"; Form event code:C388)
If (Count parameters:C259>=1)
	//ALModIncl - Key field method
	//See also ALModIncSub
	LB_bo_MinorFromLB:=True:C214  //THIS IS CLEARED IN ALMODUPDATE
	$_ptr_ListboxSetup:=$1
	If (Count parameters:C259>=3)
		$_l_Column:=$2
		$_l_Row:=$3
	Else 
		$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
		LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Row; $_l_Column)
	End if 
	$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
	OBJECT GET COORDINATES:C663($_ptr_ListboxArea->; AL_l_Left; AL_l_TOp; AL_l_Right; AL_l_Bottom)
	
	$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
	$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
	//OK:=0
	//TRACE
	
	If (bd35=0)  //This is here to ensure that this proc only gets used once
		bd35:=1  //because otherwise it will get a $2=8 (left the area) when you open another wind
		
		
		
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		$_l_KeyFieldColumn:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
		If (Size of array:C274($_ptr_ListboxSetup->)>=19)
			$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
			$_l_AreaType:=$_ptr_areaTypeVariable->
		Else 
			$_l_AreaType:=1
		End if 
		If (($_l_KeyFieldColumn>0) | ($_l_KeyFieldColumn=-3))
			$0:=True:C214
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyFieldColumn}
			If ($_l_AreaType<3)
				If ($_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Row})  //record is current loaded-check it is read write-this should would alway
					
					If (Read only state:C362($_ptr_LBTable->))
						If ((Record number:C243($_ptr_LBTable->)#-3))
							If (Read only state:C362($_ptr_LBTable->))
								READ WRITE:C146($_ptr_LBTable->)
							End if 
							LOAD RECORD:C52($_ptr_LBTable->)
						End if 
					Else 
						DB_SaveRecord($_ptr_LBTable)
						READ WRITE:C146($_ptr_LBTable->)
						QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Row})
					End if 
				Else 
					//TRACE
					
					//this should not happen with a field based format
					DB_SaveRecord($_ptr_LBTable)
					
					READ WRITE:C146($_ptr_LBTable->)
					QUERY:C277($_ptr_LBTable->; $_Ptr_KeyField->=$_Ptr_ThisColumnArray->{$_l_Row})
				End if 
			Else 
				If (Read only state:C362($_ptr_LBTable->))
					If ((Record number:C243($_ptr_LBTable->)#-3))
						If (Read only state:C362($_ptr_LBTable->))
							READ WRITE:C146($_ptr_LBTable->)
						End if 
						LOAD RECORD:C52($_ptr_LBTable->)
					End if 
				End if 
			End if 
			If (UTI_VarIsNull($_Ptr_KeyField))
				If (Record number:C243($_ptr_LBTable->)#-3)  //Can't use records in selection cos of unsaved new records
					
					$0:=False:C215
					bd35:=0
					Gen_Alert("That record has been deleted by another process or user"; "Cancel")
				Else 
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
					$_Ptr_ThisColumnField->:=$_Ptr_ThisColumnArray->{$_l_Row}
					OK:=1
				End if 
				
			Else 
				
				If (Not:C34(Check_Locked($_ptr_LBTable; 1)))
					
					Gen_Alert("That record is locked by another process or user and cannot be editied"; "Cancel")
					$0:=False:C215
					bd35:=0  //resets the flag that allows modifications to be recognized
					
				Else 
					$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
					If ($_l_AreaType<3)
						$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
						$_Ptr_ThisColumnField->:=$_Ptr_ThisColumnArray->{$_l_Row}
						//DB_SaveRecord ($_ptr_LBTable)>> Make sure the calling method does this
						
						
						
						
					End if 
					OK:=1
				End if 
				
			End if 
		Else 
			$0:=False:C215
			bd35:=0
		End if 
	Else 
		$0:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("LBi_ModIncl"; $_t_oldMethodName)
