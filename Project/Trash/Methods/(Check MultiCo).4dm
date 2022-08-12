//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Check MultiCo
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
	//C_UNKNOWN(Address_Status)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_AddMode; $_l_CurrentWinRefOLD; $_l_Type; $i; vAdd; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNew)
	C_POINTER:C301($1; $2; $3)
	C_TEXT:C284(<>SYS_t_DefaultTelFormat; $_t_CurrentFormUsage; $_t_oldMethodName; $_t_Search; $4; COM_t_TelephoneNumberFormat; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vCompCode; vCompName)
	C_TEXT:C284(vTel)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check MultiCo")
//Check MultiCo
//$2->:=""  ``````WT-06/26
//Above line commented out NG July 2001
//(Causing diary to not work properly)

$_t_Search:=Sel_AtSign($2->)
If ($_t_Search="")
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	If ($_t_Search#"")
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_Search)
	End if 
	
Else 
	QUERY:C277([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Contact_Code:4=[CONTACTS:1]Contact_Code:2; *)
	QUERY:C277([CONTACTS_COMPANIES:145];  & ; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
	If ($_t_Search#"")
		QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_Search)
	End if 
End if 
If (Records in selection:C76([CONTACTS_COMPANIES:145])>1)
	vCompCode:=""
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(Screen width:C187-368; <>SYS_l_WindowTop+50; Screen width:C187; <>SYS_l_WindowTop+261; 4; "Select the Contact's Company"; "Close_Cancel")
	
	$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
	DB_t_CurrentFormUsage:="MC"
	//  Open_Any_Window (299;390)
	DIALOG:C40([COMPANIES:2]; "dAsk Company")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	WS_KeepFocus
	
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	If (xNew=1)
		$_l_AddMode:=vAdd
		DBI_DisplayRecord(-Current process:C322; Table:C252(->[CONTACTS:1]); ""; [CONTACTS:1]Contact_Code:2)
		
		vAdd:=$_l_AddMode
		//    DEFAULT FILE($3»)
		If (OK=1)
			$2->:=[COMPANIES:2]Company_Code:1
		End if 
	Else 
		$2->:=vCompCode
	End if 
	
	
	
Else 
	If (($2->#[CONTACTS_COMPANIES:145]Company_Code:1) & ([CONTACTS_COMPANIES:145]Company_Code:1#""))
		
		$2->:=[CONTACTS_COMPANIES:145]Company_Code:1
	End if 
End if 
If (Count parameters:C259<4)  //`````WT-06/26
	$_l_Type:=Type:C295($2->)
	If ($_l_Type=Is string var:K8:2) | ($_l_Type=Is text:K8:3)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$2->)
	Else 
		RELATE ONE:C42($2->)
	End if 
	
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
	xNew:=0
Else   //`````WT-06/26
	QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS_COMPANIES:145]Company_Code:1)
	
	//RELATE ONE([CONTACTS_COMPANIES]Company Code)  //`````WT-06/26
	vCompName:=[COMPANIES:2]Company_Name:2  //`````WT-06/26
	vTel:=[COMPANIES:2]Telephone:9  //`````WT-06/26
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
	xNew:=0  //`````WT-06/26
End if   //`````WT-06/26
ERR_MethodTrackerReturn("Check MultiCo"; $_t_oldMethodName)
