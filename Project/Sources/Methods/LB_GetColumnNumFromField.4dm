//%attributes = {}
If (False:C215)
	//Project Method Name:      LB_GetColumnNumFromField
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
	C_LONGINT:C283($0; $_l_ColumnNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $1; $2; $pDescArrayPtr; $pFieldPtr)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_GetColumnNumFromField")
//LB_getcolumnnumFromField
//
//Added 19/02/07 -kmw
//
//Parameters:
//$1 = pointer to the ListBox description array
//$2 = pointer to the field that we want to find out the column number it has been assigned to
//
//Returns the column number of that is currently being used to display a particular field
//
//Example:
//$_l_ColumnNumber:=LB_GetColumnNumFromField(->[Job Stages]JT Act Sales Am;->JOB_aptr_LBStageSettings)
//
If (Count parameters:C259>=2)
	$pFieldPtr:=$1
	$pDescArrayPtr:=$2
	//
	//
	//
	//
	$_ptr_ArrayFieldPointers:=$pDescArrayPtr->{2}  //get pointer to array of field pointers
	//
	//
	$_l_ColumnNumber:=Find in array:C230($_ptr_ArrayFieldPointers->; $pFieldPtr)  //find column number that has a matching field pointer to the one passed in in $1
	//
	//
	$0:=$_l_ColumnNumber
Else 
	$0:=0
End if 
ERR_MethodTrackerReturn("LB_GetColumnNumFromField"; $_t_oldMethodName)