//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_AlertCurr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal)
	C_LONGINT:C283($_l_ScreenCentreH; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>ButtOK; $_t_CurrentFormUsage; $_t_oldMethodName; $1; $2; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vConfirm)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_AlertCurr")
//Gen_AlertCurr ency
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
<>SYS_bo_CurrentWindowModal:=True:C214
vConfirm:=$1
$_l_ScreenCentreH:=Screen width:C187/2
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreH-209; 80; $_l_ScreenCentreH+209; 260)
If (Count parameters:C259>1)
	<>ButtOK:=$2
	DB_t_CurrentFormUsage:=$3
Else 
	<>ButtOK:=""
	DB_t_CurrentFormUsage:=""
End if 
DIALOG:C40([COMPANIES:2]; "dAlert_Curr")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
<>SYS_bo_CurrentWindowModal:=False:C215
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Gen_AlertCurr"; $_t_oldMethodName)