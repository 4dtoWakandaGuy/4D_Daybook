If (False:C215)
	//object Name: [PERSONNEL]dAsk_Function.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_LONGINT:C283($_l_Functionality; $_l_Index; bd8)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].dAsk_Function.Variable10"; Form event code:C388)
$_l_Functionality:=0
For ($_l_Index; 1; 8)
	$_ptr_Variable:=Get pointer:C304("bd"+String:C10($_l_Index))
	If ($_ptr_Variable->=1)
		$_l_Functionality:=$_l_Functionality ?+ $_l_Index
		//option is on
	End if 
End for 
[PERSONNEL:11]Functionality:33:=$_l_Functionality
Personnel_FuncP
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("OBJ [PERSONNEL].dAsk_Function.Variable10"; $_t_oldMethodName)
