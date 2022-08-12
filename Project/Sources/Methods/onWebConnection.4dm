//%attributes = {}
If (False:C215)
	//Project Method Name:      onWebConnection
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2013 00:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(cache)
	//C_UNKNOWN(no)
	//ARRAY LONGINT(<>DB_AL_UserProcessID;0)
	//ARRAY LONGINT(DBWS_al_Class;0)
	//ARRAY TEXT(<>DBWS_at_UserProcess;0)
	//ARRAY TEXT(<>DBWS_at_UserProcessName;0)
	ARRAY TEXT:C222($_at_DocHeadingNames; 0)
	//ARRAY TEXT(DBSW_at_values;0)
	//ARRAY TEXT(DBWS_at_assets;0)
	//ARRAY TEXT(DBWS_at_Cache;0)
	//ARRAY TEXT(DBWS_at_CacheValues;0)
	//ARRAY TEXT(DBWS_at_variables;0)
	C_BLOB:C604($_blb_Picture)
	C_BOOLEAN:C305(<>DBWS_bo_optim; <>DBWS_Bo_Intited; <>DBWS_bo_WebConnectionsInited; $_bo_DocIsInvisible; $_bo_DocIsInvisible2; $_bo_DocIsLocked; $_bo_DocIsLocked2; $_bo_Replace; DB_bo_connected; DBWS_bo_Connected)
	C_DATE:C307($_d_DocCreatedOn; $_d_DocCreatedOn2; $_d_DocModifiedOn; $_d_DocModifiedOn2)
	C_LONGINT:C283($_l_ExtensionPosition; $_l_FullDays; $_l_Index; $_l_Process; $_l_ProcessRow; $_l_StringPosition; $_l_ThatDay; $_l_TImeToday; $_l_TotalTime; $_l_UserCompanionProcess; DBWS_l_CookieRef)
	C_PICTURE:C286(<>DB_Pic_CoLogo)
	C_TEXT:C284($_t_Assets; $_t_DefaultLogoPath; $_t_DocumentName; $_t_DocumentPath; $_t_HomeFormName; $_t_ImagesPath; $_t_LoginFormName; $_t_oldMethodName; $_t_ResourcesPath; $_t_SearchFormName; $1)
	C_TEXT:C284($2; $3; $4; $5; $6; DB_T_DefaultTitle; DB_T_user_ip; DBWS_T_DefaultTitle; DBWS_t_Incomimingurl; DBWS_T_incomingaction; DBWS_T_incomingParam)
	C_TEXT:C284(DBWS_t_LoggedInUserName; DBWS_t_mess; DBWS_t_RecordTitle; DBWS_T_Title; DBWS_T_user_ip; DSWS_t_Currentcookie)
	C_TIME:C306($_ti_DocCreatedAt; $_ti_DocCreatedAt2; $_ti_DocModifiedAt; $_ti_DocModifiedAt2; $_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("onWebConnection")



If (Not:C34(<>DBWS_Bo_Intited))
	DBWS_Init
	
End if 
//`DBWS_CookieSet (String(0)) use this to clear the logged in status
//$1Text URL
//$2Text HTTP header+HTTP body(up to 32 kb limit)
//$3Text IP address of the Web clie(browser)
//$4Text IP address of the server
//$5Text User name
//$6Text Password
ARRAY TEXT:C222(DBWS_at_variables; 0)
ARRAY TEXT:C222(DBSW_at_values; 0)


DBWS_t_Incomimingurl:=$1
DBWS_T_user_ip:=$3
DBWS_bo_Connected:=False:C215
DBWS_T_DefaultTitle:="Daybook"
If (Not:C34(<>DBWS_bo_WebConnectionsInited))
	READ WRITE:C146([WEB_ACCESS:130])
	
	QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1#"")
	APPLY TO SELECTION:C70([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1:="")
	UNLOAD RECORD:C212([WEB_ACCESS:130])
	READ ONLY:C145([WEB_ACCESS:130])
	
	ARRAY TEXT:C222(<>DBWS_at_UserProcess; 0)  //Holds the user name
	ARRAY TEXT:C222(<>DBWS_at_UserProcessName; 0)  //Hold the Process_Name for validation
	ARRAY LONGINT:C221(<>DB_AL_UserProcessID; 0)  //Holds the process ID
	$_l_Process:=New process:C317("DBWS_AutoLogout"; 128000; "Auto Disconnect Web Clients")
	//These arrays will be used to cache server side user setting to handle such things as user menus.
	<>DBWS_bo_WebConnectionsInited:=True:C214
End if 
DBWS_t_LoggedInUserName:=""
DBWS_PreProcess
READ ONLY:C145(*)
If (Not:C34(<>DBWS_Bo_Intited))
	//Need to use the server connected IP-the request the connection came into this is the form of a URL...
	
	If (Picture size:C356(<>DB_Pic_CoLogo)>0)  //this needs to be modified for multiple server usage
		
		$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
		$_l_StringPosition:=Position:C15("Resources"; $_t_ResourcesPath)
		$_t_ImagesPath:=Substring:C12($_t_ResourcesPath; 1; $_l_StringPosition-1)
		$_t_DocumentPath:=$_t_ImagesPath+"WebFolder"+Folder separator:K24:12+"Images"+Folder separator:K24:12
		$_t_DocumentPath:=$_t_DocumentPath+"Logo"+"."+"jpg"
		PICTURE TO BLOB:C692(<>DB_Pic_CoLogo; $_blb_Picture; "JPEG")
		$_ti_DocumentRef:=Create document:C266($_t_DocumentPath; "JPEG")
		CLOSE DOCUMENT:C267($_ti_DocumentRef)  // We don't need to keep it open
		BLOB TO DOCUMENT:C526(Document; $_blb_Picture)
		DBWS_pic_OwnerLogo:=<>DB_Pic_CoLogo
	Else 
		//daybook logo
		$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
		$_l_StringPosition:=Position:C15("Resources"; $_t_ResourcesPath)
		$_t_ImagesPath:=Substring:C12($_t_ResourcesPath; 1; $_l_StringPosition-1)
		$_t_DocumentPath:=$_t_ImagesPath+"WebFolder"+Folder separator:K24:12+"Images"+Folder separator:K24:12
		$_t_DocumentPath:=$_t_DocumentPath+"Logo"+"."+"jpg"
		$_t_DefaultLogoPath:=$_t_ImagesPath+"WebFolder"+Folder separator:K24:12+"Images"+Folder separator:K24:12+"topbanner.jpg"
		COPY DOCUMENT:C541($_t_DefaultLogoPath; $_t_DocumentPath)
		
	End if 
	<>DBWS_Bo_Intited:=True:C214
End if 
If (DSWS_t_Currentcookie="")
	DBWS_l_CookieRef:=AA_GetNextID(->DBWS_l_CookieRef)
	DBWS_CookieSet(String:C10(DBWS_l_CookieRef))
	
Else 
	
	DBWS_noCache
	QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=DSWS_t_Currentcookie)
	If (Records in selection:C76([WEB_ACCESS:130])=1)  //else we are not logged in
		If ([WEB_ACCESS:130]Client_IP:5=DBWS_T_user_ip)
			If ([WEB_ACCESS:130]Access_Date:2=Current date:C33)
				$_l_TotalTime:=(Current time:C178-[WEB_ACCESS:130]Access_Time:3)*1
			Else 
				$_l_TImeToday:=(Current time:C178-?00:00:00?)*1
				$_l_FullDays:=(Current date:C33-[WEB_ACCESS:130]Access_Date:2)-1
				$_l_ThatDay:=(?23:59:59?-[WEB_ACCESS:130]Access_Time:3)*1
				$_l_TotalTime:=$_l_TImeToday+$_l_ThatDay+($_l_FullDays*(24*60*60))
			End if 
			If ($_l_TotalTime<(45*60))
				DBWS_bo_Connected:=True:C214
				DBWS_t_LoggedInUserName:=[WEB_ACCESS:130]Person:10
				
				$_l_ProcessRow:=Find in array:C230(<>DBWS_at_UserProcess; [WEB_ACCESS:130]Person:10)
				If ($_l_ProcessRow>0)
					
					
				End if 
			Else 
				READ WRITE:C146([WEB_ACCESS:130])
				LOAD RECORD:C52([WEB_ACCESS:130])
				[WEB_ACCESS:130]Web_Ref:1:=""
				SAVE RECORD:C53([WEB_ACCESS:130])
				UNLOAD RECORD:C212([WEB_ACCESS:130])
				UNLOAD RECORD:C212([WEB_ACCESS:130])
				
				DBWS_l_CookieRef:=AA_GetNextID(->DBWS_l_CookieRef)
				DBWS_CookieSet(String:C10(DBWS_l_CookieRef))
				//DBWS_bo_Connected:=False
			End if 
		End if 
	Else 
		//the cookie is expired
		DBWS_l_CookieRef:=AA_GetNextID(->DBWS_l_CookieRef)
		DBWS_CookieSet(String:C10(DBWS_l_CookieRef))
		//DBWS_bo_Connected:=False
	End if 
End if 


Case of 
		
	: ((DBWS_T_incomingaction="x_@") & (Not:C34(DBWS_bo_Connected)))  //
		$_t_LoginFormName:=DBWS_GetWSForm("Login")
		WEB SEND HTTP REDIRECT:C659($_t_LoginFormName)
		
		
	: ((DBWS_T_incomingaction="") | (DBWS_T_incomingaction="/"))  //| (Not(DBWS_bo_Connected))
		DBWS_T_Title:="Welcome"
		$_t_HomeFormName:=DBWS_GetWSForm("Home")
		DBWS_SetPage("Home"; $_t_HomeFormName)
		If (DBWS_bo_Connected)
			
			DBWS_T_Title:="Connected to Daybook"
			DBWS_Login
		End if 
		
	: (DBWS_T_incomingaction="search") & (DBWS_bo_Connected)  //second parameter for what to search??)
		DBWS_T_Title:="Query Database"
		$_t_SearchFormName:=DBWS_GetWSForm("search"; DBWS_T_incomingParam)
		DBWS_SetPage(""; $_t_SearchFormName)  //
		
	: (DBWS_T_incomingaction="search_response") & (DBWS_bo_Connected)
		
		DBWS_SmartQuery(DBWS_T_incomingParam)
		
	: (DBWS_T_incomingaction="new")  //&(DBWS_bo_Connected)
		
		
		DBWS_T_Title:="Create New "+DBWS_T_incomingParam
		DBWS_SmartCreate(DBWS_T_incomingParam)
		
		
		
	: (DBWS_T_incomingaction="Listing") & (DBWS_bo_Connected)
		
		$_t_SearchFormName:=DBWS_GetWSForm("search"; DBWS_T_incomingParam)
		DBWS_T_Title:=DBWS_t_RecordTitle
		
		
	: (DBWS_T_incomingaction="Registration")
		DBWS_T_Title:="Welcome"
	: (DBWS_T_incomingaction="login")
		DBWS_T_Title:="Connected to Daybook"
		DBWS_Login
	: (DBWS_T_incomingaction="relogin")  //this is called on refresh when already logged in-connect will have returned a module  we now get the use
		DBWS_T_Title:="Connected to Daybook"
		WEB SEND TEXT:C677(DBWS_t_LoggedInUserName)
	: (DBWS_T_incomingaction="logout")  //| (Not(DBWS_bo_Connected))
		
		
		DBWS_Logout
		
		
	: (DBWS_T_incomingaction="Modules") & (DBWS_bo_Connected)
		
		DBSW_ModulesJSON(DSWS_t_Currentcookie)
	: (DBWS_T_incomingaction="Menu") & (DBWS_bo_Connected)
		//set the menu for the current context for the current Context.
		//DBWS_T_incomingParam
		//TRACE
		DBSWS_MenuJSON(DSWS_t_Currentcookie)
		
		
	: (DBWS_T_incomingaction="connect")  //& (DBWS_bo_Connected)
		//This is called on refresh or first load.
		If (DBWS_bo_Connected)
			$_l_ProcessRow:=Find in array:C230(<>DBWS_at_UserProcess; DBWS_t_LoggedInUserName)
			If ($_l_ProcessRow>0)
				
				$_l_UserCompanionProcess:=<>DB_AL_UserProcessID{$_l_ProcessRow}
				While (Process state:C330(<>DB_AL_UserProcessID{$_l_ProcessRow})#Paused:K13:6)
					DelayTicks(2)
				End while 
				While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_ProcessRow})))
					DelayTicks(2)
				End while 
				While (Semaphore:C143("usercontrol"+[WEB_ACCESS:130]Person:10))
					DelayTicks(2)
				End while 
				//we will be returned several pieces of information
				//) the current selected module
				//`) the current menu(Json)
				//`the current selected table
				//`the current selection identity
				//`the current selection start range
				//`the current seleciton end range
				//`the current selected record number
				//` the current selected record data
				//`some of that data may be empty-there may be no current selected record.
				
				SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_ProcessRow}; DBWS_l_CallAction; 2)
				SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_ProcessRow}; DBWS_l_CallBack; Current process:C322)
				RESUME PROCESS:C320(<>DB_AL_UserProcessID{$_l_ProcessRow})
				CLEAR SEMAPHORE:C144("usercontrol"+[WEB_ACCESS:130]Person:10)
				WEB SEND TEXT:C677("companies")
				
			Else 
				//something wrong if we are logged in no process
				WEB SEND TEXT:C677("vingette")
			End if 
		Else 
			//not logged in so return the context to get as 'vingette'
			WEB SEND TEXT:C677("vingette")
		End if 
		
	: (DBWS_T_incomingaction="vingette")
		//this bit does not require the user to be logged in-this will find the links and content to be displayed when not logged in
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Class:14=900; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=901; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=902; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=903; *)
		QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Class:14=904)
		//  //<iframe src="URl" name="Name"
		//width="width"height="heigh">
		//content if browser does not support
		//</iframe>
		SELECTION TO ARRAY:C260([DOCUMENTS:7]Text:3; DBWS_at_assets; [DOCUMENTS:7]Document_Class:14; DBWS_al_Class; [DOCUMENTS:7]Heading:2; $_at_DocHeadingNames)
		$_t_Assets:=""
		For ($_l_Index; 1; Size of array:C274(DBWS_at_assets))
			If ($_t_Assets#"")
				$_t_Assets:=$_t_Assets+","
			End if 
			Case of 
				: (DBWS_al_Class{$_l_Index}=901)  //HTML text
					$_t_DocumentName:=$_at_DocHeadingNames{$_l_Index}
					$_t_DocumentName:=Replace string:C233($_at_DocHeadingNames{$_l_Index}; " "; "")
					$_t_DocumentName:=Replace string:C233($_t_DocumentName; "."; "")
					$_t_DocumentName:=Replace string:C233($_t_DocumentName; "/"; "")
					$_t_DocumentName:=Replace string:C233($_t_DocumentName; "\\"; "")
					$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
					$_l_StringPosition:=Position:C15("Resources"; $_t_ResourcesPath)
					$_t_ImagesPath:=Substring:C12($_t_ResourcesPath; 1; $_l_StringPosition-1)
					$_t_DocumentPath:=$_t_ImagesPath+"WebFolder:"+$_t_DocumentName+".html"
					If (Test path name:C476($_t_DocumentPath)#Is a document:K24:1)
						$_ti_DocumentRef:=Create document:C266($_t_DocumentPath)
						SEND PACKET:C103($_ti_DocumentRef; DBWS_at_assets{$_l_Index})
						CLOSE DOCUMENT:C267($_ti_DocumentRef)
						
						//COPY DOCUMENT(DBWS_at_assets{$_l_Index};$_t_DocumentPath)
					End if 
					//make sure if you edit these documents that it deletes the file at this location then.
					$_t_Assets:=$_t_Assets+"{"+Char:C90(34)+"asset"+Char:C90(34)+":"+Char:C90(34)+$_t_DocumentName+".html"+Char:C90(34)+","+Char:C90(34)
					//CHANGE THE LINK TYPE
					$_t_Assets:=$_t_Assets+"Type"+Char:C90(34)+":"+Char:C90(34)+String:C10(904)+Char:C90(34)+"}"
				: (DBWS_al_Class{$_l_Index}=902)  // link to a document
					$_t_DocumentName:=FileNamefromPath(DBWS_at_assets{$_l_Index})
					$_t_ResourcesPath:=Get 4D folder:C485(Current resources folder:K5:16)
					$_l_StringPosition:=Position:C15("Resources"; $_t_ResourcesPath)
					$_t_ImagesPath:=Substring:C12($_t_ResourcesPath; 1; $_l_StringPosition-1)
					$_t_DocumentPath:=$_t_ImagesPath+"WebFolder"+Folder separator:K24:12+$_t_DocumentName
					$_l_ExtensionPosition:=Position:C15(".HTML"; $_t_DocumentName)
					If ($_l_ExtensionPosition=0)
						$_l_ExtensionPosition:=Position:C15(".SHTML"; $_t_DocumentName)
						If ($_l_ExtensionPosition=0)
							$_l_ExtensionPosition:=Position:C15(".HTM"; $_t_DocumentName)
						End if 
					End if 
					If (Test path name:C476($_t_DocumentPath)#Is a document:K24:1)
						COPY DOCUMENT:C541(DBWS_at_assets{$_l_Index}; $_t_DocumentPath)
					Else 
						GET DOCUMENT PROPERTIES:C477($_t_DocumentPath; $_bo_DocIsLocked; $_bo_DocIsInvisible; $_d_DocCreatedOn; $_ti_DocCreatedAt; $_d_DocModifiedOn; $_ti_DocModifiedAt)
						GET DOCUMENT PROPERTIES:C477(DBWS_at_assets{$_l_Index}; $_bo_DocIsLocked2; $_bo_DocIsInvisible2; $_d_DocCreatedOn2; $_ti_DocCreatedAt2; $_d_DocModifiedOn2; $_ti_DocModifiedAt2)
						$_bo_Replace:=False:C215
						If ($_d_DocModifiedOn2>$_d_DocModifiedOn)
							$_bo_Replace:=True:C214
						Else 
							If ($_d_DocModifiedOn2=$_d_DocModifiedOn)
								If ($_ti_DocModifiedAt2>$_ti_DocModifiedAt)
									$_bo_Replace:=True:C214
								End if 
							End if 
						End if 
						If ($_bo_Replace)
							COPY DOCUMENT:C541(DBWS_at_assets{$_l_Index}; $_t_DocumentPath)
						End if 
					End if 
					If ($_l_ExtensionPosition=0)
						//LINK IS TO AN IMAGE
						$_t_Assets:=$_t_Assets+"{"+Char:C90(34)+"asset"+Char:C90(34)+":"+Char:C90(34)+$_t_DocumentName+Char:C90(34)+","+Char:C90(34)
						$_t_Assets:=$_t_Assets+"Type"+Char:C90(34)+":"+Char:C90(34)+String:C10(DBWS_al_Class{$_l_Index})+Char:C90(34)+"}"
					Else 
						$_t_Assets:=$_t_Assets+"{"+Char:C90(34)+"asset"+Char:C90(34)+":"+Char:C90(34)+$_t_DocumentName+Char:C90(34)+","+Char:C90(34)
						//CHANGE THE LINK TYPE
						$_t_Assets:=$_t_Assets+"Type"+Char:C90(34)+":"+Char:C90(34)+String:C10(904)+Char:C90(34)+"}"
					End if 
				Else 
					
					$_t_Assets:=$_t_Assets+"{"+Char:C90(34)+"asset"+Char:C90(34)+":"+Char:C90(34)+DBWS_at_assets{$_l_Index}+Char:C90(34)+","+Char:C90(34)
					$_t_Assets:=$_t_Assets+"Type"+Char:C90(34)+":"+Char:C90(34)+String:C10(DBWS_al_Class{$_l_Index})+Char:C90(34)+"}"
			End case 
			
		End for 
		$_t_Assets:="{"+Char:C90(34)+"assets"+Char:C90(34)+":["+$_t_Assets+"]}"
		SET TEXT TO PASTEBOARD:C523($_t_Assets)
		WEB SEND TEXT:C677($_t_Assets)
		
	: (DBWS_T_incomingaction="Tabs")
		//set the menu for the current context for the current Context.
		//DBSWS_TABSJSON
	: (DBWS_T_incomingaction="getquerybox")
		
		//zDBWS_GetQuerySetup
		//(DSWS_t_Currentcookie)
		
		
	: (DBWS_T_incomingaction="Filters")
		//set the menu for the current context
		//DBSWS_TABSJSON
		
		
	: (DBWS_T_incomingaction="UserSetting")
		
		DBWS_AlterUserPreference(DSWS_t_Currentcookie)
	: (DBWS_T_incomingaction="getgridlabels")
		DBWS_GetDataGridLabels(DSWS_t_Currentcookie)
	: (DBWS_T_incomingaction="getgridformat")
		DBWS_GetDataGrid(DSWS_t_Currentcookie)
	: (DBWS_T_incomingaction="getdata")
		DBWS_GetCachedData(DSWS_t_Currentcookie)
		
	Else 
		ARRAY TEXT:C222(DBWS_at_Cache; 0)
		ARRAY TEXT:C222(DBWS_at_CacheValues; 0)
		APPEND TO ARRAY:C911(DBWS_at_Cache; "Proxy-Connection")
		APPEND TO ARRAY:C911(DBWS_at_CacheValues; "close")
		APPEND TO ARRAY:C911(DBWS_at_Cache; "Cache-Control")
		APPEND TO ARRAY:C911(DBWS_at_CacheValues; "private, x-gzip-ok=\"\"")  //"no-cache"
		APPEND TO ARRAY:C911(DBWS_at_Cache; "Expires")
		APPEND TO ARRAY:C911(DBWS_at_CacheValues; "Mon, 1 Jan 2008 00:00:00 GMT")
		APPEND TO ARRAY:C911(DBWS_at_Cache; "X-STATUS")
		
		APPEND TO ARRAY:C911(DBWS_at_CacheValues; "404 Not Found")
		DSWS_t_Currentcookie:=""
		
		
End case 
ERR_MethodTrackerReturn("onWebConnection"; $_t_oldMethodName)