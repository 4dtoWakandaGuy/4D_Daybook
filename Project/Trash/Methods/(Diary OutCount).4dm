//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary OutCount
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
	C_REAL:C285($_r_Units; $_r_Value)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary OutCount")
$_r_Value:=Sum:C1([DIARY:12]Value:16)
$_r_Units:=Sum:C1([DIARY:12]Units:20)
vText:=vText+"Total Units: "+String:C10($_r_Units)+vRec+"Total Value: "+String:C10($_r_Value; "|Accounts")
ERR_MethodTrackerReturn("Diary OutCount"; $_t_oldMethodName)