//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_ISO_DateTimeStrWithZone
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 12:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Compressed)
	C_DATE:C307($_d_Date; $1)
	C_TEXT:C284($_t_DateTimeString; $_t_MethodName; $_t_Offset; $_t_oldMethodName; $0; $3; $4)
	C_TIME:C306($_ti_Time; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_ISO_DateTimeStrWithZone")


$_d_Date:=$1
$_ti_Time:=$2
$_t_Offset:=$3
$_bo_Compressed:=(Count parameters:C259<4)

$_t_DateTimeString:=Substring:C12(String:C10($_d_Date; ISO time:K7:8); 1; 11)+Substring:C12(String:C10($_ti_Time; ISO time:K7:8); 12)
If ($_bo_Compressed)
	$_t_DateTimeString:=Replace string:C233($_t_DateTimeString; "-"; "")
	$_t_DateTimeString:=Replace string:C233($_t_DateTimeString; ":"; "")
End if 
If (Position:C15("0000"; $_t_Offset)>0)
	$_t_DateTimeString:=$_t_DateTimeString+"Z"
Else 
	$_t_DateTimeString:=$_t_DateTimeString+$_t_Offset
End if 

$0:=$_t_DateTimeString
ERR_MethodTrackerReturn("Cal4D_ISO_DateTimeStrWithZone"; $_t_oldMethodName)