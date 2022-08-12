//%attributes = {}
If (False:C215)
	//Project Method Name:      Change_AccessP2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/01/2012 14:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_ModuleSettingsinited; <>Modal; <>PER_bo_CurrentNoButtGrey; <>PER_bo_LbDefinitiionsInited; <>PER_bo_LbDefinitionsInited; <>SYS_bo_CurrentWindowModal; <>SYS_bo_StopMacros; $_bo_CurrentNoButtGrey; $_bo_LbDefinitionsInited)
	C_LONGINT:C283(<>Bar; <>SCPT_l_ExecutionProcess; <>SCPT_l_PlayerActive; $_l_BarProcess; $_l_CurrentPersonFuntions; $_l_Process; $_l_Retries; DB_l_currentuserID; DB_l_UserIdentWindow; SD3_l_CalendarStartDayNumber; vCalAct)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Change_AccessP2")
<>Modal:=True:C214

If (Get_ProcessNumber("Modules_Palette")>0)
	
	ZMenu_ModBar2
	$_l_Retries:=0
	$_l_BarProcess:=Get_ProcessNumber("Modules_Palette")
	While ($_l_BarProcess>0)
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))  // 03/04/03 pb
	End while 
End if 
If (Records in table:C83([MODULES:63])>0)
	Path_Check
End if 
<>Bar:=0

vCalAct:=0
SD3_l_CalendarStartDayNumber:=0
$_bo_LbDefinitionsInited:=<>PER_bo_LbDefinitionsInited  //remains the same because would upset open processes
//$_l_CurrentPersonFuntions:=<>PER_l_CurrentPersFunctions  //remains the same cos the Palettes etc won't go away
//$_bo_CurrentNoButtGrey:=<>PER_bo_CurrentNoButtGrey  //so does this
<>SYS_bo_StopMacros:=True:C214
<>SCPT_l_PlayerActive:=0
<>DB_bo_ModuleSettingsinited:=False:C215
DB_l_currentuserID:=0
If (Is compiled mode:C492)
	DB_l_UserIdentWindow:=New process:C317("DB_selectUserLogin"; 256000; "User Ident"; Current process:C322)
Else 
	CHANGE CURRENT USER:C289
	DB_l_UserIdentWindow:=New process:C317("DB_selectUserLogin"; 256000; "User Ident"; Current process:C322)
End if 
Repeat 
	If (DB_l_UserIdentWindow>0)
		DelayTicks(60)
	End if 
Until (DB_l_UserIdentWindow=0)
If (DB_l_currentuserID>0)
	<>PER_bo_LbDefinitionsInited:=$_bo_LbDefinitionsInited
	//<>PER_l_CurrentPersFunctions:=$_l_CurrentPersonFuntions<april22
	//<>PER_bo_CurrentNoButtGrey:=$_bo_CurrentNoButtGrey
	DB_t_CurrentFormUsage:=""
	Levels
	//If (<>PER_l_CurrentPersFunctions>1)//<april22
	//ZMenu_ModBar2 was already commented out
	//End if /<april22<april22
	Start_Event
	<>SYS_bo_StopMacros:=False:C215
	<>Modal:=False:C215
End if 
ERR_MethodTrackerReturn("Change_AccessP2"; $_t_oldMethodName)
