//%attributes = {}
If (False:C215)
	//Project Method Name:      In_ButtNextPrev
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
	C_LONGINT:C283($_l_RecordsinSelection; $_l_SelectedRecordNumber)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_ButtonTitle; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("In_ButtNextPrev")
$_t_ButtonTitle:=$2->
$_l_RecordsinSelection:=Records in selection:C76($1->)
If ($_l_RecordsinSelection<2)
	$_t_ButtonTitle:=Substring:C12($_t_ButtonTitle; 1; 6)+"NP"+Substring:C12($_t_ButtonTitle; 9; 99)
	// $_t_ButtonTitle≤7≥:="N"
	//  $_t_ButtonTitle≤8≥:="P"
Else 
	$_l_SelectedRecordNumber:=Selected record number:C246($1->)
	Case of 
		: ($_l_SelectedRecordNumber=1)
			$_t_ButtonTitle:=Substring:C12($_t_ButtonTitle; 1; 6)+" P"+Substring:C12($_t_ButtonTitle; 9; 99)
			//$_t_ButtonTitle≤7≥:=" "
			//$_t_ButtonTitle≤8≥:="P"
		: ($_l_SelectedRecordNumber=$_l_RecordsinSelection)
			$_t_ButtonTitle:=Substring:C12($_t_ButtonTitle; 1; 6)+"N "+Substring:C12($_t_ButtonTitle; 9; 99)
			//$_t_ButtonTitle≤7≥:="N"
			//$_t_ButtonTitle≤8≥:=" "
		Else 
			$_t_ButtonTitle:=Substring:C12($_t_ButtonTitle; 1; 6)+"  "+Substring:C12($_t_ButtonTitle; 9; 99)
			//$_t_ButtonTitle≤7≥:=" "
			//$_t_ButtonTitle≤8≥:=" "
	End case 
End if 
$2->:=$_t_ButtonTitle
//Copied to Input_Buttons
ERR_MethodTrackerReturn("In_ButtNextPrev"; $_t_oldMethodName)