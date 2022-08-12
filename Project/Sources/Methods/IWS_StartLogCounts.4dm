//%attributes = {}
If (False:C215)
	//Project Method Name:      IWS_StartLogCounts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>IWS_l_AveBuildTime; <>IWS_l_AveDynamic; <>IWS_l_AveStatic; <>IWS_l_AveTotalTime; <>IWS_l_CountDynamic; <>IWS_l_CountGET; <>IWS_l_CountPOST; <>IWS_l_CountStatic; <>IWS_l_LogStartTime; <>IWS_l_MSPageBuild; <>IWS_l_MSTaken)
	C_LONGINT:C283(<>IWS_l_TotalBuildTime; <>IWS_l_TotalDynamicTime; <>IWS_l_TotalStaticTime)
	C_REAL:C285(<>IWS_l_Bytes; <>IWS_r_Bytes)
	C_TEXT:C284(<>IWS_t_GetOrPost; <>IWS_t_IPAddress; <>IWS_t_Page; $_t_oldMethodName)
	C_TIME:C306(<>IWS_ti_TimeRunning)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IWS_StartLogCounts")
<>IWS_l_TotalDynamicTime:=0
<>IWS_l_TotalStaticTime:=0
<>IWS_l_TotalBuildTime:=0
<>IWS_l_AveBuildTime:=0
<>IWS_l_AveTotalTime:=0
<>IWS_l_LogStartTime:=UTI_DateTimeToNum(Current date:C33; Current time:C178)
<>IWS_ti_TimeRunning:=?00:00:00?
<>IWS_l_CountDynamic:=0
<>IWS_l_CountStatic:=0
<>IWS_l_AveStatic:=0
<>IWS_l_AveDynamic:=0
<>IWS_l_CountPOST:=0
<>IWS_l_CountGET:=0
<>IWS_t_IPAddress:=""
<>IWS_r_Bytes:=0
<>IWS_t_Page:=""
<>IWS_t_GetOrPost:=""
<>IWS_l_MSPageBuild:=0
<>IWS_l_MSTaken:=0
ERR_MethodTrackerReturn("IWS_StartLogCounts"; $_t_oldMethodName)