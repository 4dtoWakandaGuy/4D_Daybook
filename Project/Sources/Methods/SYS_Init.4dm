//%attributes = {}
If (False:C215)
	//Project Method Name:      SYS_Init
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>IWS_bo_UseWatchDog; <>SYS_bo_AbsoluteLocations; <>SYS_bo_ConnectToOracle; <>SYS_bo_Development; <>SYS_bo_FullAccess; <>SYS_bo_LogicServer; <>SYS_bo_MACOptimize; <>SYS_bo_MACOptimizeBase; <>SYS_bo_MACOptimized; <>SYS_bo_MACOptimizeError; <>SYS_bo_MACOptimizeFuncAttr)
	C_BOOLEAN:C305(<>SYS_bo_MACOptimizeGlobConst; <>SYS_bo_MACOptimizeJS2; <>SYS_bo_MACOptimizeLFs; <>SYS_bo_NewVRSPostDataMethod; <>SYS_bo_Quit; <>SYS_bo_SSLAvailable; <>SYS_bo_StartWebServer; <>SYS_bo_UseMonitor)
	C_DATE:C307($dDate)
	C_LONGINT:C283(<>IWS_ControlPanelTestClientsProc; <>IWS_StartTestClientsProc; $iITKVersion; $iResult; $iVersion1; $iVersion2)
	C_REAL:C285(<>SYS_i_CaseSensitive; <>SYS_i_Sequence; <>SYS_i_StartupMS)
	C_TEXT:C284(<>SYS_s_CurrentUser; <>SYS_s_MachineName; <>SYS_s_OSDateFormat; <>SYS_s_SensitiveDataPassword; <>SYS_s_VersionNo; <>SYS_s_WebServer; <>SYS_t_DefaultDirectory; $_t_oldMethodName; $sDate; $sDay)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SYS_Init")
//SYS_Init


<>SYS_i_StartupMS:=0  //Milliseconds

<>SYS_s_VersionNo:="6.0"  //Axel 6/22/2001

<>SYS_bo_Development:=True:C214
<>SYS_bo_NewVRSPostDataMethod:=(Current user:C182="Ron")
<>SYS_s_WebServer:=""
//<>SYS_s_MachineName:=Current machine
//◊SYS_s_MachineIP moved to SYS_Register` Axel 1/12/2001
<>SYS_i_Sequence:=0
<>SYS_bo_Quit:=False:C215
<>SYS_t_DefaultDirectory:=SYS_ParseFilePath("Directory"; StructureFilePath)


<>SYS_bo_UseMonitor:=True:C214  //set to true for deployment

<>SYS_bo_MACOptimize:=Is compiled mode:C492

//used in StartupOptions
<>SYS_bo_ConnectToOracle:=False:C215
<>SYS_bo_LogicServer:=False:C215
<>SYS_bo_UseMonitor:=False:C215
<>SYS_bo_StartWebServer:=True:C214

<>SYS_bo_MACOptimize:=False:C215
<>SYS_bo_MACOptimized:=False:C215  //Rollo 10/16/99
<>SYS_bo_MACOptimizeFuncAttr:=False:C215  //Rollo 10/16/99
<>SYS_bo_MACOptimizeError:=False:C215  //Rollo 10/28/99
<>SYS_bo_MACOptimizeGlobConst:=False:C215  //Rollo 10/30/99
<>SYS_bo_MACOptimizeBase:=True:C214  //Axel 1/18/2001
<>SYS_bo_MACOptimizeJS2:=True:C214  //Rollo 7/8/2000
<>SYS_bo_MACOptimizeLFs:=False:C215

<>SYS_s_CurrentUser:=Current user:C182
<>SYS_bo_FullAccess:=True:C214  //SYS_SetAccessLevel

<>IWS_bo_UseWatchDog:=True:C214  //JDM, 6/5/2001

//Rollo 12/16/99
<>SYS_bo_AbsoluteLocations:=False:C215
<>SYS_bo_SSLAvailable:=False:C215

<>SYS_s_SensitiveDataPassword:="sillybilly"  // Axel 07/13/2000

//Rollo 6/22/2000 - test the date format of this machine
$dDate:=Current date:C33-Day of:C23(Current date:C33)
$sDate:=String:C10($dDate)
$sDay:=String:C10(Day of:C23($dDate))+"/@"  //returns last day number of previous month
If ($sDate=$sDay)
	<>SYS_s_OSDateFormat:="DD/MM/YYYY"
Else 
	<>SYS_s_OSDateFormat:="MM/DD/YYYY"
End if 

<>SYS_i_CaseSensitive:=1
<>IWS_StartTestClientsProc:=0  // Axel 10/12/2000
<>IWS_ControlPanelTestClientsProc:=0  // Axel 10/12/2000
ERR_MethodTrackerReturn("SYS_Init"; $_t_oldMethodName)