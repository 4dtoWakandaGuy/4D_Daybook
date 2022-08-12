//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_EditLst
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:15
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(MAC_at_aMacroCode;0)
	//ARRAY TEXT(MAC_at_aMacroText;0)
	C_BOOLEAN:C305($_bo_AddRecord; SCPT_bo_RunFromArrays; vFromIn)
	C_LONGINT:C283(<>SCPT_l_PaletteWIndow; $_l_CallBackProcess; $_l_ProcessState; $_l_ProcessTime; $_l_RecordsInSelection; $_l_SetCallBack; $_l_UpdateIndex; $2; MOD_l_CurrentModuleAccess; SCPT_l_EditScriptProcess; SCPT_l_ExecutionState)
	C_LONGINT:C283(vAdd)
	C_TEXT:C284($_t_AddToTableNamed; $_t_oldMethodName; $_t_ProcessName; $_t_ScriptEditCode; $_t_TableScripts; $_t_TranslatedText; $1; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_EditLst")

If (Count parameters:C259>=1)
	$_t_ScriptEditCode:=$1
Else 
	$_t_ScriptEditCode:=""
End if 
If (Count parameters:C259>=2)
	$_l_CallBackProcess:=$2
Else 
	$_l_CallBackProcess:=0
End if 
$_t_AddToTableNamed:=""
If (Count parameters:C259>=3)
	$_t_AddToTableNamed:=$3
End if 
Start_Process
//`Load the macro codes that get called when editing a macro
$_t_TableScripts:=String:C10(Table:C252(->[SCRIPTS:80]))
If (False:C215)
	READ ONLY:C145([SCRIPTS:80])
	QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="Accept "+$_t_TableScripts+"@"; *)
	QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Load "+$_t_TableScripts+"@"; *)
	QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Enter "+$_t_TableScripts+"@"; *)
	QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="View"+$_t_TableScripts+"@"; *)
	QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="During"+$_t_TableScripts+"@"; *)
	QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Modified"+$_t_TableScripts+"@"; *)
	QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Background"+$_t_TableScripts+"@")
	//see also IME_MacroMem & Macros_InLPA
	$_l_RecordsInSelection:=Records in selection:C76([SCRIPTS:80])
	ARRAY TEXT:C222(MAC_at_aMacroCode; $_l_RecordsInSelection)
	ARRAY TEXT:C222(MAC_at_aMacroText; $_l_RecordsInSelection)
	If ($_l_RecordsInSelection>0)
		
		SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; MAC_at_aMacroCode; [SCRIPTS:80]Recording_Text:4; MAC_at_aMacroText)
		For ($_l_UpdateIndex; 1; Size of array:C274(MAC_at_aMacroText))  //NG May 2004
			$_t_TranslatedText:=Macro_PlatformTranslate(->MAC_at_aMacroText{$_l_UpdateIndex})
		End for 
		//
	End if 
End if 

UNLOAD RECORD:C212([SCRIPTS:80])
SCPT_bo_RunFromArrays:=True:C214
$_l_SetCallBack:=-3
If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
	Start_ProcCount("Edit Macro")
	Macros_File
	MOD_l_CurrentModuleAccess:=1
	DB_t_CurrentFormUsage:=""
	$_bo_AddRecord:=False:C215
	If ($_t_ScriptEditCode="")
		If (Count parameters:C259=0)
			PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ProcessName)
		Else 
			REDUCE SELECTION:C351([SCRIPTS:80]; 0)
			$_bo_AddRecord:=True:C214
		End if 
	Else 
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptEditCode)
	End if 
	
	If (Records in selection:C76([SCRIPTS:80])=1)
		Open_Pro_Window("Edit Macro"; 0; 2; ->[SCRIPTS:80]; WIN_t_CurrentInputForm)
		vAdd:=0
		vFromIn:=False:C215
		MODIFY RECORD:C57([SCRIPTS:80]; *)
		Close_ProWin(Table name:C256(->[SCRIPTS:80])+"_"+WIN_t_CurrentInputForm)
		
		//   If (◊RecEditUp#0)
		
	Else 
		If ($_bo_AddRecord)
			//Open_Pro_Window ("Edit Macro";0;2;->[MACROS];WIN_t_CurrentInputForm)
			DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[SCRIPTS:80]); True:C214)
			$_l_SetCallBack:=-4
			
		End if 
		
		
	End if 
	//  End if
End if 
Process_End
UNLOAD RECORD:C212([SCRIPTS:80])
READ ONLY:C145([SCRIPTS:80])
If ($_l_CallBackProcess>0)
	SHOW PROCESS:C325($_l_CallBackProcess)
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; SCPT_l_EditScriptProcess; 0)
	SET PROCESS VARIABLE:C370($_l_CallBackProcess; SCPT_l_ExecutionState; $_l_SetCallBack)
End if 
ERR_MethodTrackerReturn("Record_EditLst"; $_t_oldMethodName)
