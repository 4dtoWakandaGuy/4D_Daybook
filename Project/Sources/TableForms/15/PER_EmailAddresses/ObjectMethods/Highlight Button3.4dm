If (False:C215)
	//object Name: [USER]PER_EmailAddresses.Highlight Button3
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
	C_TEXT:C284(<>Per_at_PersonnelNames_EmailSign; $_t_oldMethodName; PER_T_DefaultSignature)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PER_EmailAddresses.Highlight Button3"; Form event code:C388)
Gen_Confirm("Set a Signature for this account?"; "Yes"; "No")
If (OK=1)
	//HIDE WINDOW
	If (PER_T_DefaultSignature#"")
		OBJECT SET VISIBLE:C603(PER_T_DefaultSignature; True:C214)
		//Text_Expand (->PER_T_DefaultSignature;"Signature")
	Else 
		//edit the default signature
		
		PER_T_DefaultSignature:=<>Per_at_PersonnelNames_EmailSign
		//Text_Expand (->PER_T_DEf2;"Signature")
		OBJECT SET VISIBLE:C603(PER_T_DefaultSignature; True:C214)
		
	End if 
	//SHOW WINDOW
End if 
ERR_MethodTrackerReturn("OBJ [USER].PER_EmailAddresses.Highlight Button3"; $_t_oldMethodName)
