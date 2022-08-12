If (False:C215)
	//object Name: [COMPANIES]dAsk_NewComp.Variable11
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
	C_LONGINT:C283($_l_event; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_TEXT:C284($_t_oldMethodName; vCompName; VWHOLENAME)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dAsk_NewComp.Variable11"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		If (True:C214)
			//this is not ready yet!
			OBJECT GET COORDINATES:C663(vCompName; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			VcompName:=DB_DeDupCompany(VcompName; ->[COMPANIES:2]Phonetic_Name:64; $_l_WindowLeft+$_l_ObjectLeft; $_l_ObjectTop+$_l_windowTop)
			
		End if 
	: ($_l_event=On Losing Focus:K2:8)
		GOTO OBJECT:C206(VWHOLENAME)
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dAsk_NewComp.Variable11"; $_t_oldMethodName)
