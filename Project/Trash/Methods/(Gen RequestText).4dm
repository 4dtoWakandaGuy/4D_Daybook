//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen RequestText
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; $5; MSG_l_MaxChars; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; $0; $1; $2; $3; $4; $6; MSG_t_CharsRemain; TXT_t_CHeckBoxMessage)
	C_TEXT:C284(vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen RequestText")
//Gen Request Text
// Modified by PB 09/05/02
// to allow for limiting the no. of characters entered


<>SYS_bo_CurrentWindowModal:=True:C214
vConfirm:=$1
MSG_t_CharsRemain:=""
If (Count parameters:C259>1)
	vT:=$2
Else 
	vT:=""
End if 
$_l_ScreenCentreVertical:=Screen width:C187/2
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-161; 110; $_l_ScreenCentreVertical+161; 262)
If (Count parameters:C259>2)
	<>ButtOK:=$3
	<>ButtCanc:=$4
Else 
	<>ButtOK:=""
	<>ButtCanc:=""
End if 

If (Count parameters:C259>4)  // 09/05/02 pb
	// $5 is the max. no. of characters allowed
	// useful e.g. for SMS messages
	MSG_l_MaxChars:=$5
	MSG_t_CharsRemain:="Characters remaining: "+String:C10(MSG_l_MaxChars)
End if 
If (Count parameters:C259>=6)
	TXT_t_CHeckBoxMessage:=$6
End if 

DIALOG:C40([COMPANIES:2]; "dRequest Text")
CLOSE WINDOW:C154
TXT_t_CHeckBoxMessage:=""
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
$0:=vT
<>SYS_bo_CurrentWindowModal:=False:C215
ERR_MethodTrackerReturn("Gen RequestText"; $_t_oldMethodName)