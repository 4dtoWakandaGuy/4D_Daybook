If (False:C215)
	//object Name: [USER]SD2_ScheduleWindow.oCal_pic_MainWeek
	//------------------ Method Notes ------------------
	////
	////  Object Method: SVG_Test_d.SVG_Month_G
	////
	////  Written by Charles Vass - 02/27/2009, 12:24
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//------------------ Revision Control ----------------
	//Date Created: 25/01/2013 17:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ScheduleWindow.oCal_pic_MainWeek"; Form event code:C388)

Cal4D_OM_CalWithMinis_Month(Self:C308; Form event code:C388)

ERR_MethodTrackerReturn("OBJ [USER].SD2_ScheduleWindow.oCal_pic_MainWeek"; $_t_oldMethodName)
