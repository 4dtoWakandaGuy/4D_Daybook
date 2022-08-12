//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ModUpdate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Null; $_bo_ReadOnly; $_bo_Set; $2; LB_bo_MinorFromLB)
	C_LONGINT:C283($_l_AreaType; $_l_Column; $_l_ColumnIndex; bd35)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField; $1; $3)
	C_REAL:C285($_l_Row; $4; $5)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ModUpdate")

// todo: code to come from Nigel
$_t_oldMethodName:=ERR_MethodTracker("LBi_ModUpdate")
//ALModUpdate
//See also ALModUpIfAL
//NG 13/7/2006
If (Count parameters:C259>=5)
	$_ptr_ListboxSetup:=$1
	$_bo_Null:=$2
	$_Ptr_ThisColumnField:=$3
	$_l_Column:=$4
	$_l_Row:=$5
	
	LBi_ArrUpdate($_ptr_ListboxSetup; $_l_Row; True:C214)  //return the values to the arrays
	LBi_LoadFtrs($_ptr_ListboxSetup)
	
	If ((UTI_VarIsNull($_Ptr_ThisColumnField)) & (Not:C34($_bo_Null)))
		
		$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
		$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
		$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
		$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
		If (Size of array:C274($_ptr_ListboxSetup->)>=19)
			$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
			$_l_AreaType:=$_ptr_areaTypeVariable->
		Else 
			$_l_AreaType:=1
		End if 
		$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
		If ($_l_AreaType<3)
			If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Column}))
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
				//$_Ptr_ThisColumnArray
				EDIT ITEM:C870($_Ptr_ThisColumnArray->; $_l_Row)
				
			Else 
				LISTBOX SELECT ROW:C912($_ptr_ListboxArea->; $_l_Row; 0)
				
			End if 
		Else 
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Column}))
				
				$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_Column}
				EDIT ITEM:C870($_Ptr_ThisColumnArray->; $_l_Row)
				
			Else 
				LISTBOX SELECT ROW:C912($_ptr_ListboxArea->; $_l_Row; 0)
				
			End if 
		End if 
		//WS_KEEPFOCUS
		
	Else 
		$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
		//Goto the next editable cell
		$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
		$_ptr_LBTable:=$_ptr_ListboxSetup->{10}
		$_ptr_EnterabilityArray:=$_ptr_ListboxSetup->{14}
		If (Size of array:C274($_ptr_ListboxSetup->)>=19)
			$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}
			$_l_AreaType:=$_ptr_areaTypeVariable->
		Else 
			$_l_AreaType:=1
		End if 
		
		$_bo_Set:=False:C215
		$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
		If ($_l_AreaType<3)
			For ($_l_ColumnIndex; $_l_Column+1; Size of array:C274($_ptr_EnterabilityArray->))
				If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnIndex}))
					$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_ColumnIndex}
					EDIT ITEM:C870($_Ptr_ThisColumnArray->; $_l_Row)
					$_bo_Set:=True:C214
					$_l_ColumnIndex:=Size of array:C274($_ptr_EnterabilityArray->)
				End if 
				
			End for 
		Else 
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			
			For ($_l_ColumnIndex; $_l_Column+1; Size of array:C274($_ptr_EnterabilityArray->))
				If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_ColumnIndex}))
					$_Ptr_ThisColumnArray:=$_ptr_ArrayFieldPointers->{$_l_ColumnIndex}
					EDIT ITEM:C870($_Ptr_ThisColumnArray->)
					$_bo_Set:=True:C214
					$_l_ColumnIndex:=Size of array:C274($_ptr_EnterabilityArray->)
				End if 
			End for 
			
			
		End if 
		
		If (Not:C34($_bo_Set))
			LISTBOX SELECT ROW:C912($_ptr_ListboxArea->; $_l_Row; 0)
		End if 
		
		
		
	End if 
End if 
bd35:=0


LB_bo_MinorFromLB:=False:C215
ERR_MethodTrackerReturn("LBi_ModUpdate"; $_t_oldMethodName)
