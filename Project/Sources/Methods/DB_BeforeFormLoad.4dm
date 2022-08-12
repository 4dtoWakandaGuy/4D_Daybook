//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_BeforeFormLoad
	//------------------ Method Notes ------------------
	//When loading an an output form view-which is really an input form now we may have a browser already open in the same window/process. If for instance we open a list of orders double click to edit an order(with the edit in window opetion set)
	//then go to look at stock during a stock allocation or products then a new browser window will open in the same process
	//we dont want to lose all the existing arrays.
	//we are going to copy the neccessary values so we can restore them on closing this window(you can only be in the front window in this context
	
	//------------------ Revision Control ----------------
	//Date Created: 16/04/2010 11:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(DB_al_ContextTableNumbe1;0)
	//ARRAY LONGINT(DB_al_ContextTableNumber;0)
	//ARRAY LONGINT(DB_al_ContextTableNumber1;0)
	//ARRAY LONGINT(DB_al_TabNavigation;0)
	//ARRAY LONGINT(DB_al_TabNavigation1;0)
	//ARRAY POINTER(DB_aptr_ContextPointers1;0)
	//ARRAY POINTER(DB_apo_ContextPointers;0)
	//ARRAY POINTER(DB_aptr_ContextPointers;0)
	//ARRAY TEXT(DB_at_ContextAccess;0)
	//ARRAY TEXT(DB_at_ContextAccess1;0)
	//ARRAY TEXT(DB_at_ContextNames1;0)
	//ARRAY TEXT(DB_at_ContextUsage;0)
	//ARRAY TEXT(DB_at_ContextUsage1;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	//ARRAY TEXT(DB_at_TabNavigation1;0)
	C_BOOLEAN:C305($_bo_NoCacheReset; $0; DB_bo_AlreadyinAbrowser; DB_bo_Display; DB_bo_Display1; DB_bo_DisplayFilters; DB_bo_DisplayFilters1)
	C_LONGINT:C283(DB_l_BrowserStackLevel; DB_l_CurrentDisplayedForm; DB_l_CurrentDisplayedForm1; DB_l_UserFormAccess; DB_l_UserFormAccess1)
	C_TEXT:C284($_t_oldMethodName; DB_ReturnMenu; DB_t_CurrentContext; DB_t_CurrentContext1; DB_t_FormUsage; DB_t_FormUsage1; SD2_T_SearchValue; SD2_T_SearchValue1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_BeforeFormLoad")

$_bo_NoCacheReset:=False:C215
If (DB_bo_AlreadyinAbrowser)
	DB_l_BrowserStackLevel:=DB_l_BrowserStackLevel+1
	Case of 
		: (DB_l_BrowserStackLevel=1)
			ARRAY POINTER:C280(DB_aptr_ContextPointers1; 0)
			ARRAY TEXT:C222(DB_at_ContextNames1; 0)
			ARRAY LONGINT:C221(DB_al_ContextTableNumbe1; 0)
			DB_l_CurrentDisplayedForm1:=DB_l_CurrentDisplayedForm
			DB_t_CurrentContext1:=DB_t_CurrentContext
			DB_t_FormUsage1:=DB_t_FormUsage
			DB_l_UserFormAccess1:=DB_l_UserFormAccess
			SD2_T_SearchValue1:=SD2_T_SearchValue
			DB_bo_Display1:=DB_bo_Display
			DB_l_CurrentDisplayedForm1:=DB_l_CurrentDisplayedForm
			DB_bo_DisplayFilters1:=DB_bo_DisplayFilters
			
			ARRAY TEXT:C222(DB_at_TabNavigation1; 0)
			ARRAY LONGINT:C221(DB_al_TabNavigation1; 0)
			COPY ARRAY:C226(DB_at_TabNavigation; DB_at_TabNavigation1)
			COPY ARRAY:C226(DB_al_TabNavigation; DB_al_TabNavigation1)
			ARRAY TEXT:C222(DB_at_ContextUsage1; 0)
			ARRAY TEXT:C222(DB_at_ContextAccess1; 0)
			COPY ARRAY:C226(DB_at_ContextUsage; DB_at_ContextUsage1)
			COPY ARRAY:C226(DB_at_ContextAccess; DB_at_ContextAccess1)
			
			COPY ARRAY:C226(DB_aptr_ContextPointers; DB_aptr_ContextPointers1)
			COPY ARRAY:C226(DB_al_ContextTableNumber; DB_al_ContextTableNumber1)
			DB_ReturnMenu:=Get menu bar reference:C979(Current process:C322)
			
			//what we do not want to reset though is the pointers array and cache
			$_bo_NoCacheReset:=True:C214
		: (DB_l_BrowserStackLevel=2)
		: (DB_l_BrowserStackLevel=3)
		: (DB_l_BrowserStackLevel=4)
		: (DB_l_BrowserStackLevel=5)
		: (DB_l_BrowserStackLevel=6)
		: (DB_l_BrowserStackLevel=7)
		: (DB_l_BrowserStackLevel=8)
		: (DB_l_BrowserStackLevel=9)
		: (DB_l_BrowserStackLevel=10)
	End case 
	
Else 
	DB_bo_AlreadyinAbrowser:=True:C214  // init this value here
End if 
$0:=$_bo_NoCacheReset
ERR_MethodTrackerReturn("DB_BeforeFormLoad"; $_t_oldMethodName)