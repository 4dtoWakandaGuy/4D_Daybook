//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PostKey Wait
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
	C_LONGINT:C283(<>Repeat; $_l_CurrentProcess; $1; $2; $3; $4; $5; $s)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($t; $t2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PostKey Wait")

$_l_CurrentProcess:=Current process:C322
$t:=Current time:C178+<>Repeat
$s:=Process state:C330($4)
MESSAGE:C88(String:C10($2)+"  "+String:C10($s)+Char:C90(13))
$t2:=Current time:C178
While (($s>-1) & ($s#$5) & ($t2<$t))
	DelayTicks(20)
	$s:=Process state:C330($4)
	$t2:=Current time:C178
End while 
If ($t2>=$t)
	Gen_Alert("Auto-Process aborted: Time Out")
	ABORT:C156
Else 
	Gen_PostKey($1; $2; $3)
End if 
ERR_MethodTrackerReturn("PostKey Wait"; $_t_oldMethodName)