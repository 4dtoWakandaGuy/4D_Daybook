If (False:C215)
	//object Name: [DOCUMENTS]Letters_inWS.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_inWS.Variable14"; Form event code:C388)
//C_LONGINT($r;$s)
//C_PICTURE($p)
//$r:=SW Get Area (Write;$p)
//If ($r=0)
// $r:=Int(Picture size([DOCUMENTS]Write_)/10)
//$s:=Int(Picture size($p)/10)
// If ($r#$s)
DB_bo_RecordModified:=True:C214
// End if
//End if
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Letters_inWS.Variable14"; $_t_oldMethodName)