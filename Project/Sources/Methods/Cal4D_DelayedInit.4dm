//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_DelayedInit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_Tables;0)
	C_LONGINT:C283($_r_TickCount)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_DelayedInit")

//If (Shell_SelfStart($_t_MethodName;$_t_MethodName))
ARRAY TEXT:C222(CAL_at_Tables; 0)
$_r_TickCount:=Tickcount:C458
Repeat 
	Begin SQL
		SELECT TABLE_NAME
		FROM   _USER_TABLES
		INTO   :CAL_at_Tables;
	End SQL
	
Until ((Find in array:C230(CAL_at_Tables; "Cal4D_User")>0) | (Tickcount:C458-$_r_TickCount>(30*60)))

If (Find in array:C230(CAL_at_Tables; "Cal4D_User")<1)
	ALERT:C41("Please restart the database to finish first Time_Initialization of table.")
Else 
	Cal4D_Init
End if 
//End if
ERR_MethodTrackerReturn("Cal4D_DelayedInit"; $_t_oldMethodName)