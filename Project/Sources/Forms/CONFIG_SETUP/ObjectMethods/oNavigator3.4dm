If (False:C215)
	//object Method Name: Object Name:      CONFIG_SETUP.oNavigator3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/03/2012 09:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(USER_al_MenuTabTable;0)
	//ARRAY TEXT(USER_at_MenuTab;0)
	C_BOOLEAN:C305($_bo_ShowCurrentSelection; DB_bo_ShowCurrentSelection)
	C_LONGINT:C283($_l_BoxBottom; $_l_BoxLeft; $_l_BoxRight; $_l_BoxTop; $_l_Event; $_l_SetsObjectBottom; $_l_SetsObjectLeft; $_l_SetsObjectRight; $_l_SetsObjectTop; $_l_WindowBottom; $_l_WindowHeight)
	C_LONGINT:C283($_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; $DB_l_Navigatetoselected; DB_l_CurrentDisplayedForm; DB_l_Navigatetoselected)
	C_TEXT:C284($_t_oldMethodName; USR_t_DefaultaddressFormat; USR_t_DefaultBillingRoles; USR_t_DefaultContactRole; USR_t_DefaultContactStatus; USR_t_DefaultSalesPerson; USR_t_DefaultStatus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oNavigator3"; Form event code:C388)
$_l_Event:=Form event code:C388


Case of 
	: ($_l_Event=On Clicked:K2:4)
		//DB_t_ClickedObjectName:="DB_at_TabNavigation"
		Case of 
			: (USER_at_MenuTab{USER_at_MenuTab}="CRM Data Preferences")
				If ([USER:15]Address Format:127#"")
					If ([ADDRESS_FORMATS:74]Format_Code:1#[USER:15]Address Format:127)
						QUERY:C277([ADDRESS_FORMATS:74]; [ADDRESS_FORMATS:74]Format_Code:1=[USER:15]Address Format:127)
					End if 
					USR_t_DefaultaddressFormat:=[ADDRESS_FORMATS:74]Address_Text:9
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "1"; "Address line 1")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "2"; "Address line 2")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "3"; "Town/City")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "5"; "Zip/Postal")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "4"; "State/Region/County")
					USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "6"; "Country")
					If ([USER:15]Capitalise Town:77)
						USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "Town/City"; "TOWN/CITY")
					Else 
						USR_t_DefaultaddressFormat:=Replace string:C233(USR_t_DefaultaddressFormat; "TOWN/CITY"; "Town/City")
					End if 
					
				End if 
				If ([USER:15]Def Cont Status:191#"")
					If ([STATUS:4]Status_Code:1#[USER:15]Def Cont Status:191)
						QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=[USER:15]Def Cont Status:191)
					End if 
					If ([STATUS:4]Status_Name:2#"")
						
						USR_t_DefaultContactStatus:=[STATUS:4]Status_Name:2
					Else 
						USR_t_DefaultContactStatus:="Unknown Status"
					End if 
				End if 
				If ([USER:15]Default User:76#"")
					If ([PERSONNEL:11]Initials:1#[USER:15]Default User:76)
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[USER:15]Default User:76)
					End if 
					If ([PERSONNEL:11]Name:2#"")
						USR_t_DefaultSalesPerson:=[PERSONNEL:11]Name:2
					Else 
						USR_t_DefaultSalesPerson:="Unknown Person"
					End if 
				End if 
				If ([USER:15]Default Status:40#"")
					If ([STATUS:4]Status_Code:1#[USER:15]Default Status:40)
						QUERY:C277([STATUS:4]; [STATUS:4]Status_Code:1=[USER:15]Default Status:40)
					End if 
					If ([STATUS:4]Status_Name:2#"")
						USR_t_DefaultStatus:=[STATUS:4]Status_Name:2
					Else 
						USR_t_DefaultStatus:="Unknown status name"
					End if 
				End if 
				If ([USER:15]Default Role:41#"")
					If ([ROLES:87]Role_Code:1#[USER:15]Default Role:41)
						QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=[USER:15]Default Role:41)
					End if 
					If ([ROLES:87]Role_Name:2#"")
						USR_t_DefaultContactRole:=[ROLES:87]Role_Name:2
					Else 
						USR_t_DefaultContactRole:="Unknown role name"
					End if 
				End if 
				If ([USER:15]Def_AccountJobRole:248#"")
					If ([ROLES:87]Role_Code:1#[USER:15]Def_AccountJobRole:248)
						QUERY:C277([ROLES:87]; [ROLES:87]Role_Code:1=[USER:15]Def_AccountJobRole:248)
					End if 
					If ([ROLES:87]Role_Name:2#"")
						USR_t_DefaultBillingRoles:=[ROLES:87]Role_Name:2
					Else 
						USR_t_DefaultBillingRoles:="Unknown role name"
					End if 
				End if 
				
				OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; False:C215)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
				OBJECT SET VISIBLE:C603(*; "OCRM@"; True:C214)
				FORM GOTO PAGE:C247(2)
				
				
			: (USER_al_MenuTabTable{USER_at_MenuTab}>0)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputForm"; True:C214)
				OBJECT SET VISIBLE:C603(*; "oListboxOutputArrays"; False:C215)
				OBJECT SET VISIBLE:C603(*; "OCRM@"; False:C215)
				FORM GOTO PAGE:C247(2)
				
				DB_l_CurrentDisplayedForm:=USER_al_MenuTabTable{USER_at_MenuTab}
				//TRACE
				
				OBJECT GET COORDINATES:C663(*; "oConfigItems"; $_l_SetsObjectLeft; $_l_SetsObjectTop; $_l_SetsObjectRight; $_l_SetsObjectBottom)
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft
				$_l_WindowHeight:=$_l_WindowBottom-$_l_windowTop
				$_l_BoxRight:=($_l_WindowWidth-10)
				$_l_BoxTop:=49
				$_l_BoxLeft:=$_l_SetsObjectRight+10
				$_l_BoxBottom:=$_l_WindowBottom-45
				OBJECT MOVE:C664(*; "oListboxOutputForm"; $_l_BoxLeft; $_l_BoxTop; $_l_BoxRight; $_l_BoxBottom; *)
				
				
				
				$DB_l_Navigatetoselected:=DB_l_Navigatetoselected
				$_bo_ShowCurrentSelection:=DB_bo_ShowCurrentSelection
				DB_bo_ShowCurrentSelection:=False:C215
				DB_SetFormLayout(DB_l_CurrentDisplayedForm; "USER")
				DB_bo_ShowCurrentSelection:=$_bo_ShowCurrentSelection
				DB_l_Navigatetoselected:=$DB_l_Navigatetoselected
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oNavigator3"; $_t_oldMethodName)
