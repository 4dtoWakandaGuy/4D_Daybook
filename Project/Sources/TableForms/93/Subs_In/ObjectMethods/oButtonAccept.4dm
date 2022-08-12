If (False:C215)
	//object Name: [SUBSCRIPTIONS]Subs_In.Invisible Button4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 03:51
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [SUBSCRIPTIONS].Subs_In.Invisible Button4"; Form event code:C388)
Case of 
	: (FORM Get current page:C276=1)
		If ([SUBSCRIPTIONS:93]Type:7="")
			Gen_Alert("you must set a billing type to save a subscriptions billing record")
		Else 
			ACCEPT:C269
		End if 
	: (FORM Get current page:C276=2)
		If ([SUBSCRIPTIONS:93]After_Number:5>0)
			If ([SUBSCRIPTIONS:93]Renewals_Document_Reference:15="")
				Gen_Confirm("You have not selected a default renewals document is that ok?"; "Yes"; "No")
				If (OK=1)
					ACCEPT:C269
				End if 
				OK:=1
			Else 
				ACCEPT:C269
			End if 
			
		Else 
			Gen_Alert("You must set an issue number after which to send the renewals reminder")
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [SUBSCRIPTIONS].Subs_In.Invisible Button4"; $_t_oldMethodName)
