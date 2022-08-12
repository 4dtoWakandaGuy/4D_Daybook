//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_FKey
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 10:13`Method: Record_FKey
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MAC_al_Selected;0)
	ARRAY TEXT:C222($_at_SelectedScriptCodes; 0)
	//ARRAY TEXT(MAC_at_MacroCodes;0)
	//ARRAY TEXT(MAC_at_MacroNames;0)
	C_BOOLEAN:C305(<>StartProc; <>SYS_bo_StopMacros)
	C_LONGINT:C283(<>AutoProc; <>MenuProc; <>SCPT_l_PaletteWIndow; <>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_FrontmostProcess; $_l_Index; $_l_key; $1; DB_l_ButtonClickedFunction; SCPT_l_Cancel)
	C_TEXT:C284(<>KEYS; <>PER_t_CurrentUserInitials; <>RECTEXT; <>vMacroCode; $_t_CurrentOutputform; $_t_oldMethodName; $_t_ScriptCode; $_t_ScriptText; $_t_Search; $2; DB_t_ButtonClickedFunction)
	C_TEXT:C284(DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; viSearch; vMacroCode; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_FKey")
//Record_FKey
$_t_CurrentOutputform:=WIN_t_CurrentOutputform
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (Count parameters:C259>=1)
	$_l_key:=$1
Else 
	$_l_key:=<>AutoProc
End if 
OK:=1
If (Count parameters:C259>=2)
	$_t_ScriptCode:=$2
Else 
	$_t_ScriptCode:=<>vMacroCode
End if 
READ ONLY:C145([SCRIPTS:80])
If (($_l_key=109) | ($_l_key>=1000))  //ie is Command-Shift M or comes from Macro_MenuFile
	Process_StartAr(Current process:C322; "Macro Select")
	Start_Process
	<>StartProc:=True:C214
	<>Keys:=""
	If (Count parameters:C259>=2)
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$2)
	Else 
		Macros_Sel
	End if 
	If ((OK=1) & (Records in selection:C76([SCRIPTS:80])>1))
		//vNo:=Records in selection([MACROS])
		//Userset_Empty (->[MACROS])
		//OUTPUT FORM([MACROS];"Scripts_Out")
		//WIN_t_CurrentOutputform:="Scripts_Out"
		//Layout:="Select"
		//Open_Pro_Window ("Select a Macro to Play";0;1;->[MACROS];WIN_t_CurrentOutputform)
		//FS_SetFormSort (WIN_t_CurrentOutputform)
		//WIn_SetFormSize (1;->[MACROS];WIN_t_CurrentOutputform)
		//D`ISPLAY SELECTION([MACROS];*)
		//Userset
		//Close_ProWin
		SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; MAC_at_MacroCodes; [SCRIPTS:80]Script_Name:2; MAC_at_MacroNames)
		SORT ARRAY:C229(MAC_at_MacroNames; MAC_at_MacroCodes)
		ARRAY LONGINT:C221(MAC_al_Selected; 0)
		ARRAY LONGINT:C221(MAC_al_Selected; Size of array:C274(MAC_at_MacroCodes))
		GEN_AskSelectionONE(260; 180; "Please Select a Macro"; "Macros.."; ->MAC_al_Selected; "MAC_at_MacroNames"; "Macro"; "210"; "False"; "MAC_at_MacroCodes"; "Code"; "90"; "False")
		ARRAY TEXT:C222($_at_SelectedScriptCodes; 0)
		For ($_l_Index; 1; Size of array:C274(MAC_al_Selected))
			If (MAC_al_Selected{$_l_Index}>0)
				APPEND TO ARRAY:C911($_at_SelectedScriptCodes; MAC_at_MacroCodes{MAC_al_Selected{$_l_Index}})
			End if 
		End for 
		If (Size of array:C274($_at_SelectedScriptCodes)>0)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_at_SelectedScriptCodes{1})
		End if 
	End if 
Else 
	Start_Process
	viSearch:=""
	Process_StartAr(Current process:C322; "Macro FKey")
	$_t_Search:=""
	Case of 
		: ($_l_key=-122)
			$_t_Search:="1"
		: ($_l_key=-120)
			$_t_Search:="2"
		: ($_l_key=-99)
			$_t_Search:="3"
		: ($_l_key=-118)
			$_t_Search:="4"
		: ($_l_key=-96)
			$_t_Search:="5"
		: ($_l_key=-97)
			$_t_Search:="6"
		: ($_l_key=-98)
			$_t_Search:="7"
		: ($_l_key=-100)
			$_t_Search:="8"
		: ($_l_key=-101)
			$_t_Search:="9"
		: ($_l_key=-109)
			$_t_Search:="10"
		: ($_l_key=-103)
			$_t_Search:="11"
		: ($_l_key=-111)
			$_t_Search:="12"
		: ($_l_key=-105)
			$_t_Search:="13"
		: ($_l_key=-107)
			$_t_Search:="14"
		: ($_l_key=-113)
			$_t_Search:="15"
	End case 
	//if the use presses the fkey twice the macros will run twice!!!
	
	While (Semaphore:C143("$"+"HOLDFKEY"+$_t_Search))
		DelayTicks(60*2)
	End while 
	
	
	If ($_t_Search#"")
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3=$_t_Search; *)
		QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5=<>PER_t_CurrentUserInitials)
		If (Records in selection:C76([SCRIPTS:80])=0)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Keystroke:3=$_t_Search; *)
			QUERY:C277([SCRIPTS:80];  & ; [SCRIPTS:80]Person:5="")
		End if 
	End if 
End if 
If ((OK=1) & (Records in selection:C76([SCRIPTS:80])>0))
	If ([SCRIPTS:80]Script_status:13#Disabled)
		vMacroCode:=[SCRIPTS:80]Script_Code:1
		$_l_FrontmostProcess:=Frontmost process:C327(*)
		If (([SCRIPTS:80]Same_Process:6) & ($_l_FrontmostProcess#<>MenuProc))
			RESUME PROCESS:C320($_l_FrontmostProcess)
			If (Application type:C494#4D Server:K5:6)
				SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("M:"))
				SET PROCESS VARIABLE:C370($_l_FrontmostProcess; DB_t_ButtonClickedFunction; "F:"+[SCRIPTS:80]Script_Code:1)
				POST OUTSIDE CALL:C329($_l_FrontmostProcess)
			End if 
		Else 
			<>SYS_l_CancelProcess:=0
			SCPT_l_Cancel:=0
			<>SYS_bo_StopMacros:=False:C215
			$_t_ScriptText:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "$"; "SCPT_")
			Record_Play(1; $_t_ScriptText; False:C215; [SCRIPTS:80]Script_Code:1)
			
			
			
		End if 
	End if 
	
End if 
Process_End
CLEAR SEMAPHORE:C144("$"+"HOLDFKEY"+$_t_Search)
WIN_t_CurrentOutputform:=$_t_CurrentOutputform
ERR_MethodTrackerReturn("Record_FKey"; $_t_oldMethodName)
