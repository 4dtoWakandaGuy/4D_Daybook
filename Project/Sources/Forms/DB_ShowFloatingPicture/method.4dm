If (False:C215)
	//Project Form Method Name: DB_ShowFloatingPicture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/10/2012 12:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_MouseActive; DB_bo_MouseActive; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; FW_l_CurrentRecord; FW_l_CUrrentTable; FW_l_ParentProcess)
	C_POINTER:C301($_ptr_Table)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM DB_ShowFloatingPicture"; Form event code:C388)
$_l_event:=Form event code:C388
SET TIMER:C645(30)

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		$_ptr_Table:=Table:C252(FW_l_CUrrentTable)
		GOTO RECORD:C242($_ptr_Table->; FW_l_CurrentRecord)
		FW_SetPosition
		SET TIMER:C645(30)
		
	: ($_l_event=On Outside Call:K2:11)
		
		
		If (FW_l_CurrentRecord>=0)
			$_ptr_Table:=Table:C252(FW_l_CUrrentTable)
			GOTO RECORD:C242($_ptr_Table->; FW_l_CurrentRecord)
			
			FW_SetPosition
			
		Else 
			CANCEL:C270
		End if 
		
	: ($_l_event=On Timer:K2:25) & (Not:C34(DB_bo_NoLoad))
		
		
		
		
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton; *)
		If ($_l_MouseX<$_l_WindowLeft) | ($_l_MouseX>$_l_WindowRight) | ($_l_MouseY<$_l_windowTop) | ($_l_MouseY>$_l_WindowBottom)
			
			GET PROCESS VARIABLE:C371(FW_l_ParentProcess; DB_bo_MouseActive; $_bo_MouseActive)
			If (Not:C34($_bo_MouseActive))
				HIDE WINDOW:C436
				SET TIMER:C645(0)
			End if 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("FM DB_ShowFloatingPicture"; $_t_oldMethodName)
