//%attributes = {}
If (False:C215)
	//Project Method Name:      CUR_CloseCurrency
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_OK; $_l_ScreenCentreVertical; CUR_l_SelectedCurrencyCode; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xCancel)
	C_TEXT:C284($_t_oldMethodName; UTI_t_CloseMessage)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CUR_CloseCurrency")
$_l_OK:=0
UTI_t_CloseMessage:="Do you want to save the changes?"
$_l_ScreenCentreVertical:=Screen width:C187/2
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-182; 80; $_l_ScreenCentreVertical+182; 175)
DIALOG:C40([COMPANIES:2]; "dClose")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
$_l_OK:=OK
If ($_l_OK=0)
	If (xCancel=1)
		$_l_OK:=-1
	End if 
End if 

Case of 
	: ($_l_OK=1)
		CUR_SaveExisting(CUR_l_SelectedCurrencyCode)
		CANCEL:C270
	: ($_l_OK=0)
		OK:=0
		CANCEL:C270
	: ($_l_OK=-1)
		
End case 
ERR_MethodTrackerReturn("CUR_CloseCurrency"; $_t_oldMethodName)