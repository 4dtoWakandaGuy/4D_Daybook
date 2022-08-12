//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macros_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/04/2011 18:15 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY LONGINT(SMC_al_ScriptStatus;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	//ARRAY TEXT(<>SCPT_at_ScriptCommands;0)
	//ARRAY TEXT(<>SYS_at_2DFieldNames;0)
	//ARRAY TEXT(<>SYS_at_CurrentTableFieldNames;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(SMC_at_ScriptStatus;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283(<>DB_at_TableNamesMacro; <>PER_l_CurrentUserID; $_l_IdentityRow; $_l_Index; $_l_offset; $_l_TableNumber; $_l_TableRow; BshowHistory; SMC_l_OwnerID; vAdd)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>RECTEXT; $_t_oldMethodName; $_t_ReplyText; SMC_T_LastModifiedData; vButtDisSCRIPT; vPerson)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_InLPB")
//Macros_InLPB
ARRAY TEXT:C222(SMC_at_ScriptStatus; 0)
ARRAY LONGINT:C221(SMC_al_ScriptStatus; 0)

Gen_GetConstantsList("Macro Status"; ->SMC_at_ScriptStatus; ->SMC_al_ScriptStatus)
SORT ARRAY:C229(SMC_at_ScriptStatus; SMC_al_ScriptStatus)
If ([SCRIPTS:80]Script_status:13=0)
	If ([SCRIPTS:80]Script_Code:1#"")
		[SCRIPTS:80]Script_status:13:=SMC_al_ScriptStatus{Find in array:C230(SMC_at_ScriptStatus; "Active")}
	Else 
		[SCRIPTS:80]Script_status:13:=SMC_al_ScriptStatus{Find in array:C230(SMC_at_ScriptStatus; "Active in Testing")}
	End if 
	
End if 

SMC_at_ScriptStatus:=Find in array:C230(SMC_al_ScriptStatus; [SCRIPTS:80]Script_status:13)

SMC_T_LastModifiedData:=""
If ([SCRIPTS:80]Script_Code:1#"")
	If ([SCRIPTS:80]Script_Code:1#"Untitled@")
		If (vAdd=1)
			[SCRIPTS:80]Script_Code:1:=Uppers2([SCRIPTS:80]Script_Code:1)
		End if 
		GOTO OBJECT:C206([SCRIPTS:80]Script_Name:2)
	End if 
Else 
	[SCRIPTS:80]Person:5:=<>PER_t_CurrentUserInitials
	If (vButtDisSCRIPT="IM@")
		[SCRIPTS:80]Recording_Text:4:=<>RecText
	End if 
End if 
If ([SCRIPTS:80]Script_Code:1="")
	[SCRIPTS:80]Same_Process:6:=True:C214
End if 
RELATE ONE:C42([SCRIPTS:80]Person:5)
vPerson:=[PERSONNEL:11]Name:2

Array_CopyFiles
SORT ARRAY:C229(GEN_at_Identity)
INSERT IN ARRAY:C227(GEN_at_Identity; 1; 1)
GEN_at_Identity{1}:="Unspecified"
$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; [SCRIPTS:80]Table_Number:8)
If ($_l_TableRow>0)
	$_l_IdentityRow:=Find in array:C230(GEN_at_Identity; <>DB_at_TableNames{$_l_TableRow})
	GEN_at_Identity:=$_l_IdentityRow
Else 
	GEN_at_Identity:=1
End if 

If (<>DB_at_TableNamesMacro=0)
	COPY ARRAY:C226(<>SYS_at_2DFieldNames{<>DB_at_TableNames}; <>SYS_at_CurrentTableFieldNames)
Else 
	$_l_TableRow:=Find in array:C230(<>DB_al_TableNums; <>DB_at_TableNamesMacro)
	<>DB_at_TableNames:=$_l_TableRow
	COPY ARRAY:C226(<>SYS_at_2DFieldNames{$_l_TableRow}; <>SYS_at_CurrentTableFieldNames)
End if 
<>SYS_at_CurrentTableFieldNames:=1

vButtDisSCRIPT:="I  PMO  FSSSRCADT"
Input_Buttons(->[SCRIPTS:80]; ->vButtDisSCRIPT)
//ENABLE MENU ITEM(2049;1)
DB_MenuAction("Macros"; "Paste Current Macro"; 2; "")
If (User in group:C338(Current user:C182; "Designer"))
	OBJECT SET VISIBLE:C603(BshowHistory; True:C214)
Else 
	OBJECT SET VISIBLE:C603(BshowHistory; False:C215)
	
End if 


If ([SCRIPTS:80]Script_status:13=SMC_al_ScriptStatus{Find in array:C230(SMC_at_ScriptStatus; "ACTIVE Locked")})
	$_l_offset:=0
	SMC_l_OwnerID:=0
	BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_l_OwnerID; $_l_offset)
	If (<>PER_l_CurrentUserID=SMC_l_OwnerID)
		//ask password
		$_bo_OK:=Gen_ConfirmPassword("Enter Password"; False:C215; False:C215)
		If ($_bo_OK=False:C215)
			//lock all fields
			$_l_TableNumber:=Table:C252(->[SCRIPTS:80])
			For ($_l_Index; 1; Get last field number:C255($_l_TableNumber))
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_Index)
				OBJECT SET ENTERABLE:C238($_ptr_Field->; False:C215)
			End for 
			OBJECT SET VISIBLE:C603(GEN_at_Identity; False:C215)
			OBJECT SET VISIBLE:C603(<>DB_at_TableNames; False:C215)
			OBJECT SET VISIBLE:C603(<>SYS_at_CurrentTableFieldNames; False:C215)
			OBJECT SET VISIBLE:C603(<>SCPT_at_ScriptCommands; False:C215)
			OBJECT SET VISIBLE:C603(SMC_at_ScriptStatus; False:C215)
		End if 
		
	Else 
		//lock all fields
		$_l_TableNumber:=Table:C252(->[SCRIPTS:80])
		For ($_l_Index; 1; Get last field number:C255($_l_TableNumber))
			$_ptr_Field:=Field:C253($_l_TableNumber; $_l_Index)
			OBJECT SET ENTERABLE:C238($_ptr_Field->; False:C215)
			OBJECT SET VISIBLE:C603(<>DB_at_TableNames; False:C215)
			OBJECT SET VISIBLE:C603(<>SYS_at_CurrentTableFieldNames; False:C215)
			OBJECT SET VISIBLE:C603(<>SCPT_at_ScriptCommands; False:C215)
			OBJECT SET VISIBLE:C603(SMC_at_ScriptStatus; False:C215)
		End for 
		
		
	End if 
	If ([SCRIPTS:80]Recording_Text:4#"")
		$_t_ReplyText:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4)
	End if 
	
	
End if 
ERR_MethodTrackerReturn("Macros_InLPB"; $_t_oldMethodName)