If (False:C215)
	//object Name: [COMPONENTS]EDIT_COMPONENT.oComponentGroup
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
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName; PRD_t_RelatedData; PRD_t_RelatedName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPONENTS].EDIT_COMPONENT.oComponentGroup"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (PRD_t_RelatedData#"")
			Case of 
				: ([COMPONENTS:86]Catalogue_ID:7#0)
					If (PRD_at_ComponentField#2)
						Gen_Confirm("The component type is already set, are you sure you want to change it?"; "No"; "Yes")
						If (OK=0)
							OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; True:C214)
							PRD_t_RelatedData:=""
							PRD_t_RelatedName:=""
						Else 
							PRD_at_ComponentField:=2
						End if 
						OK:=1
					Else 
						OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; True:C214)
					End if 
					
				: ([COMPONENTS:86]Component_Code:2#"")
					If (PRD_at_ComponentField#1)
						Gen_Confirm("The component type is already set, are you sure you want to change it?"; "No"; "Yes")
						If (OK=0)
							PRD_t_RelatedData:=""
							PRD_t_RelatedName:=""
						Else 
							PRD_at_ComponentField:=1
						End if 
						OK:=1
						
					Else 
						OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; True:C214)
					End if 
					
				: ([COMPONENTS:86]Group_Code:8#"")
					If (PRD_at_ComponentField#4)
						Gen_Confirm("The component type is already set, are you sure you want to change it?"; "No"; "Yes")
						If (OK=0)
							PRD_t_RelatedData:=""
							PRD_t_RelatedName:=""
						Else 
							PRD_at_ComponentField:=4
						End if 
						OK:=1
						
					Else 
						OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; True:C214)
					End if 
					
					
				: ([COMPONENTS:86]Macro_Rule:9#"")
					If (PRD_at_ComponentField#3)
						Gen_Confirm("The component type is already set, are you sure you want to change it?"; "No"; "Yes")
						If (OK=0)
							PRD_t_RelatedData:=""
							PRD_t_RelatedName:=""
						Else 
							PRD_at_ComponentField:=3
						End if 
						OK:=1
						
					Else 
						OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; True:C214)
					End if 
					
					
					
				Else 
					OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; True:C214)
			End case 
			
		Else 
			
			OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; True:C214)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [COMPONENTS].EDIT_COMPONENT.oComponentGroup"; $_t_oldMethodName)
