//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetDTSTAMP_ZULU
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 12:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IsDaylightTime; $1)
	C_DATE:C307($_d_GmtDate; $_d_LocalDate; $2)
	C_LONGINT:C283($_l_Paramters)
	C_TEXT:C284($_t_dateTimeString; $_t_MethodName; $_t_oldMethodName; $0)
	C_TIME:C306($_ti_GmtTime; $_ti_LocalTime; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetDTSTAMP_ZULU")


$_l_Paramters:=Count parameters:C259
If ($_l_Paramters>0)
	$_bo_IsDaylightTime:=$1
	If ($_l_Paramters>1)
		$_d_LocalDate:=$2
		If ($_l_Paramters>2)
			$_ti_LocalTime:=$3
		Else 
			$_ti_LocalTime:=Current time:C178(*)
		End if 
	Else 
		$_d_LocalDate:=Current date:C33(*)
		$_ti_LocalTime:=Current time:C178(*)
	End if 
Else 
	$_bo_IsDaylightTime:=True:C214
	$_d_LocalDate:=Current date:C33(*)
	$_ti_LocalTime:=Current time:C178(*)
End if 

If ($_bo_IsDaylightTime)
	$_ti_LocalTime:=$_ti_LocalTime+3600
	If ($_ti_LocalTime>=?24:00:00?)
		$_d_LocalDate:=Add to date:C393($_d_LocalDate; 0; 0; 1)
	End if 
End if 

//$GMT_T:=@XXAP Timestamp to GMT($_d_LocalDate;$_ti_LocalTime;$_d_GmtDate;$_ti_GmtTime)
//$_t_dateTimeString:=String($_d_LocalDate;Date RFC 1123;$_ti_LocalTime)  // returns, for example Fri, 10 Sep 2010 13:07:20 GMT 
//$rfcdate:=String($_d_LocalDate;time RFC 121;$_ti_LocalTime)  // returns, for example Fri, 10 Sep 2010 13:07:20 GMT 
//$_t_dateTimeString
//========================    Method Actions    ==================================

$_t_dateTimeString:=Replace string:C233(Substring:C12(String:C10($_d_GmtDate; ISO date:K1:8); 1; 11); "-"; "")
$_t_dateTimeString:=$_t_dateTimeString+Replace string:C233(Substring:C12(String:C10($_ti_GmtTime; ISO time:K7:8); 12); ":"; "")+"Z"

//========================    Clean up and Exit    =================================

$0:=$_t_dateTimeString
ERR_MethodTrackerReturn("Cal4D_iCal_GetDTSTAMP_ZULU"; $_t_oldMethodName)