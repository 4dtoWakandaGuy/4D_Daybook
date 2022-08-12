//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check Cont
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:38
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305(vFromIn)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_AddMode; $_l_CurrentWinRefOLD; $_l_DockRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowReference; $_l_WindowRight; $_l_WindowTop; vAdd; vCM)
	C_LONGINT:C283(vCP; vCT; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNew)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_CurrentFormUsage; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompCode; vCompName; vContact)
	C_TEXT:C284(vTel)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check Cont")
//Check cont
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
xNew:=0
vContact:=""
If (Records in selection:C76([CONTACTS:1])=0)
	If ((DB_t_CurrentFormUsage="NC") | (DB_GetModuleSettingByNUM(Module_Companies)=3))
		Gen_Alert("There is no Contact with that name"; "Try again")
		GOTO OBJECT:C206($1->)
	Else 
		If ((Table:C252($2)#2) & ($2->#""))
			Gen_Confirm("This Company has no Contacts.  Create one?"; "Try again"; "Create it")
		Else 
			Gen_Confirm("There is no Contact with that name.  Create one?"; "Try again"; "Create it")
		End if 
		If (OK=0)
			xNew:=1
		Else 
			GOTO OBJECT:C206($1->)
		End if 
	End if 
Else 
	Check_DispNum(->[CONTACTS:1]; "Contacts")
	If (OK=1)
		GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRight; $_l_WindowBottom)
		If ($_l_WindowTop>0)
			$_l_WindowReference:=Open window:C153(($_l_WindowLeft+10); $_l_WindowTop+10; $_l_WindowLeft+10; $_l_WindowTop+10; 4; "Select a Contact"; "Close_Cancel")
			
		Else 
			$_l_DockRight:=INT_GetDock("R")
			$_l_WindowReference:=Open window:C153((Screen width:C187-$_l_DockRight)-372; <>SYS_l_WindowTop+50; Screen width:C187-$_l_DockRight; <>SYS_l_WindowTop+266; 4; "Select a Contact"; "Close_Cancel")
		End if 
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=$_l_WindowReference
		DIALOG:C40([CONTACTS:1]; "dAsk Contact2")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		WS_KeepFocus
		
		Array_LCx(0)
		ARRAY TEXT:C222(SVS_at_PreviewEvent; 0)
		WS_KeepFocus
		
	Else 
		REJECT:C38($1->)
	End if 
End if 
If (xNew=1)
	$_l_AddMode:=vAdd
	DB_t_CurrentFormUsage:="Ask"
	If (Table:C252($2)#2)
		vCompCode:=$2->
	End if 
	vCM:=1
	DB_CreateNewRecord(Current process:C322; False:C215; Table:C252(->[CONTACTS:1]); True:C214)
	If (DB_t_CallOnCloseorSave="AS")
		OK:=1
	End if 
	vCM:=0
	vCT:=0
	vCP:=0
	vFromIn:=False:C215
	If (OK=1)
		$1->:=[CONTACTS:1]Contact_Code:2
		vCompName:=[COMPANIES:2]Company_Name:2
		vTel:=[COMPANIES:2]Telephone:9
		If ([COMPANIES:2]Country:8#"")
			If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
				QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
				COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
			End if 
		Else 
			COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
		End if 
		If (COM_t_TelephoneNumberFormat#"")
			OBJECT SET FORMAT:C236(vTel; COM_t_TelephoneNumberFormat)
		End if 
	Else 
		$1->:=""
		vCompName:=""
		vTel:=""
		GOTO OBJECT:C206($1->)
	End if 
	READ ONLY:C145([CONTACTS:1])
	READ ONLY:C145([COMPANIES:2])
	UNLOAD RECORD:C212([CONTACTS:1])
	UNLOAD RECORD:C212([COMPANIES:2])
	RELATE ONE:C42($1->)
Else 
	If (OK=0)
		GOTO OBJECT:C206($1->)
	End if 
	$1->:=vContact
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Check Cont"; $_t_oldMethodName)