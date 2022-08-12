//%attributes = {}
If (False:C215)
	//Project Method Name:      LET_FindTemplates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2009 14:04`Method: LET_FindTemplates
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LET_FindTemplates")
MESSAGES OFF:C175
QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=4D Write Letter Template; *)
QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]X_Template_Type:30=0; *)
QUERY:C277([DOCUMENTS:7];  & ; [DOCUMENTS:7]Document_Status:15>-100)  //deleted templates will get a status of status-100
MESSAGES ON:C181
If (Records in selection:C76([DOCUMENTS:7])=0)
	//must be not updated so need to create the templates
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Standard:9=True:C214)
	If (Records in selection:C76([DOCUMENTS:7])=0)
		// ALERT("There are no templates in this database")
		Gen_Alert("There are no templates in this database.")
	Else 
		//need to check these have data in the picture field!
		FIRST RECORD:C50([DOCUMENTS:7])
		CREATE EMPTY SET:C140([DOCUMENTS:7]; "WriteTemplates")
		For ($_l_Index; 1; Records in selection:C76([DOCUMENTS:7]))
			If (Picture size:C356([DOCUMENTS:7]Write_:5)>0)
				ADD TO SET:C119([DOCUMENTS:7]; "WriteTemplates")
				
			End if 
			NEXT RECORD:C51([DOCUMENTS:7])
		End for 
		USE SET:C118("WriteTemplates")
		SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; WS_at_TemplateRefs; [DOCUMENTS:7]Heading:2; WS_at_TemplateNames)
	End if 
Else 
	CREATE SET:C116([DOCUMENTS:7]; "WriteTemplates")
	USE SET:C118("WriteTemplates")
	CLEAR SET:C117("WriteTemplates")
	SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; WS_at_TemplateRefs; [DOCUMENTS:7]Heading:2; WS_at_TemplateNames)
	SORT ARRAY:C229(WS_at_TemplateNames; WS_at_TemplateRefs)
End if 
ERR_MethodTrackerReturn("LET_FindTemplates"; $_t_oldMethodName)