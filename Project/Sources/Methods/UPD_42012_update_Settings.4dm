//%attributes = {}
If (False:C215)
	//Project Method Name:      UPD_42012_update_Settings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($1)
	C_LONGINT:C283($_l_FunctionalityOLD; $_l_Index; $1; $_l_Functionality; $_l_FunctionalityOLD; $_l_Index)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("42012_update_Settings")
If (Count parameters:C259=0)
	$_l_FunctionalityOLD:=[PERSONNEL:11]Functionality:33
Else 
	$_l_FunctionalityOLD:=$1
End if 
//September 2009 NG No test in here to see if functionality has already been updated-this could be dangerous
//plus it does not seem to do what it should
$_l_Functionality:=0  //[PERSONNEL]Functionality
For ($_l_Index; 1; $_l_FunctionalityOLD)
	$_l_Functionality:=$_l_Functionality ?+ $_l_Index
End for 
If (Count parameters:C259<2)
	
	[PERSONNEL:11]Functionality:33:=$_l_Functionality
Else 
	$2->:=$_l_Functionality
End if 
ERR_MethodTrackerReturn("42012_update_Settings"; $_t_oldMethodName)
