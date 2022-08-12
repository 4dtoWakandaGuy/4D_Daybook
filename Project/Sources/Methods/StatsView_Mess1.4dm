//%attributes = {}
If (False:C215)
	//Project Method Name:      StatsView_Mess1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; bd15; bd16; bd17; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $1; vTitle20)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StatsView_Mess1")
//StatsView_Mess1
$_l_ScreenCentreVertical:=Screen width:C187/2
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-111; 110; $_l_ScreenCentreVertical+110; 166; 1984)
ALL RECORDS:C47([IDENTIFIERS:16])
ONE RECORD SELECT:C189([IDENTIFIERS:16])
FORM SET INPUT:C55([IDENTIFIERS:16]; "dProgress0")
vTitle20:=$1
bd15:=0  //Used for indicate %
bd16:=0  //Last used bd15
bd17:=0  //Start pos for loops
DISPLAY RECORD:C105([IDENTIFIERS:16])
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("StatsView_Mess1"; $_t_oldMethodName)