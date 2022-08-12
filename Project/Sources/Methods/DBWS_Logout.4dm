//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_Logout
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/01/2012 11:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_AL_UserProcessID;0)
	//ARRAY TEXT(<>DBWS_at_UserProcess;0)
	C_LONGINT:C283($_l_PersonRow)
	C_TEXT:C284($_t_HomeFormName; $_t_oldMethodName; DBWS_t_JsonIconBar; DBWS_t_LoggedInUserName; DBWS_T_Title; DSWS_t_Currentcookie)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_Logout")

If (DSWS_t_Currentcookie#"")
	READ WRITE:C146([WEB_ACCESS:130])
	
	
	QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=DSWS_t_Currentcookie)
	LOAD RECORD:C52([WEB_ACCESS:130])
	If (Records in selection:C76([WEB_ACCESS:130])>1)
		[WEB_ACCESS:130]Web_Ref:1:=""
		[WEB_ACCESS:130]Access_Date:2:=!00-00-00!
		[WEB_ACCESS:130]Access_Time:3:=?00:00:00?
		[WEB_ACCESS:130]Login_Date:14:=!00-00-00!
		[WEB_ACCESS:130]Login_Time:15:=?00:00:00?
		SAVE RECORD:C53([WEB_ACCESS:130])
	End if 
	DSWS_t_Currentcookie:=""
	DBWS_t_LoggedInUserName:=""
	DBWS_CookieSet(String:C10(0))
	$_l_PersonRow:=Find in array:C230(<>DBWS_at_UserProcess; [WEB_ACCESS:130]Person:10)
	If ($_l_PersonRow>0)
		While (Process state:C330(<>DB_AL_UserProcessID{$_l_PersonRow})#Paused:K13:6)
			DelayTicks(2)
		End while 
		While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_PersonRow})))
			DelayTicks(2)
		End while 
		While (Semaphore:C143("usercontrol"+[WEB_ACCESS:130]Person:10))
			DelayTicks(2)
		End while 
		DBWS_t_JsonIconBar:=""
		SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_l_CallAction; -1)
		SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_l_CallBack; Current process:C322)
		RESUME PROCESS:C320(<>DB_AL_UserProcessID{$_l_PersonRow})
		DELETE FROM ARRAY:C228(<>DBWS_at_UserProcess; $_l_PersonRow)
		DELETE FROM ARRAY:C228(<>DB_AL_UserProcessID; $_l_PersonRow)
		CLEAR SEMAPHORE:C144("usercontrol"+[WEB_ACCESS:130]Person:10)
	End if 
End if 
DBWS_T_Title:="Welcome"
$_t_HomeFormName:=DBWS_GetWSForm("Home")
DBWS_SetPage("Home"; $_t_HomeFormName)
ERR_MethodTrackerReturn("DBWS_Logout"; $_t_oldMethodName)