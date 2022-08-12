If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oStatementDateTUpDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/07/2012 09:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_DATE(VsdateTBASE)
	C_BOOLEAN:C305(SRCH_bo_VSDateToSet)
	C_DATE:C307(VSDateF; VSDateT)
	C_LONGINT:C283($_l_event; VSDateTupDown)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oStatementDateTUpDown"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (VSDateT=!00-00-00!)
			VSDateT:=Current date:C33
			VSDateTBASE:=Current date:C33
			//VSDateF:=VSDateT
		End if 
		If (VSDateTBASE=!00-00-00!)
			VSDateTBASE:=VSDateT
		End if 
		VSDateT:=VSDateTBASE+VSDateTupDown
		If (VSDateT>!00-00-00!)
			SRCH_bo_VSDateToSet:=True:C214
			If (VSDateT<VSDateF)
				VSDateF:=VSDateT
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oStatementDateTUpDown"; $_t_oldMethodName)
