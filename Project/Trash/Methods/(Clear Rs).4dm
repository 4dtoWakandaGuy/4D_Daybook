//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Clear Rs
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
	C_LONGINT:C283(rComp; rCont; rContr; rDiary; rOrd; rState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Clear Rs")
rComp:=0
rCont:=0
rOrd:=0
rDiary:=0
rContr:=0
rState:=0
ERR_MethodTrackerReturn("Clear Rs"; $_t_oldMethodName)