If (False:C215)
	//Project Form Method Name:      ACC_SetupImportoptions
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/07/2013 09:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ACC_rb_AllTemplates)
	//C_UNKNOWN(ACC_rb_UKTemplates)
	//C_UNKNOWN(ACC_rb_USTemplates)
	//ARRAY BOOLEAN(ACC_ab_TemplateSelected;0)
	//ARRAY BOOLEAN(ACC_lb_ChartTemplates;0)
	//ARRAY TEXT(ACC_at_CountryFilter;0)
	//ARRAY TEXT(ACC_at_On_ScreenTemplates;0)
	//ARRAY TEXT(ACC_at_TemplateDocumentNames;0)
	//ARRAY TEXT(ACC_at_TemplateNames;0)
	C_BOOLEAN:C305($_bo_Escape; DB_bo_NoLoad)
	C_LONGINT:C283($_l_CharacterPosition; $_l_DocumentNameLength; $_l_Event; $_l_Index; ABS_l_BUT1; ABS_l_BUT10; ABS_l_BUT11; ABS_l_BUT12; ABS_l_BUT13; ABS_l_BUT14; ABS_l_BUT15)
	C_LONGINT:C283(ABS_l_BUT16; ABS_l_BUT17; ABS_l_BUT18; ABS_l_BUT19; ABS_l_BUT2; ABS_l_BUT20; ABS_l_BUT21; ABS_l_BUT22; ABS_l_BUT23; ABS_l_BUT24; ABS_l_BUT25)
	C_LONGINT:C283(ABS_l_BUT26; ABS_l_BUT27; ABS_l_BUT3; ABS_l_BUT4; ABS_l_BUT5; ABS_l_BUT6; ABS_l_BUT7; ABS_l_BUT8; ABS_l_BUT9)
	C_TEXT:C284($_t_Before; $_t_Country; $_t_oldMethodName; $_t_StructurePath; $_t_TemplateName; oABS_COL1; oABS_COL10; oABS_COL11; oABS_COL12; oABS_COL13; oABS_COL14)
	C_TEXT:C284(oABS_COL15; oABS_COL16; oABS_COL17; oABS_COL18; oABS_COL19; oABS_COL2; oABS_COL20; oABS_COL21; oABS_COL22; oABS_COL23; oABS_COL24)
	C_TEXT:C284(oABS_COL25; oABS_COL26; oABS_COL27; oABS_COL3; oABS_COL4; oABS_COL5; oABS_COL6; oABS_COL7; oABS_COL8; oABS_COL9; oABS_HED1)
	C_TEXT:C284(oABS_HED10; oABS_HED11; oABS_HED12; oABS_HED13; oABS_HED14; oABS_HED15; oABS_HED16; oABS_HED17; oABS_HED18; oABS_HED19; oABS_HED2)
	C_TEXT:C284(oABS_HED20; oABS_HED21; oABS_HED22; oABS_HED23; oABS_HED24; oABS_HED25; oABS_HED26; oABS_HED27; oABS_HED3; oABS_HED4; oABS_HED5)
	C_TEXT:C284(oABS_HED6; oABS_HED7; oABS_HED8; oABS_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM ACC_SetupImportoptions"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		//TRACE
		//Here we pick up the templates on this machine
		If (Application type:C494#4D Remote mode:K5:5)
			$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
			
			
		Else 
			$_t_StructurePath:=Get 4D folder:C485(4D Client database folder:K5:13)
			
		End if 
		If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data"+Folder separator:K24:12+"COATEMPLATES")=Is a folder:K24:2))
			If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
				
				
				CREATE FOLDER:C475($_t_StructurePath+"Resources")
			End if 
			If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")=Is a folder:K24:2))
				CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")
				
				
			End if 
			If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data"+Folder separator:K24:12+"COATEMPLATES")=Is a folder:K24:2))
				CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data")
				
				
			End if 
		End if 
		//we are now certain the directory exists
		ARRAY TEXT:C222(ACC_at_TemplateDocumentNames; 0)
		ARRAY TEXT:C222(ACC_at_TemplateNames; 0)
		ARRAY TEXT:C222(ACC_at_CountryFilter; 0)
		DOCUMENT LIST:C474($_t_StructurePath+"Resources"+Folder separator:K24:12+"Data"+Folder separator:K24:12+"COATEMPLATES"; ACC_at_TemplateDocumentNames; 8)
		
		SORT ARRAY:C229(ACC_at_TemplateDocumentNames; >)
		//note this folder contains a DTD(One for header one for accounts) and then for each template a HEADERS and an ACCOUNTS
		//so here we take this down to one name per template
		For ($_l_Index; Size of array:C274(ACC_at_TemplateDocumentNames); 1; -1)
			If (ACC_at_TemplateDocumentNames{$_l_Index}="ACCOUNTS.DTD") | (ACC_at_TemplateDocumentNames{$_l_Index}="HEADINGS.DTD") | (ACC_at_TemplateDocumentNames{$_l_Index}="COA_NOTES.txt")
				DELETE FROM ARRAY:C228(ACC_at_TemplateDocumentNames; $_l_Index)
			Else 
				If ($_l_Index<Size of array:C274(ACC_at_TemplateDocumentNames))
					If (ACC_at_TemplateDocumentNames{$_l_Index}=ACC_at_TemplateDocumentNames{$_l_Index+1})
						DELETE FROM ARRAY:C228(ACC_at_TemplateDocumentNames; $_l_Index)
					End if 
				End if 
			End if 
			
		End for 
		ARRAY TEXT:C222(ACC_at_TemplateNames; Size of array:C274(ACC_at_TemplateDocumentNames))
		ARRAY TEXT:C222(ACC_at_CountryFilter; Size of array:C274(ACC_at_TemplateDocumentNames))
		For ($_l_Index; 1; Size of array:C274(ACC_at_TemplateNames))
			$_l_CharacterPosition:=Position:C15("_"; ACC_at_TemplateDocumentNames{$_l_Index})
			If ($_l_CharacterPosition>0)
				$_l_DocumentNameLength:=Length:C16(ACC_at_TemplateDocumentNames{$_l_Index})
				$_t_Before:=""
				$_t_Country:=""
				$_bo_Escape:=False:C215
				Repeat 
					If (ACC_at_TemplateDocumentNames{$_l_Index}[[$_l_DocumentNameLength]]="_")
						$_bo_Escape:=True:C214
						$_t_Before:=Substring:C12(ACC_at_TemplateDocumentNames{$_l_Index}; 1; $_l_DocumentNameLength-1)
						$_l_CharacterPosition:=Position:C15("_"; $_t_Before)
						If ($_l_CharacterPosition>0)
							//country
							$_t_Country:=Substring:C12($_t_Before; 1; $_l_CharacterPosition-1)
							$_t_Before:=Substring:C12($_t_Before; $_l_CharacterPosition+1)
						End if 
					Else 
						$_l_DocumentNameLength:=$_l_DocumentNameLength-1
					End if 
				Until ($_l_DocumentNameLength=0) | ($_bo_Escape)
				ACC_at_TemplateNames{$_l_Index}:=$_t_Before
				ACC_at_CountryFilter{$_l_Index}:=$_t_Country
			Else 
				$_l_CharacterPosition:=Position:C15("."; ACC_at_TemplateDocumentNames{$_l_Index})
				If ($_l_CharacterPosition>0)
					$_t_Before:=Substring:C12(ACC_at_TemplateDocumentNames{$_l_Index}; 1; $_l_CharacterPosition-1)
				Else 
					$_t_Before:=ACC_at_TemplateDocumentNames{$_l_Index}
				End if 
				
				ACC_at_TemplateNames{$_l_Index}:=$_t_Before
			End if 
			
		End for 
		//So we have 3 arrays one for the template names one for the document names and one for the country names
		//`if however there was a USA_LEISURE_ACCOUNTS and a UK_LEISURE_ACCOUNTS. we would have both appear on screen with both
		//`Also The list contains _HEADINGS and _ACCOUNTS so each template should exist twice at this point.
		ARRAY TEXT:C222(ACC_at_On_ScreenTemplates; 0)
		For ($_l_Index; 1; Size of array:C274(ACC_at_TemplateNames))
			$_t_TemplateName:=ACC_at_TemplateNames{$_l_Index}
			If ($_t_TemplateName="ACCOUNTS") | ($_t_TemplateName="HEADINGS")
				$_t_TemplateName:="Default"
			End if 
			If (Find in array:C230(ACC_at_On_ScreenTemplates; $_t_TemplateName)<0)
				APPEND TO ARRAY:C911(ACC_at_On_ScreenTemplates; $_t_TemplateName)
			End if 
		End for 
		ARRAY BOOLEAN:C223(ACC_ab_TemplateSelected; 0)
		ARRAY BOOLEAN:C223(ACC_ab_TemplateSelected; Size of array:C274(ACC_at_On_ScreenTemplates))
		
		
		
		
		LB_SetEnterable(->ACC_lb_ChartTemplates; False:C215; 0)
		LB_SetupListbox(->ACC_lb_ChartTemplates; "LAY_t"; "LAY_L"; 1; ->ACC_at_On_ScreenTemplates; ->ACC_ab_TemplateSelected)
		LB_SetColumnHeaders(->ACC_lb_ChartTemplates; "LAY_L"; 1; "Template"; "Select")
		LB_SetColumnWidths(->ACC_lb_ChartTemplates; "LAY_t"; 1; 180; 60)
		LB_SetEnterable(->ACC_lb_ChartTemplates; False:C215; 0)
		LB_SetEnterable(->ACC_lb_ChartTemplates; True:C214; 2)
		LB_SetScroll(->ACC_lb_ChartTemplates; -2; -2)
		LB_StyleSettings(->ACC_lb_ChartTemplates; "Black"; 9; "LAY_t"; ->[ACCOUNTS:32])
		
		ACC_rb_AllTemplates:=1
		ACC_rb_UKTemplates:=0
		ACC_rb_USTemplates:=0
		
End case 
ERR_MethodTrackerReturn("FM ACC_SetupImportoptions"; $_t_oldMethodName)
