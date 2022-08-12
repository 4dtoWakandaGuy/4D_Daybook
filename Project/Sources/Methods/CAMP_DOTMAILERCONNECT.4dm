//%attributes = {}

If (False:C215)
	//Project Method Name:      CAMP_DOTMAILERCONNECT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  27/02/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_OrdersList; 0)
	ARRAY LONGINT:C221($_al_AccountValueTypes; 0)
	ARRAY TEXT:C222($_at_AccountFields; 0)
	ARRAY TEXT:C222($_at_DataFieldLabels; 0)
	ARRAY TEXT:C222($_at_DataFieldValues; 0)
	ARRAY TEXT:C222($_at_headerNames; 0)
	ARRAY TEXT:C222($_at_headerValue; 0)
	C_BLOB:C604($_blb_Credentials)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Reset)
	C_COLLECTION:C1488($_col_ObjectCollection)
	C_LONGINT:C283($_l_EndPointRow; $_l_PasswordRow; $_l_PreferenceID; $_l_Property; $_l_Ref; $_l_Result; $_l_UserNameRow)
	C_OBJECT:C1216($_obj_ResultObject; DB_obj_Interface)
	C_REAL:C285($_r_AccountID; $_r_CurrentAccountID)
	C_TEXT:C284($_t_AccountID; $_t_BaseURL; $_t_Credentials; $_t_DotMailerEndPoint; $_t_DotPassword; $_t_DotUserName; $_t_EncodedCredentials; $_t_JsonRespons; $_t_JsonResponse; $_t_oldMethodName; $_t_Property)
	C_TEXT:C284($_t_Request; $_t_Save; $_t_Url; $_t_UserName; $0)
End if 

//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("CAMP_DOTMAILERCONNECT")

