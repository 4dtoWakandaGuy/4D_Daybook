//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_Login
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/01/2012 11:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DBWS_al_UserIDS;0)
	//ARRAY TEXT(<>DBSW_at_UserNames;0)
	ARRAY TEXT:C222($_at_UserNames; 0)
	//ARRAY TEXT(DB_at_Formvalues;0)
	//ARRAY TEXT(DB_at_Formvariables;0)
	C_BOOLEAN:C305(<>DBWS_bo_UsersInited; $_bo_Continue; $_bo_Success; DBWS_bo_Connected; DBWS_bo_ispost)
	C_LONGINT:C283($_l_FirstDay; $_l_FullDays; $_l_Index; $_l_Number; $_l_Today; $_l_TotalTime; $_l_VariabNameRow)
	C_TEXT:C284($_t_HashedPW; $_t_oldMethodName; $_t_Output; $_t_UserName; DBWS_t_mess; DBWS_T_user_ip; DSWS_t_Currentcookie; w_mess)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_Login")

w_mess:=""
//TRACE

$_bo_Success:=False:C215
//READ WRITE([PERSONNEL])
READ WRITE:C146([WEB_ACCESS:130])
If (Not:C34(<>DBWS_bo_UsersInited))
	ARRAY LONGINT:C221(<>DBWS_al_UserIDS; 0)
	ARRAY TEXT:C222(<>DBSW_at_UserNames; 0)
	<>DBWS_bo_UsersInited:=True:C214
End if 

QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Startup_List:15=True:C214; *)
QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=0; *)

QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Person_Identity:13#"")
//APPLY TO SELECTION([PERSONNEL];[PERSONNEL]xEnableWebLogin:=True)
QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]x_Enable_Web_Login:53=True:C214)
$_l_Number:=Records in selection:C76([PERSONNEL:11])

If ($_l_Number#Size of array:C274(<>DBSW_at_UserNames))
	SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; $_at_UserNames)
	SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; <>DBWS_al_UserIDS)
	ARRAY TEXT:C222(<>DBSW_at_UserNames; Size of array:C274(<>DBWS_al_UserIDS))
	For ($_l_Index; 1; Size of array:C274(<>DBWS_al_UserIDS))
		$_at_UserNames{$_l_Index}:=Uppercase:C13($_at_UserNames{$_l_Index})
		<>DBSW_at_UserNames{$_l_Index}:=UTI_MD5($_at_UserNames{$_l_Index})
	End for 
	
End if 
$_bo_Continue:=True:C214
If (DBWS_bo_Connected)
	QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=DSWS_t_Currentcookie)
	If (Records in selection:C76([WEB_ACCESS:130])>=1)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[WEB_ACCESS:130]Personnel_ID:12)
		If (Records in selection:C76([PERSONNEL:11])>0)
			$_t_UserName:=[PERSONNEL:11]Name:2
			
			
		Else 
			$_t_UserName:=[WEB_ACCESS:130]Person:10
		End if 
		$_bo_Continue:=False:C215
		$_t_Output:=$_t_UserName
		//TEXT TO BLOB($_t_Output;$my_blob;UTF8 text without length)
		WEB SEND TEXT:C677($_t_Output)
	End if 
