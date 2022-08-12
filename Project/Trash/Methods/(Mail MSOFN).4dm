//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Mail MSOFN
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
	C_LONGINT:C283(vNo3; vNo4; vNo5)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail MSOFN")
If ([MAILSORT_MAIL:83]SSC:3#"000@")
	Case of 
		: ([COMPANIES:2]Mailsort_OFN:50="F")
			vNo3:=vNo3+1
		: ([COMPANIES:2]Mailsort_OFN:50="O")
			vNo4:=vNo4+1
		Else 
			vNo5:=vNo5+1
	End case 
End if 
ERR_MethodTrackerReturn("Mail MSOFN"; $_t_oldMethodName)