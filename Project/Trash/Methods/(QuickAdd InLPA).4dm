//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      QuickAdd InLPA
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
	//Array Text(ORD_AT_QuickAddProdCode;0)
	C_LONGINT:C283(vAct1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QuickAdd InLPA")
vAct1:=ORD_AT_QuickAddProdCode
QuickAdd_UpLine
ERR_MethodTrackerReturn("QuickAdd InLPA"; $_t_oldMethodName)