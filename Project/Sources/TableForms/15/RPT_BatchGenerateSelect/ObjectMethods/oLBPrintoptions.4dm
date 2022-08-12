If (False:C215)
	//object Name: [USER]RPT_BatchGenerateSelect.oLBPrintoptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/04/2010 14:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRT_lb_PrintOptions;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].RPT_BatchGenerateSelect.oLBPrintoptions"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(PRT_lb_PrintOptions; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			Case of 
				: ($_l_Column=6)
					
					Reports_BatchGenTypeSelObjHand
			End case 
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].RPT_BatchGenerateSelect.oLBPrintoptions"; $_t_oldMethodName)
