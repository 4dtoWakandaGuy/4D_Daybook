If (False:C215)
	//object Name: [COMPANIES]dAsk_Apply.oGoBack
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; s1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_Apply.oGoBack"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (s1=1)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+450; $_l_windowTop+120)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_Apply.oGoBack"; $_t_oldMethodName)
