//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_RedrawMinis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/01/2010 19:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_ProcessState; $_l_ProcessTime)
	C_PICTURE:C286(Cal_pic_MiniMonth2; CAL_pic_MiniMonth3)
	C_POINTER:C301(Cal_ptr_MiniCalender1)
	C_TEXT:C284(<>CAL_t_FullAndMinisProcName; $_t_MethodName; $_t_oldMethodName; $_t_processName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_RedrawMinis")


PROCESS PROPERTIES:C336(Current process:C322; $_t_processName; $_l_ProcessState; $_l_ProcessTime)

//========================    Method Actions    ==================================

If (<>CAL_t_FullAndMinisProcName=$_t_processName)
	Cal4D_Cal_GetMiniCalendar(Cal_ptr_MiniCalender1; Cal_D_TopMiniDate; 0)  //->Mini_Month_1_G
	Cal4D_Cal_GetMiniCalendar(->Cal_pic_MiniMonth2; Cal_D_TopMiniDate; 1)
	Cal4D_Cal_GetMiniCalendar(->CAL_pic_MiniMonth3; Cal_D_TopMiniDate; 2)
End if 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_Cal_RedrawMinis"; $_t_oldMethodName)