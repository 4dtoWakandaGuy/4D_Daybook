If (False:C215)
	//object Name: [WEBSETUP_4D]Replace_dlg.Variable93
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/11/2011 20:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	_O_C_INTEGER:C282($_l_EndHighlight; $_l_StartHighlight)
	C_TEXT:C284($_t_oldMethodName; $tNewStr)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].Replace_dlg.Variable93"; Form event code:C388)

GET HIGHLIGHT:C209(Focus object:C278->; $_l_StartHighlight; $_l_EndHighlight)  //$_l_EndHighlight will be one past the last highlighted char
SET TEXT TO PASTEBOARD:C523(Substring:C12(Focus object:C278->; $_l_StartHighlight; $_l_EndHighlight-$_l_StartHighlight))

$tNewStr:=""
$tNewStr:=Substring:C12(Focus object:C278->; 1; $_l_StartHighlight-1)
$tNewStr:=$tNewStr+Substring:C12(Focus object:C278->; $_l_EndHighlight)  //get from stop to end
Focus object:C278->:=$tNewStr
HIGHLIGHT TEXT:C210(Focus object:C278->; $_l_StartHighlight; $_l_StartHighlight)
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].Replace_dlg.Variable93"; $_t_oldMethodName)
