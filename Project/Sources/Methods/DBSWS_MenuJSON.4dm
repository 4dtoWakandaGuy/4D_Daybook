//%attributes = {}

If (False:C215)
	//Project Method Name:      DBSWS_MenuJSON
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_AL_UserProcessID;0)
	ARRAY TEXT:C222($_at_MenuItemIDS; 0; 0)
	ARRAY TEXT:C222($_at_MenuItems; 0; 0)
	ARRAY TEXT:C222($_at_MenuNames; 0)
	//ARRAY TEXT(DB_at_Formvalues;0)
	//ARRAY TEXT(DB_at_Formvariables;0)
	C_LONGINT:C283($_l_ArraySize; $_l_ExistingInsertionPoint; $_l_WebProcessRow)
	C_TEXT:C284($_t_DBWSJsonIconBar; $_t_ExistingString; $_t_IconLabel; $_t_InsertionHeader; $_t_JsonTYPE; $_t_MenuItemLabel; $_t_MenuJSON; $_t_MenuLabel; $_t_oldMethodName; $_t_String; $_t_ViewModule)
	C_TEXT:C284($_t_ViewScreen; $_t_ViewType; $1; DBWS_T_incomingParam; DBWS_t_JsonCurrentModule; DBWS_t_ModuleMenuJSON)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBSWS_MenuJSON")

//if we are getting a menu..we may have performed any of the following actions.
//1) Just logged in-we will get the cached User_Module and states and set the menu
//2) there may be no states-in which case we go to the 'Module_First for the user.
//3) the user may have clicked on a module which will redraw the menu for that module
//4 ) we may have no records open in which case it is the standard module menu
//we may have a window open in which case the we are replacing the module menu menu appended to the current window menu
//we may have clicked on a tab to view a different selection of records-changing from companies to contacts etc in which case we are resetting the menu for the current context.

$_t_oldMethodName:=ERR_MethodTracker("DBSWS_MenuJSON")
If (True:C214)
	$_t_String:=""
	If ($1#"")
		If (DBWS_T_incomingParam#"")
			Case of 
				: (DBWS_T_incomingParam="Start")
					//TRACE
					QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=$1)
					If (Records in selection:C76([WEB_ACCESS:130])=1)
						$_l_WebProcessRow:=DBWS_GetCurrentUserProcess([WEB_ACCESS:130]Personnel_ID:12; [WEB_ACCESS:130]Person:10)
						
						If ($_l_WebProcessRow>0)
							While (Process state:C330(<>DB_AL_UserProcessID{$_l_WebProcessRow})#Paused:K13:6)
								DelayTicks(2)
							End while 
							While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_WebProcessRow})))
								DelayTicks(2)
							End while 
							While (Semaphore:C143("usercontrol"+[WEB_ACCESS:130]Person:10))
								DelayTicks(2)
							End while 
							DBWS_t_JsonCurrentModule:=""
							SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_WebProcessRow}; DBWS_l_CallAction; 1100)
							SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_WebProcessRow}; DBWS_l_CallBack; Current process:C322)
							RESUME PROCESS:C320(<>DB_AL_UserProcessID{$_l_WebProcessRow})
							CLEAR SEMAPHORE:C144("usercontrol"+[WEB_ACCESS:130]Person:10)
							While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_WebProcessRow}))) | (DBWS_t_JsonCurrentModule="")
								DelayTicks(2)
							End while 
							While (Process state:C330(<>DB_AL_UserProcessID{$_l_WebProcessRow})#Paused:K13:6)
								DelayTicks(2)
							End while 
							While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_WebProcessRow})))
								DelayTicks(2)
							End while 
							While (Semaphore:C143("usercontrol"+[WEB_ACCESS:130]Person:10))
								DelayTicks(2)
							End while 
							DBWS_t_ModuleMenuJSON:=""
							SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_WebProcessRow}; DBWS_l_CallAction; 2)
							SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_WebProcessRow}; DBWS_l_CallBack; Current process:C322)
							RESUME PROCESS:C320(<>DB_AL_UserProcessID{$_l_WebProcessRow})
							CLEAR SEMAPHORE:C144("usercontrol"+[WEB_ACCESS:130]Person:10)
							While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_WebProcessRow}))) | (DBWS_t_ModuleMenuJSON="")
								DelayTicks(2)
							End while 
							WEB SEND TEXT:C677(DBWS_t_ModuleMenuJSON)
							SET TEXT TO PASTEBOARD:C523(DBWS_t_ModuleMenuJSON)
							
							
						Else 
							WEB SEND TEXT:C677($_t_String)
							SET TEXT TO PASTEBOARD:C523($_t_String)
						End if 
					Else 
						WEB SEND TEXT:C677($_t_String)
						SET TEXT TO PASTEBOARD:C523($_t_String)
					End if 
			End case 
		Else 
			WEB SEND TEXT:C677($_t_String)
			SET TEXT TO PASTEBOARD:C523($_t_String)
		End if 
	Else 
		WEB SEND TEXT:C677($_t_String)
		SET TEXT TO PASTEBOARD:C523($_t_String)
	End if 
