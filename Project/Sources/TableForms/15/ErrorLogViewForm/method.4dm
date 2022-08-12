If (False:C215)
	//Table Form Method Name: [USER]ErrorLogViewForm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Err_bo_InErrorHandler; DB_bo_NoLoad)
	C_LONGINT:C283(<>Err_l_DebugLogStatus)
	C_TEXT:C284(<>t_ErrorDebugLog; $_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [USER]ErrorLogViewForm"; Form event code:C388)


//$_t_oldMethodName:=ERR_MethodTracker ("FM [USER].ErrorLogViewForm";Form event)
SET TIMER:C645(60*2)


Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "ErrorLogViewForm")
		//SET TIMER(60*1*)
		l_ErrorDebugLogStatusOLD:=<>Err_l_DebugLogStatus
	: (Form event code:C388=On Timer:K2:25)
		If (Not:C34(<>Err_bo_InErrorHandler))  // NG added to stop the redraw if there is an error so we can read it
			REDRAW:C174(<>t_ErrorDebugLog)
		End if 
		
End case 
If (<>Err_l_DebugLogStatus=0)
	CANCEL:C270
End if 


//on
ERR_MethodTrackerReturn("FM [USER].ErrorLogViewForm"; $_t_oldMethodName)