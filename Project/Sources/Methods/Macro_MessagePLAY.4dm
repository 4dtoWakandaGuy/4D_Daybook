//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_MessagePLAY
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
	C_LONGINT:C283(CURMACWINDOW)
	C_TEXT:C284($_t_oldMethodName; $_t_Parameter1; $_t_Parameter1Content; $1; VMTITLE3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_MessagePLAY")

$_t_Parameter1:=First_Param($1)
$_t_Parameter1Content:=STR_RemQuote(First_Param($1))
If (CURMACWINDOW=0)
	CURMACWINDOW:=Record_MessWin($_t_Parameter1Content)
End if 
If ($_t_Parameter1#"")
	VMTITLE3:=$_t_Parameter1
	HIGHLIGHT TEXT:C210(VMTITLE3; 32000; 32000)
	DISPLAY RECORD:C105([SCRIPTS:80])
End if 
//dont forget to close that window
ERR_MethodTrackerReturn("Macro_MessagePLAY"; $_t_oldMethodName)
