//%attributes = {}
If (False:C215)
	//Project Method Name:      Ask_Output
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(rFile; rPrint)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Ask_Output")
Gen_Confirm("Output to the Printer/Screen or to a Text file?"; "Printer"; "Text")
If (OK=1)
	//rPrint:=1
	//rFile:=0
Else 
	//rFile:=1
	//rPrint:=0
	OK:=1
End if 
ERR_MethodTrackerReturn("Ask_Output"; $_t_oldMethodName)
