//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_MSStart
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch5; ch6)
	C_TEXT:C284($_t_oldMethodName; vLocation)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_MSStart")
If ((ch6=1) & (vLocation#""))
	If (Length:C16(vLocation)=3)
		vLocation:=vLocation+"@"
	End if 
	CREATE EMPTY SET:C140([MAILSORT_MAIL:83]; "Extra")
	FIRST RECORD:C50([MAILSORT_MAIL:83])
	While ((Not:C34(End selection:C36([MAILSORT_MAIL:83]))) & ([MAILSORT_MAIL:83]SSC:3#vLocation))
		NEXT RECORD:C51([MAILSORT_MAIL:83])
	End while 
	If (End selection:C36([MAILSORT_MAIL:83]))
		Gen_Alert("Mailsort SSC not found"; "Cancel")
		OK:=0
		ch5:=0
	Else 
		While (Not:C34(End selection:C36([MAILSORT_MAIL:83])))
			ADD TO SET:C119([MAILSORT_MAIL:83]; "Extra")
			NEXT RECORD:C51([MAILSORT_MAIL:83])
		End while 
		USE SET:C118("Extra")
		Mail_MSSort
	End if 
End if 
ERR_MethodTrackerReturn("Mail_MSStart"; $_t_oldMethodName)