ARRAY TEXT:C222($_at_DataFieldLabels; 0)
ARRAY TEXT:C222($_at_DataFieldValues; 0)
$0:="NUL"
CAMP_LoadDotMailerPrefs(->$_at_DataFieldLabels; ->$_at_DataFieldValues)
$_l_EndPointRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer End Point")
If ($_l_EndPointRow>0)
	$_t_DotMailerEndPoint:=$_at_DataFieldValues{$_l_EndPointRow}
	$_l_UserNameRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer User Name")
	If ($_l_UserNameRow>0)
		$_t_DotUserName:=$_at_DataFieldValues{$_l_UserNameRow}
		$_l_PasswordRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer Password")
		If ($_l_PasswordRow>0)
			$_t_DotPassword:=$_at_DataFieldValues{$_l_PasswordRow}
			
			If ($_t_DotPassword="") | ($_t_DotUserName="") | ($_t_DotMailerEndPoint="")
				//the preference is not set up so here we can display a dialog to set it up
				OB SET ARRAY:C1227(DB_obj_Interface; "Labels"; $_at_DataFieldLabels)
				OB SET ARRAY:C1227(DB_obj_Interface; "Values"; $_at_DataFieldValues)
				OB SET:C1220(DB_obj_Interface; "WindowTitle"; "Dot Mailer Settings")
				DIALOG:C40("PREFERENCE_SETOBJECTS")
				$_t_Save:=OB Get:C1224(DB_obj_Interface; "Exit")
				If ($_t_Save#"")
					OB GET ARRAY:C1229(DB_obj_Interface; "Labels"; $_at_DataFieldLabels)
					OB GET ARRAY:C1229(DB_obj_Interface; "Values"; $_at_DataFieldValues)
					$_l_EndPointRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer End Point")
					If ($_l_EndPointRow>0)
						$_t_DotMailerEndPoint:=$_at_DataFieldValues{$_l_EndPointRow}
						$_l_UserNameRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer User Name")
						If ($_l_UserNameRow>0)
							$_t_DotUserName:=$_at_DataFieldValues{$_l_UserNameRow}
							$_l_PasswordRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer Password")
							If ($_l_PasswordRow>0)
								$_t_DotPassword:=$_at_DataFieldValues{$_l_PasswordRow}
								
								If ($_t_DotPassword="") | ($_t_DotUserName="") | ($_t_DotMailerEndPoint="")
									Gen_Alert("Sorry you cannot save the preference with a blank value")
									$_bo_Continue:=False:C215
								Else 
									CAMP_LoadDotMailerPrefs(->$_at_DataFieldLabels; ->$_at_DataFieldValues; True:C214)
									$_bo_Continue:=True:C214
								End if 
							Else 
								$_bo_Continue:=False:C215
							End if 
						Else 
							$_bo_Continue:=False:C215
						End if 
						
					Else 
						$_bo_Continue:=False:C215
					End if 
				Else 
					$_bo_Continue:=False:C215
				End if 
				
				
			Else 
				$_bo_Continue:=True:C214
			End if 
		Else 
			$_bo_Reset:=True:C214
			$_bo_Continue:=False:C215
		End if 
	Else 
		$_bo_Reset:=True:C214
		$_bo_Continue:=False:C215
	End if 
Else 
	$_bo_Reset:=True:C214
	$_bo_Continue:=False:C215
End if 
If ($_bo_Reset) | (Gen_Option)
	OB SET ARRAY:C1227(DB_obj_Interface; "Labels"; $_at_DataFieldLabels)
	OB SET ARRAY:C1227(DB_obj_Interface; "Values"; $_at_DataFieldValues)
	OB SET:C1220(DB_obj_Interface; "WindowTitle"; "Dot Mailer Settings")
	DIALOG:C40("PREFERENCE_SETOBJECTS")
	$_t_Save:=OB Get:C1224(DB_obj_Interface; "Exit")
	If ($_t_Save#"")
		OB GET ARRAY:C1229(DB_obj_Interface; "Labels"; $_at_DataFieldLabels)
		OB GET ARRAY:C1229(DB_obj_Interface; "Values"; $_at_DataFieldValues)
		$_l_EndPointRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer End Point")
		If ($_l_EndPointRow>0)
			$_t_DotMailerEndPoint:=$_at_DataFieldValues{$_l_EndPointRow}
			$_l_UserNameRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer User Name")
			If ($_l_UserNameRow>0)
				$_t_DotUserName:=$_at_DataFieldValues{$_l_UserNameRow}
				$_l_PasswordRow:=Find in array:C230($_at_DataFieldLabels; "Dot Mailer Password")
				If ($_l_PasswordRow>0)
					$_t_DotPassword:=$_at_DataFieldValues{$_l_PasswordRow}
					
					If ($_t_DotPassword="") | ($_t_DotUserName="") | ($_t_DotMailerEndPoint="")
						Gen_Alert("Sorry you cannot save the preference with a blank value")
						$_bo_Continue:=False:C215
					Else 
						CAMP_LoadDotMailerPrefs(->$_at_DataFieldLabels; ->$_at_DataFieldValues; True:C214)
						$_bo_Continue:=True:C214
					End if 
				Else 
					$_bo_Continue:=False:C215
				End if 
			Else 
				$_bo_Continue:=False:C215
			End if 
			
		Else 
			$_bo_Continue:=False:C215
		End if 
	Else 
		$_bo_Continue:=False:C215
	End if 
End if 

$_bo_Continue:=True:C214
TRACE:C157
If ($_bo_Continue)
	//demo@apiconnector.com/demo
	//$_t_DotMailerEndPoint:=
	$_t_UserName:="demo@apiconnector.com"
	///$_t_DotPassword:="demo"
	$_t_BaseURL:=$_t_DotMailerEndPoint
	$_t_Url:=$_t_BaseURL+"/v2/account-info"
	ARRAY TEXT:C222($_at_headerNames; 0)
	ARRAY TEXT:C222($_at_headerValue; 0)
	APPEND TO ARRAY:C911($_at_headerNames; "Authorization")
	$_t_Credentials:=$_t_DotUserName+":"+$_t_DotPassword
	TEXT TO BLOB:C554($_t_Credentials; $_blb_Credentials; UTF8 text without length:K22:17)
	
	BASE64 ENCODE:C895($_blb_Credentials; $_t_EncodedCredentials)
	
	
	
	
	APPEND TO ARRAY:C911($_at_headerValue; "Basic "+$_t_EncodedCredentials)
	$_l_Result:=HTTP Request:C1158(HTTP GET method:K71:1; $_t_Url; $_t_Request; $_t_JsonResponse; $_at_headerNames; $_at_headerValue)
	If ($_l_Result=200)
		
		$_obj_ResultObject:=JSON Parse:C1218($_t_JsonResponse)
		OB GET PROPERTY NAMES:C1232($_obj_ResultObject; $_at_AccountFields; $_al_AccountValueTypes)
		$_l_Ref:=Find in array:C230($_at_AccountFields; "id")
		$_bo_Continue:=True:C214
		If ($_l_Ref>0)
			$_r_AccountID:=OB Get:C1224($_obj_ResultObject; "id"; $_al_AccountValueTypes{$_l_Ref})
		Else 
			$_bo_Continue:=False:C215
		End if 
		$_l_Ref:=Find in array:C230($_at_AccountFields; "Properties")
		If ($_al_AccountValueTypes{$_l_Ref}=42)
			C_COLLECTION:C1488($_col_ObjectCollection)
			$_col_ObjectCollection:=New collection:C1472
			$_t_Property:=""
			For each ($_l_Property; $_obj_ResultObject)
				$_col_ObjectCollection.push($_obj_ResultObject[$_l_Property])
				
			End for each 
			
			//OB GET ARRAY($_obj_ResultObject;"Properties";$_abo_OrdersList)
		End if 
		$_r_CurrentAccountID:=Camp_LoadDotMailerAccount($_r_AccountID)
		If ($_r_CurrentAccountID=0)
			$_r_CurrentAccountID:=$_r_AccountID
			Camp_LoadDotMailerAccount($_r_AccountID; True:C214)
		End if 
		If ($_r_CurrentAccountID=$_r_AccountID)
			$0:="Basic "+$_t_EncodedCredentials
			
		End if 
		
		
		
		//CAMP_LoadDotMailerSettings (->$_at_AccountFieldLabels;->$_at_AccountFieldValues)
		//$_l_Result;HTTP Request(HTTP DELETE method;"database.example.com";$_t_Request;$_t_JsonResponse)
	Else 
		//handle the error
		
	End if 
End if 
ERR_MethodTrackerReturn("CAMP_DOTMAILERCONNECT"; $_t_oldMethodName)