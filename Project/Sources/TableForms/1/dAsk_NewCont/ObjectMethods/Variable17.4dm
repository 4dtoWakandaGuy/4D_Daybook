If (False:C215)
	//object Name: [CONTACTS]dAsk_NewCont.Variable17
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
	//ARRAY TEXT(AA_at_ProffesionallAdditions;0)
	//ARRAY TEXT(AA_at_Salutations;0)
	//ARRAY TEXT(AA_at_SNprefix;0)
	C_LONGINT:C283(r1; r2; xNew; xOK)
	C_TEXT:C284($_t_oldMethodName; Vcompname; Vforename; Vpostcode; Vsurname; Vtitle; Vtown; VwholeName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].dAsk_NewCont.Variable17"; Form event code:C388)
If (AA_at_Salutations>0)
	If (AA_at_Salutations<(Size of array:C274(AA_at_Salutations)-2))
		Vtitle:=AA_at_Salutations{AA_at_Salutations}
		If (Vforename#"") | (Vsurname#"")
			Case of 
				: (Vforename#"") & (Vsurname#"") & (Vtitle#"")
					VwholeName:=Vtitle+" "+Vforename+" "+Vsurname
				: (Vforename#"") & (Vsurname#"") & (Vtitle="")
					VwholeName:=Vforename+" "+Vsurname
				: (Vforename#"") & (Vsurname="") & (Vtitle#"")
					VwholeName:=Vtitle+" "+Vforename
				: (Vforename="") & (Vsurname#"") & (Vtitle#"")
					VwholeName:=Vtitle+" "+Vsurname
				: (Vforename#"") & (Vsurname="") & (Vtitle="")
					VwholeName:=Vforename
				: (Vforename="") & (Vsurname#"") & (Vtitle="")
					VwholeName:=Vsurname
				: (Vforename="") & (Vsurname="") & (Vtitle#"")
					VwholeName:=Vtitle
			End case 
			AA_ParseName(VwholeName; 0; ->Vtitle; ->vForename; ->vSurname; ->AA_at_Salutations; ->AA_at_SNprefix; ->AA_at_ProffesionallAdditions)
		End if 
	Else 
		OBJECT SET ENTERABLE:C238(Vcompname; False:C215)
		OBJECT SET ENTERABLE:C238(Vtown; False:C215)
		OBJECT SET ENTERABLE:C238(Vpostcode; False:C215)
		OBJECT SET ENABLED:C1123(r1; False:C215)
		OBJECT SET ENABLED:C1123(r2; False:C215)
		OBJECT SET ENABLED:C1123(xNew; False:C215)
		// DISABLE BUTTON(xCancel)
		OBJECT SET ENABLED:C1123(xOK; False:C215)
		FORM GOTO PAGE:C247(3)
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [CONTACTS].dAsk_NewCont.Variable17"; $_t_oldMethodName)
