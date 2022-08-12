If (False:C215)
	//object Method Name: Object Name:      [COMPANIES].WS_TOOLBAR.Variable30
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 15:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_ContextualMenuItemFunt;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItems;0)
	C_BOOLEAN:C305(<>MenuFront; <>PER_bo_CurrentNoButtGrey)
	C_LONGINT:C283(<>BUTTPROC; <>MENU_l_BarModule; <>MenuProc; $_l_Process)
	C_PICTURE:C286(BAR_Pic_Logo)
	C_TEXT:C284(<>ButtDis; $_t_ExecuteMethodName; $_t_oldMethodName; BAR_t_Button; vSolution)
	C_TIME:C306(vTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES]WS_TOOLBAR.Variable30"; Form event code:C388)

If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (GEN_at_ContextualMenuItems>0)
	BAR_t_Button:=""
	$_t_oldMethodName:=ERR_MethodTracker(GEN_at_ContextualMenuItemFunt{GEN_at_ContextualMenuItems})
	EXECUTE FORMULA:C63(GEN_at_ContextualMenuItemFunt{GEN_at_ContextualMenuItems})
	$_t_ExecuteMethodName:=GEN_at_ContextualMenuItemFunt{GEN_at_ContextualMenuItems}
	EXECUTE METHOD:C1007($_t_ExecuteMethodName)
	<>MenuFront:=True:C214
	If (Picture size:C356(BAR_Pic_Logo)>0)
		vSolution:=Uppercase:C13(GEN_at_ContextualMenuItems{GEN_at_ContextualMenuItems})
	Else 
		vSolution:=Uppercase:C13(GEN_at_ContextualMenuItems{GEN_at_ContextualMenuItems})+Char:C90(13)+DB_GetOrganisationScreenName
	End if 
	SET WINDOW TITLE:C213(vSolution)
	Gen_SetModCol
	vSNo:=<>MENU_l_BarModule
	
	GEN_at_ContextualMenuItems:=0
	
Else 
	//If (vTime>=Current time)  `(vTime+†00:00:01†)
	$_l_Process:=ZScrnSav_Proc
	//Else
	BRING TO FRONT:C326(<>MenuProc)
	<>MenuFront:=True:C214
	Gen_SetModCol
	If (<>ButtDis#"G                ")
		<>ButtDis:="G                "
		If (<>PER_bo_CurrentNoButtGrey=False:C215)
			If (<>ButtProc>0)
				POST OUTSIDE CALL:C329(<>ButtProc)
			End if 
		End if 
	End if 
	vTime:=Current time:C178
	//End if
	
End if 
ERR_MethodTrackerReturn("OBJ:WS_TOOLBAR,GEN_at_ContextualMenuItems"; $_t_oldMethodName)
