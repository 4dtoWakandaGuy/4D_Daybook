//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_DragRow
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
	C_BOOLEAN:C305(LBI_bo_RowDragged)
	C_POINTER:C301($_ptr_ArrayReferences; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_DragRow")

//NG 20/7/06 This method is a replacement for ALDragROw..now that i am sure it will get used in the list box scheme
$_t_oldMethodName:=ERR_MethodTracker("LBi_DragRow")
//ALDragRow - note the fact that the row order has been changed
LBI_bo_RowDragged:=True:C214
$_ptr_ArrayReferences:=$1->{9}
If (Substring:C12($_ptr_ArrayReferences->{4}; 7; 1)="1")  //($_ptr_ArrayReferences»{4}≤7≥="1")
	$_ptr_ArrayReferences->{4}:=Substring:C12($_ptr_ArrayReferences->{4}; 1; 6)+"2"+Substring:C12($_ptr_ArrayReferences->{4}; 8; 99)
	//$_ptr_ArrayReferences»{4}≤7≥:="2"
End if 
ERR_MethodTrackerReturn("LBi_DragRow"; $_t_oldMethodName)