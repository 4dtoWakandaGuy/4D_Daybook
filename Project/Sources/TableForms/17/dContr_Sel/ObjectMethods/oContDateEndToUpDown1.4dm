
If (False:C215)
	//Object Name:      [CONTRACTS].dContr_Sel.oasAtOptionsUpDown
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
	C_DATE:C307(vSDateT; VsdateTBASE)
	C_LONGINT:C283(VsDateTupDown)
End if 
//Code Starts Here
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Case of 
			: (Form event code:C388=On Clicked:K2:4)
				If (vSDateT=!00-00-00!)
					vSDateT:=Current date:C33(*)
				End if 
				If (VsdateTBASE=!00-00-00!)
					VsdateTBASE:=vSDateT
				End if 
				vSDateT:=VsdateTBASE+VsDateTupDown
				
		End case 
		
		
End case 
