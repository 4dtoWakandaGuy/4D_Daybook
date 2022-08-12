If (False:C215)
	//object Method Name: Object Name:      WEB_Vingettes.oLBWebVignettes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/03/2012 12:49
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DBWS_al_DocumentTypes;0)
	//ARRAY TEXT(DBWS_at_DocumentCodes;0)
	C_BOOLEAN:C305(DBWS_bo_ActiveAsset)
	C_LONGINT:C283($_l_Column; $_l_Event; $_l_Row; $_l_Type; DBSWS_l_vinWinBottom; DBSWS_l_vinWinLeft; DBSWS_l_vinWinRight; DBSWS_l_vinWinTop; DBWS_l_DocumentClass)
	C_TEXT:C284($_t_AssetPath; $_t_oldMethodName; DB_t_LinkURL; DBWS_t_CurrentLoadedDocument; DBWS_t_DocumentText; DBWS_t_DocumentTitle; DBWS_t_DocumentURL; DBWS_t_Webform)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ WEB_Vingettes.oLBWebVignettes"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
		
	: ($_l_Event=On Double Clicked:K2:5)
		READ WRITE:C146([DOCUMENTS:7])
		GET WINDOW RECT:C443(DBSWS_l_vinWinLeft; DBSWS_l_vinWinTop; DBSWS_l_vinWinRight; DBSWS_l_vinWinBottom)
		LISTBOX GET CELL POSITION:C971(*; "oLBWebVignettes"; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Row>0)
				$_l_Type:=DBWS_al_DocumentTypes{$_l_Row}
				QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=DBWS_at_DocumentCodes{$_l_Row})
				DBWS_t_CurrentLoadedDocument:=[DOCUMENTS:7]Document_Code:1
				DBWS_bo_ActiveAsset:=([DOCUMENTS:7]Document_Class:14>0)
				DBWS_l_DocumentClass:=[DOCUMENTS:7]Document_Class:14
				Case of 
					: ($_l_Type=(900))  //Plain Text
						
						DBWS_t_DocumentText:=[DOCUMENTS:7]Text:3
						FORM GOTO PAGE:C247(2)
					: ($_l_Type=(901))  //html
						DBWS_t_DocumentTitle:=[DOCUMENTS:7]Heading:2
						DBWS_t_DocumentText:=[DOCUMENTS:7]Text:3
						FORM GOTO PAGE:C247(2)
					: ($_l_Type=(902))  //link to document..
						$_ti_DocumentRef:=Open document:C264(""; ""; 3)
						If (Document#"")
							Gen_Alert("This asset path must be relative to the server, edit the path to suit")
							$_t_AssetPath:=Gen_Request("Server asset path"; document)
							If (OK=1) & ($_t_AssetPath#"")
								[DOCUMENTS:7]Text:3:=$_t_AssetPath
							End if 
							SAVE RECORD:C53([DOCUMENTS:7])
							
						End if 
						
						
					: ($_l_Type=(903))  //link to webpage
						DBWS_t_DocumentTitle:=[DOCUMENTS:7]Heading:2
						DBWS_t_DocumentURL:=[DOCUMENTS:7]Text:3
						DB_t_LinkURL:="http://"+DBWS_t_DocumentURL
						WA OPEN URL:C1020(*; "oWebform"; DB_t_LinkURL)
						WA REFRESH CURRENT URL:C1023(DBWS_t_Webform)
						FORM GOTO PAGE:C247(3)
				End case 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ WEB_Vingettes.oLBWebVignettes"; $_t_oldMethodName)
