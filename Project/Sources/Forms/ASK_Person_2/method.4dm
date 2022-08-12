If (False:C215)
	//Project Form Method Name:      ASK_Person_2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 12:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(GEN_at_Name;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PW_Bo_shake)
	C_LONGINT:C283($_l_ArraySize; $_l_Event; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WinHeight; PW_l_SHakeCount; PW_l_WinBottom; PW_l_WinBottom2; PW_l_winLeft)
	C_LONGINT:C283(PW_l_winLeft2; PW_l_WinRIght; PW_l_WinRIght2; PW_l_Wintop; PW_l_Wintop2; xCancel)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284(<>DB_t_PassLock; <>DB_t_Password; $_t_oldMethodName; WS_t_Password)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM ASK_Person_2"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
		<>PictLogoMed:=Get_Picture(20240)
		SPLASH_HIDE
		
		If (Current user:C182="Designer") & (Not:C34(Is compiled mode:C492))
			OBJECT SET VISIBLE:C603(WS_t_Password; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(WS_t_Password; False:C215)
		End if 
		GEN_at_Name:=1
		
		If (Is Windows:C1573)
			OBJECT SET TITLE:C194(xCancel; "Exit")
			// Else
			
		End if 
		OBJECT SET FONT:C164(<>DB_t_Password; "%Password")
		OBJECT SET FONT SIZE:C165(<>DB_t_Password; 12)
		<>DB_t_PassLock:=""
		ON EVENT CALL:C190("")
		ON EVENT CALL:C190("On_EventID"; "$Events")
		$_l_ArraySize:=((Size of array:C274(GEN_at_Name))*12)
		If ($_l_ArraySize>600)
			$_l_ArraySize:=600
		Else 
			If ($_l_ArraySize<335)
				$_l_ArraySize:=335
			End if 
		End if 
		$_l_WinHeight:=$_l_ArraySize+(504-(335))
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		WS_AutoscreenSize(2; $_l_WinHeight; $_l_WindowRight-$_l_WindowLeft)
		
		INT_SetDialog
	: ($_l_Event=On Outside Call:K2:11)
		
		If (PW_Bo_shake)
			//TRACE
			If (PW_l_SHakeCount=0)
				GET WINDOW RECT:C443(PW_l_winLeft; PW_l_Wintop; PW_l_WinRIght; PW_l_WinBottom)
				
			End if 
			Repeat 
				If (PW_l_SHakeCount<10)
					GET WINDOW RECT:C443(PW_l_winLeft2; PW_l_Wintop2; PW_l_WinRIght2; PW_l_WinBottom2)
					If (PW_l_winLeft2<PW_l_winLeft)
						SET WINDOW RECT:C444(PW_l_winLeft+10; PW_l_Wintop; PW_l_WinRIght+10; PW_l_WinBottom)
					Else 
						SET WINDOW RECT:C444(PW_l_winLeft-10; PW_l_Wintop; PW_l_WinRIght-10; PW_l_WinBottom)
					End if 
					PW_l_SHakeCount:=PW_l_SHakeCount+1
					DELAY PROCESS:C323(Current process:C322; 1)
					//CALL PROCESS(Current process)
				Else 
					PW_l_SHakeCount:=0
					PW_Bo_shake:=False:C215
					SET WINDOW RECT:C444(PW_l_winLeft; PW_l_Wintop; PW_l_WinRIght; PW_l_WinBottom)
				End if 
			Until (PW_l_SHakeCount>=10)
			PW_l_SHakeCount:=0
		End if 
	: ($_l_Event=On Clicked:K2:4)
		
		$_l_ArraySize:=((Size of array:C274(GEN_at_Name))*12)
		If ($_l_ArraySize>600)
			$_l_ArraySize:=600
		Else 
			If ($_l_ArraySize<335)
				$_l_ArraySize:=335
			End if 
		End if 
		$_l_WinHeight:=$_l_ArraySize+(504-(335))
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
		
		WS_AutoscreenSize(2; $_l_WinHeight; $_l_WindowRight-$_l_WindowLeft)
		
End case 
ERR_MethodTrackerReturn("FM ASK_Person_2"; $_t_oldMethodName)
