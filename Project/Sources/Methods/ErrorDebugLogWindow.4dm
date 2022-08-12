//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 01/04/2010 15:52
	//Method Name: ErrorDebugLogWindow
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
WIN_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187-500; 213; Screen width:C187-4; 714; -Palette window:K34:3; ""; "")
DIALOG:C40([USER:15]; "ErrorLogViewForm")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=WIN_l_CurrentWinRefOLD