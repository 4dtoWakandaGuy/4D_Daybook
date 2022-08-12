//%attributes = {}

If (False:C215)
	//Project Method Name:      DB_GetActionsUsed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  23/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_BlankActionCode; 0)
	//ARRAY TEXT(DB_at_ActionCodes;0)
	C_BOOLEAN:C305(DB_bo_ActionsReady)
	C_LONGINT:C283($_l_CallBackProcess; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("DB_GetActionsUsed")
If (Count parameters:C259>=1)
	$_l_CallBackProcess:=$1
	
	READ ONLY:C145([DIARY:12])
	ALL RECORDS:C47([DIARY:12])
	DISTINCT VALUES:C339([DIARY:12]Action_Code:9; $_at_ActionCodes)
	
	$_at_BlankActionCode:=Find in array:C230($_at_ActionCodes; "")
	If ($_at_BlankActionCode>0)
		DELETE FROM ARRAY:C228($_at_ActionCodes; $_at_BlankActionCode)
	End if 
	VARIABLE TO VARIABLE:C635($_l_CallBackProcess; DB_at_ActionCodes; $_at_ActionCodes)
	
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; DB_bo_ActionsReady; True:C214)
	
End if 
ERR_MethodTrackerReturn("DB_GetActionsUsed"; $_t_oldMethodName)