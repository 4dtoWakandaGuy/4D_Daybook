//%attributes = {}
If (False:C215)
	//Project Method Name:      Record_MessWin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>TopModBar)
	C_LONGINT:C283($_l_WindowBottom; $_l_WindowLeft; $_l_WindowTop; $0; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $1; vMTitle4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record_MessWin")

$0:=0
Case of 
	: (($1="") | ($1="R@"))
		$0:=Screen width:C187-2
		$_l_WindowTop:=32
		If (<>TopModBar)
			
			$_l_WindowTop:=$_l_WindowTop+20
			
		End if 
		$_l_WindowBottom:=338
		$_l_WindowLeft:=$0-170
	: ($1="L@")
		$0:=Screen width:C187-2
		$_l_WindowTop:=32
		If (<>TopModBar)
			
			$_l_WindowTop:=$_l_WindowTop+20
			
		End if 
		$_l_WindowBottom:=338
		$_l_WindowLeft:=2
		$0:=172
	: ($1="B@")
		$_l_WindowBottom:=Screen height:C188-2
		$_l_WindowTop:=$_l_WindowBottom-100
		$_l_WindowLeft:=57
		$0:=514
	: ($1="T@")
		$_l_WindowTop:=32
		If (<>TopModBar)
			
			$_l_WindowTop:=$_l_WindowTop+20
			
		End if 
		$_l_WindowBottom:=$_l_WindowTop+100
		$_l_WindowLeft:=57
		$0:=514
End case 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_WindowLeft; $_l_WindowTop; $0; $_l_WindowBottom; Palette window:K34:3)
READ ONLY:C145([SCRIPTS:80])
If (Records in selection:C76([SCRIPTS:80])=0)
	ALL RECORDS:C47([SCRIPTS:80])
	FIRST RECORD:C50([SCRIPTS:80])
End if 
If (($1="B@") | ($1="T@"))
	FORM SET INPUT:C55([SCRIPTS:80]; "dMessageTB")
Else 
	FORM SET INPUT:C55([SCRIPTS:80]; "dMessage")
End if 
vMTitle4:=""
DISPLAY RECORD:C105([SCRIPTS:80])
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("Record_MessWin"; $_t_oldMethodName)