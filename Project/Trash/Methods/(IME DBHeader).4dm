//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME DBHeader
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
	C_LONGINT:C283($_l_CountParameters)
	C_TEXT:C284($_t_CurrentPage; $_t_FormJS; $_t_HeadingAction; $_t_HeadingLeft; $_t_HeadingRight; $_t_Navigation; $_t_oldMethodName; $_t_onLoadFormJS; $_t_UserName; $_t_UserOrganization; $_t_WindowTitle)
	C_TEXT:C284($1; $2; $3; $4; $5; $6; $7; IME_t_UserName; IME_t_UserOrganization)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME DBHeader")
//IME DBHeader
//Rollo 9/6/2004

//Default header and heading html etc for all daybook interface pages


$_l_CountParameters:=Count parameters:C259

$_t_WindowTitle:=$1  //title of the window
Case of 
	: ($_t_WindowTitle="")
		$_t_WindowTitle:="Daybook"
	: ($_t_WindowTitle="Daybook@")
	Else 
		$_t_WindowTitle:="Daybook "+$_t_WindowTitle
End case 

$_t_HeadingAction:=$2
If ($_t_HeadingAction#"")
	$_t_HeadingAction:=IME_DBEncrypt($_t_HeadingAction)  //always encrypt the urls
End if 

$_t_HeadingLeft:=$3  //heading on the left

If ($_l_CountParameters>3)
	$_t_HeadingRight:=$4  //heading on the right
Else 
	$_t_HeadingRight:=""
End if 

If ($_l_CountParameters>4)
	$_t_CurrentPage:=$5  //URL of the current page, used to affect the Navigation
Else 
	$_t_CurrentPage:=""
End if 

If ($_l_CountParameters>5)
	$_t_onLoadFormJS:=$6  //Optional additional JS function to call
Else 
	$_t_onLoadFormJS:=""
End if 

If ($_l_CountParameters>6)
	$_t_FormJS:=$7
Else 
	$_t_FormJS:=""
End if 

$_t_UserName:=IME_t_UserName
$_t_UserOrganization:=IME_t_UserOrganization
$_t_Navigation:=IME_DBNavigation($_t_CurrentPage)

IME_ReplyText2("ITX DGHeader1"; $_t_WindowTitle; $_t_onLoadFormJS)
IME_ReplyText2("ITX DGForm1"; $_t_HeadingAction; $_t_FormJS)
IME_ReplyText2("ITX DGHeading1"; $_t_HeadingLeft; $_t_HeadingRight; $_t_UserName; $_t_UserOrganization; $_t_Navigation)
ERR_MethodTrackerReturn("IME DBHeader"; $_t_oldMethodName)