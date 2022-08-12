If (False:C215)
	//Table Form Method Name: [MAILSORT_MAIL]Line_Listing
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_REAL:C285(vSubtotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; vProbCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [MAILSORT_MAIL].Line_Listing"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		vProbCode:=Replace string:C233([MAILSORT_MAIL:83]SSC:3; "XX"; "")
		QUERY:C277([MAILSORT_B:78]; [MAILSORT_B:78]SSC:2=vProbCode)
		vSubtotal:=vSubtotal+[MAILSORT_MAIL:83]Count:5
		vVAT:=vVAT+[MAILSORT_MAIL:83]Bags:6
End case 
ERR_MethodTrackerReturn("FM [MAILSORT_MAIL].Line_Listing"; $_t_oldMethodName)
