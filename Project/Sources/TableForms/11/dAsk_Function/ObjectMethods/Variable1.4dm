If (False:C215)
	//object Name: [PERSONNEL]dAsk_Function.Variable1
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
	C_LONGINT:C283($_l_Functionality; $_l_Index; bd20)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].dAsk_Function.Variable1"; Form event code:C388)
If (Read only state:C362([PERSONNEL:11]))
	bd20:=[PERSONNEL:11]Functionality:33
	Personnel_FuncP
Else 
	$_l_Functionality:=0
	For ($_l_Index; 1; 8)
		If ($_l_Index<=Bd20)
			$_l_Functionality:=$_l_Functionality ?+ $_l_Index
		End if 
	End for 
	[PERSONNEL:11]Functionality:33:=$_l_Functionality
	Personnel_FuncP
	//
	DB_bo_RecordModified:=True:C214
End if 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].dAsk_Function.Variable1"; $_t_oldMethodName)
