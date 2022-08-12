//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_SetManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/03/2010 13:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(<>SM_OUTPUTDELAY; <>StartProc; WIN_bo_TrackerInited)
	C_LONGINT:C283(<>MenuProc; <>newSetsProcess; $_l_ScreenHeight; $_l_ScreenRight; $_l_WindowReferenceRow; $1; $2; $3; MOD_l_CurrentModuleAccess; r1; r2)
	C_LONGINT:C283(SM_l_CallBack; SM_l_ShowScripts; SM_l_TableNumber; SM_Recordsinselection; vAdd; vRecNo; WIN_l_CurrentWinRef; xSort)
	C_REAL:C285($4)
	C_TEXT:C284(<>KEYS; <>PER_t_CurrentUserInitials; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProdName; vStatus)
	C_TIME:C306(vTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_SetManager")
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
//this method is called as a process
//it will load into a heirarchical list the Set Names used by this user
Case of 
	: (Count parameters:C259<4) & (Count parameters:C259>2)
		SM_l_TableNumber:=$1
		SM_Recordsinselection:=$2
		SM_l_CallBack:=$3
		SM_l_ShowScripts:=0
	Else 
		SM_l_TableNumber:=$1
		SM_Recordsinselection:=$2
		SM_l_CallBack:=$3
		SM_l_ShowScripts:=$4
		
End case 
If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
	<>StartProc:=False:C215
	<>Keys:=""
	Start_Process
	//DEFAULT TABLE([MACROS])
	MOD_l_CurrentModuleAccess:=1
	vAdd:=0
	DB_t_CurrentFormUsage:=""
	xSort:=0
	vTime:=?00:00:00?
	vProdName:=""
	vRecNo:=0
	DB_MenuAction(Get localized string:C991("Menu_Volumes"); Get localized string:C991("MenuItem_DatListsPal"); 4; "18"; <>MenuProc; False:C215)
	vStatus:=""
	Array_LCx(0)
	
	$_l_ScreenHeight:=Screen height:C188
	$_l_ScreenRight:=Screen width:C187  //-2
	r1:=0
	r2:=0
	Macros_File
End if 



If (<>PER_t_CurrentUserInitials#"") & (<>PER_t_CurrentUserInitials#"~SV")
	//universal
	SM_LoadHLList
	//Now we have our list so we can open our window
	Open_AnyTypeWindow(307; 257; -1990; "Set Functions"; "SM_Closewindow")
	SET WINDOW TITLE:C213("Selection Manager")
	
	DIALOG:C40([USER:15]; "WS_SetManager")
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	
	<>SM_OUTPUTDELAY:=False:C215
	<>newSetsProcess:=0
	
End if 
ERR_MethodTrackerReturn("Gen_SetManager"; $_t_oldMethodName)