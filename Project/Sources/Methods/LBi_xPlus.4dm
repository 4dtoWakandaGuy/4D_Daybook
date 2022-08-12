//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_xPlus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/11/2010 13:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	C_BOOLEAN:C305($_bo_False; $_bo_ReadOnly; $_bo_Set; $_bo_True; LB_bo_AddLine; DB_bo_ListBoxActive)
	C_LONGINT:C283($_l_AreaType; $_l_Column; $_l_Index; $_l_NewNumberofRows; $_l_NumberofRows; $0; $6)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField; $1)
	C_POINTER:C301($2; $5)
	C_REAL:C285($3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBi_xPlus")

//NG 13/7/2006.
//This method replaces ALxPlus


//ALxPlus
//TRACE
If (Count parameters:C259>=2)
	$2->:=1  //always one now
	If (Count parameters:C259>=5)
		LBi_EditListLay($1; $2; $5)
	Else 
		LBi_EditListLay($1; $2)
	End if 
	
	
Else 
	<>LB_at_EditModes:=2
	LBi_EditListLay($1)
	
End if 
$_ptr_ListboxSetup:=$1
$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
If (Size of array:C274($_ptr_ListboxSetup->)>=19)
	$_ptr_areaTypeVariable:=$_ptr_ListboxSetup->{19}  //3 is table based 2 is array based view of fields and -1 is array based array of arrays.
	$_l_AreaType:=$_ptr_areaTypeVariable->
Else 
	$_l_AreaType:=1
End if 

$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
If ($_l_AreaType<3)
	$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)
	//TRACE
	If (Count parameters:C259>=6)
		$_l_NumberofRows:=$6
	End if 
	LISTBOX INSERT ROWS:C913($_ptr_ListboxArea->; $_l_NumberofRows+1)
	$0:=$_l_NumberofRows+1
	GET AUTOMATIC RELATIONS:C899($_bo_True; $_bo_False)
	LBi_ArrUpdate($_ptr_ListboxSetup; $_l_NumberofRows+1; True:C214)
	//GET AUTOMATIC RELATIONS($_bo_True;$_bo_False)
	//SET AUTOMATIC RELATIONS(True;False)
	//$ParentPointer:=$1->{10}
	//RELATE ONE($ParentPointer->)
	//SET AUTOMATIC RELATIONS($_bo_True;$_bo_False)
	If ($_ptr_ArrayReferences->{8}#"")  //if a subfile
		LBi_SubKeyUp($_ptr_ListboxSetup; -1)
		
	End if 
Else 
	$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
	
	//TRACE
	$_l_NumberofRows:=Records in selection:C76($_ptr_LBTable->)
	
End if 
LBi_LoadFtrs($1)
//GOTO AREA($_ptr_ListboxArea->)

//Set the scroll box position
LBI_Scrollonresize($_ptr_ListboxArea)

LB_SetScroll($_ptr_ListboxArea; $_l_NumberofRows+1; 1)


LB_bo_AddLine:=True:C214

$_l_NewNumberofRows:=$_l_NumberofRows+1
$_l_Column:=1
$_ptr_EnterabilityArray:=$1->{14}

$_bo_Set:=False:C215
$_ptr_LBTable:=$1->{10}
LBI_Scrollonresize($_ptr_ListboxArea)
LB_SetScroll($_ptr_ListboxArea; $_l_NumberofRows+1; 1)
If ($_l_AreaType<3)
	For ($_l_Index; 1; Size of array:C274($_ptr_ListboxArea->))
		$_ptr_ListboxArea->{$_l_Index}:=False:C215
	End for 
	
	$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
	For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
		If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Index}
			If ($_l_NumberofRows+1<=Size of array:C274($_Ptr_ThisColumnArray->))
				EDIT ITEM:C870($_Ptr_ThisColumnArray->; $_l_NumberofRows+1)
				If ($_l_NumberofRows+1<=Size of array:C274($_ptr_ListboxArea->))
					$_ptr_ListboxArea->{$_l_NumberofRows+1}:=True:C214
					$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
					$_bo_Set:=True:C214
				End if 
			End if 
		End if 
		
	End for 
Else 
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
	For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
		If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
			$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index}
			
			EDIT ITEM:C870($_Ptr_ThisColumnArray->)
			$_bo_Set:=True:C214
			$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
			
		End if 
		
	End for 
End if 
If (Not:C34($_bo_Set))
	LISTBOX SELECT ROW:C912($_ptr_ListboxArea->; $3; 0)
End if 
ERR_MethodTrackerReturn("LBi_xPlus"; $_t_oldMethodName)