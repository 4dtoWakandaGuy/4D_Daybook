If (False:C215)
	//object Name: [USER]dQualitiesSearch.Variable3
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].dQualitiesSearch.Variable3"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].dQualitiesSearch.Variable3"; $_t_oldMethodName)
