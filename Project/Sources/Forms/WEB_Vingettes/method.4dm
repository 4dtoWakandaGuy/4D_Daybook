If (False:C215)
	//Project Form Method Name:      WEB_Vingettes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 11:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DBWS_abo_DocumentActive;0)
	//ARRAY BOOLEAN(DBWS_lb_Documents;0)
	//ARRAY LONGINT(DBWS_al_DocumentTypes;0)
	//ARRAY TEXT(DBWS_at_DocumentCodes;0)
	//ARRAY TEXT(DBWS_at_documentHeadings;0)
	//ARRAY TEXT(DBWS_at_DocumentTypes;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DBWS_bo_ActiveAsset)
	C_LONGINT:C283($_l_Event; $_l_SetTypesIndex; $_l_SizeofArray; DB_I_WSProgress; DBSWS_l_vinWinBottom; DBSWS_l_vinWinLeft; DBSWS_l_vinWinRight; DBSWS_l_vinWinTop; DWS_l_BUT1; DWS_l_But2; DWS_l_BUT3)
	C_LONGINT:C283(DWS_l_BUT4; DWS_l_BUT5; DWS_l_BUT6; DWS_l_BUT7; DWS_l_BUT8; DWS_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; DB_t_LinkURL; DBWS_t_Webform; DWS_t_COL1; DWS_t_COL2; DWS_t_COL3; DWS_t_COL4; DWS_t_COL5; DWS_t_COL6; DWS_t_COL7; DWS_t_COL8)
	C_TEXT:C284(DWS_t_COL9; DWS_t_HED1; DWS_t_HED2; DWS_t_HED3; DWS_t_HED4; DWS_t_HED5; DWS_t_HED6; DWS_t_HED7; DWS_t_HED8; DWS_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM WEB_Vingettes"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_I_WSProgress:=0
		WA SET PREFERENCE:C1041(DBWS_t_Webform; 2; True:C214)
		WA SET PREFERENCE:C1041(DBWS_t_Webform; 3; True:C214)
		WA SET PREFERENCE:C1041(DBWS_t_Webform; 4; True:C214)
		//$Err:=Web_SetPreferences(SD2_l_Dataform;Web_kVisible;1;"")  `0=hide the browser; 1=show the browser (2) SET VISIBLE doesn't fully hide web area
		//DB_t_WebUrl:="http://digitalmedia.creamermedia.co.za:8080/Cumulus"
		DB_t_LinkURL:=""
		
		//- are inactive 900=text 901=document link 902=html 903 URL(other site)
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=-900; *)  //
		
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=-901; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=-902; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=-903; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=900; *)  //
		
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=901; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=902; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=903)
		ARRAY TEXT:C222(DBWS_at_DocumentTypes; 0)
		ARRAY BOOLEAN:C223(DBWS_abo_DocumentActive; 0)
		
		SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; DBWS_at_DocumentCodes; [DOCUMENTS:7]Heading:2; DBWS_at_documentHeadings; [DOCUMENTS:7]Document_Class:14; DBWS_al_DocumentTypes)
		$_l_SizeofArray:=Size of array:C274(DBWS_at_DocumentCodes)
		ARRAY TEXT:C222(DBWS_at_DocumentTypes; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(DBWS_abo_DocumentActive; $_l_SizeofArray)
		For ($_l_SetTypesIndex; 1; $_l_SizeofArray)
			Case of 
				: (Abs:C99(DBWS_al_DocumentTypes{$_l_SetTypesIndex})=900)
					DBWS_at_DocumentTypes{$_l_SetTypesIndex}:="Text with no markup"
				: (Abs:C99(DBWS_al_DocumentTypes{$_l_SetTypesIndex})=901)
					DBWS_at_DocumentTypes{$_l_SetTypesIndex}:="HTML Marked up text"
					
				: (Abs:C99(DBWS_al_DocumentTypes{$_l_SetTypesIndex})=902)
					DBWS_at_DocumentTypes{$_l_SetTypesIndex}:="Link to document"
				: (Abs:C99(DBWS_al_DocumentTypes{$_l_SetTypesIndex})=903)
					DBWS_at_DocumentTypes{$_l_SetTypesIndex}:="URL(embed)"
					
				Else 
					DBWS_at_DocumentTypes{$_l_SetTypesIndex}:="Unknown"
			End case 
			If (DBWS_al_DocumentTypes{$_l_SetTypesIndex}>0)
				DBWS_abo_DocumentActive{$_l_SetTypesIndex}:=True:C214
			Else 
				DBWS_abo_DocumentActive{$_l_SetTypesIndex}:=False:C215
			End if 
			
		End for 
		
		
		
		LB_SetupListbox(->DBWS_lb_Documents; "DWS_t"; "DWS_L"; 1; ->DBWS_abo_DocumentActive; ->DBWS_at_DocumentTypes; ->DBWS_at_documentHeadings; ->DBWS_at_DocumentCodes; ->DBWS_al_DocumentTypes)
		
		LB_SetColumnHeaders(->DBWS_lb_Documents; "DWS_L"; 1; "Active"; "Type"; "Name"; "Code"; "Class")
		LB_SetColumnWidths(->DBWS_lb_Documents; "ABC_t"; 1; 40; 176; 268; 68; 0)
		
		LB_SetEnterable(->DBWS_lb_Documents; False:C215; 0)
		LB_SetEnterable(->DBWS_lb_Documents; False:C215; 1)
		LB_SetScroll(->DBWS_lb_Documents; -3; -2)
		LB_StyleSettings(->DBWS_lb_Documents; "Black"; 9; "ABC_t"; ->[ACCOUNTS:32])
		GET WINDOW RECT:C443(DBSWS_l_vinWinLeft; DBSWS_l_vinWinTop; DBSWS_l_vinWinRight; DBSWS_l_vinWinBottom)
		
		
		
		
		
		
End case 
ERR_MethodTrackerReturn("FM WEB_Vingettes"; $_t_oldMethodName)
