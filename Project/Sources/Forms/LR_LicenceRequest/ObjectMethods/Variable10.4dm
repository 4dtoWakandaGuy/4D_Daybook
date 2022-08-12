If (False:C215)
	//object Name: Object Name:      LR_LicenceRequest.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; xOK)
	C_TEXT:C284($_t_oldMethodName; DB_t_PathName; vTitle4; vTitle5; vTitle7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.Variable10")

$_t_oldMethodName:=ERR_MethodTracker("OBJ LR_LicenceRequest.Variable10"; Form event code:C388)
//
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		//OK:=1
		//If (vTitle7#"")
		//Gen_Confirm ("NB: After changing your Licence No any additions made by "
		//+"'Disk Updates' will need to be reinstalled.")
		// If (OK=0)
		// ◊PathName:=vTitle7
		// End if
		//End if
		//If (OK=1)
		//Path_CheckLUDel
		
		
		If (DB_t_PathName#"")
			DB_t_PathName:=DB_LICENCECODETEST(DB_t_PathName)
			
			
			//Path_Check
		End if 
		If (DB_t_PathName="")
			
			GOTO OBJECT:C206(DB_t_PathName)
			vTitle5:="Not Accepted"
		Else 
			vTitle5:="Accepted"
		End if 
		vTitle4:="Required"
		//[USER]Path Name:=<>PathName
		//[USER]Limit Date:=!00/00/00!
		OBJECT SET ENABLED:C1123(xOK; False:C215)
		vTitle7:=DB_t_PathName
		//End if
End case 

//
ERR_MethodTrackerReturn("OBJ LR_LicenceRequest.Variable10"; $_t_oldMethodName)
