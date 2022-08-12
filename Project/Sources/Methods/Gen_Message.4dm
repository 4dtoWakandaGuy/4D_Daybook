//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Message
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OpenWIndow; $2)
	C_LONGINT:C283($_l_Length; $_l_Max; $_l_ScreenCentreVertical; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_windowTop; $_l_WIndowType; $3)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Message")
// Gen_Message
// Creates a message dialogue to display while waiting for something
// Don't forget to CLOSE WINDOW afterwards
// 10/06/02 pb
// example call: Gen_Message(messagetext)

If ($1#"")
	$_l_ScreenCentreVertical:=Screen width:C187/2
	//Open form window({Table;}formName{;Type{;hPos{;vPos{;*}}}})WinRef
	//NG 16/7 the following line was corrupted, so i am making some assumptions
	If (Count parameters:C259>=2)
		$_bo_OpenWIndow:=$2
		
	Else 
		$_bo_OpenWIndow:=True:C214
	End if 
	If (Count parameters:C259>=3)
		$_l_WIndowType:=$3
	Else 
		$_l_WIndowType:=Movable form dialog box:K39:8
	End if 
	If ($_bo_OpenWIndow)
		$_l_WindowReference:=Open form window:C675([COMPANIES:2]; "dMessage"; $_l_WIndowType)
		
	Else 
		GOTO XY:C161(0; 0)
	End if 
	$_l_Max:=Screen width:C187
	
	$_l_Length:=Length:C16($1)
	GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
	$_l_Max:=$_l_Max-$_l_WindowLeft
	If (($_l_Length*7)>$_l_Max)
		$_l_Length:=$_l_Max
	End if 
	If (($_l_WindowRight-$_l_WindowLeft)<(($_l_Length*7)))
		
		SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowLeft+($_l_Length*7); $_l_WindowBottom)
	End if 
	SET WINDOW TITLE:C213("Progress")
	MESSAGE:C88($1+(" "*32))
	
End if 
ERR_MethodTrackerReturn("Gen_Message"; $_t_oldMethodName)