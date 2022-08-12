//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_FormRel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 18:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vAB)
	C_POINTER:C301(BUT_p_ButtonStringPointer)
	C_TEXT:C284($_t_oldMethodName; vLayCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_FormRel")
If ((vLayCode#[ORDERS:24]Order_Code:3) & (Not:C34(End selection:C36([ORDERS:24]))))
	If (BUT_p_ButtonStringPointer->="OI@")
		
	Else 
		Orders_InLPOI(vAB; 0)
	End if 
	Orders_InvCalc
	vLayCode:=[ORDERS:24]Order_Code:3
End if 
ERR_MethodTrackerReturn("Orders_FormRel"; $_t_oldMethodName)