If (False:C215)
	//object Name: [CONTRACTS]Contract_in.oEndDateButton
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; $_t_password)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.oEndDateButton"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_t_password:=Gen_Request("Please enter the administrator password to modify the date of this contract"; "")
		If ($_t_password="Timur")
			OBJECT SET ENTERABLE:C238([CONTRACTS:17]End_Date:6; True:C214)
			GOTO OBJECT:C206([CONTRACTS:17]End_Date:6)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.oEndDateButton"; $_t_oldMethodName)
