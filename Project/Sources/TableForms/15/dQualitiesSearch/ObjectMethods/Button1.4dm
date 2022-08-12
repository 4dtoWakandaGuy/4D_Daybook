If (False:C215)
	//object Name: [USER]dQualitiesSearch.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(QV_l_CurrentTable; QV_HL_QualitiesList; QV_l_OK)
	C_TEXT:C284($_t_oldMethodName; QV_T_QualitiesAsText)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].dQualitiesSearch.Button1"; Form event code:C388)
QV_ParseText(QV_T_QualitiesAsText)
QV_DoSearch(QV_l_CurrentTable)
QV_l_OK:=1
CANCEL:C270
CLEAR LIST:C377(QV_HL_QualitiesList; *)
ERR_MethodTrackerReturn("OBJ [USER].dQualitiesSearch.Button1"; $_t_oldMethodName)