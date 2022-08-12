If (False:C215)
	//object Method Name: Object Name:      [USER].CCM_Prefs.Variable37
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/01/2010 16:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(CCM_D_ActivityDate; CCM_D_ActivityDate2)
	C_LONGINT:C283(CCM_l_AuthServiceID)
	C_TEXT:C284($_t_oldMethodName; CCM_t_AuthorizationProvider; CCM_t_AuthorizationService; CCM_t_PaymentHeader; CCM_t_PSPName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable37"; Form event code:C388)
Case of 
	: (CCM_l_AuthServiceID>0)
		CCM_D_ActivityDate:=!00-00-00!
		CCM_D_ActivityDate2:=!00-00-00!
		CCM_D_ActivityDate:=Date:C102(Request:C163("Enter START date to view"; String:C10(Current date:C33(*)-1)))
		If (OK=1)
			CCM_D_ActivityDate2:=Date:C102(Request:C163("Enter END date to view"; String:C10(CCM_D_ActivityDate; 4)))
			If (OK=1)
				If (CCM_D_ActivityDate2<CCM_D_ActivityDate)
					CCM_D_ActivityDate2:=CCM_D_ActivityDate
				End if 
				If (CCM_D_ActivityDate=CCM_D_ActivityDate2)
					CCM_t_PaymentHeader:="Transaction activity for "+CCM_t_AuthorizationProvider+" on "+String:C10(CCM_D_ActivityDate; 4)
					
				Else 
					CCM_t_PaymentHeader:="Transaction activity for "+CCM_t_AuthorizationProvider+" from "+String:C10(CCM_D_ActivityDate; 4)+" to "+String:C10(CCM_D_ActivityDate2; 4)
					
					
				End if 
				CCM_t_PSPName:=CCM_t_AuthorizationService
				CCM_ShowDetails(0; ->CCM_l_AuthServiceID; CCM_D_ActivityDate; CCM_D_ActivityDate2)
			End if 
			
		End if 
		
		
		
	: (CCM_l_AuthServiceID<0)
		Gen_Alert("This provider is not saved yet..there is no activity")
	Else 
		Gen_Alert("You must select a card Authorization service name to view the activity")
End case 
ERR_MethodTrackerReturn("OBJ:CCM_Prefs,BViewCardActity"; $_t_oldMethodName)
