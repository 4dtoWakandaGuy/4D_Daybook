If (False:C215)
	//object Name: [PERSONNEL]Ask_Person.oLCS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 12:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ABC_lb_LCS;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; ACC_t_LoginPassword)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Ask_Person.oLCS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(ABC_lb_LCS; $_l_Column; $_l_Row)
		
		<>PER_t_CurrentUserInitials:=GEN_at_RecordCode{$_l_Row}
		If (Current user:C182="Designer")
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
			
		End if 
		
		
		
		If (($_l_Row<=Size of array:C274(GEN_at_Name)) & ($_l_Row>0))
			If (GEN_at_Identity{$_l_Row}="")
				Ask_PersonOK(ACC_t_LoginPassword)
			Else 
				Ask_PersonSel
				GOTO OBJECT:C206(*; "oACCLoginPasswordEnter")
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Ask_Person.oLCS"; $_t_oldMethodName)
