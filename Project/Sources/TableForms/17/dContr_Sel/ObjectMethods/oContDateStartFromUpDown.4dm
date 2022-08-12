
If (False:C215)
	//Object Name:      [CONTRACTS].dContr_Sel.oasAtOptionsUpDown1
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  14/07/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vSDateF; VsdateFBASE)
	C_LONGINT:C283(VsDateFupDown)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (vSDateF=!00-00-00!)
			vSDateF:=Current date:C33(*)
		End if 
		If (VsdateFBASE=!00-00-00!)
			VsdateFBASE:=vSDateF
		End if 
		vSDateF:=VsdateFBASE+VsDateFupDown
		
End case 
