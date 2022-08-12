//%attributes = {}
If (False:C215)
	//Project Method Name:      Per_SaveSMTPAuth
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SMTP_abo_UserPassSSL;0)
	//ARRAY LONGINT(SMTP_al_UserAuthActive;0)
	//ARRAY LONGINT(SMTP_al_UserAuthType;0)
	//ARRAY LONGINT(SMTP_al_UserIDs;0)
	//ARRAY TEXT(SMTP_at_UserAuthName;0)
	//ARRAY TEXT(SMTP_at_UserAuthPass;0)
	C_BOOLEAN:C305(PER_bo_UseSSL; SMTP_bo_ArraysInited; SYS_bo_AuthSettingsLoaded)
	C_LONGINT:C283($_l_AuthType; $_l_PersonID; $_l_PersonRow; $_l_UseAuth; $1; $2; $3; PER_l_UseAuthentication; Per_l_UserAuthtype; SMTP_l_GeneralPassActive; SMTP_l_GeneralPassType)
	C_POINTER:C301($_ptr_UserAuthActive)
	C_TEXT:C284($_t_oldMethodName; $_t_UserName; $_t_UserPassword; $4; $5; PER_t_UserName; PER_t_UserPassword; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Per_SaveSMTPAuth")

//NG March 12th 2007
//This method saves back to the blob the personnel settings for SMTP AUTH
While (Semaphore:C143("LoadingSMTPPrefs"))
	DelayTicks(2)
End while   //So that only one update happens at a time
If (Not:C34(SMTP_bo_ArraysInited))
	ARRAY LONGINT:C221(SMTP_al_UserIDs; 0)
	ARRAY LONGINT:C221(SMTP_al_UserAuthActive; 0)
	ARRAY LONGINT:C221(SMTP_al_UserAuthType; 0)
	ARRAY TEXT:C222(SMTP_at_UserAuthName; 0)
	ARRAY TEXT:C222(SMTP_at_UserAuthPass; 0)
	ARRAY BOOLEAN:C223(SMTP_abo_UserPassSSL; 0)
	SMTP_bo_ArraysInited:=True:C214
End if 

If (Count parameters:C259>=5)
	$_l_PersonID:=$1
	$_l_UseAuth:=$2
	$_l_AuthType:=$3
	$_t_UserName:=$4
	$_t_UserPassword:=$5
	Per_LOADSMTPAUTH($_l_PersonID; ->PER_l_UseAuthentication; ->PER_t_UserName; ->PER_t_UserPassword; ->Per_l_UserAuthtype; ->SMTP_al_UserIDs; ->PER_bo_UseSSL; ->SMTP_al_UserAuthActive; ->SMTP_al_UserAuthType; ->SMTP_at_UserAuthName; ->SMTP_at_UserAuthPass; ->SMTP_abo_UserPassSSL)
	
	
	//
	$_l_PersonRow:=Find in array:C230(SMTP_al_UserIDs; $_l_PersonID)
	If ($_l_PersonRow>0)  //The user has personal auth settings
		SMTP_al_UserAuthActive{$_l_PersonRow}:=$_l_UseAuth
		SMTP_al_UserAuthType{$_l_PersonRow}:=$_l_AuthType
		SMTP_at_UserAuthName{$_l_PersonRow}:=$_t_UserName
		SMTP_at_UserAuthPass{$_l_PersonRow}:=$_t_UserPassword
	Else 
		SYS_bo_AuthSettingsLoaded:=False:C215  //added 30/07/08 -kmw (just in case)
		APPEND TO ARRAY:C911(SMTP_al_UserIDs; $_l_PersonID)
		APPEND TO ARRAY:C911(SMTP_al_UserAuthActive; $_l_UseAuth)
		APPEND TO ARRAY:C911(SMTP_al_UserAuthType; $_l_AuthType)
		APPEND TO ARRAY:C911(SMTP_at_UserAuthName; $_t_UserName)
		APPEND TO ARRAY:C911(SMTP_at_UserAuthPass; $_t_UserPassword)
	End if 
	//SYS_LOADSMTPAUTH (True)
	SYS_LOADSMTPAUTH(True:C214; ->PER_l_UseAuthentication; ->SMTP_l_GeneralPassActive; ->SMTP_l_GeneralPassType; ->SMTP_t_GeneralPassName; ->SMTP_t_GeneralPassAuth; ->SMTP_al_UserIDs; ->SMTP_al_UserAuthActive; ->SMTP_al_UserAuthType; ->SMTP_at_UserAuthName; ->SMTP_at_UserAuthPass; ->SMTP_abo_UserPassSSL)  //Save the updated data
	
	
End if 

CLEAR SEMAPHORE:C144("LoadingSMTPPrefs")
ERR_MethodTrackerReturn("Per_SaveSMTPAuth"; $_t_oldMethodName)
