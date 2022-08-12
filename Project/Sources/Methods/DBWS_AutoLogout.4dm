//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_AutoLogout
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2011 07:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_QuitCalled)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_AutoLogout")

//TRACE
$_ti_StartTime:=Current time:C178
Repeat 
	DelayTicks(30*60)
	If ((Current time:C178*1)>($_ti_StartTime+(45*60)))
		//Dont start tracking till 45 mins after we start
		If (Current time:C178*1)>(?00:00:00?+(45*60))
			//`dont track in the 1st 45 mins after midnight
			//thats just to keep it easy
			READ WRITE:C146([WEB_ACCESS:130])
			QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Access_Time:3<(Current time:C178-(45*60)); *)
			QUERY:C277([WEB_ACCESS:130];  & ; [WEB_ACCESS:130]Web_Ref:1#"")
			If (Records in selection:C76([WEB_ACCESS:130])>0)
				APPLY TO SELECTION:C70([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1:="")
				APPLY TO SELECTION:C70([WEB_ACCESS:130]; [WEB_ACCESS:130]Access_Date:2:=!00-00-00!)
				APPLY TO SELECTION:C70([WEB_ACCESS:130]; [WEB_ACCESS:130]Access_Time:3:=?00:00:00?)
				APPLY TO SELECTION:C70([WEB_ACCESS:130]; [WEB_ACCESS:130]Login_Date:14:=!00-00-00!)
				APPLY TO SELECTION:C70([WEB_ACCESS:130]; [WEB_ACCESS:130]Login_Time:15:=?00:00:00?)
				//if the user tries to reconeect with that cookie it will be timed out and send them to login.
				
			End if 
			
		End if 
	End if 
Until (OK=0) | (<>SYS_bo_QuitCalled)
ERR_MethodTrackerReturn("DBWS_AutoLogout"; $_t_oldMethodName)