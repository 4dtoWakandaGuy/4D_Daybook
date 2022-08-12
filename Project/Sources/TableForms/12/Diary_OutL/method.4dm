If (False:C215)
	//Table Form Method Name: [DIARY]Diary_OutL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_DIaryDocumentCodes; 0)
	ARRAY TEXT:C222($_at_DocumentCodes; 0)
	//ARRAY TEXT(DOC_at_DocumentTypes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; INT_bo_DetailOpen; WIN_bo_Resize)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_DocClass; $_l_DocClass2; $_l_event; DEF_l_SettingsCalled; SIZ_l_Minimized; SIZ_l_OLDBottom; SIZ_l_OLDLEFT; SIZ_l_OLDRight; SIZ_l_OLDTop; VNo)
	C_TEXT:C284($_t_DocumentCode; $_t_FormReference; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; oldform; vButtDisO; vName; VordTitle; WIN_t_CurrentInputForm)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_OutL"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		
		ARRAY TEXT:C222(DOC_at_DocumentTypes; 2)
		DOC_at_DocumentTypes{1}:="Letters"
		DOC_at_DocumentTypes{2}:="Emails"
		If (DOC_at_DocumentTypes=0)
			If (Records in selection:C76([DIARY:12])=1)
				FIRST RECORD:C50([DIARY:12])
				If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
					$_t_DocumentCode:=[DIARY:12]Document_Code:15
					QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=$_t_DocumentCode)
				End if 
				If ([DOCUMENTS:7]Document_Class:14=-4) | ([DOCUMENTS:7]Document_Class:14=4)
					DOC_at_DocumentTypes:=2
				Else 
					DOC_at_DocumentTypes:=1
				End if 
			Else 
				DOC_at_DocumentTypes:=1
			End if 
			Case of 
				: (DOC_at_DocumentTypes=1)
					COPY NAMED SELECTION:C331([DIARY:12]; "AllSelection")
					DISTINCT VALUES:C339([DIARY:12]Document_Code:15; $_at_DIaryDocumentCodes)
					QUERY WITH ARRAY:C644([DOCUMENTS:7]Document_Code:1; $_at_DIaryDocumentCodes)
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=-3)
					SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; $_at_DocumentCodes)
					QUERY WITH ARRAY:C644([DIARY:12]Document_Code:15; $_at_DocumentCodes)
				: (DOC_at_DocumentTypes=2)
					COPY NAMED SELECTION:C331([DIARY:12]; "AllSelection")
					DISTINCT VALUES:C339([DIARY:12]Document_Code:15; $_at_DIaryDocumentCodes)
					QUERY WITH ARRAY:C644([DOCUMENTS:7]Document_Code:1; $_at_DIaryDocumentCodes)
					QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=-4)
					SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; $_at_DocumentCodes)
					QUERY WITH ARRAY:C644([DIARY:12]Document_Code:15; $_at_DocumentCodes)
					
			End case 
			//Relate many selection([DOCUMENTS]LDocument_Code)
		End if 
		If (DEF_l_SettingsCalled=0)
			If (SIZ_l_OLDLEFT=0) & (SIZ_l_OLDTOP=0) & (SIZ_l_OLDRIGHT=0) & (SIZ_l_OLDBOTTOM=0)
				WS_OutputResize
			End if 
			INT_Setoutput(Table:C252(->[DIARY:12]); WIN_t_CurrentOutputform; ->VordTitle; 120)
			DEF_l_SettingsCalled:=1
		Else 
			DEF_l_SettingsCalled:=0
		End if 
		VNo:=Records in selection:C76([DIARY:12])
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(INT_bo_DetailOpen))
			If (Not:C34(WIN_bo_Resize))
				
				WS_OutputResize
			Else 
				WIN_bo_Resize:=False:C215
			End if 
			
		End if 
		
		INT_bo_DetailOpen:=False:C215
	: ($_l_event=On Display Detail:K2:22)
		If ([DIARY:12]Diary_Code:3#"")
			RELATE ONE:C42([DIARY:12]Contact_Code:2)
			vName:=[CONTACTS:1]Contact_Name:31
			//    RELATE ONE([DIARY]Document Code)
			If ([COMPANIES:2]Company_Code:1#[DIARY:12]Company_Code:1)  //only here cos StatsView kills auto rels
				RELATE ONE:C42([DIARY:12]Company_Code:1)
			End if 
		Else 
			REDUCE SELECTION:C351([CONTACTS:1]; 0)
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			vName:=""
			
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_OutL")
		Cache_Initialise("DMaster")
		FSetting_SetLabel(WIN_t_CurrentOutputform)
	: ($_l_event=On Activate:K2:9)  // | (vFromIn))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_OutL")
		vButtDisO:="O              D "
		Out_Buttons
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		DB_t_CurrentFormUsage:="InL"
		Out_ButtCall(->[DIARY:12]; ->[DIARY:12]Diary_Code:3; ->[DIARY:12]Company_Code:1; "Diary"; "Diary_New"; "Diary_DiarySel"; "Minor_DelSetEx"; "DMaster"; "Diary"; "Diary_OutCount"; 1; 2)
	: ($_l_event=On Open Detail:K2:23)
		oldform:=WIN_t_CurrentInputForm
		//may need to open an email here so
		RELATE ONE:C42([DIARY:12]Document_Code:15)
		$_l_DocClass:=Text Email
		$_l_DocClass2:=Text Email Template
		If ([DOCUMENTS:7]Document_Class:14=$_l_DocClass) | ([DOCUMENTS:7]Document_Class:14=$_l_DocClass2)
			OLDform:=WIN_t_CurrentInputForm
			//coerse the form here
			FORM SET INPUT:C55([DIARY:12]; "Diary_InEmail")
			WIN_t_CurrentInputForm:="Diary_InEmail"
			
		Else 
			FORM SET INPUT:C55([DIARY:12]; WIN_t_CurrentInputForm)
		End if 
		GET WINDOW RECT:C443(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		
		
	: ($_l_event=On Close Detail:K2:24)
		$_t_FormReference:=Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm  //added NG may 2004
		INT_LoadFormSizes(<>PER_l_CurrentUserID; $_t_FormReference)
		
		WIN_t_CurrentInputForm:=OLDform
		FORM SET INPUT:C55([DIARY:12]; WIN_t_CurrentInputForm)
		SET WINDOW RECT:C444(SIZ_l_OLDLEFT; SIZ_l_OLDTOP; SIZ_l_OLDRIGHT; SIZ_l_OLDBOTTOM)
		vButtDisO:="O              D "
		Out_Buttons
End case 
ERR_MethodTrackerReturn("FM:Diary_OutL"; $_t_oldMethodName)
