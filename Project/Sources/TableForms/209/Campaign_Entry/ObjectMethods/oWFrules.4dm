
If (False:C215)
	//Object Name:      [WORKFLOW_Campaign].Campaign_Entry.oWFrules
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  09/10/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283(xnext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [WORKFLOW_Campaign]Campaign_Entry.oWFrules"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If ([WORKFLOW_Campaign:209]Rules_Macro:12="")
			Gen_Confirm3("Use Existing Function, Create New, Create Query"; "New"; "Select"; "Query")
			$_bo_OK:=(OK=1)
			If (xnext=0)
				
				If ($_bo_OK)
					//Select
					[WORKFLOW_Campaign:209]Rules_Macro:12:=WF_CreateMacroSearch
					
				Else 
					
					//create macro
				End if 
			Else 
				//QUery
			End if 
			
		Else 
			[WORKFLOW_Campaign:209]Rules_Macro:12:=WF_CreateMacroSearch([WORKFLOW_Campaign:209]Rules_Macro:12)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [WORKFLOW_Campaign]Campaign_Entry.oWFrules"; $_t_oldMethodName)
