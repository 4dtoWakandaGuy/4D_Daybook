//%attributes = {}
If (False:C215)
	//Project Method Name:      IsEmailAvailable
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    28/11/2010 21:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Set; $0; $1)
	C_LONGINT:C283($_l_DaysRemaining)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultSMTPhost; $_t_Message; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IsEmailAvailable")
$_bo_Set:=False:C215
$_t_Message:=""

If (Current user:C182="Designer")
	//DB_GetModuleSettingByNUM (Module_IntServer ;1)
	//43rd element of mod array is internet manager in licencing numberer
End if 

Case of 
	: (DB_GetModuleSettingByNUM(Module_IntServer)>0)  //BSW 04/07/02
		$_bo_Set:=True:C214
		
	: (Position:C15("Workstation"; DB_GetOrganisation)>0)
		$_bo_Set:=True:C214
		
	Else 
		Case of 
			: (Current date:C33(*)<!2001-10-01!)
				$_t_Message:="Email has been enabled"
				$_t_Message:=$_t_Message+Char:C90(13)+"This will be valid until 30th September 2001"
				$_t_Message:=$_t_Message+Char:C90(13)+"Apply for your upgrade to use eMail after this"
				$_bo_Set:=True:C214
			: (Current date:C33(*)<!2001-10-30!)
				$_l_DaysRemaining:=!2001-10-30!-Current date:C33(*)
				$_t_Message:="Email has been enabled"
				$_t_Message:=$_t_Message+Char:C90(13)+"You have only"+String:C10($_l_DaysRemaining)+" Days to register"
				$_t_Message:=$_t_Message+Char:C90(13)+"Apply for your upgrade to use eMail after this"
				$_bo_Set:=True:C214
			Else 
				$_bo_Set:=True:C214
		End case 
		
End case 
If (<>EMAIL_t_DefaultSMTPhost="") | (<>EMAIL_t_DefaultReplyToAddress="")
	If ($_bo_Set=True:C214)
		Gen_Alert("Email can be enabled, by setting up your eMail Prefs"; ""; -1984)
		$_t_Message:=""
	End if 
	$_bo_Set:=False:C215
	
End if 


If (Count parameters:C259>0)
	If ($1=True:C214) & ($_t_Message#"")
		Gen_Alert($_t_Message; ""; -1984)
	End if 
End if 
$0:=$_bo_Set
ERR_MethodTrackerReturn("IsEmailAvailable"; $_t_oldMethodName)