End if 
If (False:C215)
	//The users default menu for their default module-note this must be a module that is available!!
	
	//This method will get the menu settings for a given context for a given user
	If (False:C215)
		$_l_WebProcessRow:=Find in array:C230(DB_at_Formvariables; "View Type")
		If ($_l_WebProcessRow>0)
			$_t_ViewType:=DB_at_Formvalues{$_l_WebProcessRow}  //This will be blank for no data displayed, output, input, dialog
			$_l_WebProcessRow:=Find in array:C230(DB_at_Formvariables; "Selected Module")
			If ($_l_WebProcessRow>0)
				$_t_ViewModule:=DB_at_Formvariables{$_l_WebProcessRow}  //This will be blank for no Module Selected
				$_l_WebProcessRow:=Find in array:C230(DB_at_Formvariables; "Selected Form")
				If ($_l_WebProcessRow>0)
					$_t_ViewScreen:=DB_at_Formvariables{$_l_WebProcessRow}  //this will give a 'form' to display-Contacts_Listing for a listing of Contacts. Contact for a contact form Companies_Listing for companies etc etc. For Dialogs Confirm_Dialog etc
					
					
				End if 
			End if 
		End if 
		
		ARRAY TEXT:C222($_at_MenuNames; 0)
		ARRAY TEXT:C222($_at_MenuItems; 0; 0)
		ARRAY TEXT:C222($_at_MenuItemIDS; 0; 0)  //the 'method' to call
		APPEND TO ARRAY:C911($_at_MenuNames; "File")
		INSERT IN ARRAY:C227($_at_MenuItems; Size of array:C274($_at_MenuItems)+1)
		INSERT IN ARRAY:C227($_at_MenuItemIDS; Size of array:C274($_at_MenuItemIDS)+1)
		$_l_ArraySize:=Size of array:C274($_at_MenuItems)
		APPEND TO ARRAY:C911($_at_MenuItems{$_l_ArraySize}; "New")
		APPEND TO ARRAY:C911($_at_MenuItemIDS{$_l_ArraySize}; "DB_NewRecord")
		APPEND TO ARRAY:C911($_at_MenuItems{$_l_ArraySize}; "Open")
		APPEND TO ARRAY:C911($_at_MenuItemIDS{$_l_ArraySize}; "DB_OpenRecord")
		
		APPEND TO ARRAY:C911($_at_MenuNames; "Edit")
		INSERT IN ARRAY:C227($_at_MenuItems; Size of array:C274($_at_MenuItems)+1)
		INSERT IN ARRAY:C227($_at_MenuItemIDS; Size of array:C274($_at_MenuItemIDS)+1)
		$_l_ArraySize:=Size of array:C274($_at_MenuItems)
		APPEND TO ARRAY:C911($_at_MenuItems{$_l_ArraySize}; "Edit")
		APPEND TO ARRAY:C911($_at_MenuItemIDS{$_l_ArraySize}; "DB_EditRecord")
		APPEND TO ARRAY:C911($_at_MenuItems{$_l_ArraySize}; "Copy")
		APPEND TO ARRAY:C911($_at_MenuItemIDS{$_l_ArraySize}; "DB_CopyRecord")
		
		$_t_MenuJSON:=""
		
		$_t_JsonTYPE:="STRING"
		$_t_ExistingString:=""
		$_l_ExistingInsertionPoint:=0
		$_t_InsertionHeader:="Menu"
		$_t_MenuLabel:="Menu"
		$_t_MenuItemLabel:="item"
		$_t_IconLabel:="Callback"
	End if 
	$_t_DBWSJsonIconBar:="{"+Char:C90(34)+"menu1"+Char:C90(34)+":"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+" {"+Char:C90(34)+"id"+Char:C90(34)+":"+Char:C90(34)+"file"+Char:C90(34)+","+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+"File"+Char:C90(34)+","+Char:C90(34)+"popup"+Char:C90(34)+":"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+" {"+Char:C90(34)+"menuitem"+Char:C90(34)+": [{"+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+"New"+Char:C90(34)+","+Char:C90(34)+"onclick"+Char:C90(34)+":"+Char:C90(34)+"CreateNewDoc()"+Char:C90(34)+"}"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+","
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+"{"+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+"Open"+Char:C90(34)+","+Char:C90(34)+"onclick"+Char:C90(34)+":"+Char:C90(34)+"OpenDoc()"+Char:C90(34)+"}"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+","
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+"{"+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+"Close"+Char:C90(34)+","+Char:C90(34)+"onclick"+Char:C90(34)+":"+Char:C90(34)+"CloseDoc()"+Char:C90(34)+"}"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+"]}}"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+","
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+Char:C90(34)+"menu2"+Char:C90(34)+": {"+Char:C90(34)
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+"id"+Char:C90(34)+":"+Char:C90(34)+"Edit"+Char:C90(34)+","+Char:C90(34)+"value"+Char:C90(34)
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+":"+Char:C90(34)+"Edit"+Char:C90(34)+","+Char:C90(34)+"popup"+Char:C90(34)+":{"+Char:C90(34)
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+"menuitem"+Char:C90(34)+":[{"+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+"Cut"+Char:C90(34)
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+","+Char:C90(34)+"onclick"+Char:C90(34)+":"+Char:C90(34)+"CreateNewDoc()"+Char:C90(34)+"},{"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+Char:C90(34)+"value"+Char:C90(34)+":"+Char:C90(34)+"Copy"+Char:C90(34)+","+Char:C90(34)
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+"onclick"+Char:C90(34)+":"+Char:C90(34)+"OpenDoc()"+Char:C90(34)+"},{"+Char:C90(34)+"value"
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+Char:C90(34)+":"+Char:C90(34)+"Paste"+Char:C90(34)+","+Char:C90(34)+"onclick"+Char:C90(34)
	$_t_DBWSJsonIconBar:=$_t_DBWSJsonIconBar+":"+Char:C90(34)+"CloseDoc()"+Char:C90(34)+"}]}}}"
	
	
	
	//$_t_DBWSJsonIconBar:="{+Char(34)+Menus+Char(34)+:[{+Char(34)+menu+Char(34)+:{+Char(34)+id+Char(34)+:+Char(34)+file+Char(34)+,+Char(34)+value+Char(34)+:+Char(34)+File+Char(34)+,}},{+Char(34)+menu+Char(34)+:{+Char(34)+id+Char(34)+:+Char(34)+Edit+Char(34)+,+Char(34)+value+Cha"+"r(34)+:+Char(34)+Edit+Char(34)+,}}]}"
	SET TEXT TO PASTEBOARD:C523($_t_DBWSJsonIconBar)
	
	WEB SEND TEXT:C677($_t_DBWSJsonIconBar)
End if 
ERR_MethodTrackerReturn("DBSWS_MenuJSON"; $_t_oldMethodName)