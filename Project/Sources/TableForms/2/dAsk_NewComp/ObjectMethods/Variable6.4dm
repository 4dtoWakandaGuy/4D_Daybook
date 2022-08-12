If (False:C215)
	//object Name: [COMPANIES]dAsk_NewComp.Variable6
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(r1; r2)
	C_TEXT:C284($_t_oldMethodName; vCompName; vPostcode; vSurname; vTown)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_NewComp.Variable6"; Form event code:C388)
If ((vCompName#"") | (vTown#"") | (vPostcode#"") | (vSurname#""))
	If ((vCompName="") & (vSurname#"") & (r1=0))
		r1:=1
		r2:=0
	End if 
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_NewComp.Variable6"; $_t_oldMethodName)
