If (False:C215)
	//object Name: [PURCHASE_INVOICES]dPurch Sel.oPeriodCodeF
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PURCHASE_INVOICES].dPurch Sel.oPeriodCodeF"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->ACC_t_PeriodFrom; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
End if 
ERR_MethodTrackerReturn("OBJ [PURCHASE_INVOICES].dPurch Sel.oPeriodCodeF"; $_t_oldMethodName)
