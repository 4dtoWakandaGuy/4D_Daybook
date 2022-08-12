//%attributes = {}
If (False:C215)
	//Project Method Name:      Sel_Ending
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/02/2012 20:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vSIS)
	C_TEXT:C284($_t_oldMethodName; VSELPREV)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sel_Ending")
//Sel_Ending
If (Count parameters:C259>=1)
	If (OK=1)
		USE SET:C118("Big One")
	End if 
	CLEAR SET:C117("Big One")
	If (vSIS=False:C215)
		CLEAR SET:C117("Before")
	End if 
Else 
	
	If (OK=1)
		USE SET:C118("Big One")
	End if 
	CLEAR SET:C117("Big One")
	If (vSIS=False:C215)
		CLEAR SET:C117("Before")
	End if 
End if 

vSelPrev:="•FSC"
ERR_MethodTrackerReturn("Sel_Ending"; $_t_oldMethodName)