If (False:C215)
	//object Name: [USER]BK_FileOptions.Pop-up%2FDrop-down List15
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DM_at_OrderTerms;0)
	C_BOOLEAN:C305(DM_Bo_Modified)
	C_LONGINT:C283($_l_event; DM_l_CurrentOptions)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderTerms; DM_t_OrderTerms)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List15"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (DM_at_OrderTerms>0)
			$_t_OrderTerms:=DM_at_OrderTerms{DM_at_OrderTerms}
			If ($_t_OrderTerms#DM_t_OrderTerms)
				If (DM_t_OrderTerms#"") & (DM_l_CurrentOptions>0)
					Gen_Confirm("Change default Delivery terms from"+DM_t_OrderTerms+" to "+$_t_OrderTerms; "Yes"; "No")
					If (OK=1)
						DM_t_OrderTerms:=$_t_OrderTerms
						DM_Bo_Modified:=True:C214
					End if 
				Else 
					DM_t_OrderTerms:=$_t_OrderTerms
					DM_Bo_Modified:=True:C214
				End if 
			End if 
		End if 
End case 
DM_at_OrderTerms:=0
ERR_MethodTrackerReturn("OBJ [USER].BK_FileOptions.Pop-up/Drop-down List15"; $_t_oldMethodName)