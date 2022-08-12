//%attributes = {}
If (False:C215)
	//Project Method Name:      Jobs_TC_GetSelectionsFromArrays
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
	//ARRAY POINTER(ORD_aPtr_LbDISetup;0)
	//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
	C_LONGINT:C283($_l_Column; $_l_FieldNumber; $_l_UniqueFieldColumnNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayofRecordsIdents)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_TC_GetSelectionsFromArrays")

//added kmw, 10/01/07
//Sets current selection of order Lines and Diary records to be the same as the records displayed in the ListBox arrays
//used on Time and Cost entry screen just before saving, canceling or anywhere where the system expects the current selection of records to match whats being displayed in the arrays



//Set current selection for [order items] based on values in array containing [orders items]item number
$_ptr_ArrayFieldPointers:=ORD_aPtr_OrderItemsSetup{2}
//FieldsRef=Point to fields columns
//This gets the column with the unique field in
$_l_UniqueFieldColumnNumber:=0
For ($_l_Column; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
	$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Column})
	If ($_l_FieldNumber=Field:C253(->[ORDER_ITEMS:25]Item_Number:27))
		$_l_UniqueFieldColumnNumber:=$_l_Column
		$_l_Column:=Size of array:C274($_ptr_ArrayFieldPointers->)
	End if 
End for 
$_ptr_ArrayofArrayPointers:=ORD_aPtr_OrderItemsSetup{3}  //pointer to the array of pointers to each column/field/data array
$_ptr_ArrayofRecordsIdents:=$_ptr_ArrayofArrayPointers->{$_l_UniqueFieldColumnNumber}  //pointer to array that contains the unique primary key data (ie [ORDER ITEMS]Item Number)
QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Item_Number:27; $_ptr_ArrayofRecordsIdents->)

//Set current selection for [diary] based on values in array containing [diary]diary code
$_ptr_ArrayFieldPointers:=ORD_aPtr_LbDISetup{2}
//FieldsRef=Point to fields columns
//This gets the column with the unique field in
$_l_UniqueFieldColumnNumber:=0
For ($_l_Column; 1; Size of array:C274($_ptr_ArrayFieldPointers->))
	$_l_FieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{$_l_Column})
	If ($_l_FieldNumber=Field:C253(->[DIARY:12]Diary_Code:3))
		$_l_UniqueFieldColumnNumber:=$_l_Column
		$_l_Column:=Size of array:C274($_ptr_ArrayFieldPointers->)
	End if 
End for 
$_ptr_ArrayofArrayPointers:=ORD_aPtr_LbDISetup{3}  //pointer to the array of pointers to each column/field/data array
$_ptr_ArrayofRecordsIdents:=$_ptr_ArrayofArrayPointers->{$_l_UniqueFieldColumnNumber}  //pointer to array that contains the unique primary key data (ie [DIARY]Diary Coder)
QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_ptr_ArrayofRecordsIdents->)
ERR_MethodTrackerReturn("Jobs_TC_GetSelectionsFromArrays"; $_t_oldMethodName)