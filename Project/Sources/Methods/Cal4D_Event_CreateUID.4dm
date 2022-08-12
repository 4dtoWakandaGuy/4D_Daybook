//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Event_CreateUID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_DateTimeString; $_t_MethodName; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_CreateUID")


$_t_DateTimeString:=Cal4D_ISO_DateTimeStrWithZone(Current date:C33; Current time:C178; Cal4D_iCal_GetTimezoneOffset)
$_t_DateTimeString:=$_t_DateTimeString+":"+String:C10((Random:C100%1024)+1; "0000")+"-Cal4D.v11SQL"



$0:=$_t_DateTimeString
ERR_MethodTrackerReturn("Cal4D_Event_CreateUID"; $_t_oldMethodName)