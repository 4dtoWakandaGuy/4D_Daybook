//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_DateStamp
	//------------------ Method Notes ------------------
	//WT July 2001
	//Pass this method a date (even empty ones)
	//and it will return a date code(LONGINT)
	//``Gen_DateStamp({TheDateVar})=> 'TheDateVar' in LongInt format
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_DateStamp")
Case of 
	: (Count parameters:C259=0)
		$_d_Date:=Current date:C33(*)
	: (Count parameters:C259=1)
		$_d_Date:=$1
End case 
$0:=(($_d_Date-!1999-12-30!)*24*60*60)
If ($0=0)
	$0:=1
End if 
ERR_MethodTrackerReturn("Gen_DateStamp"; $_t_oldMethodName)