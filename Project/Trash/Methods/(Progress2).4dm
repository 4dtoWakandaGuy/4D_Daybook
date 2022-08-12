//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Progress2
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
	C_LONGINT:C283(<>PS_l_Progress; $_l_CUrrentProcess; $_l_Last; $_l_Progress; $_l_ScreenCenter; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284(<>Progress2; $_t_oldMethodName; $1; vTitle20)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Progress2")
//Progress2 - one that Delays instead of pausing

$_l_CUrrentProcess:=Current process:C322
DB_SetMenuBar(""; 86)
READ ONLY:C145([IDENTIFIERS:16])
ALL RECORDS:C47([IDENTIFIERS:16])
ONE RECORD SELECT:C189([IDENTIFIERS:16])
$_l_ScreenCenter:=Screen width:C187/2
$_l_Last:=-1
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCenter-111; 110; $_l_ScreenCenter+110; 166; 1984)
While (<>Progress2#"")
	IDLE:C311  // 7/04/03 pb
	vTitle20:=Substring:C12(<>Progress2; 4; 99)
	If (Length:C16(vTitle20)>30)
		$_l_Progress:=Position:C15(":"; vTitle20)
		If ($_l_Progress>0)
			vTitle20:=Substring:C12(vTitle20; 1; $_l_Progress-1)
		End if 
	End if 
	$_l_Progress:=Num:C11(Substring:C12(<>Progress2; 1; 2))
	If ($_l_Progress#$_l_Last)
		<>PS_l_Progress:=$_l_Progress
		//INPUT FORM([FILES];"dProgress0")
		//DISPLAY RECORD([FILES])
		$_l_Last:=$_l_Progress
	End if 
	If (<>Progress2#"")
		DelayTicks(60)  //one second
	End if 
	
End while 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("Progress2"; $_t_oldMethodName)