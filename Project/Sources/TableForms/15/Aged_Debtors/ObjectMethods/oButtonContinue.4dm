If (False:C215)
	//object Name: [USER]Aged_Debtors.oOptionsButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/03/2011 11:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_bo_ShowDate)
	C_DATE:C307(Vdate)
	C_TEXT:C284($_t_oldMethodName; Acc_t_AccountCodeFrom)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Aged_Debtors.oOptionsButton"; Form event code:C388)
If (ACC_bo_ShowDate)
	If (Vdate#!00-00-00!)
		If (ACC_bo_ShowDate)
			If (Acc_t_AccountCodeFrom#"")
				ACCEPT:C269
			Else 
				Gen_Alert("You  must identify the debtors account code")
			End if 
		Else 
			ACCEPT:C269
		End if 
	Else 
		Gen_Alert("You must enter an as at date")
	End if 
Else 
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ:Aged_Debtors,BOK"; $_t_oldMethodName)
