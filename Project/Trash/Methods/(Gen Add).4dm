//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen Add
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY REAL:C219($_ar_AddNumber; 0)
	C_LONGINT:C283($_l_RecordsIndex; $_l_RecordsinSelection)
	C_POINTER:C301($1; $2)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen Add")
$0:=0
$_l_RecordsinSelection:=Records in selection:C76($1->)
ARRAY REAL:C219($_ar_AddNumber; $_l_RecordsinSelection)
SELECTION TO ARRAY:C260($2->; $_ar_AddNumber)
For ($_l_RecordsIndex; 1; $_l_RecordsinSelection)
	$0:=$0+$_ar_AddNumber{$_l_RecordsIndex}
End for 
//FIRST RECORD($1»)
//While (Not(End selection($1»)))
//  $0:=$0+$2»
//  NEXT RECORD($1»)
//End while
ERR_MethodTrackerReturn("Gen Add"; $_t_oldMethodName)