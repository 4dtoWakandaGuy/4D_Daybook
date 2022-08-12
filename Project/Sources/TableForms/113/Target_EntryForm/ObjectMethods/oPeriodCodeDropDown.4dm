If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
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
	C_LONGINT:C283(vSD_SelCalendar2)
	C_TEXT:C284($_t_oldMethodName; SP_t_PeriodCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Variable5"; Form event code:C388)
If (SP_at_PeriodCodes>0)
	SP_t_PeriodCode:=SP_at_PeriodCodes{SP_at_PeriodCodes}
	[SALES_PROJECTION:113]ProjectionPeriodID:25:=SP_al_PeriodIDs{SP_at_PeriodCodes}
	[SALES_PROJECTION:113]ProjectionFromDate:22:=SP_ad_PeriodFromDate{SP_at_PeriodCodes}
	[SALES_PROJECTION:113]ProjectiontoDate:23:=SP_ad_PeriodToDate{SP_at_PeriodCodes}
	OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ProjectionFromDate:22; False:C215)
	OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ProjectiontoDate:23; False:C215)
	GOTO OBJECT:C206([SALES_PROJECTION:113]GrossValue:13)
	OBJECT SET VISIBLE:C603(*; "PCT_Fromdate"; False:C215)
	OBJECT SET VISIBLE:C603(*; "PCT_Todate"; False:C215)
	OBJECT SET ENABLED:C1123(vSD_SelCalendar2; False:C215)
	
	
End if 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Variable5"; $_t_oldMethodName)
