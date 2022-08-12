//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_UpdateJobTotalFromAL
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
	//ARRAY POINTER(JOB_aptr_LBStageSettings;0)
	C_LONGINT:C283($_l_Field1Element; $_l_Field2Element; $_l_Field3Element; $_l_FIeldNumber; $_l_FieldsIndex; $_l_Row; $_l_SizeofArray; $_l_T1; $_l_T2; $_l_T3)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_Field; $_Ptr_Field1ColumnArray; $_ptr_Field2; $_Ptr_Field2ColumnArray; $_ptr_Field3; $_Ptr_Field3ColumnArray; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_UpdateJobTotalFromAL")

//NG November 2004
//This method updates the JoBS_Totals from the job stages using the area list arrays
//it is specific to usage within [Jobs]inB 13 form
$_ptr_ArrayFieldPointers:=JOB_aptr_LBStageSettings{2}
$_ptr_Field:=->[JOB_STAGES:47]AT_Actual_Units:5
$_ptr_Field2:=->[JOB_STAGES:47]AS_Quoted_Amount:7
$_ptr_Field3:=->[JOB_STAGES:47]AT_Budget_Sales_Amount:8
$_l_Field1Element:=0
$_l_Field2Element:=0
$_l_Field3Element:=0
//Find those fields in the arrays
For ($_l_FieldsIndex; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
	$_l_FIeldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_FieldsIndex})
	If ($_l_Field1Element=0)
		If ($_l_FIeldNumber=Field:C253($_ptr_Field))
			//$_l_Field1Element:=$_l_FIeldNumber
			$_l_Field1Element:=$_l_FieldsIndex  //altered to use element number instead of filed number 15/06/07 -kmw
		End if 
	End if 
	If ($_l_Field2Element=0)
		If ($_l_FIeldNumber=Field:C253($_ptr_Field2))
			//$_l_Field2Element:=$_l_FIeldNumber
			$_l_Field2Element:=$_l_FieldsIndex  //altered to use element number instead of filed number 15/06/07 -kmw
		End if 
	End if 
	If ($_l_Field3Element=0)
		If ($_l_FIeldNumber=Field:C253($_ptr_Field3))
			//$_l_Field3Element:=$_l_FIeldNumber
			$_l_Field3Element:=$_l_FieldsIndex  //altered to use element number instead of filed number 15/06/07 -kmw
		End if 
	End if 
	If ($_l_Field1Element>0) & ($_l_Field2Element>0) & ($_l_Field3Element>0)
		$_l_FieldsIndex:=9999999
	End if 
	
End for 

//Now extract the 'SUM' from those fields
$_ptr_ArrayofArrayPointers:=JOB_aptr_LBStageSettings{3}
If (Size of array:C274($_ptr_ArrayofArrayPointers->)>0)
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
	$_l_SizeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
	$_l_T1:=0
	$_l_T2:=0
	$_l_T3:=0
	If ($_l_Field1Element>0)
		$_Ptr_Field1ColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Field1Element}
	End if 
	If ($_l_Field2Element>0)
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Field2Element}
	End if 
	If ($_l_Field3Element>0)
		$_Ptr_Field3ColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_Field3Element}
	End if 
	$_l_T1:=Sum:C1($_Ptr_Field1ColumnArray->)
	$_l_T2:=Sum:C1($_Ptr_Field2ColumnArray->)
	$_l_T3:=Sum:C1($_Ptr_Field3ColumnArray->)
	//For ($_l_Row;1;$_l_SizeofArray)
	//If ($_l_Field1Element>0)
	//$_l_T1:=$_l_T1+($_Ptr_Field1ColumnArray->{$_l_Row})
	//End if 
	//If ($_l_Field2Element>0)
	//$_l_T2:=$_l_T2+($_Ptr_ThisColumnArray->{$_l_Row})
	//End if 
	//If ($_l_Field3Element>0)
	//$_l_T3:=$_l_T3+($_Ptr_Field3ColumnArray->{$_l_Row})
	//End if 
	
	//End for 
	[JOBS:26]AT_Actual_Units:16:=$_l_T1
	[JOBS:26]AS_Quoted_Amount:11:=$_l_T2
	[JOBS:26]AC_Actual_Cost_Amount:10:=$_l_T3
End if 
ERR_MethodTrackerReturn("JOB_UpdateJobTotalFromAL"; $_t_oldMethodName)