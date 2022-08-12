If (False:C215)
	//object Name: [USER]Aged_Debtors.oOptionsButtoninv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/02/2010 07:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(Vdate)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Aged_Debtors.oOptionsButtoninv"; Form event code:C388)
If (Vdate#!00-00-00!)
	If (Acc_t_AccountCodeFrom#"")
		ACCEPT:C269
	Else 
		Gen_Alert("You  must identify the debtors account code")
	End if 
Else 
	Gen_Alert("You must enter an as at date")
End if 
ERR_MethodTrackerReturn("OBJ [USER].Aged_Debtors.oOptionsButtoninv"; $_t_oldMethodName)
