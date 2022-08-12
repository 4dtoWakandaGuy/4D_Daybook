If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Label.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; Vt5Choose)
	C_TEXT:C284($_t_oldMethodName; vT5Document)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Label.Variable5"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		OBJECT SET VISIBLE:C603(Vt5Choose; False:C215)
		OBJECT SET VISIBLE:C603(vT5Document; False:C215)
End case 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dAsk_Label.Variable5"; $_t_oldMethodName)
