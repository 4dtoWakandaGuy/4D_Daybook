If (False:C215)
	//object Name: [USER]dQualitiesSearch.Button4
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
	C_LONGINT:C283(QV_l_OK)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].dQualitiesSearch.Button4"; Form event code:C388)
QV_l_OK:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].dQualitiesSearch.Button4"; $_t_oldMethodName)