If (False:C215)
	//object Name: [INVOICES]dInv_Sel.oCreditStageF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; vStage)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].dInv_Sel.oCreditStageF"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->vStage; ""; ->[CREDIT_STAGES:54]; ->[CREDIT_STAGES:54]Stage_Code:1; ->[CREDIT_STAGES:54]Stage_Name:2; "Credit Stage")
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].dInv_Sel.oCreditStageF"; $_t_oldMethodName)
