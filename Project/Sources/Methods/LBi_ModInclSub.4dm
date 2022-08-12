//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_ModInclSub
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
	C_BOOLEAN:C305($0; LB_bo_MinorFromLB)
	C_LONGINT:C283($_l_Column; $_l_Index; $_l_KeyPosition; $_l_Row; bd35)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_Subtable; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField; $1)
	C_REAL:C285($2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_ModInclSub")

// todo: code to come from Nigel
$_t_oldMethodName:=ERR_MethodTracker("LBi_ModInclSub")
//Sub - Subfile
//See also ALModIncl
LB_bo_MinorFromLB:=True:C214  //THIS IS CLEARED IN ALMODUPDATE


//TRACE
$0:=False:C215
If (bd35=0)  //This is here to ensure that this proc only gets used once
	$_l_Column:=$2
	$_l_Row:=$3
	bd35:=1  //because otherwise it will get a $2=8 (left the area) when you open another wind
	
	$_ptr_Subtable:=$1->{8}
	$_ptr_ArrayFieldPointers:=$1->{2}
	$_l_KeyPosition:=Size of array:C274($_ptr_ArrayFieldPointers->)
	If ($_l_KeyPosition>0)
		$0:=False:C215
		$_ptr_ArrayofArrayPointers:=$1->{3}
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
		$_l_Index:=1
		_O_ALL SUBRECORDS:C109($_ptr_Subtable->)
		While (($0=False:C215) & (Not:C34(_O_End subselection:C37($_ptr_Subtable->))))
			//IDLE  ` 03/04/03 pb
			If ($_l_Index=$_Ptr_ThisColumnArray->{$_l_Row})
				$0:=True:C214
				OK:=1
				$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Column}
				$_Ptr_ThisColumnField->:=$_Ptr_ThisColumnArray->{$_l_Row}
			Else 
				$_l_Index:=$_l_Index+1
				_O_NEXT SUBRECORD:C62($_ptr_Subtable->)
			End if 
		End while 
		
	Else 
		$0:=True:C214
	End if 
Else 
	$0:=True:C214
End if 
If ($0=False:C215)
	bd35:=0  //resets the flag that allows modifications to be recognized
End if 
ERR_MethodTrackerReturn("LBi_ModInclSub"; $_t_oldMethodName)