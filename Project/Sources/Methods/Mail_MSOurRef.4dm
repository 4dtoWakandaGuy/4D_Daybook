//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_MSOurRef
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
	C_LONGINT:C283(ch5; ch8)
	C_TEXT:C284($_t_oldMethodName; vOurRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_MSOurRef")
If ((ch8=1) & (ch5=1))
	If ([MAILSORT_MAIL:83]SSC:3="@XX")
		vOurRef:=Substring:C12([MAILSORT_MAIL:83]SSC:3; 1; 3)
	Else 
		vOurRef:=[MAILSORT_MAIL:83]SSC:3
	End if 
End if 
ERR_MethodTrackerReturn("Mail_MSOurRef"; $_t_oldMethodName)