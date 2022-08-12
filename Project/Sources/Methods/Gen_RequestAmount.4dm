//%attributes = {}

If (False:C215)
	//Project Method Name:      Gen_RequestAmount
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; GEN_bo_RequestLongint; GEN_bo_RequestReal)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_FormHeight; $_l_FormWidth; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $2; $6; $7; GEN_l_Amount; WIN_l_CurrentWinRef)
	C_REAL:C285($0; $3; GEN_R_Amount)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; $1; $4; $5; $8; vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_RequestAmount")

//NG This is the same Gen_RequestAmoun excpet the request values are numeric
$_t_oldMethodName:=ERR_MethodTracker("Gen_RequestAmount")
//Gen_RequestAmoun
If (Count parameters:C259>=2)
	<>SYS_bo_CurrentWindowModal:=True:C214
	vConfirm:=$1
	vT:=""
	GEN_R_Amount:=0
	GEN_l_Amount:=0
	
	
	//Note the amount is
	//TRACE
	Case of 
		: ($2=Is longint:K8:6)
			GEN_bo_RequestLongint:=True:C214
			If (Count parameters:C259>=3)
				//Entry value is to be longint
				GEN_l_Amount:=$3
			Else 
				GEN_l_Amount:=0
			End if 
		: ($2=Is real:K8:4)
			GEN_bo_RequestReal:=True:C214
			If (Count parameters:C259>=3)
				GEN_R_Amount:=$3
			Else 
				GEN_R_Amount:=0
				
			End if 
	End case 
	
	$_l_ScreenCentreVertical:=Screen width:C187/2
	$_l_FormWidth:=318
	$_l_ScreenCentreHorizontal:=Screen height:C188/2
	$_l_FormHeight:=101
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	If (Count parameters:C259<=5)
		WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FormWidth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FormHeight/2)); ($_l_ScreenCentreVertical+Int:C8($_l_FormWidth/2)); $_l_ScreenCentreHorizontal+(Int:C8($_l_FormHeight/2)); -1987)
	Else 
		//$5=Centre
		//$6=middle
		If (Count parameters:C259<=6)
			WIN_l_CurrentWinRef:=Open window:C153($6-(Int:C8($_l_FormWidth/2)); $7-(Int:C8($_l_FormHeight/2)); $6+(Int:C8($_l_FormWidth/2)); $7+(Int:C8($_l_FormHeight/2)); -1985)
		Else 
			//allow for window title
			WIN_l_CurrentWinRef:=Open window:C153($6-(Int:C8($_l_FormWidth/2)); $7-(Int:C8($_l_FormHeight/2)); $6+(Int:C8($_l_FormWidth/2)); $7+(Int:C8($_l_FormHeight/2)); -1987; $8)
		End if 
		
	End if 
	
	If (Count parameters:C259>4)
		<>ButtOK:=$4
		<>ButtCanc:=$5
	Else 
		<>ButtOK:=""
		<>ButtCanc:=""
	End if 
	DIALOG:C40([COMPANIES:2]; "dRequest")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	Case of 
		: ($2=Is longint:K8:6)
			$0:=GEN_l_Amount
			GEN_l_Amount:=0
		: ($2=Is real:K8:4)
			$0:=GEN_R_Amount
			GEN_R_Amount:=0
	End case 
	<>SYS_bo_CurrentWindowModal:=False:C215
End if 
ERR_MethodTrackerReturn("Gen_RequestAmount"; $_t_oldMethodName)