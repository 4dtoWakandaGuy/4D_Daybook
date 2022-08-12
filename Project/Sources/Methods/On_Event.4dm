//%attributes = {}
If (False:C215)
	//Project Method Name:      On_Event
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/01/2010 18:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_additionalItems; 0)
	//ARRAY TEXT(GEN_at_ContextualMenuItemFunt;0)
	//ARRAY TEXT(GEN_at_ContextualMenuItems;0)
	C_BOOLEAN:C305(<>MenuFront; <>MOD_bo_ModuleSelected; <>ScrnSavEv; <>StartProc; $_bo_CommandDown; $_bo_NoTrack; $_bo_ShiftDown; SYS_bo_NoTrack)
	C_LONGINT:C283(<>MenuProc; <>SYS_l_CancelProcess; $_l_ArraySize; $_l_ArraySizePlus; $_l_Index; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_SelectedRow; $_l_SkinsProcess; DB_l_ButtonClickedFunction)
	C_LONGINT:C283(Trap1ST)
	C_TEXT:C284(<>KEYS; <>MOD_t_ModuleExecute; $_t_oldMethodName; $_t_PopUpItems; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("On_Event")

//cant track in here
$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw

SYS_bo_NoTrack:=True:C214
//On_Event - See also On_EventW, On_EventNM, On_EventNSS & On_Event NMNSS
If (<>MenuProc=0)
	<>MenuProc:=1
End if 

DB_t_CurrentFormUsage:=""
If (Trap1ST=0)
	//GEN_GetModules (False)
	
	Trap1St:=1
End if 
GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)

Case of 
	: ((Macintosh control down:C544) & ($_l_MouseButton=1)) | ($_l_MouseButton=2)
		If (False:C215)
			$_t_PopUpItems:="About this database...<I;(-!"
		Else 
			$_t_PopUpItems:=""
		End if 
		If (Not:C34(Undefined:C82(GEN_at_ContextualMenuItems)))
			If (Size of array:C274(GEN_at_ContextualMenuItems)>0)
				For ($_l_Index; 1; Size of array:C274(GEN_at_ContextualMenuItems))
					$_t_PopUpItems:=$_t_PopUpItems+";"+GEN_at_ContextualMenuItems{$_l_Index}
				End for 
				
				$_l_ArraySize:=Size of array:C274(GEN_at_ContextualMenuItems)
				$_t_PopUpItems:=$_t_PopUpItems+";(-;"+"Volumes Palette"+";"+"Macros Palette"+";"+"Interface Options"
				
				$_l_ArraySizePlus:=$_l_ArraySize+7
				ARRAY TEXT:C222($_at_additionalItems; 3)
				//$_at_additionalItems{1}:="In_ButtProc"
				$_at_additionalItems{1}:="ZMenu_ModBar2"
				$_at_additionalItems{2}:="SCPT_LaunchPalette"
				//$_at_additionalItems{2}:="Gen_ListSet"
				//$_at_additionalItems{5}:="ProcessesP"
				$_at_additionalItems{3}:="INT_SelectSkins"
				$_t_PopUpItems:=$_t_PopUpItems+";(-;"+"Open Document"
				$_l_SelectedRow:=Pop up menu:C542($_t_PopUpItems)
				
				Case of 
					: ($_l_SelectedRow=0)
						// Display Information
					: ($_l_SelectedRow>=1) & ($_l_SelectedRow<=$_l_ArraySize)
						BRING TO FRONT:C326(<>MenuProc)
						<>MenuFront:=True:C214
						//$_t_oldMethodName:=ERR_MethodTracker ("On_Event"+GEN_at_ContextualMenuItemFunt{$_l_SelectedRow})
						EXECUTE FORMULA:C63(GEN_at_ContextualMenuItemFunt{$_l_SelectedRow})
						<>MOD_bo_ModuleSelected:=True:C214
						<>MOD_t_ModuleExecute:=GEN_at_ContextualMenuItemFunt{$_l_SelectedRow}
					: ($_l_SelectedRow>($_l_ArraySize+1)) & ($_l_SelectedRow<=$_l_ArraySizePlus)
						If ($_l_SelectedRow<19)
							//$_t_oldMethodName:=ERR_MethodTracker ("On_Event"+$_at_additionalItems{($_l_SelectedRow-$_l_ArraySize)-1})
							
							EXECUTE FORMULA:C63($_at_additionalItems{($_l_SelectedRow-$_l_ArraySize)-1})
						Else 
							$_l_SkinsProcess:=New process:C317("INT_SelectSkins"; DB_ProcessMemoryinit(1); "Set Interface Options")
						End if 
						
						
					: ($_l_SelectedRow>($_l_ArraySizePlus+1))
						//$_t_oldMethodName:=ERR_MethodTracker ("On_Event"+"DB_OpenWordDoc")
						
						EXECUTE FORMULA:C63("DB_OpenWordDoc")
				End case 
			End if 
		End if 
	: (Mousedown=0)
		$_bo_CommandDown:=(((Modifiers\256)%2)=1)
		Case of 
			: ($_bo_CommandDown)
				$_bo_ShiftDown:=(((Modifiers\512)%2)=1)
				Case of 
					: ((Keycode=87) | (Keycode=119))
						On_EventCmdW
					: ((Keycode=102) | (Keycode=70))
						SET PROCESS VARIABLE:C370(Frontmost process:C327(*); DB_l_ButtonClickedFunction; DB_GetButtonFunction("Find"))
						POST OUTSIDE CALL:C329(Frontmost process:C327(*))
					: ((Keycode=116) | (Keycode=84))
						SET PROCESS VARIABLE:C370(Frontmost process:C327(*); DB_l_ButtonClickedFunction; DB_GetButtonFunction("Sort"))
						POST OUTSIDE CALL:C329(Frontmost process:C327(*))
					: (Keycode=46)
						RESUME PROCESS:C320(Frontmost process:C327(*))
						<>SYS_l_CancelProcess:=Frontmost process:C327(*)
						POST OUTSIDE CALL:C329(Frontmost process:C327(*))
					: ($_bo_ShiftDown)
						Case of 
							: ((Keycode=72) | (Keycode=104))
								On_EventCmdH
							: ((Keycode=83) | (Keycode=115))
								On_EventCmdS
							: (Keycode=109)
								On_EventFKey
						End case 
						
					: ((Keycode=115) | (Keycode=83))
						SET PROCESS VARIABLE:C370(Frontmost process:C327(*); DB_l_ButtonClickedFunction; DB_GetButtonFunction("Select"))
						POST OUTSIDE CALL:C329(Frontmost process:C327(*))
					: (<>StartProc)
						If ((Keycode=65) | (Keycode=97) | (Keycode=77) | (Keycode=109))
							<>Keys:=<>Keys+"§"+Char:C90(Keycode)
							If (Length:C16(<>Keys)>21)
								<>StartProc:=False:C215
							End if 
						End if 
				End case 
			: (Keycode<0)
				On_EventFKey
			: (<>StartProc)
				<>Keys:=<>Keys+Char:C90(Keycode)
				If (Length:C16(<>Keys)>21)
					<>StartProc:=False:C215
				End if 
				
		End case 
End case 
SYS_bo_NoTrack:=$_bo_NoTrack
<>ScrnSavEv:=True:C214
//ERR_MethodTrackerReturn ("On_Event";$_t_oldMethodName)
