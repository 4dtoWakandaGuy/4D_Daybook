If (False:C215)
	//object Name: [DOCUMENTS]Letters_inW.oTemplateTypeSelection
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
	//ARRAY TEXT(DB_at_TemplateTypes;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Letters_inW.oTemplateTypeSelection"; Form event code:C388)
If (DB_at_TemplateTypes>0)
	Case of 
		: (DB_at_TemplateTypes=1)  //not available
			[DOCUMENTS:7]X_Template_Type:30:=1
			
			
		: (DB_at_TemplateTypes=2)  //is available
			[DOCUMENTS:7]X_Template_Type:30:=0
	End case 
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Letters_inW.oTemplateTypeSelection"; $_t_oldMethodName)
