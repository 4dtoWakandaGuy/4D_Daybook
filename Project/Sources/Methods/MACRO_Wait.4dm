//%attributes = {}
If (False:C215)
	//Project Method Name:      MACRO_Wait
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
	C_LONGINT:C283($1; vMpage)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MACRO_Wait")

vMPage:=vMPage+$1
If (vMPage>0)
	DelayTicks(vMPage*60)
End if 
ERR_MethodTrackerReturn("MACRO_Wait"; $_t_oldMethodName)