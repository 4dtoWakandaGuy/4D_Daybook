If (False:C215)
	//object Name: [CONTACTS]dAsk_NewCont.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(CRM_bo_EnforceTitle)
	C_LONGINT:C283(r1; r2)
	C_TEXT:C284($_t_oldMethodName; VCompCode; vCompName; vSurname; Vtitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dAsk_NewCont.Variable8"; Form event code:C388)
CRM_bo_EnforceTitle:=False:C215
If (vSurname#"")
	If ((vCompName="") & (vSurname#"") & (r1=0))
		r1:=1
		r2:=0
	End if 
	If (VSurName#"") & (Vtitle="")
		If (CRM_bo_EnforceTitle)
			Gen_Alert("You must enter a title for this person"; "OK")
		Else 
			If (VCompCode="") & (R2=1)
				Gen_Alert("You must enter an existing company to continue")
			Else 
				
				ACCEPT:C269
			End if 
		End if 
		
	Else 
		
		ACCEPT:C269
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dAsk_NewCont.Variable8"; $_t_oldMethodName)
