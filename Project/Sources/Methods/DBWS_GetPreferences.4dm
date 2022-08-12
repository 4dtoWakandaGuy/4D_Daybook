//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   17/09/2011 17:17 v7.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WEB_at_TemplateNames1;0)
	//ARRAY TEXT(WEB_at_TemplateNames2;0)
	//ARRAY TEXT(WEB_at_TemplateNames3;0)
	C_BOOLEAN:C305($_bo_Save; $1; DBWS_bo_PrefsLoaded)
	C_LONGINT:C283($_l_ItemID; $_l_offset; WEB_i_RBOption1; WEB_i_RBOption2; WEB_i_RBOption3; WEB_i_RBOption4; WEB_i_RBOption5; WEB_i_RBOption6; WEB_i_RBOption7)
	C_PICTURE:C286(<>DB_Pic_CoLogo)
	C_TEXT:C284($_t_oldMethodName; $0; DBWS_T_ownerName; WEB_T_TemplateName1; WEB_T_TemplateName4; WEB_T_TemplateName6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetPreferences")

If (Count parameters:C259>=1)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 
ARRAY TEXT:C222(WEB_at_TemplateNames1; 0)
APPEND TO ARRAY:C911(WEB_at_TemplateNames1; "Home")
APPEND TO ARRAY:C911(WEB_at_TemplateNames2; "Home_Login")
APPEND TO ARRAY:C911(WEB_at_TemplateNames2; "Home_UserLogin")
ARRAY TEXT:C222(WEB_at_TemplateNames2; 0)
APPEND TO ARRAY:C911(WEB_at_TemplateNames2; "Home_Login")
APPEND TO ARRAY:C911(WEB_at_TemplateNames2; "Home_UserLogin")
ARRAY TEXT:C222(WEB_at_TemplateNames3; 0)
APPEND TO ARRAY:C911(WEB_at_TemplateNames2; "Home_UserLogin")


If (Not:C34(DBWS_bo_PrefsLoaded)) | ($_bo_Save)
	WEB_i_RBOption6:=1
	WEB_T_TemplateName6:="Home_UserLogin"
	READ WRITE:C146([PREFERENCES:116])
	$_l_ItemID:=PREF_GetPreferenceID("Web Server Preferences")
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		$_l_offset:=0
		VARIABLE TO BLOB:C532(WEB_i_RBOption1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_i_RBOption2; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_i_RBOption3; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_i_RBOption4; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_i_RBOption5; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_i_RBOption6; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_i_RBOption7; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_T_TemplateName1; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_T_TemplateName4; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(WEB_T_TemplateName6; [PREFERENCES:116]DataBlob:2; *)
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		Case of 
			: (WEB_i_RBOption1=1)  //Public Website
				$0:=WEB_T_TemplateName1
			: (WEB_i_RBOption4=1)  //Customer Login Site
				$0:=WEB_T_TemplateName4
			: (WEB_i_RBOption6=1)  //Private Webstie
				$0:=WEB_T_TemplateName6
				
		End case 
		
	Else 
		If ($_bo_Save)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(WEB_i_RBOption1; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_i_RBOption2; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_i_RBOption3; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_i_RBOption4; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_i_RBOption5; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_i_RBOption6; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_i_RBOption7; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_T_TemplateName1; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_T_TemplateName4; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(WEB_T_TemplateName6; [PREFERENCES:116]DataBlob:2; *)
			DB_SaveRecord(->[PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			$0:=""
		Else 
			$_l_offset:=0
			WEB_i_RBOption1:=0
			WEB_i_RBOption2:=0
			WEB_i_RBOption3:=0
			WEB_i_RBOption4:=0
			WEB_i_RBOption5:=0
			WEB_i_RBOption6:=1
			WEB_i_RBOption7:=0
			WEB_T_TemplateName1:=""
			WEB_T_TemplateName4:=""
			WEB_T_TemplateName6:=""
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_i_RBOption1; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_i_RBOption2; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_i_RBOption3; $_l_offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_i_RBOption4; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_i_RBOption5; $_l_offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_i_RBOption6; $_l_offset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_i_RBOption7; $_l_offset)
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_T_TemplateName1; $_l_offset)
										If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
											BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_T_TemplateName4; $_l_offset)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; WEB_T_TemplateName6; $_l_offset)
											End if 
										End if 
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			
			Case of 
				: (WEB_i_RBOption1=1)  //Public Website
					$0:=WEB_T_TemplateName1
				: (WEB_i_RBOption4=1)  //Customer Login Site
					$0:=WEB_T_TemplateName4
				: (WEB_i_RBOption6=1)  //Private Webstie
					$0:=WEB_T_TemplateName6
					
			End case 
			
			
		End if 
		
		
	End if 
	//and get some settings from the user..
	DBWS_T_ownerName:=DB_GetOrganisation
	DBWS_pic_OwnerLogo:=<>DB_Pic_CoLogo
	DBWS_bo_PrefsLoaded:=True:C214
Else 
	Case of 
		: (WEB_i_RBOption1=1)  //Public Website
			$0:=WEB_T_TemplateName1
		: (WEB_i_RBOption4=1)  //Customer Login Site
			$0:=WEB_T_TemplateName4
		: (WEB_i_RBOption6=1)  //Private Webstie
			$0:=WEB_T_TemplateName6
			
	End case 
	
End if 
ERR_MethodTrackerReturn("DBWS_GetPreferences"; $_t_oldMethodName)