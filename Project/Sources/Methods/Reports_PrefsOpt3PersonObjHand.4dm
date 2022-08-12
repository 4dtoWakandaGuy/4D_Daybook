//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsOpt3PersonObjHand
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsOpt3PersonObjHand
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SR_bo_ReportPrefsDirty)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsOpt3PersonObjHand")



//Added 20/02/09 v631b120o -kmw

Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		SR_bo_ReportPrefsDirty:=True:C214
		
		Reports_PrefFormVarsToArrays
		
	: (Form event code:C388=On Getting Focus:K2:7)
		OBJECT MOVE:C664(*; "oSREmailPrintOption3"; 0; 0; -25; 0)
		OBJECT MOVE:C664(*; "oSREmailPrintOption3Pers"; -25; 0; 25; 0)
		
	: (Form event code:C388=On Losing Focus:K2:8)
		OBJECT MOVE:C664(*; "oSREmailPrintOption3"; 0; 0; 25; 0)
		OBJECT MOVE:C664(*; "oSREmailPrintOption3Pers"; 25; 0; -25; 0)
		
	Else 
		
End case 
ERR_MethodTrackerReturn("Reports_PrefsOpt3PersonObjHand"; $_t_oldMethodName)
