If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dSaveAs
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
	//ARRAY TEXT(<>Per_at_PersonnelNames;0)
	//ARRAY TEXT(DIA_at_Access;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; DIA_bo_AccessInited)
	C_LONGINT:C283($_l_event; xNext)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; DOC_t_DocumentCode; vTitle1; vTitle2; vTitle3; vType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dSaveAs"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	ARRAY TEXT:C222(<>Per_at_PersonnelNames; 0)  //Used in SuperWrite WP - is all visible personnel
	If ((DB_GetModuleSettingByNUM(Module_WPManager))>1)  //remove this if use it other than in WP"
		
		
		
		If (Not:C34(DIA_bo_AccessInited))
			QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=<>PER_t_CurrentUserInitials)
			ARRAY TEXT:C222(DIA_at_Access; 0)
			SELECTION TO ARRAY:C260([PERSONNEL_DIARY_ACCESS:149]Person:1; DIA_at_Access)
			DIA_bo_AccessInited:=True:C214
		End if 
		If (Size of array:C274(DIA_at_Access)>0)
			COPY ARRAY:C226(DIA_at_Access; <>Per_at_PersonnelNames)
			<>Per_at_PersonnelNames:=Find in array:C230(<>Per_at_PersonnelNames; <>PER_t_CurrentUserInitials)
			If (<>Per_at_PersonnelNames<1)
				INSERT IN ARRAY:C227(<>Per_at_PersonnelNames; 1; 1)
				<>Per_at_PersonnelNames{1}:=<>PER_t_CurrentUserInitials
			End if 
		Else 
			ALL RECORDS:C47([PERSONNEL:11])
			SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; <>Per_at_PersonnelNames)
			UNLOAD RECORD:C212([PERSONNEL:11])
		End if 
		SORT ARRAY:C229(<>Per_at_PersonnelNames; >)
		INSERT IN ARRAY:C227(<>Per_at_PersonnelNames; 1; 1)
		<>Per_at_PersonnelNames{1}:="*ALL"
		<>Per_at_PersonnelNames:=Find in array:C230(<>Per_at_PersonnelNames; <>PER_t_CurrentUserInitials)
	End if 
	
	
	OpenHelp(Table:C252(->[DOCUMENTS:7]); "dSaveAs")
	xNext:=Num:C11([DOCUMENTS:7]Standard:9)
	vTitle1:=[DOCUMENTS:7]Document_Code:1
	If (vTitle1="*TMP@")
		Let_No
		vTitle1:=DOC_t_DocumentCode
	End if 
	vTitle2:=[DOCUMENTS:7]Heading:2
	If ([ACTIONS:13]Action_Code:1#vType)
		MESSAGES OFF:C175
		QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=vType)
		MESSAGES ON:C181
	End if 
	vTitle3:="Save "+[ACTIONS:13]Action_Name:2+(" Template"*xNext)+" as..."
	
	// CREATE SET([DOCUMENTS];"Master")`no - cos is done from Output & New & Open proc
	If ([DOCUMENTS:7]Document_Code:1#"")  //not & #TMP cos would leave the TMP one
		
		//    DB_SaveRecord(->[DOCUMENTS])`don't save cos would be before a changed name
		PUSH RECORD:C176([DOCUMENTS:7])
		DB_bo_RecordModified:=True:C214
	Else 
		DB_bo_RecordModified:=False:C215
	End if 
	If ([DOCUMENTS:7]Person:10#"")
		<>Per_at_PersonnelNames:=Find in array:C230(<>Per_at_PersonnelNames; [DOCUMENTS:7]Person:10)
		If (<>Per_at_PersonnelNames<1)
			<>Per_at_PersonnelNames:=Find in array:C230(<>Per_at_PersonnelNames; <>PER_t_CurrentUserInitials)
		End if 
	End if 
	Letters_SWSaSrc
	INT_SetDialog
	
End if 
ERR_MethodTrackerReturn("FM:dSaveAs"; $_t_oldMethodName)
