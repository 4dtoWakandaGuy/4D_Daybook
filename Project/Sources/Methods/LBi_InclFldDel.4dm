//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_InclFldDel
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
	C_LONGINT:C283($3)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_ptr_ArrayofColumnColors; $_ptr_ArrayofColumnFonts; $_ptr_ArrayofColumnFooters; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayofColumnLabels; $_ptr_ArrayofColumnLockFlags; $_ptr_ArrayofColumnWIdths)
	C_POINTER:C301($_ptr_EnterabilityArray; $2)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_InclFldDel")

//NG 20/7/06 This method is a direct replacement for ALinclFldDel
//ALInclFldDel - used to delete columns that cannot be show cos they exceed max

$_ptr_ArrayFieldPointers:=$2->{2}
$_ptr_ArrayofArrayPointers:=$2->{3}
$_ptr_ArrayOfArrayNames:=$2->{4}
$_ptr_ArrayOfColumFormats:=$2->{5}
$_Ptr_ArrayofColumnFormulas:=$2->{6}
$_ptr_ArrayofColumnLabels:=$2->{12}
$_ptr_ArrayofColumnWIdths:=$2->{13}
$_ptr_EnterabilityArray:=$2->{14}
$_ptr_ArrayofColumnLockFlags:=$2->{15}
$_ptr_ArrayofColumnFonts:=$2->{16}
$_ptr_ArrayofColumnColors:=$2->{17}
$_ptr_ArrayofColumnFooters:=$2->{18}
$0:=$1+RemoveTrail2(Substring:C12($_ptr_ArrayofColumnLabels->{$3}; 1; 15))+Char:C90(13)
DELETE FROM ARRAY:C228($_ptr_ArrayFieldPointers->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayofArrayPointers->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayOfArrayNames->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayOfColumFormats->; $3; 1)
DELETE FROM ARRAY:C228($_Ptr_ArrayofColumnFormulas->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayofColumnLabels->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayofColumnWIdths->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_EnterabilityArray->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayofColumnLockFlags->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayofColumnColors->; $3; 1)
DELETE FROM ARRAY:C228($_ptr_ArrayofColumnFooters->; $3; 1)
ERR_MethodTrackerReturn("LBi_InclFldDel"; $_t_oldMethodName)