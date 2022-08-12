//%attributes = {}
If (False:C215)
	//Project Method Name:      GEN_editRestictedMacro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 17:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(MAC_bo_NoButtons)
	C_LONGINT:C283($_l_AddMode; DB_l_ButtonClickedFunction; iCancel; iOK; MAC_l_MacroEntryClass; Vadd)
	C_REAL:C285($2; $3; Mac_l_MaxLines)
	C_TEXT:C284($_t_CurrentInputForm; $_t_oldMethodName; $0; $1; PAL_BUTTON; vButtDisSCRIPT; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("GEN_editRestictedMacro")
READ WRITE:C146([SCRIPTS:80])
Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; -1990)
FORM SET INPUT:C55([SCRIPTS:80]; "Macro_RestrictedEntry")
Mac_l_MaxLines:=32000
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)

If (Count parameters:C259>=2)
	Mac_l_MaxLines:=$2
End if 
If (Count parameters:C259>=3)
	MAC_l_MacroEntryClass:=$3
Else 
	MAC_l_MacroEntryClass:=Owner Owned Macro
End if 
$_l_AddMode:=Vadd
Vadd:=0
MAC_bo_NoButtons:=True:C214
$_t_CurrentInputForm:=WIN_t_CurrentInputForm
WIN_t_CurrentInputForm:="Macro_RestrictedEntry"
PAL_BUTTON:=""
DB_l_ButtonClickedFunction:=0
iOK:=0
iCancel:=0
vButtDisSCRIPT:=""
MODIFY RECORD:C57([SCRIPTS:80]; *)
$0:=[SCRIPTS:80]Script_Code:1
CLOSE WINDOW:C154
Vadd:=$_l_AddMode
WIN_t_CurrentInputForm:=$_t_CurrentInputForm
ERR_MethodTrackerReturn("GEN_editRestictedMacro"; $_t_oldMethodName)