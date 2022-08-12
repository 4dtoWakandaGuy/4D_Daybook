If (False:C215)
	//object Name: [PRODUCTS]dAsk Product.oUrl
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
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	//ARRAY TEXT(PRD_at_UrlLinks;0)
	//ARRAY TEXT(PRD_at_URLS;0)
	C_LONGINT:C283($_l_event; $_l_HttpPosition; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRIght; $_l_ObjectTop; $_l_URLRow; PRD_l_SelectedURLRef)
	C_TEXT:C284($_t_ConstructURL; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].dAsk Product.oUrl"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		If (PRD_at_URLS>0)
			
			If (PRD_at_URLS{PRD_at_URLS}#"")
				//if this is blank do nothing
				OBJECT GET COORDINATES:C663([PRODUCTS:9]Product_Name:2; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
				$_t_ConstructURL:=PRD_at_URLS{PRD_at_URLS}
				$_l_URLRow:=Find in array:C230(PRD_at_UrlLinks; $_t_ConstructURL)
				If ($_l_URLRow<0)
					$_l_URLRow:=Find in array:C230(CO_at_SearchOptions; $_t_ConstructURL)
					If ($_l_URLRow>0)
						$_t_ConstructURL:=CO_at_SearchConstructs{$_l_URLRow}
						PRD_l_SelectedURLRef:=0
						CO_News([PRODUCTS:9]Product_Name:2; $_l_ObjectLeft; $_l_ObjectBottom; $_t_ConstructURL; Table:C252(->[PRODUCTS:9]))
						
					End if 
				Else 
					//its a url
					PRD_l_SelectedURLRef:=$_l_URLRow
					$_l_HttpPosition:=Position:C15("HTTPS://"; PRD_at_UrlLinks{PRD_l_SelectedURLRef})
					If ($_l_HttpPosition=0)
						$_l_HttpPosition:=Position:C15("HTTP://"; PRD_at_UrlLinks{PRD_l_SelectedURLRef})
						If ($_l_HttpPosition=0)
							$_t_ConstructURL:="HTTP://"+PRD_at_UrlLinks{PRD_l_SelectedURLRef}
						Else 
							$_t_ConstructURL:=PRD_at_UrlLinks{PRD_l_SelectedURLRef}
						End if 
					End if 
					CO_News([PRODUCTS:9]Product_Name:2; $_l_ObjectLeft; $_l_ObjectBottom; $_t_ConstructURL)
				End if 
			End if 
			
		End if 
		
End case 
PRD_at_URLS:=0
ERR_MethodTrackerReturn("OBJ [PRODUCTS].dAsk Product.oUrl"; $_t_oldMethodName)
