//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(MAC_at_aMacroCode;0)
	//ARRAY TEXT(MAC_at_aMacroText;0)
	C_BOOLEAN:C305($_bo_Update; SCPT_bo_RunFromArrays)
	C_LONGINT:C283(<>AutoProc; $_l_CountRecords; $_l_Index; vP)
	C_TEXT:C284(<>SerialNo; $_t_oldMethodName; $_t_ReplyText; $_t_TableNumberString)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_Mod")
READ ONLY:C145([PERSONNEL:11])
//NG November 2007 in order to correctly enable macros to be associated with the fields here.
$_t_TableNumberString:=String:C10(Table:C252(->[SCRIPTS:80]))

READ ONLY:C145([SCRIPTS:80])
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="Accept "+$_t_TableNumberString+"@"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Load "+$_t_TableNumberString+"@"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Enter "+$_t_TableNumberString+"@"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="View"+$_t_TableNumberString+"@"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="During"+$_t_TableNumberString+"@"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Modified"+$_t_TableNumberString+"@"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="Background"+$_t_TableNumberString+"@")
//see also IME_MacroMem & Macros_InLPA
$_l_CountRecords:=Records in selection:C76([SCRIPTS:80])
ARRAY TEXT:C222(MAC_at_aMacroCode; $_l_CountRecords)
ARRAY TEXT:C222(MAC_at_aMacroText; $_l_CountRecords)
If ($_l_CountRecords>0)
	
	SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; MAC_at_aMacroCode; [SCRIPTS:80]Recording_Text:4; MAC_at_aMacroText)
	For ($_l_Index; 1; Size of array:C274(MAC_at_aMacroText))  //NG May 2004
		$_t_ReplyText:=Macro_PlatformTranslate(->MAC_at_aMacroText{$_l_Index})
	End for 
	//
End if 

UNLOAD RECORD:C212([SCRIPTS:80])
SCPT_bo_RunFromArrays:=True:C214
If (Records in table:C83([SCRIPTS:80])<2)
	Minor_Mod(->[SCRIPTS:80]; "Macros")
Else 
	If ((<>SerialNo#"") & (<>AutoProc=676767))  //come from an Edit Macro
		Gen_Mod(<>SerialNo; "Macros_File"; "Master"; ->[SCRIPTS:80]; ->vP; "Macros_Sel"; "Macros")
	Else 
		Gen_Mod("View Macros"; "Macros_File"; "Master"; ->[SCRIPTS:80]; ->vP; "Macros_Sel"; "Macros")
	End if 
End if 
ERR_MethodTrackerReturn("Macros_Mod"; $_t_oldMethodName)
