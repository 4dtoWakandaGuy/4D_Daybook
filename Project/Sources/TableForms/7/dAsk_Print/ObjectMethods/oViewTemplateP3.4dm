If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.oViewTemplateP3
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
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_TEXT:C284($_t_oldMethodName; WS_T_EmailBody)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.oViewTemplateP3"; Form event code:C388)
If (WS_at_TemplateNames>0)
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=WS_at_TemplateRefs{WS_at_TemplateNames})
	WS_T_EmailBody:=[DOCUMENTS:7]Text:3
End if 


//reset window size
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dAsk_Print.oViewTemplateP3"; $_t_oldMethodName)