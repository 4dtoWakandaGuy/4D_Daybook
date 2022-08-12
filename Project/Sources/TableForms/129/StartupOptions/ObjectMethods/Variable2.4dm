If (False:C215)
	//object Name: [WEBSETUP_4D]StartupOptions.Variable2
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_TestRow; GEN_cb_1; GEN_cb_2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].StartupOptions.Variable2"; Form event code:C388)


If (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	If (Current user:C182="John") | (Current user:C182="Rollo") | (Current user:C182="Bryan")
		$_l_TestRow:=Find in array:C230(Self:C308->; "Test")
		If ($_l_TestRow>0)
			Self:C308->:=$_l_TestRow
		End if 
	End if 
End if 


If (GEN_cb_1=0) & (Self:C308->>0)
	
	//CONFIRM("You wish to connect to Oracle?")
	
	// If (OK=1)
	
	// GEN_cb_1:=1
	
	//Else
	
	Self:C308->:=0
	
	//End if
	
End if 

If (GEN_cb_1=0) & (GEN_cb_2>0)
	//CONFIRM("Do you want to start the Web Server without Oracle?")
	//If (OK=1)
	// GEN_cb_2:=0
	//End if
End if 
//end
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].StartupOptions.Variable2"; $_t_oldMethodName)
