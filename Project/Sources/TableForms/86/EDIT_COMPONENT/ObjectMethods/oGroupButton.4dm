If (False:C215)
	//object Method Name: Object Name:      [COMPONENTS].EDIT_COMPONENT.oSelection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 08:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(PRD_at_ComponentField;0)
	C_LONGINT:C283($_l_event; PRD_l_Edit; PRD_l_ScriptEdit)
	C_TEXT:C284($_t_oldMethodName; $_t_RecordCode; PRD_t_RelatedData)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.oSelection"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		Case of 
			: (PRD_at_ComponentField=1)  // product
				//Open product in new window-new process
				If (PRD_t_RelatedData#"")
					ZProducts_Mod(PRD_t_RelatedData; "TRUE"; ->PRD_l_Edit)
					
				End if 
			: (PRD_at_ComponentField=2)  //catalogue
				//open catalogue in new window-new proces
				CatalogueGroup_Mod(PRD_t_RelatedData; "TRUE"; ->PRD_l_Edit)
				
			: (PRD_at_ComponentField=3)  // `script(macro)
				//Edit macro
				$_t_RecordCode:=PRD_t_RelatedData
				PRD_l_ScriptEdit:=New process:C317("Record_EditLst"; DB_ProcessMemoryinit(2); $_t_RecordCode; PRD_t_RelatedData)
				If (PRD_l_ScriptEdit>0)
					Process_StartAr(PRD_l_ScriptEdit; "Edit Macro")
				End if 
				
			: (PRD_at_ComponentField=4)  //  `product group
				//Open list of Products_In group
				If (PRD_t_RelatedData#"")
					ZProducts_Mod(PRD_t_RelatedData; "TRUE"; ->PRD_l_Edit)
					
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.oSelection"; $_t_oldMethodName)
