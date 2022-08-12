If (False:C215)
	//object Name: Object Name:      EN_Cumulus.oStop1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2011 11:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_T_TExt)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ EN_Cumulus.oStop1"; Form event code:C388)
DB_T_TExt:=WA Get page content:C1038(*; "oCumulus")
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
SEND PACKET:C103($_ti_DocumentRef; DB_T_TExt)
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("OBJ EN_Cumulus.oStop1"; $_t_oldMethodName)
