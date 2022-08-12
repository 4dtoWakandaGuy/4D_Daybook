//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Progress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>PS_l_Progress; $_l_CurrentProcess; $_l_CurrentWinRefOLD; $_l_ScreenCentreVertical; SD3_l_CalendarStartDayNumber; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>Splash_t_SplashProgressMessage; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Progress")
//Progress - one that pauses itself & has to be woken
$_l_CurrentProcess:=Current process:C322
DB_SetMenuBar(""; 86)
READ ONLY:C145([IDENTIFIERS:16])
ALL RECORDS:C47([IDENTIFIERS:16])
ONE RECORD SELECT:C189([IDENTIFIERS:16])
$_l_ScreenCentreVertical:=Screen width:C187-(100+20)
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-111; 110; $_l_ScreenCentreVertical+110; 166; -1984)
<>PS_l_Progress:=1
While (<>PS_l_Progress<10)
	IDLE:C311
	
	If (<>PS_l_Progress>10)
		<>PS_l_Progress:=10
	End if 
	// (◊Progress#"")
	vTitle20:=Substring:C12(<>Splash_t_SplashProgressMessage; 4; 99)
	// INPUT FORM([FILES];"dProgress"+String(Num(Substring(◊Progress;1;2))*10))
	FORM SET INPUT:C55([IDENTIFIERS:16]; "dProgress0")
	DISPLAY RECORD:C105([IDENTIFIERS:16])
	//If (◊Progress#"")
	//  PAUSE PROCESS($_l_CurrentProcess)
	//End if
	If (<>PS_l_Progress<10)
		DelayTicks(10)
		
		PAUSE PROCESS:C319(Current process:C322)
		<>PS_l_Progress:=<>PS_l_Progress+1
	End if 
	
End while 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
SD3_l_CalendarStartDayNumber:=0
ERR_MethodTrackerReturn("Progress"; $_t_oldMethodName)