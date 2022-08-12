If (False:C215)
	//Project Form Method Name: DB_USERMODE
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2014 19:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(DB_al_ContextAccess;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(DB_at_ContextNames;0)
	//ARRAY TEXT(DB_at_ContextUsage;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_BOOLEAN:C305(DB_bo_DisplayStats; DB_bo_FiltersAvailable; DB_bo_NoCacheReset; DB_bo_ShowArrayBased; DB_bo_ShowCurrentSelection)
	C_LONGINT:C283($_l_event; $_l_ScreenNumber; $_l_SwitchToTable; $_l_Windowbottom; $_l_Windowleft; $_l_Windowright; $_l_WindowTop; DB_l_CurrentDisplayedForm; DB_l_Navigatetoselected; DB_l_SwitchToTable; DB_l_TablesPallette)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentContext; DB_t_FormUsage)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/DB_USERMODE/{formMethod}"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Load:K2:1)
		
		DB_t_FormUsage:=""
		DB_l_Navigatetoselected:=0
		DB_bo_ShowCurrentSelection:=False:C215
		DB_l_CurrentDisplayedForm:=Table:C252(->[CONTACTS:1])
		DB_t_CurrentContext:="USERMODE"
		DB_bo_DisplayStats:=False:C215
		DB_bo_FiltersAvailable:=False:C215
		DB_bo_ShowArrayBased:=False:C215
		ARRAY TEXT:C222(DB_at_TabNavigation; 0)
		
		ARRAY POINTER:C280(DB_aptr_ContextPointers; 0)
		ARRAY TEXT:C222(DB_at_ContextNames; 0)
		ARRAY LONGINT:C221(DB_al_ContextTableNumber; 0)
		ARRAY TEXT:C222(DB_at_ContextUsage; 0)
		ARRAY LONGINT:C221(DB_al_ContextAccess; 0)
		
		DB_bo_NoCacheReset:=DB_BeforeFormLoad
		
		DB_SetFormLayout(DB_l_CurrentDisplayedForm; DB_t_CurrentContext)
		$_l_ScreenNumber:=Menu bar screen:C441
		SCREEN COORDINATES:C438($_l_Windowleft; $_l_WindowTop; $_l_Windowright; $_l_Windowbottom; $_l_ScreenNumber)
		SET WINDOW RECT:C444($_l_Windowleft+5; $_l_WindowTop+40; $_l_Windowright-20; $_l_Windowbottom-40)
		DB_l_TablesPallette:=New process:C317("DB_TablesPalette"; 180000; "Tables"; Current process:C322)
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (DB_l_SwitchToTable>0)
				$_l_SwitchToTable:=DB_l_SwitchToTable
				DB_l_SwitchToTable:=0
				If ($_l_SwitchToTable#DB_l_CurrentDisplayedForm)
					DB_SetFormLayout($_l_SwitchToTable; DB_t_CurrentContext)
				End if 
		End case 
		
		
End case 
ERR_MethodTrackerReturn("FM DB_USERMODE"; $_t_oldMethodName)
