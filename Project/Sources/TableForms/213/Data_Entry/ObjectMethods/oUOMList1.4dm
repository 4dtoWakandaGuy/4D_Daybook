If (False:C215)
	//object Name: [Attribute_Classes]Data_Entry.oUOMList1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_TemplateIDS;0)
	//ARRAY TEXT(SD2_at_TemplateNames;0)
	C_BOOLEAN:C305($_bo_Overwrite)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; $_t_TemplateName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACTIONS].Action_In.Variable3"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (SD2_at_TemplateNames>0)
			Case of 
				: (SD2_al_TemplateIDS{SD2_at_TemplateNames}>0)  //selected a template
					$_bo_Overwrite:=True:C214
					If (Old:C35([ACTIONS:13]Action_Code:1)#"")  //this is not a new action
						Gen_Confirm("Overwrite the settings of this diary action with those from the template"; "NO"; "Yes")
						If (OK=1)
							$_bo_Overwrite:=False:C215
						End if 
						OK:=1
					End if 
					SD2_LoadTemplateActionSettings($_bo_Overwrite; SD2_al_TemplateIDS{SD2_at_TemplateNames})
				: (SD2_al_TemplateIDS{SD2_at_TemplateNames}=0)  //Save as a template
					$_t_TemplateName:=Gen_Request("Name this template:"; "")
					If ($_t_TemplateName#"") & (OK=1)
						
					End if 
					
			End case 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [ACTIONS].Action_In.Variable3"; $_t_oldMethodName)
