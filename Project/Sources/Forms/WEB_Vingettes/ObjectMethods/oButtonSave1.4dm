If (False:C215)
	//object Name: Object Name:      WEB_Vingettes.oButtonSave1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 13:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DBWS_abo_DocumentActive;0)
	//ARRAY LONGINT(DBWS_al_DocumentTypes;0)
	//ARRAY TEXT(DBWS_at_DocumentCodes;0)
	//ARRAY TEXT(DBWS_at_documentHeadings;0)
	//ARRAY TEXT(DBWS_at_DocumentTypes;0)
	C_BOOLEAN:C305(DBWS_bo_ActiveAsset)
	C_LONGINT:C283($_l_DocumentRow; DBSWS_l_vinWinBottom; DBSWS_l_vinWinLeft; DBSWS_l_vinWinRight; DBSWS_l_vinWinTop)
	C_TEXT:C284($_t_oldMethodName; DBWS_t_CurrentLoadedDocument; DBWS_t_DocumentTitle; DBWS_t_DocumentURL)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/WEB_Vingettes/oButtonSave1"; Form event code:C388)

If (DBWS_t_DocumentTitle#"") & (DBWS_t_DocumentURL#"")
	If (DBWS_t_CurrentLoadedDocument#"")
		READ WRITE:C146([DOCUMENTS:7])
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DBWS_t_CurrentLoadedDocument)
	Else 
		CREATE RECORD:C68([DOCUMENTS:7])
		[DOCUMENTS:7]Document_Class:14:=903
		[DOCUMENTS:7]Document_Code:1:="WB "+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "WB")
	End if 
	[DOCUMENTS:7]Heading:2:=DBWS_t_DocumentTitle
	[DOCUMENTS:7]Text:3:=DBWS_t_DocumentURL
	If (Not:C34(DBWS_bo_ActiveAsset))
		[DOCUMENTS:7]Document_Class:14:=-903
	End if 
	If (DBWS_t_CurrentLoadedDocument="")
		APPEND TO ARRAY:C911(DBWS_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
		APPEND TO ARRAY:C911(DBWS_at_documentHeadings; [DOCUMENTS:7]Heading:2)
		APPEND TO ARRAY:C911(DBWS_al_DocumentTypes; [DOCUMENTS:7]Document_Class:14)
		APPEND TO ARRAY:C911(DBWS_at_DocumentTypes; "URL(embed)")
		APPEND TO ARRAY:C911(DBWS_abo_DocumentActive; DBWS_bo_ActiveAsset)
	Else 
		$_l_DocumentRow:=Find in array:C230(DBWS_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
		If ($_l_DocumentRow>0)
			DBWS_at_documentHeadings{$_l_DocumentRow}:=[DOCUMENTS:7]Heading:2
			DBWS_al_DocumentTypes{$_l_DocumentRow}:=[DOCUMENTS:7]Document_Class:14
		End if 
	End if 
	SAVE RECORD:C53([DOCUMENTS:7])
	SET WINDOW RECT:C444(DBSWS_l_vinWinLeft; DBSWS_l_vinWinTop; DBSWS_l_vinWinRight; DBSWS_l_vinWinBottom)
	FORM GOTO PAGE:C247(1)
	
Else 
	Gen_Alert("You must provide a URL and an asset name")
	
End if 
ERR_MethodTrackerReturn("OBJ WEB_Vingettes.oButtonSave1"; $_t_oldMethodName)
