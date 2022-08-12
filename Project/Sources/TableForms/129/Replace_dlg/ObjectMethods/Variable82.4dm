If (False:C215)
	//object Name: [WEBSETUP_4D]Replace_dlg.Variable82
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($_l_EndHighlight; $_l_StartHighlight)
	C_TEXT:C284($_t_oldMethodName; $tClipStr; $tNewStr)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].Replace_dlg.Variable82"; Form event code:C388)

$tClipStr:=Get text from pasteboard:C524
GET HIGHLIGHT:C209(Focus object:C278->; $_l_StartHighlight; $_l_EndHighlight)  //$_l_EndHighlight will be one past the last highlighted character
$tNewStr:=Substring:C12(Focus object:C278->; 1; $_l_StartHighlight-1)
$tNewStr:=$tNewStr+$tClipStr
$tNewStr:=$tNewStr+Substring:C12(Focus object:C278->; $_l_EndHighlight)
Focus object:C278->:=$tNewStr
HIGHLIGHT TEXT:C210(Focus object:C278->; $_l_StartHighlight; $_l_StartHighlight)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].Replace_dlg.Variable82"; $_t_oldMethodName)
