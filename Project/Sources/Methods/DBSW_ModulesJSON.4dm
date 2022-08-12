//%attributes = {}
If (False:C215)
	//Project Method Name:      DBSW_ModulesJSON
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/01/2012 08:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_AL_UserProcessID;0)
	C_LONGINT:C283($_l_ProcessRow)
	C_TEXT:C284($_t_oldMethodName; $_t_String; $1; DBWS_t_JsonIconBar)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBSW_ModulesJSON")

//This method will get the modules for the current logged in user and return them to the web page in JSON format

$_t_String:=""
If (Count parameters:C259>=1)
	If ($1#"")
		QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=$1)
		If (Records in selection:C76([WEB_ACCESS:130])=1)
			$_l_ProcessRow:=DBWS_GetCurrentUserProcess([WEB_ACCESS:130]Personnel_ID:12; [WEB_ACCESS:130]Person:10)
			If ($_l_ProcessRow>0)
				While (Process state:C330(<>DB_AL_UserProcessID{$_l_ProcessRow})#Paused:K13:6)
					DelayTicks(2)
				End while 
				While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_ProcessRow})))
					DelayTicks(2)
				End while 
				While (Semaphore:C143("usercontrol"+[WEB_ACCESS:130]Person:10))
					DelayTicks(2)
				End while 
				DBWS_t_JsonIconBar:=""
				SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_ProcessRow}; DBWS_l_CallAction; 1)
				SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_ProcessRow}; DBWS_l_CallBack; Current process:C322)
				RESUME PROCESS:C320(<>DB_AL_UserProcessID{$_l_ProcessRow})
				CLEAR SEMAPHORE:C144("usercontrol"+[WEB_ACCESS:130]Person:10)
				While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_ProcessRow}))) | (DBWS_t_JsonIconBar="")
					DelayTicks(2)
				End while 
				$_t_String:=DBWS_t_JsonIconBar  //AA_JUNK10
				WEB SEND TEXT:C677($_t_String)
				//SET TEXT TO PASTEBOARD($_t_String)
				
			Else 
				WEB SEND TEXT:C677($_t_String)
				//SET TEXT TO PASTEBOARD($_t_String)
			End if 
		Else 
			WEB SEND TEXT:C677($_t_String)
			//SET TEXT TO PASTEBOARD($_t_String)
		End if 
	Else 
		WEB SEND TEXT:C677($_t_String)
		//SET TEXT TO PASTEBOARD($_t_String)
	End if 
Else 
	WEB SEND TEXT:C677($_t_String)
End if 
ERR_MethodTrackerReturn("DBSW_ModulesJSON"; $_t_oldMethodName)