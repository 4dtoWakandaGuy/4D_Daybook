If (False:C215)
	//object Name: [USER]Template_manager.oLetSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_lb_Documents;0)
	//ARRAY LONGINT(DOC_al_TemplatesInclude;0)
	//ARRAY TEXT(WS_at_TemplateNames;0)
	//ARRAY TEXT(WS_at_TemplateRefs;0)
	C_BOOLEAN:C305(DOC_bo_TemplateSelected)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Index; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Template_manager.oLetSelect"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)  // | ($_l_event=On Double Clicked )
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			
			
			
			If (DOC_al_TemplatesInclude{$_l_Row}=0)
				For ($_l_Index; 1; Size of array:C274(DOC_al_TemplatesInclude))
					DOC_al_TemplatesInclude{$_l_Index}:=0
				End for 
				DOC_al_TemplatesInclude{$_l_Row}:=1
				DOC_al_TemplatesInclude:=$_l_Row
				WS_at_TemplateRefs:=$_l_Row
				WS_at_TemplateNames:=$_l_Row
			Else 
				DOC_al_TemplatesInclude{$_l_Row}:=0
				DOC_al_TemplatesInclude:=$_l_Row
				WS_at_TemplateRefs:=$_l_Row
				WS_at_TemplateNames:=$_l_Row
			End if 
			
			
		Else 
			LISTBOX SELECT ROW:C912(DIA_lb_Documents; 1; 0)
		End if 
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			
			
			If (DOC_al_TemplatesInclude{$_l_Row}=0)
				
				For ($_l_Index; 1; Size of array:C274(DOC_al_TemplatesInclude))
					DOC_al_TemplatesInclude{$_l_Index}:=0
				End for 
				DOC_al_TemplatesInclude{$_l_Row}:=1
				DOC_bo_TemplateSelected:=True:C214
				DOC_al_TemplatesInclude:=$_l_Row
				WS_at_TemplateRefs:=$_l_Row
				WS_at_TemplateNames:=$_l_Row
				
				CANCEL:C270
			Else 
				DOC_al_TemplatesInclude{$_l_Row}:=0
				DOC_al_TemplatesInclude:=$_l_Row
				WS_at_TemplateRefs:=$_l_Row
				WS_at_TemplateNames:=$_l_Row
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].Template_manager.oLetSelect"; $_t_oldMethodName)
