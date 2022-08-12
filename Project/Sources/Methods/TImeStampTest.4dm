//%attributes = {}
If (False:C215)
	//Project Method Name:      TImeStampTest
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/10/2014 17:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_ExtractedDate; $_d_StartDate)
	C_LONGINT:C283($_l_Stamp)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_ExtractedTime; $_ti_Time)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TImeStampTest")
$_d_StartDate:=!2014-04-28!
$_ti_Time:=Time:C179(Time string:C180(54778))

//$_ti_Time:=?15:12:00?
//TRACE
Repeat 
	$_l_Stamp:=(($_d_StartDate-!1990-01-01!)*24*60*60)+($_ti_Time+0)
	$_d_ExtractedDate:=!1990-01-01!+($_l_Stamp\(24*60*60))
	$_ti_ExtractedTime:=Time:C179(Time string:C180($_l_Stamp%(24*60*60)))
	If ($_ti_ExtractedTime#$_ti_Time) | ($_d_ExtractedDate#$_d_StartDate)
	End if 
	If ($_ti_Time=?23:59:00?)
		$_ti_Time:=?00:00:00?
		$_d_StartDate:=$_d_StartDate+1
	End if 
	MESSAGE:C88(String:C10($_l_Stamp)+" "+String:C10($_d_StartDate)+" "+String:C10($_ti_Time))
	
	$_ti_Time:=Time:C179(Time string:C180($_ti_Time+1))
	
Until (False:C215) | ($_d_StartDate>=(Current date:C33+720))
ERR_MethodTrackerReturn("TImeStampTest"; $_t_oldMethodName)
