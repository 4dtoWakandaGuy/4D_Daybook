//%attributes = {}

If (False:C215)
	//Project Method Name:      Locations_Mod
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
	C_BOOLEAN:C305(<>DB_bo_NewStockActive)
	C_LONGINT:C283($_l_FormDefaultHeight; $_l_FormDefaultWidth; MOD_l_CurrentModuleAccess; <>Mod_l_MaxModules; $_l_FormDefaultHeight; $_l_FormDefaultWidth; MOD_l_CurrentModuleAccess; STK_l_LocationsReadWrite)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform; <>SYS_t_FormSizeName; $_t_oldMethodName; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Locations_Mod")
TRACE:C157
<>DB_bo_NewStockActive:=True:C214

If (Not:C34(<>DB_bo_NewStockActive))
	
	
	
	
	Minor_ModName(->[LOCATIONS:61]; "Locations"; <>SYS_t_FormSizeName; Term_StoWT("Stock Locations"))
	
Else 
	If (Test semaphore:C652("LocationsBeingEdited"))
		Gen_Alert("Sorry someone else is editing locations")
	Else 
		While (Semaphore:C143("LocationsBeingEdited"))
			DelayTicks(20)
		End while 
		
		$_t_oldMethodName:=ERR_MethodTracker("Locations_Mod")
		If (<>Mod_l_MaxModules=0)
			GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
		End if 
		
		Start_Process
		MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_StockControl))
		If (((DB_GetModuleSettingByNUM(1))=5) & (MOD_l_CurrentModuleAccess<2))
			Gen_Alert("You do not have access to the Data Manager Module"; "Cancel")
		Else 
			STK_l_LocationsReadWrite:=0
			If (MOD_l_CurrentModuleAccess#3)
				STK_l_LocationsReadWrite:=1
			End if 
			
			
			
			FORM GET PROPERTIES:C674([USER:15]; "STK_LocationsEditor"; $_l_FormDefaultWidth; $_l_FormDefaultHeight)
			WIN_t_CurrentOutputform:="STK_LocationsEditor"
			Open_Pro_Window("Locations Editor"; 0; 1; ->[USER:15]; "STK_LocationsEditor"; "STK_CloseLocations")
			FS_SetFormSort(WIN_t_CurrentOutputform)
			StartTransaction
			DIALOG:C40([USER:15]; "STK_LocationsEditor")
			
		End if 
		
		Close_ProWin
		Process_End
		
		CLEAR SEMAPHORE:C144("LocationsBeingEdited")
	End if 
	
	
End if 
ERR_MethodTrackerReturn("Locations_Mod"; $_t_oldMethodName)
