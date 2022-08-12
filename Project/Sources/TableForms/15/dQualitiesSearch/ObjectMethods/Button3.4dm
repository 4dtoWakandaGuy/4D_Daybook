If (False:C215)
	//object Name: [USER]dQualitiesSearch.Button3
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].dQualitiesSearch.Button3"; Form event code:C388)
CANCEL:C270
QV_l_OK:=0
ERR_MethodTrackerReturn("OBJ [USER].dQualitiesSearch.Button3"; $_t_oldMethodName)