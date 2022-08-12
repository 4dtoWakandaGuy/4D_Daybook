//%attributes = {}
If (False:C215)
	//Project Method Name:      DiaryGetDayView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(vViewPublic)
	C_DATE:C307($2)
	C_LONGINT:C283(VPUBLICCHECK)
	C_TEXT:C284($_t_oldMethodName; $1)
	C_TIME:C306(SD_ti_CurrentviewEndTime; SD_ti_CurrentviewStartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DiaryGetDayView")

Case of 
	: (vPublicCheck=0)
		vViewPublic:=False:C215
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1; *)
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$2)
		ORDER BY:C49([DIARY:12]; [DIARY:12]Time_Do_From:6; >)
	: (vPublicCheck=1)
		vViewPublic:=True:C214
		QUERY:C277([DIARY:12];  & ; [DIARY:12]Public:44=True:C214)
		CREATE SET:C116([DIARY:12]; "PublicSet")
		QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$1)
		CREATE SET:C116([DIARY:12]; "OperatorSet")
		UNION:C120("PublicSet"; "OperatorSet"; "FinalSet")
		USE SET:C118("FinalSet")
		QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4=$2)
		ORDER BY:C49([DIARY:12]; [DIARY:12]Time_Do_From:6; >)
		CLEAR SET:C117("PublicSet")
		CLEAR SET:C117("OperatorSet")
		CLEAR SET:C117("FinalSet")
End case 
FIRST RECORD:C50([DIARY:12])
If ([DIARY:12]Time_Do_From:6<SD_ti_CurrentviewStartTime)
	SD_ti_CurrentviewStartTime:=[DIARY:12]Time_Do_From:6
End if 
LAST RECORD:C200([DIARY:12])
If ([DIARY:12]Time_Do_From:6>SD_ti_CurrentviewEndTime)
	SD_ti_CurrentviewEndTime:=[DIARY:12]Time_Do_From:6
End if 

CREATE SET:C116([DIARY:12]; "DiarySet")
ERR_MethodTrackerReturn("DiaryGetDayView"; $_t_oldMethodName)