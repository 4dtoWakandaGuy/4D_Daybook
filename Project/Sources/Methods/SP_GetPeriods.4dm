//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetPeriods
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
	//ARRAY DATE(SP_ad_PeriodFromDate;0)
	//ARRAY DATE(SP_ad_PeriodToDate;0)
	//ARRAY LONGINT(SP_al_PeriodIDs;0)
	//ARRAY TEXT(SP_at_PeriodCodes;0)
	//ARRAY TEXT(SP_at_PVPeriodCode;0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetPeriods")
//by default only load current and future periods!
READ ONLY:C145([PERIODS:33])
QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=0)
If (Records in selection:C76([PERIODS:33])>0)
	READ WRITE:C146([PERIODS:33])
	QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=0)
	DB_lockFile(->[PERIODS:33])
	APPLY TO SELECTION:C70([PERIODS:33]; [PERIODS:33]x_ID:10:=0)
	
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERIODS:33]))
End if 
QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3>=(Current date:C33(*)-30))
SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; SP_at_PeriodCodes; [PERIODS:33]From_Date:3; SP_ad_PeriodFromDate; [PERIODS:33]To_Date:4; SP_ad_PeriodToDate; [PERIODS:33]x_ID:10; SP_al_PeriodIDs)
//because of a problem with area list using meta chars-the array does not work
//in the pop-up on the array list area
ARRAY TEXT:C222(SP_at_PVPeriodCode; 0)
COPY ARRAY:C226(SP_at_PeriodCodes; SP_at_PVPeriodCode)
For ($_l_Index; 1; Size of array:C274(SP_at_PVPeriodCode))
	SP_at_PVPeriodCode{$_l_Index}:=Replace string:C233(SP_at_PVPeriodCode{$_l_Index}; "/"; " ")
	
End for 

SORT ARRAY:C229(SP_ad_PeriodFromDate; SP_ad_PeriodToDate; SP_al_PeriodIDs; SP_at_PeriodCodes; SP_at_PVPeriodCode)
ERR_MethodTrackerReturn("SP_GetPeriods"; $_t_oldMethodName)