If (False:C215)
	//object Name: [USER]PER_EmailAddresses.Highlight Button1
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
	//ARRAY TEXT(PER_at_DefaultHostAddresses;0)
	//ARRAY TEXT(PER_at_EmailAddresses;0)
	//ARRAY TEXT(PER_at_EmailNames;0)
	//ARRAY TEXT(PER_at_DefaultSignatures;0)
	C_BOOLEAN:C305(USR_bo_Modified)
	C_LONGINT:C283(PER_l_CurrentSelected)
	C_TEXT:C284($_t_oldMethodName; PER_t_DefaultHostAddress; PER_t_EmailAddress; PER_t_EmailName; PER_T_DefaultSignature)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PER_EmailAddresses.Highlight Button1"; Form event code:C388)
If (PER_l_CurrentSelected>0)
	Gen_Confirm("Delete "+PER_t_EmailName+"?")
	If (OK=1)
		DELETE FROM ARRAY:C228(PER_at_EmailNames; PER_l_CurrentSelected)
		DELETE FROM ARRAY:C228(PER_at_EmailAddresses; PER_l_CurrentSelected)
		DELETE FROM ARRAY:C228(PER_at_DefaultHostAddresses; PER_l_CurrentSelected)
		DELETE FROM ARRAY:C228(PER_at_DefaultSignatures; PER_l_CurrentSelected)
		PER_l_CurrentSelected:=-1
		PER_t_EmailAddress:=""
		PER_t_EmailName:=""
		PER_t_DefaultHostAddress:=""
		PER_T_DefaultSignature:=""
		OBJECT SET VISIBLE:C603(PER_T_DefaultSignature; False:C215)
		USR_bo_Modified:=True:C214
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].PER_EmailAddresses.Highlight Button1"; $_t_oldMethodName)
