If (False:C215)
	//object Name: [PURCHASE_ORDERS]dPurchOrd_Sel.oPostedDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/07/2012 12:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SRCH_bo_vRDateToSet)
	C_DATE:C307(SRCH_d_rdateTBase; vRDateF; vRDateT)
	C_LONGINT:C283($_l_event; vRDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oPostedDateTUpDown"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (vRDateT=!00-00-00!)
			vRDateT:=Current date:C33
			SRCH_d_rdateTBase:=Current date:C33
			//vRDateF:=vRDateT
		End if 
		If (SRCH_d_rdateTBase=!00-00-00!)
			SRCH_d_rdateTBase:=vRDateT
		End if 
		vRDateT:=SRCH_d_rdateTBase+vRDateTupDown
		If (vRDateT>!00-00-00!)
			SRCH_bo_vRDateToSet:=True:C214
			If (vRDateT<vRDateF)
				vRDateF:=vRDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PURCHASE_ORDERS].dPurchOrd_Sel.oPostedDateTUpDown"; $_t_oldMethodName)
