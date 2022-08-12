//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ProcesstoFront
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/08/2012 11:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Process)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName; $1)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_ProcesstoFront")

If (Count parameters:C259>=1)
	$_l_Process:=Num:C11($1)
Else 
	
	$_t_MenuItemParameter:=Get selected menu item parameter:C1005
	$_l_Process:=Num:C11($_t_MenuItemParameter)
	
End if 
If ($_l_Process>0)
	SHOW PROCESS:C325($_l_Process)
	BRING TO FRONT:C326($_l_Process)
	RESUME PROCESS:C320($_l_Process)
End if 
ERR_MethodTrackerReturn("DB_ProcesstoFront"; $_t_oldMethodName)