//%attributes = {}
If (False:C215)
	//Project Method Name:      Per_LOADSMTPAUTH
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/12/2010 20:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_SMTPUseSSL; 0)
	ARRAY LONGINT:C221($_al_SMTPUserAuthActive; 0)
	ARRAY LONGINT:C221($_al_SMTPUserAuthTypes; 0)
	ARRAY LONGINT:C221($_al_SMTPUserIDS; 0)
	//ARRAY LONGINT(PER_al_AuthenticationTypes;0)
	ARRAY TEXT:C222($_at_SMTPUserAuthName; 0)
	ARRAY TEXT:C222($_at_SMTPUserAuthPasswords; 0)
	//ARRAY TEXT(PER_at_AuthenticationType;0)
	C_BOOLEAN:C305($0; PER_bo_UseSSL; SYS_bo_AuthSettingsLoaded)
	C_LONGINT:C283($_l_Personid; $_l_PersonRow; $_l_SMTPAuth; $_l_SMTPGeneralPassActive; $_l_SMTPGeneralPassType; $1; PER_l_UseAuthentication; Per_l_UserAuthtype)
	C_POINTER:C301($_Ptr_aUSeSSL; $_Ptr_AuthActive; $_Ptr_AuthNames; $_Ptr_AuthPasswords; $_Ptr_AuthTypes; $_ptr_UseAuthentication; $_ptr_UserAuthtype; $_ptr_UserIDS; $_ptr_UserName; $_ptr_UserPassword; $_Ptr_USeSSL)
	C_POINTER:C301($10; $11; $12; $2; $3; $4; $5; $6; $7; $8; $9)
	C_POINTER:C301(Per_ptr_UserAuthtype)
	C_TEXT:C284($_t_oldMethodName; $_t_SMTPGeneralPassAuth; $_t_SMTPGeneralPassName; PER_t_UserName; PER_t_UserPassword)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Per_LOADSMTPAUTH")
If (Count parameters:C259>=4)
	$_ptr_UseAuthentication:=$2
	$_ptr_UserName:=$3
	$_ptr_UserPassword:=$4
	If (Count parameters:C259>=5)
		$_ptr_UserAuthtype:=$5  //Per_l_UserAuthtype
		If (Count parameters:C259>=6)
			$_ptr_UserIDS:=$6
			If (Count parameters:C259>=7)
				$_ptr_USEssl:=$7
				If (Count parameters:C259>=8)
					$_Ptr_AuthActive:=$8
					If (Count parameters:C259>=9)
						$_Ptr_AuthTypes:=$9
						If (Count parameters:C259>=10)
							$_Ptr_AuthNames:=$10
							If (Count parameters:C259>=11)
								$_Ptr_AuthPasswords:=$11
								If (Count parameters:C259>=12)
									$_Ptr_aUSeSSL:=$12
								Else 
									$_Ptr_aUSeSSL:=->$_abo_SMTPUseSSL
								End if 
							Else 
								$_Ptr_AuthPasswords:=->$_at_SMTPUserAuthPasswords
							End if 
						Else 
							$_Ptr_AuthNames:=->$_at_SMTPUserAuthName
						End if 
					Else 
						$_Ptr_AuthTypes:=->$_al_SMTPUserAuthTypes
					End if 
				Else 
					$_Ptr_AuthActive:=->$_al_SMTPUserAuthActive
				End if 
			Else 
				$_ptr_UseSSL:=->PER_bo_UseSSL
			End if 
		Else 
			$_ptr_UserIDS:=->$_al_SMTPUserIDS
		End if 
	Else 
		$_ptr_UserAuthtype:=->Per_l_UserAuthtype
	End if 
Else 
	
	$_ptr_UseAuthentication:=->PER_l_UseAuthentication
	$_ptr_UserName:=->PER_t_UserName
	$_ptr_UserPassword:=->PER_t_UserPassword
	$_ptr_UserAuthtype:=->Per_l_UserAuthtype
	$_ptr_UseSSL:=->PER_bo_UseSSL
	$_ptr_UserIDS:=->$_al_SMTPUserIDS
	$_Ptr_AuthActive:=->$_al_SMTPUserAuthActive
	$_Ptr_AuthTypes:=->$_al_SMTPUserAuthTypes
	$_Ptr_AuthNames:=->$_at_SMTPUserAuthName
	$_Ptr_AuthPasswords:=->$_at_SMTPUserAuthPasswords
	$_Ptr_aUSeSSL:=->$_abo_SMTPUseSSL
End if 
//THis method will load the SMTP auth prefs and then find the settings for this user
//NOTE THAT IN THIS METHOD WE ARE NOT SETTING ENTERABILITY OR VISIBILITY JUST THE VALUES
ARRAY LONGINT:C221(PER_al_AuthenticationTypes; 5)
ARRAY TEXT:C222(PER_at_AuthenticationType; 5)
PER_al_AuthenticationTypes{1}:=-1  //=Use  System setting
PER_al_AuthenticationTypes{2}:=0
PER_al_AuthenticationTypes{3}:=1
PER_al_AuthenticationTypes{4}:=2
PER_al_AuthenticationTypes{5}:=3
PER_at_AuthenticationType{1}:="Use Database Preference"
PER_at_AuthenticationType{2}:="Most Secure Available"
PER_at_AuthenticationType{3}:="Plain"
PER_at_AuthenticationType{4}:="Password"
PER_at_AuthenticationType{5}:="CRAM-MD5"
PER_at_AuthenticationType:=1
$_ptr_UseAuthentication->:=-0
$_ptr_UserName->:=""
$_ptr_UserPassword->:=""


