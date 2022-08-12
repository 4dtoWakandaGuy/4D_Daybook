//%attributes = {}

If (False:C215)
	//Project Method Name:      LB_SetColumnHeaders
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
	C_LONGINT:C283($_l_Index; $_l_NextButton; $0; $3)
	C_POINTER:C301($_ptr_Button; $1)
	C_TEXT:C284($_t_ButtonPrefix; $_t_HeaderTitle; $_t_oldMethodName; $10; $11; $12; $13; $14; $15; $16; $17)
	C_TEXT:C284($18; $19; $2; $4; $5; $6; $7; $8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LB_SetColumnHeaders")

// $1 = pointer to the listbox area
// $2 = button prefix - e.g. "ATT_L" - all buttons must be pre-defined as integers
// $3 ->$n = the header texts


If (Count parameters:C259>=3)
	
	$_l_NextButton:=$3
	$_t_ButtonPrefix:=$2+"_BUT"
	For ($_l_Index; 4; Count parameters:C259)
		$_ptr_Button:=Get pointer:C304($_t_ButtonPrefix+String:C10($_l_NextButton))
		$_t_HeaderTitle:=${$_l_Index}
		OBJECT SET TITLE:C194($_ptr_Button->; $_t_HeaderTitle)
		$0:=$_l_NextButton
		$_l_NextButton:=$_l_NextButton+1
	End for 
End if 

// $1 = pointer to the listbox area
// $2 = button prefix - e.g. "ATT_L" - all buttons must be pre-defined as integers
// $3 ->$n = the header texts
ERR_MethodTrackerReturn("LB_SetColumnHeaders"; $_t_oldMethodName)