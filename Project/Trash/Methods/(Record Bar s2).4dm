//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record_Bar s2
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
	C_LONGINT:C283(r1; r2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_Bar s2")
r1:=0
r2:=1
Record_BarSrch
ERR_MethodTrackerReturn("Record_Bar s2"; $_t_oldMethodName)