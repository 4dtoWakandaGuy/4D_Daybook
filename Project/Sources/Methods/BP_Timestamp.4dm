//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_Timestamp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_EmailOK)
	C_DATE:C307($_d_Date; $_d_TimeStampCutDate; $1)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_BackupMessage; $_t_BackupSubject; $_t_oldMethodName; BP_t_BackupAdminEmail)
	C_TIME:C306($_ti_Time; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_Timestamp")
//TRACE
If (Count parameters:C259>0)
	$_d_Date:=$1
Else 
	$_d_Date:=Current date:C33(*)
End if 

If (Count parameters:C259>1)
	$_ti_Time:=$2
Else 
	$_ti_Time:=Current time:C178(*)
End if 

If (($_d_Date>!1970-01-01!) & ($_d_Date<!2020-01-01!))
	
	$_d_TimeStampCutDate:=!1970-01-01!  //BSW15/11/02 Please don't change  this cut date without asking the manager - Thnx
	
	If ($_d_Date>=$_d_TimeStampCutDate)
		$0:=(($_d_Date-$_d_TimeStampCutDate)*86400)+$_ti_Time  //86400 seconds = 24*60*60 = 24 hrs = 1 day
	Else 
		$0:=(($_d_Date-$_d_TimeStampCutDate)*86400)-$_ti_Time  //86400 seconds = 24*60*60 = 24 hrs = 1 day
	End if 
	
Else 
	
	//TRACE
	$_t_BackupSubject:="Daybook alert message for DBA"
	$_t_BackupMessage:="In "+Structure file:C489+Char:C90(13)+Char:C90(10)+" Rewrite Timestamp related functions and methods because it will break the"+" timestamps generated before 01/01/1932 and after 01/01/2068!"
	$_t_BackupMessage:=$_t_BackupMessage+Char:C90(13)+Char:C90(10)+"Date - $_d_Date:"+String:C10($_d_Date)
	$_t_BackupMessage:=$_t_BackupMessage+Char:C90(13)+Char:C90(10)+"Current Process: "+Process_Name(Current process:C322)
	//MESSAGE($_t_BackupMessage)  //Also Error occurred so alert admin via email
	$_bo_EmailOK:=BP_SendEmail(BP_t_BackupAdminEmail; BP_t_BackupAdminEmail; $_t_BackupSubject; $_t_BackupMessage)
End if 
ERR_MethodTrackerReturn("BP_Timestamp"; $_t_oldMethodName)
