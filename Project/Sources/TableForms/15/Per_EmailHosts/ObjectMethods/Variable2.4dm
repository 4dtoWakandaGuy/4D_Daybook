If (False:C215)
	//object Name: [USER]Per_EmailHosts.Variable2
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
	//ARRAY TEXT(PER_at_EmailHostNames;0)
	C_BOOLEAN:C305(USR_bo_Modified)
	C_LONGINT:C283(PER_l_CurrentSelected)
	C_TEXT:C284($_t_oldMethodName; PER_t_EmailHostName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Per_EmailHosts.Variable2"; Form event code:C388)
If (PER_l_CurrentSelected#0)
	If (PER_t_EmailHostName#"")
		
		Gen_Confirm("Save "+PER_t_EmailHostName+"?")
		If (OK=1)
			If (PER_l_CurrentSelected<0)
				INSERT IN ARRAY:C227(PER_at_EmailHostNames; Size of array:C274(PER_at_EmailHostNames)+1; 1)
				PER_l_CurrentSelected:=Size of array:C274(PER_at_EmailHostNames)
			End if 
			PER_at_EmailHostNames{PER_at_EmailHostNames}:=PER_t_EmailHostName
			USR_bo_Modified:=True:C214
		End if 
		
	End if 
End if 
PER_l_CurrentSelected:=-1
PER_t_EmailHostName:=""
ERR_MethodTrackerReturn("OBJ [USER].Per_EmailHosts.Variable2"; $_t_oldMethodName)