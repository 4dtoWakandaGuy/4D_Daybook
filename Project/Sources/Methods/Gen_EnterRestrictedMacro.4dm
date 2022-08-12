//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_EnterRestrictedMacro
	//------------------ Method Notes ------------------
	//this will open a restricted entry macro window-this is restricted to the number of lines in parameter 2)
	
	//------------------ Revision Control ----------------
	//Date Created: 21/12/2011 16:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(MAC_bo_NoButtons)
	C_LONGINT:C283($_l_AddMode; DB_l_ButtonClickedFunction; iCancel; iOK; MAC_l_MacroEntryClass; Vadd)
	C_REAL:C285($1; $2; $3; Mac_l_MaxLines)
	C_TEXT:C284($_t_CurrentInputForm; $_t_oldMethodName; $0; PAL_BUTTON; vButtDisSCRIPT; WIN_t_CurrentInputForm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_EnterRestrictedMacro")
READ WRITE:C146([SCRIPTS:80])

Open window:C153(Screen width:C187/2; Screen height:C188/2; Screen width:C187/2; Screen height:C188/2; -1990)
FORM SET INPUT:C55([SCRIPTS:80]; "Macro_RestrictedEntry")
Mac_l_MaxLines:=32000
If (Count parameters:C259>=2)
	Mac_l_MaxLines:=$2
End if 
If (Count parameters:C259>=3)
	MAC_l_MacroEntryClass:=$3
Else 
	MAC_l_MacroEntryClass:=Owner Owned Macro
End if 
$_l_AddMode:=Vadd
Vadd:=1
MAC_bo_NoButtons:=True:C214
$_t_CurrentInputForm:=WIN_t_CurrentInputForm
WIN_t_CurrentInputForm:="Macro_RestrictedEntry"
PAL_BUTTON:=""
DB_l_ButtonClickedFunction:=0
iOK:=0
iCancel:=0
vButtDisSCRIPT:=""
ADD RECORD:C56([SCRIPTS:80]; *)
$0:=[SCRIPTS:80]Script_Code:1
CLOSE WINDOW:C154
Vadd:=$_l_AddMode
WIN_t_CurrentInputForm:=$_t_CurrentInputForm
ERR_MethodTrackerReturn("Gen_EnterRestrictedMacro"; $_t_oldMethodName)