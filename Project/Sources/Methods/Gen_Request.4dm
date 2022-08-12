//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_Request
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/12/2009 08:20`Method: Gen_Request
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_CurrentWindowModal; GEN_bo_RequestDate; GEN_bo_RequestLongint; GEN_bo_RequestReal; IME_bo_FromWebRequest)
	C_DATE:C307(GEN_d_date)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_FormHeight; $_l_FormWidth; $_l_ScreenCentreHorizontal; $_l_ScreenCentreVertical; $_l_WindowReference; $5; $6; GEN_l_Amount; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_REAL:C285(GEN_R_Amount)
	C_TEXT:C284(<>ButtCanc; <>ButtOK; $_t_oldMethodName; $0; $1; $2; $3; $4; $7; vConfirm; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_Request")
//Gen_Request

IME_WebMessagesInit


<>SYS_bo_CurrentWindowModal:=True:C214
vConfirm:=$1
GEN_bo_RequestReal:=False:C215
GEN_bo_RequestLongint:=False:C215
GEN_bo_RequestDate:=False:C215
GEN_R_Amount:=0
GEN_l_Amount:=0
GEN_d_date:=!00-00-00!

If (Count parameters:C259>1)
	vT:=$2
Else 
	vT:=""
End if 

If (IME_bo_FromWebRequest=False:C215)
	$_l_ScreenCentreVertical:=Screen width:C187/2
	$_l_FormWidth:=318
	$_l_ScreenCentreHorizontal:=Screen height:C188/2
	$_l_FormHeight:=101
	If (Count parameters:C259<5)
		$_l_WindowReference:=Open window:C153($_l_ScreenCentreVertical-(Int:C8($_l_FormWidth/2)); $_l_ScreenCentreHorizontal-(Int:C8($_l_FormHeight/2)); $_l_ScreenCentreVertical-(Int:C8($_l_FormWidth/2))+$_l_FormWidth; $_l_ScreenCentreHorizontal-(Int:C8($_l_FormHeight/2))+$_l_FormHeight; 1984)
	Else 
		//$5=Centre
		//$6=middle
		If (Count parameters:C259<=6)
			$_l_WindowReference:=Open window:C153($5-(Int:C8($_l_FormWidth/2)); $6-(Int:C8($_l_FormHeight/2)); $5-(Int:C8($_l_FormWidth/2))+$_l_FormWidth; $6-(Int:C8($_l_FormHeight/2))+$_l_FormHeight; 1985)
			
		Else 
			//allow for window title
			$_l_WindowReference:=Open window:C153($5-(Int:C8($_l_FormWidth/2)); $6-(Int:C8($_l_FormHeight/2)); $5-(Int:C8($_l_FormWidth/2))+$_l_FormWidth; $6-(Int:C8($_l_FormHeight/2))+$_l_FormHeight; 1987; $7)
		End if 
		
	End if 
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=$_l_WindowReference
	
	If (Count parameters:C259>2)
		<>ButtOK:=$3
		<>ButtCanc:=$4
	Else 
		<>ButtOK:=""
		<>ButtCanc:=""
	End if 
	DIALOG:C40([COMPANIES:2]; "dRequest")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	$0:=Str_StripDel(vT)
	<>SYS_bo_CurrentWindowModal:=False:C215
	
Else 
	IME_WebMessagesAddWarning("Request Warning"; "Warning. From the web, the system couldn't request from the user  the following."+".. '"+$1+".' Assumed the default value of '"+vT+"'.")
	OK:=0
End if 
ERR_MethodTrackerReturn("Gen_Request"; $_t_oldMethodName)