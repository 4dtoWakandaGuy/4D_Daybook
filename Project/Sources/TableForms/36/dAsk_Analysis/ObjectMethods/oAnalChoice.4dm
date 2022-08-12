If (False:C215)
	//object Name: [ANALYSES]dAsk_Analysis.oAnalChoice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2011 21:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ANALYSES].dAsk_Analysis.oAnalChoice"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(DB_lb_OutputArrays; $_l_Column; $_l_Row)
		
		<>Per_t_CurrentDefaultAnalCode:=GEN_at_RecordCode{$_l_Row}
End case 
ERR_MethodTrackerReturn("OBJ [ANALYSES].dAsk_Analysis.oAnalChoice"; $_t_oldMethodName)
