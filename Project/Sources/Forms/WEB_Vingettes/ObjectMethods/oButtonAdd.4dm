If (False:C215)
	//object Name: Object Name:      WEB_Vingettes.oButtonAdd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 11:56
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DBWS_abo_DocumentActive;0)
	//ARRAY LONGINT(DBWS_al_DocumentTypes;0)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY TEXT(DBWS_at_Assettypes;0)
	//ARRAY TEXT(DBWS_at_DocumentCodes;0)
	//ARRAY TEXT(DBWS_at_documentHeadings;0)
	//ARRAY TEXT(DBWS_at_DocumentTypes;0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	C_BOOLEAN:C305(DBWS_bo_ActiveAsset; GEN_Bo_ShowCreate)
	C_LONGINT:C283($_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Index; DBSWS_l_vinWinBottom; DBSWS_l_vinWinLeft; DBSWS_l_vinWinRight; DBSWS_l_vinWinTop; DBWS_l_DocumentClass; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_AssetName; $_t_Document; $_t_oldMethodName; $_t_ServerPath; DB_t_WindowTitle; DBWS_t_CurrentLoadedDocument; DBWS_t_DocumentText; DBWS_t_DocumentTitle; DBWS_t_DocumentURL)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/WEB_Vingettes/oButtonAdd"; Form event code:C388)
$_t_oldMethodName:=ERR_MethodTracker("OBJ WEB_Vingettes.oButtonAdd"; Form event code:C388)

//Select the asset type to add
ARRAY TEXT:C222(DBWS_at_Assettypes; 0)
APPEND TO ARRAY:C911(DBWS_at_Assettypes; "Text with no markup")
APPEND TO ARRAY:C911(DBWS_at_Assettypes; "HTML Marked up text")
APPEND TO ARRAY:C911(DBWS_at_Assettypes; "Link to document")
APPEND TO ARRAY:C911(DBWS_at_Assettypes; "URL(embed)")

ARRAY TEXT:C222(GEN_at_DropDownMenu; Size of array:C274(DBWS_at_Assettypes))
ARRAY LONGINT:C221(GEN_al_DropDownMenuID; Size of array:C274(DBWS_at_Assettypes))
CLEAR SEMAPHORE:C144("$LoadingListofLists")
$_l_CurrentRow:=0
GET WINDOW RECT:C443(DBSWS_l_vinWinLeft; DBSWS_l_vinWinTop; DBSWS_l_vinWinRight; DBSWS_l_vinWinBottom)
For ($_l_Index; 1; Size of array:C274(DBWS_at_Assettypes))  //8
	//do not put in invisible ones
	$_l_CurrentRow:=$_l_CurrentRow+1
	GEN_at_DropDownMenu{$_l_CurrentRow}:=DBWS_at_Assettypes{$_l_Index}
	GEN_al_DropDownMenuID{$_l_CurrentRow}:=$_l_Index
End for   //8
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
GEN_Bo_ShowCreate:=False:C215
DB_t_WindowTitle:="Select asset type"
DIALOG:C40([USER:15]; "Gen_PopUpChoice")
CLOSE WINDOW:C154
If (GEN_at_DropDownMenu>0)
	Case of 
		: (DBWS_at_Assettypes{GEN_at_DropDownMenu}="Text with no markup")
			DBWS_t_CurrentLoadedDocument:=""
			DBWS_t_DocumentTitle:=""
			DBWS_t_DocumentText:=""
			DBWS_l_DocumentClass:=900
			DBWS_bo_ActiveAsset:=True:C214
			FORM GOTO PAGE:C247(2)
		: (DBWS_at_Assettypes{GEN_at_DropDownMenu}="HTML Marked up text")
			DBWS_t_CurrentLoadedDocument:=""
			DBWS_t_DocumentTitle:=""
			DBWS_t_DocumentText:=""
			DBWS_l_DocumentClass:=901
			DBWS_bo_ActiveAsset:=True:C214
			FORM GOTO PAGE:C247(2)
		: (DBWS_at_Assettypes{GEN_at_DropDownMenu}="Link to document")
			$_t_Document:=Document
			Document:=""
			$_ti_DocumentRef:=Open document:C264(""; ""; 3)
			If (Document#"")
				Gen_Alert("This asset path must be relative to the server, edit the path to suit")
				$_t_ServerPath:=Gen_Request("Server asset path"; document)
				If ($_t_ServerPath#"")
					$_t_AssetName:=Gen_Request("Name this asset"; "")
					If ($_t_AssetName#"")
						CREATE RECORD:C68([DOCUMENTS:7])
						[DOCUMENTS:7]Document_Class:14:=902
						[DOCUMENTS:7]Document_Code:1:="WB "+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "WB")
						[DOCUMENTS:7]Heading:2:=$_t_AssetName
						[DOCUMENTS:7]Text:3:=$_t_ServerPath
						APPEND TO ARRAY:C911(DBWS_at_DocumentCodes; [DOCUMENTS:7]Document_Code:1)
						APPEND TO ARRAY:C911(DBWS_at_documentHeadings; [DOCUMENTS:7]Heading:2)
						APPEND TO ARRAY:C911(DBWS_al_DocumentTypes; [DOCUMENTS:7]Document_Class:14)
						APPEND TO ARRAY:C911(DBWS_at_DocumentTypes; "Link to document")
						APPEND TO ARRAY:C911(DBWS_abo_DocumentActive; True:C214)
						SAVE RECORD:C53([DOCUMENTS:7])
						
						
					End if 
				End if 
				CLOSE DOCUMENT:C267($_ti_DocumentRef)
				
			End if 
			Document:=$_t_Document
			
			
			
		: (DBWS_at_Assettypes{GEN_at_DropDownMenu}="URL(embed)")
			DBWS_t_CurrentLoadedDocument:=""
			DBWS_t_DocumentTitle:=""
			DBWS_t_DocumentURL:=""
			DBWS_bo_ActiveAsset:=True:C214
			DBWS_l_DocumentClass:=903
			FORM GOTO PAGE:C247(4)
			
			
			
	End case 
End if 
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("OBJ WEB_Vingettes.oButtonAdd"; $_t_oldMethodName)
