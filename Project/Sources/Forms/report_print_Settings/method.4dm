
If (False:C215)
	//Project Method Name:      report_print_Settings
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/09/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284(REP_T_REPORTNAME)
End if 
//Code Starts Here
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		If (REP_T_REPORTNAME#"")
		Else 
			//REP_T
		End if 
		
	: ($_l_FormEvent=On Data Change:K2:15)
	: ($_l_FormEvent=On Clicked:K2:4)
	: ($_l_FormEvent=On Close Box:K2:21)
	: ($_l_FormEvent=On Validate:K2:3)
End case 

