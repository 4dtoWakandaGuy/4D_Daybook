If (False:C215)
	//object Method Name: Object Name:      [WORKFLOW_CONTROL].Workflow_Control_In.oWorkflowType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/10/2010 10:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_WorkflowType;0)
	C_LONGINT:C283($_l_Distance; $_l_event; $_l_ObjectBottom; $_l_ObjectBottom2; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oWorkflowType"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (SD2_at_WorkflowType=1)
				$_l_Distance:=623-577
				OBJECT GET COORDINATES:C663(*; "oWFActionCode"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				WS_AutoscreenSize(2; ($_l_ObjectBottom+$_l_Distance)+10; $_l_WindowRight-$_l_WindowLeft)
				OBJECT GET COORDINATES:C663(*; "oWorkflowType"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom2)
				
				$_l_ObjectBottom:=Gen_SetobjectPositionByname("oWorkflowType"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom)
				INT_SetDialog
				
			: (SD2_at_WorkflowType=2)
				$_l_Distance:=747-701
				
				OBJECT GET COORDINATES:C663(*; "oOnCompletedP2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				
				WS_AutoscreenSize(2; ($_l_ObjectBottom+$_l_Distance)+10; $_l_WindowRight-$_l_WindowLeft)
				OBJECT GET COORDINATES:C663(*; "oOnCompletedP2"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom2)
				
				$_l_ObjectBottom:=Gen_SetobjectPositionByname("oWorkflowType"; $_l_ObjectTop; $_l_ObjectLeft; $_l_ObjectBottom)
				
				INT_SetDialog
				
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_CONTROL].Workflow_Control_In.oWorkflowType"; $_t_oldMethodName)
