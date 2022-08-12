//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_ContactChoice
	//------------------ Method Notes ------------------
	
	//This method will display a window as a small process when entering names in the
	//email
	//the names are in an array ◊DOC_at_EmailChoices
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 16:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($2)
	//C_UNKNOWN($3)
	//ARRAY LONGINT(SD2_al_ContactTypeSelect;0)
	//ARRAY TEXT(SD2_at_ContactEmailSelect;0)
	//ARRAY TEXT(SD2_at_ContactNamesSelect;0)
	//ARRAY TEXT(SD2_at_ContactsSelect;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $2; $3; $4; EmailChoiceProc; SD2_l_Callback; SD2_l_CallEvent; SD2_l_EmailChoiceProc; SD2_l_ProcessReady; SD2_l_winLeft; SD2_l_winTop)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; $_l_CurrentWinRefOLD; $1; $4; SD2_l_Callback; SD2_l_CallEvent; SD2_l_EmailChoiceProc; SD2_l_ProcessReady; SD2_l_winLeft; SD2_l_winTop)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_ContactChoice")


If (Count parameters:C259>=4)
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153($1; $2; $3; $2; -2)
	SD2_l_winLeft:=$1
	SD2_l_winTop:=$2
	
	SD2_l_Callback:=$4
	SD2_l_CallEvent:=0
	ARRAY TEXT:C222(SD2_at_ContactsSelect; 0)
	ARRAY TEXT:C222(SD2_at_ContactNamesSelect; 0)
	ARRAY TEXT:C222(SD2_at_ContactEmailSelect; 0)
	ARRAY LONGINT:C221(SD2_al_ContactTypeSelect; 0)
	SD2_l_ProcessReady:=1
	While (SD2_l_ProcessReady=1)
		DelayTicks(2)
	End while 
	
	DIALOG:C40([USER:15]; "SD2_MiniDropSelect")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	SD2_l_EmailChoiceProc:=0
	If (Process state:C330(SD2_l_Callback)>=0)
		SET PROCESS VARIABLE:C370(SD2_l_Callback; SD2_l_EmailChoiceProc; SD2_l_EmailChoiceProc)
	End if 
End if 
ERR_MethodTrackerReturn("DOC_EmailChoices"; $_t_oldMethodName)