SYS_LOADSMTPAUTH(False:C215; ->$_l_SMTPAuth; ->$_l_SMTPGeneralPassActive; ->$_l_SMTPGeneralPassType; ->$_t_SMTPGeneralPassName; ->$_t_SMTPGeneralPassAuth; $_ptr_UserIDS; $_Ptr_AuthActive; $_Ptr_AuthTypes; $_Ptr_AuthNames; $_Ptr_AuthPasswords; $_Ptr_aUSeSSL)

// Auth is required
$0:=True:C214
If (Count parameters:C259>=1)
	$_l_Personid:=$1
Else 
	
	$_l_Personid:=[PERSONNEL:11]Personnel_ID:48
End if 
If ($_l_Personid#0)  //The user has an id-else new user
	If ($_l_Personid>0)
		$_l_PersonRow:=Find in array:C230($_ptr_UserIDS->; $_l_Personid)
		If ($_l_PersonRow>0)  //The user has personal auth settings
			$_ptr_UseAuthentication->:=$_Ptr_AuthActive->{$_l_PersonRow}
			$_ptr_UserAuthtype->:=$_Ptr_AuthTypes->{$_l_PersonRow}
			PER_at_AuthenticationType:=Find in array:C230(PER_al_AuthenticationTypes; $_Ptr_AuthTypes->{$_l_PersonRow})
			$_ptr_UserName->:=$_Ptr_AuthNames->{$_l_PersonRow}
			$_ptr_UserPassword->:=$_Ptr_AuthPasswords->{$_l_PersonRow}
			$_ptr_UseSSL->:=$_Ptr_aUSeSSL->{$_l_PersonRow}
		Else 
			//******************* added 30/07/08 -kmw *******************************************
			SYS_bo_AuthSettingsLoaded:=False:C215  //just in case
			
			$_ptr_UseAuthentication->:=0
			$_ptr_UserAuthtype->:=0
			$_ptr_UserName->:=""
			$_ptr_UserPassword->:=""
			$_ptr_UseSSL->:=False:C215
			APPEND TO ARRAY:C911($_ptr_UserIDS->; $_l_Personid)
			APPEND TO ARRAY:C911($_Ptr_AuthActive->; $_ptr_UseAuthentication->)
			APPEND TO ARRAY:C911($_Ptr_AuthTypes->; $_ptr_UserAuthtype->)
			APPEND TO ARRAY:C911($_Ptr_AuthNames->; $_ptr_UserName->)
			APPEND TO ARRAY:C911($_Ptr_AuthPasswords->; $_ptr_UserPassword->)
			APPEND TO ARRAY:C911($_Ptr_aUSeSSL->; $_ptr_UseSSL->)
			//*******************************************************
			//*********************************
		End if 
		If ($_ptr_UseAuthentication->=0) & ($_l_SMTPAuth=1)
			$_ptr_UseAuthentication->:=$_l_SMTPAuth
			$_ptr_UserAuthtype->:=$_l_SMTPGeneralPassType  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
			$_ptr_UserName->:=""  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
			$_ptr_UserPassword->:=""  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
			$_ptr_UseSSL->:=False:C215
		End if 
		If ($_l_SMTPAuth=1) & ($_l_SMTPGeneralPassActive=1)
			//General password is set -do we need to do anything
			$_ptr_UserAuthtype->:=$_l_SMTPGeneralPassType
			$_ptr_UserName->:=$_t_SMTPGeneralPassName
			$_ptr_UserPassword->:=$_t_SMTPGeneralPassAuth
			$_ptr_UseSSL->:=False:C215
		End if 
	Else 
		$_ptr_UseAuthentication->:=$_l_SMTPGeneralPassActive
		$_ptr_UserAuthtype->:=$_l_SMTPGeneralPassType
		
		PER_at_AuthenticationType:=PER_al_AuthenticationTypes{$_ptr_UserAuthtype->}
		$_ptr_UserName->:=$_t_SMTPGeneralPassName
		$_ptr_UserPassword->:=$_t_SMTPGeneralPassAuth
		$_ptr_UseSSL->:=False:C215
	End if 
	
Else 
	//New person-no ID-so turn on if required
	If ($_l_SMTPAuth=1)
		$_ptr_UseAuthentication->:=1
		$_ptr_UserAuthtype->:=$_l_SMTPGeneralPassType  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
		$_ptr_UserName->:=""  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
		$_ptr_UserPassword->:=""  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
		$_ptr_UseSSL->:=False:C215
	Else 
		$_ptr_UseAuthentication->:=0
		$_ptr_UserAuthtype->:=$_l_SMTPGeneralPassType  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
		$_ptr_UserName->:=""  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
		$_ptr_UserPassword->:=""  //added 28/07/08 -kmw for when running uncompiled - might have always set somewhere else anyway but just in case
		$_ptr_UseSSL->:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("Per_LOADSMTPAUTH"; $_t_oldMethodName)
