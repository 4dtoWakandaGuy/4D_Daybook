//%attributes = {}
If (False:C215)
	//Project Method Name:      Companies_OutCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_SizeofArray)
	C_REAL:C285($_r_Value)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies_OutCo")
$_l_SizeofArray:=Sum:C1([COMPANIES:2]Size:15)
$_r_Value:=Sum:C1([COMPANIES:2]Value:31)
vText:=vText+"Total Size: "+String:C10($_l_SizeofArray; "|Accounts")+vRec+"Total Value: "+String:C10($_r_Value; "|Accounts")
ERR_MethodTrackerReturn("Companies_OutCo"; $_t_oldMethodName)
AA_CloseStates
ERR_MethodTrackerReturn("Companies_OutCo"; $_t_oldMethodName)