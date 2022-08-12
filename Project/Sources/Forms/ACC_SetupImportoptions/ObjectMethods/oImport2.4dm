If (False:C215)
	//object Method Name: Object Name:      ACC_SetupImportoptions.oImport2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/07/2013 12:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(ACC_rb_UKTemplates)
	//C_UNKNOWN(ACC_rb_USTemplates)
	//ARRAY BOOLEAN(ACC_ab_TemplateSelected;0)
	//ARRAY TEXT(ACC_at_On_ScreenTemplates;0)
	//ARRAY TEXT(ACC_at_TemplateDocumentNames;0)
	C_BOOLEAN:C305(ACC_CB_ImportTab; ACC_CB_ImportXLS)
	C_LONGINT:C283($_l_DocumentNameRow; $_l_DocumentRow; $_l_TemplateSelected)
	C_TEXT:C284($_t_oldMethodName; $_t_Prefix; $_t_Try; $_t_Try2; DB_t_ImportAccounts; DB_T_ImportHeadings)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ ACC_SetupImportoptions.oImport2"; Form event code:C388)
If (ACC_CB_ImportXLS=False:C215) & (ACC_CB_ImportTAB=False:C215)
	$_l_TemplateSelected:=Find in array:C230(ACC_ab_TemplateSelected; True:C214)
	If ($_l_TemplateSelected<0)
		Gen_Alert("You must Select an import option to import data")
	Else 
		//workout the template document name here
		$_t_Prefix:=""
		Case of 
			: (ACC_rb_UKTemplates=1)
				$_t_Prefix:="UK_"
			: (ACC_rb_USTemplates=1)
				$_t_Prefix:="USA_"
			Else 
		End case 
		If (ACC_at_On_ScreenTemplates{$_l_TemplateSelected}#"DEFAULT")
			$_t_Try:=$_t_Prefix+ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_ACCOUNTS"+".XML"
			$_t_Try2:=$_t_Prefix+ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_HEADINGS"+".XML"
		Else 
			$_t_Try:=$_t_Prefix+"ACCOUNTS"+".XML"
			$_t_Try2:=$_t_Prefix+"HEADINGS"+".XML"
		End if 
		$_l_DocumentRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try)
		$_l_DocumentNameRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try2)
		Case of 
			: ($_l_DocumentRow<0) & ($_t_Prefix#"")
				$_t_Prefix:=""
				If (ACC_at_On_ScreenTemplates{$_l_TemplateSelected}#"DEFAULT")
					$_t_Try:=ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_ACCOUNTS"+".XML"
					$_t_Try2:=ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_HEADINGS"+".XML"
				Else 
					$_t_Try:="ACCOUNTS"+".XML"
					$_t_Try2:="HEADINGS"+".XML"
				End if 
				$_l_DocumentRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try)
				$_l_DocumentNameRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try2)
			: ($_l_DocumentRow<0) & ($_t_Prefix="")  //No prefix selected-(ALL) but document must have a prefix if we are here
				$_t_Prefix:="UK_"
				If (ACC_at_On_ScreenTemplates{$_l_TemplateSelected}#"DEFAULT")
					$_t_Try:=$_t_Prefix+ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_ACCOUNTS"+".XML"
					$_t_Try2:=$_t_Prefix+ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_HEADINGS"+".XML"
				Else 
					$_t_Try:=$_t_Prefix+"ACCOUNTS"+".XML"
					$_t_Try2:=$_t_Prefix+"HEADINGS"+".XML"
				End if 
				$_l_DocumentRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try)
				$_l_DocumentNameRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try2)
				If ($_l_DocumentRow<0)
					$_t_Prefix:="USA_"
					If (ACC_at_On_ScreenTemplates{$_l_TemplateSelected}#"DEFAULT")
						$_t_Try:=$_t_Prefix+ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_ACCOUNTS"+".XML"
						$_t_Try2:=$_t_Prefix+ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_HEADINGS"+".XML"
					Else 
						$_t_Try:=$_t_Prefix+"ACCOUNTS"+".XML"
						$_t_Try2:=$_t_Prefix+"HEADINGS"+".XML"
					End if 
					$_l_DocumentRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try)
					$_l_DocumentNameRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try2)
				End if 
				If ($_l_DocumentRow<0)
					If (ACC_at_On_ScreenTemplates{$_l_TemplateSelected}#"DEFAULT")
						$_t_Try:=ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_ACCOUNTS"+".XML"
						$_t_Try2:=ACC_at_On_ScreenTemplates{$_l_TemplateSelected}+"_HEADINGS"+".XML"
					Else 
						$_t_Try:="ACCOUNTS"+".XML"
						$_t_Try2:="HEADINGS"+".XML"
					End if 
					$_l_DocumentRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try)
					$_l_DocumentNameRow:=Find in array:C230(ACC_at_TemplateDocumentNames; $_t_Try2)
				End if 
		End case 
		If ($_l_DocumentRow>0) & ($_l_DocumentNameRow>0)
			DB_t_ImportAccounts:=ACC_at_TemplateDocumentNames{$_l_DocumentRow}
			DB_T_ImportHeadings:=ACC_at_TemplateDocumentNames{$_l_DocumentNameRow}
			CANCEL:C270
		End if 
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ ACC_SetupImportoptions.oImport2"; $_t_oldMethodName)
