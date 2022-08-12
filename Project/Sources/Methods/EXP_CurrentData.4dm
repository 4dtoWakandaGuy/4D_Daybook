//%attributes = {}
If (False:C215)
	//Project Method Name:      EXP_CurrentData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 17:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ExportProjectClasses;0)
	//ARRAY TEXT(DB_at_ExportProjectFormats;0)
	//ARRAY TEXT(DB_at_ExportProjectNames;0)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $_l_DataOwnerID; $_l_ExportProjects; $_l_FieldIndex; $_l_PathPosition; $_l_Position; $_l_Type; DB_l_CURRENTDISPLAYEDFORM)
	C_POINTER:C301($_ptr_Field; $_Ptr_Table)
	C_TEXT:C284($_t_Before; $_t_DomText; $_t_ElementRef; $_t_ExportPath; $_t_oldMethodName; $_t_SettingsName; $_t_TableName; $_t_xmlRef; $exportParams)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("EXP_CurrentData")
If (DB_l_CURRENTDISPLAYEDFORM>0)
	$_Ptr_Table:=Table:C252(DB_l_CURRENTDISPLAYEDFORM)
	$_l_ExportProjects:=PREF_GetPreferenceID("Data Transfer Projects"; True:C214; -1)
	If (<>PER_l_CurLoggedinDataOwnerID=0)
		$_l_DataOwnerID:=Records in table:C83([USER:15])
	Else 
		$_l_DataOwnerID:=<>PER_l_CurLoggedinDataOwnerID
	End if 
	If ($_l_ExportProjects>0)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Preference_DataID:7=$_l_DataOwnerID; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]IDNumber:1=$_l_ExportProjects; *)
		QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=DB_l_CURRENTDISPLAYEDFORM)
		//One preference record per table
		//here we can load default projects from disk.
		ARRAY TEXT:C222(DB_at_ExportProjectNames; 0)
		ARRAY TEXT:C222(DB_at_ExportProjectFormats; 0)
		ARRAY LONGINT:C221(DB_al_ExportProjectClasses; 0)  //class one=user created can be edited class-minus one defaults-cant be changed except by designers and class minus2 is default-only displayed for designer
		
		If (Records in selection:C76([PREFERENCES:116])>0)
			
		End if 
		
		If (Size of array:C274(DB_at_ExportProjectNames)=0)
		End if 
		//If (Size of array(DB_at_ExportProjectNames)=0)
		If (Current user:C182="Designer")
			//note this project does not get saved
			
			
			If (True:C214)
				$_t_xmlRef:=DOM Create XML Ref:C861("settings-import-export")
				// Export the table "$1" in '4D' binary format, all the records or only the current selection
				//DOM SET XML ATTRIBUTE($_t_xmlRef;"table_no";DB_l_CURRENTDISPLAYEDFORM;"format";"4D";"all_records";False)
				DOM SET XML ATTRIBUTE:C866($_t_xmlRef; "table_no"; DB_l_CURRENTDISPLAYEDFORM; "format"; "XML"; "all_records"; False:C215; "char_display_format"; "character"; "platform"; "automatic")  // Definition of fields to export
				//char_display_format="character" platform="automatic"For ($_l_FieldIndex;1;Get last field number(DB_l_CURRENTDISPLAYEDFORM))
				$_t_ElementRef:=DOM Create XML element:C865($_t_xmlRef; "xml_settings"; "export_dtd_mode"; "generate-outside"; "export_xsl_mode"; "none")
				
				//<xml_settings export_dtd_mode="generate-outside"export_xsl_mode="none"/>
				For ($_l_FieldIndex; 1; Get last field number:C255(DB_l_CURRENTDISPLAYEDFORM))
					If (Is field number valid:C1000(DB_l_CURRENTDISPLAYEDFORM; $_l_FieldIndex))
						$_ptr_Field:=Field:C253(DB_l_CURRENTDISPLAYEDFORM; $_l_FieldIndex)
						$_l_Type:=Type:C295($_ptr_Field->)
						Case of 
							: ($_l_Type=Is alpha field:K8:1)
								$_t_ElementRef:=DOM Create XML element:C865($_t_xmlRef; "field"; "table_no"; DB_l_CURRENTDISPLAYEDFORM; "field_no"; $_l_FieldIndex; "kind"; "alpha")
							: ($_l_Type=Is real:K8:4)
								$_t_ElementRef:=DOM Create XML element:C865($_t_xmlRef; "field"; "table_no"; DB_l_CURRENTDISPLAYEDFORM; "field_no"; $_l_FieldIndex; "kind"; "real")
							: ($_l_Type=Is text:K8:3)
								$_t_ElementRef:=DOM Create XML element:C865($_t_xmlRef; "field"; "table_no"; DB_l_CURRENTDISPLAYEDFORM; "field_no"; $_l_FieldIndex; "kind"; "text")
								
							Else 
								
								$_t_ElementRef:=DOM Create XML element:C865($_t_xmlRef; "field"; "table_no"; DB_l_CURRENTDISPLAYEDFORM; "field_no"; $_l_FieldIndex)
						End case 
					End if 
				End for 
				
				DOM EXPORT TO VAR:C863($_t_xmlRef; $_t_DomText)
				DOM CLOSE XML:C722($_t_xmlRef)
				//$_ti_DocumentRef:=Create document("";"TEXT")
				//SEND PACKET($_ti_DocumentRef;$_t_DomText)
				//Close DocUMENT($_ti_DocumentRef)
			Else 
				$_ti_DocumentRef:=Open document:C264(""; "TEXT")
				RECEIVE PACKET:C104($_ti_DocumentRef; $_t_DomText; 32000)
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
			End if 
			APPEND TO ARRAY:C911(DB_at_ExportProjectNames; "Default Data Export")
			APPEND TO ARRAY:C911(DB_at_ExportProjectFormats; $_t_DomText)
			APPEND TO ARRAY:C911(DB_al_ExportProjectClasses; -2)  //class one=user created can be edited class-minus one defaults-cant be changed except by designers and class minus2 is default-only displayed for designer
			
		End if 
		//Now ask the user which export project to use-unless there are zero in which case ask them to name the project
		If (Size of array:C274(DB_at_ExportProjectNames)=0) | (True:C214)
			$_t_xmlRef:=DOM Create XML Ref:C861("settings-import-export")
			DOM SET XML ATTRIBUTE:C866($_t_xmlRef; "table_no"; DB_l_CURRENTDISPLAYEDFORM; "format"; "4D"; "all_records"; True:C214; "char_display_format"; "character"; "platform"; "automatic")  // Definition of fields to export
			DOM EXPORT TO VAR:C863($_t_xmlRef; $_t_DomText)
			DOM CLOSE XML:C722($_t_xmlRef)
			
			$_t_TableName:=Table name:C256(DB_l_CURRENTDISPLAYEDFORM)
			$_t_ExportPath:=Select folder:C670("Please select the export folder:")
			If (OK=1) & ($_t_ExportPath#"")
				
				$_t_ExportPath:=$_t_ExportPath+$_t_TableName+".txt"
				EXPORT DATA:C666($_t_ExportPath; $_t_DomText; *)  //Display of the export dialog box
				If (OK=1)
					Gen_Confirm("Do you wish to save these export settings for future use?"; "Yes"; "No")
					If (Ok=1)
						$_t_SettingsName:=Gen_Request("Please name these settings"; "")
						If ($_t_SettingsName#"")
							//From the DOMTEXT we want to take out the 'file path'
							$_l_PathPosition:=Position:C15("file_path="; $_t_DomText)
							$_t_Before:=Substring:C12($_t_DomText; 1; $_l_PathPosition-1)
							$_t_DomText:=Substring:C12($_t_DomText; $_l_PathPosition+Length:C16("file_path="))
							$_l_Position:=Position:C15("encoding="; $_t_DomText)
							$_t_DomText:=Substring:C12($_t_DomText; $_l_Position-1)
							$_t_DomText:=$_t_Before+$_t_DomText
							
							APPEND TO ARRAY:C911(DB_at_ExportProjectNames; $_t_SettingsName)
							APPEND TO ARRAY:C911(DB_at_ExportProjectFormats; $_t_DomText)
							APPEND TO ARRAY:C911(DB_al_ExportProjectClasses; 1)  //class one=user created can be edited class-minus one defaults-cant be changed except by designers and class minus2 is default-only displayed for designer
							READ WRITE:C146([PREFERENCES:116])
							QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]Preference_DataID:7=$_l_DataOwnerID; *)
							QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]IDNumber:1=$_l_ExportProjects; *)
							QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=DB_l_CURRENTDISPLAYEDFORM)
							If (Records in selection:C76([PREFERENCES:116])=0)
								CREATE RECORD:C68([PREFERENCES:116])
								[PREFERENCES:116]Preference_DataID:7:=$_l_DataOwnerID
								[PREFERENCES:116]IDNumber:1:=$_l_ExportProjects
								[PREFERENCES:116]Pref_OwnerTable:3:=DB_l_CURRENTDISPLAYEDFORM
							End if 
							SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
							VARIABLE TO BLOB:C532(DB_at_ExportProjectNames; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(DB_at_ExportProjectFormats; [PREFERENCES:116]DataBlob:2; *)
							VARIABLE TO BLOB:C532(DB_al_ExportProjectClasses; [PREFERENCES:116]DataBlob:2; *)
							
							SAVE RECORD:C53([PREFERENCES:116])
							
						End if 
					End if 
				End if 
			End if 
			
		Else 
			//here we ask the user which export they want to use and whether they want to edit the settings
			
			EXPORT DATA:C666("DocExport.xml"; $_t_DomText; *)  //Display of the export dialog box
			$_ti_DocumentRef:=Create document:C266(""; "TEXT")
			SEND PACKET:C103($_ti_DocumentRef; $_t_DomText)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
		//End if
		
		
	End if 
End if 
ERR_MethodTrackerReturn("EXP_CurrentData"; $_t_oldMethodName)