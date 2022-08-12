//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      MState_Calc2
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
	C_LONGINT:C283(rState)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MState_Calc2")
If (rState=2)
	RELATE ONE:C42([INVOICES:39]Company_Code:2)
	RELATE ONE:C42([INVOICES:39]Contact_Code:3)
Else 
	MState_Calc
End if 
ERR_MethodTrackerReturn("MState_Calc2"; $_t_oldMethodName)