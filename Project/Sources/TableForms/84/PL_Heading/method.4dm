If (False:C215)
	//Table Form Method Name: [HEADINGS]P&L Heading
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch6)
	C_REAL:C285(vAmountF; vAmountT)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [HEADINGS].P&L Heading"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	If (ch6=1)
		OBJECT SET FORMAT:C236(vAmountF; "|Inverse Accounts")
		OBJECT SET FORMAT:C236(vAmountT; "|Inverse Accounts")
	End if 
End if 
ERR_MethodTrackerReturn("FM [HEADINGS].P&L Heading"; $_t_oldMethodName)
