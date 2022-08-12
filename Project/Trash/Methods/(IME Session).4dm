//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME Session
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
	//ARRAY TEXT(<>IME_at_RobotIPs;0)
	//ARRAY TEXT(<>IME_at_RobotWebRefs;0)
	C_BOOLEAN:C305(bIsARobot)
	C_LONGINT:C283($_l_IPRow)
	C_TEXT:C284($_t_ClientIP; $_t_oldMethodName; $_t_Site; $1; IME_t_ClientIP; vWebRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME Session")
//IME Session


$_t_Site:=$1

If (vWebRef="")
	vWebRef:=Substring:C12(IME_CookieGet($_t_Site+"ref"); 1; 11)
End if 

If (vWebRef="")
	
	$_t_ClientIP:=Substring:C12(IME_t_ClientIP; 1; 15)  //check for robots & don't add sessions
	$_l_IPRow:=Find in array:C230(<>IME_at_RobotIPs; $_t_ClientIP)
	If ($_l_IPRow<1)
		bIsARobot:=False:C215
		IME_AccessCreate($_t_Site; 1)
	Else 
		bIsARobot:=True:C214  //NB: Is currently NOT a robot if cookies are handled by the robot
		vWebRef:=<>IME_at_RobotWebRefs{$_l_IPRow}
	End if 
	
	//Else
	//IME_AccessUpdate
End if 

IME_CookieSet($_t_Site+"ref"; vWebRef; True:C214; 3600)  //60*60 - 60 minute timeout
ERR_MethodTrackerReturn("IME Session"; $_t_oldMethodName)