End if 
If ($_bo_Continue)
	If (DBWS_bo_ispost)
		If (Size of array:C274(DB_at_Formvariables)>0)
			$_l_VariabNameRow:=Find in array:C230(DB_at_Formvariables; "name")
			
			If ($_l_VariabNameRow>0)
				$_l_VariabNameRow:=Find in array:C230(<>DBSW_at_UserNames; DB_at_Formvalues{$_l_VariabNameRow})
				If ($_l_VariabNameRow>0)
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>DBWS_al_UserIDS{$_l_VariabNameRow})
					$_t_UserName:=[PERSONNEL:11]Name:2
					$_l_VariabNameRow:=Find in array:C230(DB_at_Formvariables; "password")
					If ($_l_VariabNameRow>0)
						$_t_UserName:=DB_at_Formvalues{$_l_VariabNameRow}
						QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=DSWS_t_Currentcookie)
						If (Records in selection:C76([WEB_ACCESS:130])>=1)
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=[WEB_ACCESS:130]Personnel_ID:12)
							//here should test if valid user
							$_t_HashedPW:=UTI_MD5([PERSONNEL:11]Person_Identity:13)
							If (($_t_UserName#$_t_HashedPW) | ([WEB_ACCESS:130]Person:10#$_t_UserName))
								DBWS_t_mess:="Password or User name Incorrect"
								$_bo_Success:=False:C215
							Else 
								If ([WEB_ACCESS:130]Client_IP:5=DBWS_T_user_ip)
									If ([WEB_ACCESS:130]Access_Date:2=Current date:C33)
										$_l_TotalTime:=(Current time:C178-[WEB_ACCESS:130]Access_Time:3)*1
									Else 
										$_l_Today:=(Current time:C178-?00:00:00?)*1
										$_l_FullDays:=(Current date:C33-[WEB_ACCESS:130]Access_Date:2)-1
										$_l_FirstDay:=(?23:59:59?-[WEB_ACCESS:130]Access_Time:3)*1
										$_l_TotalTime:=$_l_Today+$_l_FirstDay+($_l_FullDays*(24*60*60))
									End if 
									If ($_l_TotalTime<(45*60))
										
										//its a reconnect-
										
										[WEB_ACCESS:130]Access_Date:2:=Current date:C33
										[WEB_ACCESS:130]Access_Time:3:=Current time:C178
										SAVE RECORD:C53([WEB_ACCESS:130])
										$_bo_Success:=True:C214
									Else 
										//actually we should not get here because the cookie is handles in the connection method
										//session has timed out
										//??issue new cookie
										[WEB_ACCESS:130]Login_Date:14:=Current date:C33
										[WEB_ACCESS:130]Access_Time:3:=Current time:C178
										
										$_bo_Success:=False:C215
									End if 
									
								Else 
									//logging in from a different IP-one session per user-be a crack trying to be here as cookie has been hijacked
									[WEB_ACCESS:130]Web_Ref:1:=""
									$_bo_Success:=False:C215
									DBWS_t_mess:="Invalid connection. please try again"
								End if 
								//correct user-has session timed out
							End if 
						Else 
							QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=$_t_UserName)
							If (Records in selection:C76([PERSONNEL:11])=1)
								$_t_HashedPW:=UTI_MD5([PERSONNEL:11]Person_Identity:13)
								If ($_t_HashedPW=$_t_UserName)
									QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Personnel_ID:12=[PERSONNEL:11]Personnel_ID:48)
									If (Records in selection:C76([WEB_ACCESS:130])=0)
										CREATE RECORD:C68([WEB_ACCESS:130])
										[WEB_ACCESS:130]x_ID:13:=AA_GetNextID(->[WEB_ACCESS:130]x_ID:13)
										[WEB_ACCESS:130]Personnel_ID:12:=[PERSONNEL:11]Personnel_ID:48
										[WEB_ACCESS:130]Person:10:=[PERSONNEL:11]Name:2
									End if 
									[WEB_ACCESS:130]Person:10:=[PERSONNEL:11]Name:2
									[WEB_ACCESS:130]Web_Ref:1:=DSWS_t_Currentcookie
									[WEB_ACCESS:130]Access_Date:2:=Current date:C33
									[WEB_ACCESS:130]Access_Time:3:=Current time:C178
									[WEB_ACCESS:130]Client_IP:5:=DBWS_T_user_ip
									[WEB_ACCESS:130]Login_Time:15:=Current time:C178
									[WEB_ACCESS:130]Login_Date:14:=Current date:C33
									SAVE RECORD:C53([WEB_ACCESS:130])
									
									$_l_VariabNameRow:=DBWS_GetCurrentUserProcess([WEB_ACCESS:130]Personnel_ID:12; [WEB_ACCESS:130]Person:10)
									
									$_bo_Success:=True:C214
									
								Else 
									//password is wrong
									$_bo_Success:=False:C215
								End if 
							Else 
								//no user name match
								$_bo_Success:=False:C215
							End if 
							
						End if 
					Else 
						$_bo_Success:=False:C215
					End if 
				Else 
					$_bo_Success:=False:C215
				End if 
			Else 
				$_bo_Success:=False:C215
			End if 
			
		End if 
		If ($_bo_Success)
			//SEND HTTP REDIRECT(nextpage)
			$_t_Output:=$_t_UserName
			//TEXT TO BLOB($_t_Output;$my_blob;UTF8 text without length)
			WEB SEND TEXT:C677($_t_Output)
		Else 
			$_t_Output:=""
			//TEXT TO BLOB($_t_Output;$my_blob;UTF8 text without length)
			WEB SEND TEXT:C677($_t_Output)
		End if 
	End if 
End if 
UNLOAD RECORD:C212([WEB_ACCESS:130])
READ ONLY:C145([WEB_ACCESS:130])
ERR_MethodTrackerReturn("DBWS_Login"; $_t_oldMethodName)