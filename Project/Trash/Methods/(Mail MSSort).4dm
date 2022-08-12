//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail MSSort
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/08/2009 08:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail MSSort")
If (ch4=1)
	ORDER BY:C49([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]Area_Order:4; >; [MAILSORT_MAIL:83]SSC:3; >)
Else 
	ORDER BY:C49([MAILSORT_MAIL:83]; [MAILSORT_MAIL:83]SSC:3; >)
End if 
ERR_MethodTrackerReturn("Mail MSSort"; $_t_oldMethodName)