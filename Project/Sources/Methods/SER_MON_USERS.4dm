//%attributes = {}
If (False:C215)
	//Project Method Name:      SER_MON_USERS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SER_MON_USERS
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($NewStyleLicence)
	C_DATE:C307($_d_LastLicenceCheckedDate)
	C_LONGINT:C283($_l_Delay)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SER_MON_USERS")
//This method executes on the server
//it ensures a stored proc is running
//we can use this process for calling data management
//at the moment it is just  idling


$_d_LastLicenceCheckedDate:=!00-00-00!
Repeat 
	If (Current date:C33>$_d_LastLicenceCheckedDate)  //only do this once a day
		LR_Custom
		
	End if 
	$_l_Delay:=60
	DelayTicks($_l_Delay*160)  //just so we dont hog it
	//SER_GetDatafileSize (1)  `Check if data segment is needed
	
Until (False:C215)
ERR_MethodTrackerReturn("SER_MON_USERS"; $_t_oldMethodName)
