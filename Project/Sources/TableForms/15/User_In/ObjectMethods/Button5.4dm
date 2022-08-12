If (False:C215)
	//object Name: [USER]User_In.Button5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 13:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($_boj_InputData)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(SP_at_ScriptCode;0)
	//ARRAY TEXT(SP_at_ScriptName;0)
	C_BOOLEAN:C305(Gen_bo_Create; GEN_Bo_ShowCreate)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; $_l_CurrentWinRefOLD; $_l_Index; $_l_OwnerClass; $_l_SystemClass; BPR_SPOrderAmount0; BPR_SPOrderAmount1; BPR_SPOrderAmount2; SCRIPT_l_SetScriptClass; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_CloseSave; $_t_oldMethodName; DB_t_CallOnCloseorSave; DB_t_WindowTitle; SP_t_ProjectCostScript)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Button5"; Form event code:C388)
Gen_Alert("The Cost calculation Macro must put the result into the variable M_Returnamount")
$_l_OwnerClass:=Owner Sales Pipeline Macro
$_l_SystemClass:=System Sales Pipeline Macro
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Class:11=$_l_OwnerClass; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Class:11=$_l_SystemClass)
SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; SP_at_ScriptCode; [SCRIPTS:80]Script_Name:2; SP_at_ScriptName)
ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
COPY ARRAY:C226(SP_at_ScriptName; GEN_at_DropDownMenu)
ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(GEN_at_DropDownMenu))
For ($_l_Index; 1; Size of array:C274(GEN_at_DropDownMenu))
	GEN_al_DropDownMenuID{$_l_Index}:=$_l_Index
End for 
DB_t_WindowTitle:="Select Macro to use"
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1986)
GEN_Bo_ShowCreate:=True:C214
DIALOG:C40([USER:15]; "Gen_PopUpChoice")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (Gen_bo_Create)
	<>DB_at_TableNamesMacro:=Table:C252(->[PROJECTS:89])
	If (Current user:C182="Designer")
		SCRIPT_l_SetScriptClass:=System Sales Pipeline Macro
	Else 
		SCRIPT_l_SetScriptClass:=Owner Sales Pipeline Macro
	End if 
	$_t_CloseSave:=DB_t_CallOnCloseorSave
	UNLOAD RECORD:C212([SCRIPTS:80])
	DB_t_CallOnCloseorSave:=""
	$_boj_InputData:=New object:C1471("TableNumber"; Table:C252(->[SCRIPTS:80]); "Format"; "Scripts"; "RecordTitle"; "Script")
	
	//Minor_In(->[SCRIPTS]; "Macros_In"; "Macros")
	DB_t_CallOnCloseorSave:=$_t_CloseSave
	SP_t_ProjectCostScript:=[SCRIPTS:80]Script_Code:1
	
	BPR_SPOrderAmount2:=1
	BPR_SPOrderAmount1:=0
	BPR_SPOrderAmount0:=0
	UNLOAD RECORD:C212([SCRIPTS:80])
Else 
	If (GEN_at_DropDownMenu>0)
		SP_t_ProjectCostScript:=SP_at_ScriptCode{GEN_at_DropDownMenu}
		
		BPR_SPOrderAmount2:=1
		BPR_SPOrderAmount1:=0
		BPR_SPOrderAmount0:=0
		
	Else 
		SP_t_ProjectCostScript:=""
		
		BPR_SPOrderAmount0:=1
		BPR_SPOrderAmount2:=0
		BPR_SPOrderAmount1:=0
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:User_In,SP_l_ButSelectMacro"; $_t_oldMethodName)
