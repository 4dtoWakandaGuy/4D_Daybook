If (False:C215)
	//object Name: [USER]dQualitiesSearch.Variable4
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
	C_TEXT:C284($_t_oldMethodName; QV_T_QualitiesAsText)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].dQualitiesSearch.Variable4"; Form event code:C388)
QV_ParseText(QV_T_QualitiesAsText)
QV_T_QualitiesAsText:=""
ERR_MethodTrackerReturn("OBJ [USER].dQualitiesSearch.Variable4"; $_t_oldMethodName)