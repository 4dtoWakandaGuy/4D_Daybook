//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter_Print2
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
	C_LONGINT:C283(ch5; ch8; iNoDear; iNoSal)
	C_TEXT:C284($_t_oldMethodName; vOurRef; vSalutation)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter_Print2")
If ([CONTACTS:1]Salutation:7#"")
	vSalutation:="Dear "+[CONTACTS:1]Salutation:7
End if 
If ((iNoDear=1) & (vSalutation="Dear @"))
	vSalutation:=Substring:C12(vSalutation; 6; 32000)
End if 
If (iNoSal=1)
	vSalutation:=""
End if 
If ((ch8=1) & (ch5=1))
	If ([MAILSORT_MAIL:83]SSC:3="@XX")
		vOurRef:=vOurRef+" ("+Substring:C12([MAILSORT_MAIL:83]SSC:3; 1; 3)+")"
	Else 
		vOurRef:=vOurRef+" ("+[MAILSORT_MAIL:83]SSC:3+")"
	End if 
End if 
ERR_MethodTrackerReturn("Letter_Print2"; $_t_oldMethodName)