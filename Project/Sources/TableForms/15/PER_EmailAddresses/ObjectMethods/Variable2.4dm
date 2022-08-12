If (False:C215)
	//object Name: [USER]PER_EmailAddresses.Variable2
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
	C_LONGINT:C283(PER_l_CurrentSelected)
	C_TEXT:C284($_t_oldMethodName; PER_t_DefaultHostAddress; PER_t_EmailAddress; PER_t_EmailName; PER_T_DefaultSignature)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PER_EmailAddresses.Variable2"; Form event code:C388)
If (PER_l_CurrentSelected#0)
	If (PER_t_EmailName#"") | (PER_t_EmailAddress#"")
		If (PER_t_EmailName="")
			PER_t_EmailName:=PER_t_EmailAddress
		End if 
		Gen_Confirm("Save "+PER_t_EmailName+"?")
		If (OK=1)
			If (PER_l_CurrentSelected<0)
				INSERT IN ARRAY:C227(PER_at_EmailNames; Size of array:C274(PER_at_EmailNames)+1; 1)
				INSERT IN ARRAY:C227(PER_at_EmailAddresses; Size of array:C274(PER_at_EmailAddresses)+1; 1)
				INSERT IN ARRAY:C227(PER_at_DefaultHostAddresses; Size of array:C274(PER_at_EmailAddresses)+1; 1)
				INSERT IN ARRAY:C227(PER_at_DefaultSignatures; Size of array:C274(PER_at_EmailAddresses)+1; 1)
				PER_l_CurrentSelected:=Size of array:C274(PER_at_EmailAddresses)
			End if 
			PER_at_EmailNames{PER_l_CurrentSelected}:=PER_t_EmailName
			PER_at_EmailAddresses{PER_l_CurrentSelected}:=PER_t_EmailAddress
			PER_at_DefaultHostAddresses{PER_l_CurrentSelected}:=PER_t_DefaultHostAddress
			PER_at_DefaultSignatures{PER_l_CurrentSelected}:=PER_T_DefaultSignature
		End if 
		
	End if 
End if 
PER_l_CurrentSelected:=-1
PER_t_EmailName:=""
PER_t_EmailAddress:=""
PER_t_DefaultHostAddress:=""
PER_T_DefaultSignature:=""
OBJECT SET VISIBLE:C603(PER_T_DefaultSignature; False:C215)
ERR_MethodTrackerReturn("OBJ [USER].PER_EmailAddresses.Variable2"; $_t_oldMethodName)