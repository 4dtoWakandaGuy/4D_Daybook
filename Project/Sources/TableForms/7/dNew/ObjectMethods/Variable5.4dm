If (False:C215)
	//object Method Name: Object Name:      [DOCUMENTS].dNew.Variable5
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
	//Array Text(<>WP_at_DocumentDiaryActionCode;0)
	//Array Text(<>WP_at_DocumentDiaryActionName;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dNew.Variable5"; Form event code:C388)
If (<>WP_at_DocumentDiaryActionName=0)
	<>WP_at_DocumentDiaryActionName:=1
End if 
<>WP_at_DocumentDiaryActionCode:=<>WP_at_DocumentDiaryActionName
Letters_InSWTem(<>WP_at_DocumentDiaryActionCode{<>WP_at_DocumentDiaryActionName})
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dNew.Variable5"; $_t_oldMethodName)