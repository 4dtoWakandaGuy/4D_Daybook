//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME DBLogin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/10/2011 14:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Draw; $_bo_OK)
	C_LONGINT:C283(<>SYS_l_LoggedInaccount; $_l_CharacterIndex; $_l_PasswordLength)
	C_TEXT:C284($_t_ErrorClass; $_t_ErrorText; $_t_oldMethodName; $_t_Password; $_t_PasswordError; $_t_Submitted; $_t_UserName; $_t_UserNameError; IME_t_UserGroupCode; IME_t_UserInitials; IME_t_UserName)
	C_TEXT:C284(IME_t_UserOrganization; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME DBLogin")
//IME DBLogin
//Rollo 9/6/2004

//Draw and process login to daybook web interface


$_t_UserName:=IME_FieldValue("username")
If ($_t_UserName="")
	$_t_UserName:=IME_Parameter("username")
End if 

$_t_Password:=IME_FieldValue("password")
$_t_Submitted:=IME_FieldValue("submitted")

$_t_ErrorText:=""
$_t_ErrorClass:="error"
$_t_UserNameError:=""
$_t_PasswordError:=""

$_bo_Draw:=True:C214

If ($_t_Submitted="1")  //received a post with this hidden value for verification
	
	Case of 
		: (($_t_UserName="") & ($_t_Password=""))
			$_t_ErrorText:="Please enter your Initials or Name, and your Password"
			$_t_UserNameError:=$_t_ErrorClass
			$_t_PasswordError:=$_t_ErrorClass
		: ($_t_UserName="")
			$_t_ErrorText:="Please enter your Initials or Name"
			$_t_UserNameError:=$_t_ErrorClass
			
			//Commented out below check for no password 26/04/08 -kmw (The assumption here seems to be that the user had forgotten to enter there password. However, this was stopping users without passwords from using the web)
			//: ($_t_Password="")
			//$_t_ErrorText:="Please enter your Password"
			//$_t_PasswordError:=$_t_ErrorClass
		Else 
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_t_UserName; *)
			QUERY:C277([PERSONNEL:11];  | ; [PERSONNEL:11]Name:2=$_t_UserName)
			
			If (Records in selection:C76([PERSONNEL:11])=0)
				//$_t_ErrorText:="Please check and re-enter your Initials or Name, and specify your Password again"
				$_t_ErrorText:="Please check and re-enter your Initials (or Name) and Password"  //NOTE: These messages displayed in cases of incorrect password and unknown user name have been changed to the be the same as each other for security reasons.... 26/04/08 -kmw
				$_t_UserNameError:=$_t_ErrorClass
			Else 
				
				$_bo_OK:=False:C215
				$_l_PasswordLength:=Length:C16($_t_Password)
				
				While ((Not:C34(End selection:C36([PERSONNEL:11]))) & ($_bo_OK=False:C215))
					
					$_bo_OK:=True:C214
					
					If (Length:C16([PERSONNEL:11]Person_Identity:13)=$_l_PasswordLength)
						$_l_CharacterIndex:=1
						While (($_l_CharacterIndex<=$_l_PasswordLength) & ($_bo_OK))
							If (Character code:C91(Substring:C12([PERSONNEL:11]Person_Identity:13; $_l_CharacterIndex; 1))#Character code:C91(Substring:C12($_t_Password; $_l_CharacterIndex; 1)))
								$_bo_OK:=False:C215
							End if 
							$_l_CharacterIndex:=$_l_CharacterIndex+1
						End while 
					Else 
						$_bo_OK:=False:C215
					End if 
					
					If ($_bo_OK=False:C215)
						NEXT RECORD:C51([PERSONNEL:11])
					End if 
					
				End while 
				
				If ($_bo_OK=False:C215)
					//$_t_ErrorText:="Please check and re-enter your Password"
					$_t_ErrorText:="Please check and re-enter your Initials (or Name) and Password"  //NOTE: These messages displayed in cases of incorrect password and unknown user name have been changed to the be the same as each other for security reasons.... 26/04/08 -kmw
					$_t_UserNameError:=$_t_ErrorClass
					
				Else 
					
					//success
					
					READ WRITE:C146([WEB_ACCESS:130])
					QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=vWebRef)
					[WEB_ACCESS:130]Person:10:=[PERSONNEL:11]Initials:1
					[WEB_ACCESS:130]Personnel_ID:12:=[PERSONNEL:11]Personnel_ID:48
					[WEB_ACCESS:130]Login_Date:14:=Current date:C33
					[WEB_ACCESS:130]Login_Time:15:=Current time:C178
					SAVE RECORD:C53([WEB_ACCESS:130])
					
					IME_t_UserInitials:=[PERSONNEL:11]Initials:1
					IME_t_UserGroupCode:=[PERSONNEL:11]Group_Code:28
					IME_t_UserName:=[PERSONNEL:11]Name:2
					READ ONLY:C145([USER:15])
					If (<>SYS_l_LoggedInaccount=0)
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=0)
					Else 
						QUERY:C277([USER:15]; [USER:15]XdataOwnerID:251=<>SYS_l_LoggedInaccount)
					End if 
					IME_t_UserOrganization:=[USER:15]Organisation:1
					
					IME_CachedDataPut("WebRef"+vWebRef; 30; "IME_t_UserInitials"; "IME_t_UserName"; "IME_t_UserOrganization"; "IME_t_UserGroupCode")  //see also IME_Main
					
					UNLOAD RECORD:C212([WEB_ACCESS:130])
					
					//first page shown - always, at present
					IME_DBDashboard
					
					UNLOAD RECORD:C212([PERSONNEL:11])
					
					//IME_CookieSet ("Daybookref";vWebRef;True;3600)  `60*60 - 60 minute timeout
					
					$_bo_Draw:=False:C215
					
				End if 
				
			End if 
			
	End case 
	
End if 

If ($_bo_Draw)
	
	IME_DBHeader("Log In"; "dblogin"; "Please log in"; ""; "dblogin")
	
	If ($_t_ErrorText#"")
		IME_ReplyText2("ITX DGTextError"; $_t_ErrorText)
	End if 
	
	IME_ReplyText2("ITX DGLabInp"; "Initials&nbsp;or&nbsp;Name"; "username"; $_t_UserName; "20"; "41"; $_t_UserNameError)
	IME_ReplyText2("ITX DGLabInpPass"; "Password"; "password"; ""; "20"; "21"; $_t_PasswordError)
	IME_ReplyText2("ITX DGInpHid"; "submitted"; "1")
	
	IME_ReplyText2("ITX DGButt"; "login"; "Log in")
	
	IME_DBFooter
	
End if 

//person ident
ERR_MethodTrackerReturn("IME DBLogin"; $_t_oldMethodName)