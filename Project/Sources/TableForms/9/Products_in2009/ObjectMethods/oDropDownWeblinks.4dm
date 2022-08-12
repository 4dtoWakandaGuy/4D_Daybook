If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oDropDownWeblinks
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(PRD_at_UrlLinks;0)
	//ARRAY TEXT(PRD_at_WebLinks;0)
	C_LONGINT:C283($_l_CharacterPosition; $_l_ContructOptionRow; $_l_ContructRow; $_l_event; $_l_Index; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; PRD_l_SelectedURLRef)
	C_TEXT:C284($_t_Construct; $_t_Context; $_t_ContextOLD; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oDropDownWeblinks"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		If ([PRODUCTS:9]Product_Code:1#"")
			If (PRD_at_WebLinks<(Size of array:C274(PRD_at_WebLinks)-3))
				
				If (PRD_at_WebLinks{PRD_at_WebLinks}#"")
					//if this is blank do nothing
					OBJECT GET COORDINATES:C663([PRODUCTS:9]Product_Name:2; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_t_Construct:=PRD_at_WebLinks{PRD_at_WebLinks}
					$_l_ContructRow:=Find in array:C230(PRD_at_UrlLinks; $_t_Construct)
					If ($_l_ContructRow<0)
						$_l_ContructOptionRow:=Find in array:C230(CO_at_SearchOptions; $_t_Construct)
						If ($_l_ContructOptionRow>0)
							$_t_Construct:=CO_at_SearchConstructs{$_l_ContructOptionRow}
							PRD_l_SelectedURLRef:=0
							CO_News([PRODUCTS:9]Product_Name:2; $_l_ObjectLeft; $_l_ObjectBottom; $_t_Construct; Table:C252(->[PRODUCTS:9]))
							
						End if 
						PRD_at_WebLinks:=0
						
					Else 
						//its a url
						PRD_l_SelectedURLRef:=$_l_ContructRow
					End if 
				End if 
			Else 
				Case of 
					: (PRD_at_WebLinks=(Size of array:C274(PRD_at_WebLinks)))  //we have selected to edit the settings(this will only be here if we are admin or designer
						CO_NewsEditSettings(->[PRODUCTS:9])
						PRD_at_WebLinks:=0
						
					: (PRD_at_WebLinks=(Size of array:C274(PRD_at_WebLinks)-1))  //we have selected to edit the settings(this will only be here if we are admin or designer
						//add url
						$_t_Context:=Gen_Request("Enter the New URL"; "")
						If (OK=1)
							READ WRITE:C146([X_URL_LInks:101])
							CREATE RECORD:C68([X_URL_LInks:101])
							[X_URL_LInks:101]Parent_RecordCode:2:=[PRODUCTS:9]Product_Code:1
							[X_URL_LInks:101]Parent_Context:1:="PRODUCTS"
							[X_URL_LInks:101]URL:3:=$_t_Context
							DB_SaveRecord(->[X_URL_LInks:101])
							
							ARRAY TEXT:C222(PRD_at_WebLinks; 0)
							QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_Context:1="PRODUCTS"; *)
							QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_RecordCode:2=[PRODUCTS:9]Product_Code:1)
							SELECTION TO ARRAY:C260([X_URL_LInks:101]URL:3; PRD_at_UrlLinks)
							For ($_l_Index; 1; Size of array:C274(CO_at_SearchOptions))
								APPEND TO ARRAY:C911(PRD_at_WebLinks; CO_at_SearchOptions{$_l_Index})
							End for 
							If (Size of array:C274(PRD_at_UrlLinks)>0)
								APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
								For ($_l_Index; 1; Size of array:C274(PRD_at_UrlLinks))
									APPEND TO ARRAY:C911(PRD_at_WebLinks; PRD_at_UrlLinks{$_l_Index})
								End for 
							End if 
							PRD_l_SelectedURLRef:=Find in array:C230(PRD_at_UrlLinks; $_t_Context)
							APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
							APPEND TO ARRAY:C911(PRD_at_WebLinks; "Open Selected URL")
							APPEND TO ARRAY:C911(PRD_at_WebLinks; "Edit Selected URL")
							APPEND TO ARRAY:C911(PRD_at_WebLinks; "Add URL")
							APPEND TO ARRAY:C911(PRD_at_WebLinks; "Edit Websearch Settings")
							
							
						End if 
						PRD_at_WebLinks:=0
						
					: (PRD_at_WebLinks=(Size of array:C274(PRD_at_WebLinks)-2))  //we have selected to edit the settings(this will only be here if we are admin or designer
						//  `Edit url
						If (PRD_l_SelectedURLRef>0) & ([PRODUCTS:9]Product_Code:1#"")
							$_t_ContextOLD:=PRD_at_UrlLinks{PRD_l_SelectedURLRef}
							$_t_Context:=PRD_at_UrlLinks{PRD_l_SelectedURLRef}
							$_t_Context:=Gen_Request("Enter the modified URL"; $_t_Context)
							If (OK=1)
								READ WRITE:C146([X_URL_LInks:101])
								QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_RecordCode:2=[PRODUCTS:9]Product_Code:1; *)
								QUERY:C277([X_URL_LInks:101];  & ; [X_URL_LInks:101]Parent_Context:1="PRODUCTS"; *)
								QUERY:C277([X_URL_LInks:101];  & ; [X_URL_LInks:101]URL:3=$_t_ContextOLD)
								[X_URL_LInks:101]URL:3:=$_t_Context
								DB_SaveRecord(->[X_URL_LInks:101])
								PRD_at_UrlLinks{PRD_l_SelectedURLRef}:=$_t_Context
								ARRAY TEXT:C222(PRD_at_WebLinks; 0)
								QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_Context:1="PRODUCTS"; *)
								QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]Parent_RecordCode:2=[PRODUCTS:9]Product_Code:1)
								SELECTION TO ARRAY:C260([X_URL_LInks:101]URL:3; PRD_at_UrlLinks)
								For ($_l_Index; 1; Size of array:C274(CO_at_SearchOptions))
									APPEND TO ARRAY:C911(PRD_at_WebLinks; CO_at_SearchOptions{$_l_Index})
								End for 
								If (Size of array:C274(PRD_at_UrlLinks)>0)
									APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
									For ($_l_Index; 1; Size of array:C274(PRD_at_UrlLinks))
										APPEND TO ARRAY:C911(PRD_at_WebLinks; PRD_at_UrlLinks{$_l_Index})
									End for 
								End if 
								PRD_l_SelectedURLRef:=Find in array:C230(PRD_at_UrlLinks; $_t_Context)
								APPEND TO ARRAY:C911(PRD_at_WebLinks; "-")
								APPEND TO ARRAY:C911(PRD_at_WebLinks; "Open Selected URL")
								APPEND TO ARRAY:C911(PRD_at_WebLinks; "Edit Selected URL")
								APPEND TO ARRAY:C911(PRD_at_WebLinks; "Add URL")
								APPEND TO ARRAY:C911(PRD_at_WebLinks; "Edit Websearch Settings")
								
							End if 
						End if 
						PRD_at_WebLinks:=0
						
					: (PRD_at_WebLinks=(Size of array:C274(PRD_at_WebLinks)-3))  //we have selected to edit the settings(this will only be here if we are admin or designer
						//Open url
						If (PRD_l_SelectedURLRef>0)
							$_l_CharacterPosition:=Position:C15("HTTP://"; PRD_at_UrlLinks{PRD_l_SelectedURLRef})
							If ($_l_CharacterPosition=0)
								$_t_Context:="HTTP://"+PRD_at_UrlLinks{PRD_l_SelectedURLRef}
							Else 
								$_t_Context:=PRD_at_UrlLinks{PRD_l_SelectedURLRef}
							End if 
							CO_News([PRODUCTS:9]Product_Name:2; $_l_ObjectLeft; $_l_ObjectBottom; $_t_Context)
						Else 
							//this is only so i can test with nothing there
							$_t_Context:="www.apple.com"
							$_l_CharacterPosition:=Position:C15("http://"; $_t_Context)
							If ($_l_CharacterPosition=0)
								$_t_Context:="http://"+$_t_Context
							Else 
								$_t_Context:=$_t_Context
							End if 
							
							CO_News([PRODUCTS:9]Product_Name:2; $_l_ObjectLeft; $_l_ObjectBottom; $_t_Context)
							
							
						End if 
						PRD_at_WebLinks:=0
						
				End case 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oDropDownWeblinks"; $_t_oldMethodName)
