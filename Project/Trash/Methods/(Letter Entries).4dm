//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letter Entries
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
	C_LONGINT:C283(i; vNo)
	C_POINTER:C301(vPtr)
	C_TEXT:C284($_t_oldMethodName; $0; vRequest; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letter Entries")
If ((Not:C34(End selection:C36)) & (i<=vNo))
	If (vPtr->#"")
		If (vPtr->#vRequest)
			vRequest:=vPtr->
			i:=i+1
			vText:=""
			Mail_MSRec
			Letter_AllDets(True:C214)
			Letter_Print2
			Letter_Replace(True:C214)
			Letter_Alloc([DOCUMENTS:7]Document_Code:1)
		End if 
	End if 
End if 
$0:=""
ERR_MethodTrackerReturn("Letter Entries"; $_t_oldMethodName)