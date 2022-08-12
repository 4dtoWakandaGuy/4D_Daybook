//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_RequestDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/02/2010 16:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; GEN_bo_RequestDate)
	C_DATE:C307($0; $3; GEN_d_date)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_FormHeight; $_l_FormWidth; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $2; $6; $7; GEN_l_Amount; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(GEN_R_Amount)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; $1; $4; $5; $8; vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_RequestDate")
//Gen_RequestAmoun
If (Count parameters:C259>=2)
	<>SYS_bo_CurrentWindowModal:=True:C214
	vConfirm:=$1
	vT:=""
	GEN_R_Amount:=0
	GEN_l_Amount:=0
	//Note the amount is
	
	Case of 
		: ($2=Is date:K8:7)
			If (Count parameters:C259>=3)
				//Entry value is to be date
				GEN_d_date:=$3
			Else 
				GEN_d_date:=!00-00-00!
			End if 
			
	End case 
	
	$_l_ScreenCentreVertical:=Screen width:C187/2
	$_l_FormWidth:=318
	$_l_ScreenCentreHorizontal:=Screen height:C188/2
	$_l_FormHeight:=101
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	
	If (Count parameters:C259<5)
		WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FormWidth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FormHeight/2)); ($_l_ScreenCentreVertical+Int:C8($_l_FormWidth/2)); $_l_ScreenCentreHorizontal+(Int:C8($_l_FormHeight/2)); -1987)
	Else 
		//$5=Centre
		//$6=middle
		If (Count parameters:C259<=8)
			If (Count parameters:C259>=7)
				WIN_l_CurrentWinRef:=Open window:C153($6-(Int:C8($_l_FormWidth/2)); $7-(Int:C8($_l_FormHeight/2)); $6+(Int:C8($_l_FormWidth/2)); $7+(Int:C8($_l_FormHeight/2)); -1985)
			Else 
				WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FormWidth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FormHeight/2)); ($_l_ScreenCentreVertical+Int:C8($_l_FormWidth/2)); $_l_ScreenCentreHorizontal+(Int:C8($_l_FormHeight/2)); -1987)
			End if 
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
	$0:=!00-00-00!
	GEN_bo_RequestDate:=True:C214
	DIALOG:C40([COMPANIES:2]; "dRequest")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (OK=1)
		$0:=GEN_d_date
	End if 
	OK:=1
	
	<>SYS_bo_CurrentWindowModal:=False:C215
End if 
ERR_MethodTrackerReturn("Gen_RequestDate"; $_t_oldMethodName)