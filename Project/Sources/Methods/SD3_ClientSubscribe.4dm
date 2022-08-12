//%attributes = {}

If (False:C215)
	//Project Method Name:      SD3_ClientSubscribe
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ActionViewClass; $_l_TableNumber; $_l_WIndowID; $1; $3)
	C_OBJECT:C1216($_obj_Attributes; $_obj_DiaryInitTask; $_obj_ObjParamters; $4)
	C_TEXT:C284(<>IP_t_CurrentRegisteredUser; $_t_UpdaterMethod; $_t_WhoseDiary; $2; SYS_t_CUrrentTaskUUID)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_ClientSubscribe")

$_l_WIndowID:=$1
$_t_UpdaterMethod:=$2
$_l_TableNumber:=$3
$_obj_Attributes:=$4
OB SET:C1220($_obj_ObjParamters; "action"; "Subscribe")
OB SET:C1220($_obj_ObjParamters; "client_id"; <>IP_t_CurrentRegisteredUser)
OB SET:C1220($_obj_ObjParamters; "window_id"; $_l_WIndowID)
OB SET:C1220($_obj_ObjParamters; "method"; $_t_UpdaterMethod)
OB SET:C1220($_obj_ObjParamters; "table_num"; $_l_TableNumber)
OB SET:C1220($_obj_ObjParamters; "Include_Properties"; $_obj_Attributes)
SD3_ServerSideDiaryManager($_obj_ObjParamters)
ERR_MethodTrackerReturn("SD3_ClientSubscribe"; $_t_oldMethodName)