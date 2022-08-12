//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_GetPreviousYears
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 14:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SP_lb_Listbox;0)
	//ARRAY BOOLEAN(SP_lb_Listbox2;0)
	ARRAY DATE:C224($_ad_PeriodFromDate; 0)
	ARRAY DATE:C224($_ad_PeriodToDate; 0)
	//ARRAY DATE(SP_ad_SPDateFrom;0)
	//ARRAY DATE(SP_ad_SPDateFrom2;0)
	//ARRAY DATE(SP_ad_SPDateTo;0)
	//ARRAY DATE(SP_ad_SPDateTo2;0)
	ARRAY LONGINT:C221($_al_PeriodIDS; 0)
	//ARRAY LONGINT(SP_al_aSPLinkedID2;0)
	//ARRAY LONGINT(SP_al_SPeriodFromID2;0)
	//ARRAY LONGINT(SP_al_SPExistingID;0)
	//ARRAY LONGINT(SP_al_SPLinkedID2;0)
	//ARRAY LONGINT(SP_al_SPPeriodIDs;0)
	//ARRAY LONGINT(SP_al_SPPeriodIDs2;0)
	//ARRAY REAL(SP_ar_SPCurrentProjection2;0)
	//ARRAY REAL(SP_ar_SPTargetAmount2;0)
	//ARRAY REAL(SP_ar_SPTargetResult2;0)
	ARRAY TEXT:C222($_at_PeriodCodes; 0)
	//ARRAY TEXT(SP_at_aSPPeriodCode2;0)
	//ARRAY TEXT(SP_at_SPPeriodCode2;0)
	C_BOOLEAN:C305($_bo_NoPeriod; DB_bo_FontsInited)
	C_DATE:C307($_d_Date; $_d_DateFrom; $_d_DateTo)
	C_LONGINT:C283(<>SYS_l_DefaultPlainFontSize; $_l_ArraySize; $_l_Dayof; $_l_DifferenceDays; $_l_Index; $_l_Monthof; $_l_PeriodsIndex; $_l_QueryID; $_l_YearOf; $1; $2)
	C_LONGINT:C283($4; SP_l_BUT1; SP_l_BUT2; SP_l_BUT3; SP_l_BUT4; SP_l_BUT5; SP_l_BUT6; SP_l_SPeriodFromID)
	C_TEXT:C284(<>SYS_t_DefaultFontPlain; $_t_oldMethodName; $3; oSP_COL1; oSP_COL2; oSP_COL3; oSP_COL4; oSP_COL5; oSP_COL6; oSP_HED1; oSP_HED2)
	C_TEXT:C284(oSP_HED3; oSP_HED4; oSP_HED5; oSP_HED6)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_GetPreviousYears")
//this method which is called when trying to autofill targets
//will find previous years of the same target
//first we must find what the periods or dates we want are
ARRAY LONGINT:C221(SP_al_SPeriodFromID2; 0)
ARRAY LONGINT:C221(SP_al_SPPeriodIDs2; 0)
ARRAY LONGINT:C221(SP_al_aSPLinkedID2; 0)
ARRAY DATE:C224(SP_ad_SPDateFrom2; 0)
ARRAY DATE:C224(SP_ad_SPDateTo2; 0)
ARRAY TEXT:C222(SP_at_SPPeriodCode2; 0)
ARRAY REAL:C219(SP_ar_SPTargetAmount2; 0)
ARRAY REAL:C219(SP_ar_SPTargetResult2; 0)
ARRAY REAL:C219(SP_ar_SPCurrentProjection2; 0)
$_l_ArraySize:=Size of array:C274(SP_al_SPPeriodIDs)

ARRAY LONGINT:C221(SP_al_SPeriodFromID2; $_l_ArraySize)
ARRAY LONGINT:C221(SP_al_SPPeriodIDs2; $_l_ArraySize)
ARRAY LONGINT:C221(SP_al_SPLinkedID2; $_l_ArraySize)
ARRAY DATE:C224(SP_ad_SPDateFrom2; $_l_ArraySize)
ARRAY DATE:C224(SP_ad_SPDateTo2; $_l_ArraySize)
ARRAY TEXT:C222(SP_at_aSPPeriodCode2; $_l_ArraySize)
ARRAY REAL:C219(SP_ar_SPTargetAmount2; $_l_ArraySize)
ARRAY REAL:C219(SP_ar_SPTargetResult2; $_l_ArraySize)
ARRAY REAL:C219(SP_ar_SPCurrentProjection2; $_l_ArraySize)
If (SP_l_SPeriodFromID>0)
	ALL RECORDS:C47([PERIODS:33])
	SELECTION TO ARRAY:C260([PERIODS:33]Period_Code:1; $_at_PeriodCodes; [PERIODS:33]From_Date:3; $_ad_PeriodFromDate; [PERIODS:33]To_Date:4; $_ad_PeriodToDate; [PERIODS:33]x_ID:10; $_al_PeriodIDS)
	SORT ARRAY:C229($_ad_PeriodFromDate; $_ad_PeriodToDate; $_al_PeriodIDS; $_at_PeriodCodes)
	//period based targets
	For ($_l_Index; 1; Size of array:C274(SP_al_SPPeriodIDs))
		If (SP_al_SPExistingID{$_l_Index}>0)
			SP_al_SPLinkedID2{$_l_Index}:=SP_al_SPExistingID{$_l_Index}
		Else 
			SP_al_SPLinkedID2{$_l_Index}:=-$_l_Index
		End if 
		$_d_DateFrom:=SP_ad_SPDateFrom{$_l_Index}
		$_d_DateTo:=SP_ad_SPDateTo{$_l_Index}
		$_l_Dayof:=Day of:C23($_d_DateFrom)
		$_l_Monthof:=Month of:C24($_d_DateFrom)
		$_l_YearOf:=Year of:C25($_d_DateFrom)
		$_d_Date:=$_d_DateFrom-365
		If (Day of:C23($_d_Date)#$_l_Dayof)
			If (Day of:C23($_d_Date)<$_l_Dayof)
				$_l_DifferenceDays:=$_l_Dayof-Day of:C23($_d_Date)
				$_d_Date:=$_d_Date-$_l_DifferenceDays
			Else 
				$_l_DifferenceDays:=Day of:C23($_d_Date)-$_l_Dayof
				$_d_Date:=$_d_Date+$_l_DifferenceDays
			End if 
		End if 
		$_l_QueryID:=0
		For ($_l_PeriodsIndex; 1; Size of array:C274($_ad_PeriodFromDate))
			If ((Month of:C24($_ad_PeriodFromDate{$_l_PeriodsIndex})=$_l_Monthof) & (Year of:C25($_ad_PeriodFromDate{$_l_PeriodsIndex})=($_l_YearOf-1)))
				$_l_QueryID:=$_al_PeriodIDS{$_l_PeriodsIndex}
				$_l_PeriodsIndex:=Size of array:C274($_ad_PeriodFromDate)+1
			End if 
		End for 
		
		$_bo_NoPeriod:=False:C215
		If ($_l_QueryID>0)
			QUERY:C277([PERIODS:33]; [PERIODS:33]x_ID:10=$_l_QueryID)
			
			SP_al_SPeriodFromID2{$_l_Index}:=[PERIODS:33]x_ID:10
			SP_at_aSPPeriodCode2{$_l_Index}:=[PERIODS:33]Period_Code:1
		Else 
			$_bo_NoPeriod:=True:C214
			SP_at_aSPPeriodCode2{$_l_Index}:=SP_at_aSPPeriodCode2{$_l_Index}+"-12 "
			SP_al_SPeriodFromID2{$_l_Index}:=0
		End if 
		SP_at_aSPPeriodCode2{$_l_Index}:=[PERIODS:33]Period_Code:1
		SP_ad_SPDateFrom2{$_l_Index}:=[PERIODS:33]From_Date:3
		SP_ad_SPDateTo2{$_l_Index}:=[PERIODS:33]To_Date:4
		If (Not:C34($_bo_NoPeriod))
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
			QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionPeriodID:25=SP_al_SPeriodFromID2{$_l_Index})
			If ($1>[SALES_PROJECTION:113]PersonnelOwnerID:4)
				QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelOwnerID:4=$1)
			End if 
			If ($2>0)
				QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelGroupID:5=$2)
			End if 
			If ($3#"")
				QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectionAdHocOwner:26=$3)
			End if 
			If ($4>0)
				QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Class_ID:2=$4)
			End if 
			If (Records in selection:C76([SALES_PROJECTION:113])>0)
				SP_ar_SPTargetAmount2{$_l_Index}:=[SALES_PROJECTION:113]GrossValue:13
				SP_ar_SPTargetResult2{$_l_Index}:=[SALES_PROJECTION:113]ConvertedSaleValue:19
				
			End if 
		End if 
	End for 
	
Else 
	//date based targets
	For ($_l_Index; 1; Size of array:C274(SP_al_SPPeriodIDs))
		$_d_DateFrom:=SP_ad_SPDateFrom{$_l_Index}
		$_d_DateTo:=SP_ad_SPDateTo{$_l_Index}
		$_l_Dayof:=Day of:C23($_d_DateFrom)
		$_l_MonthOf:=Month of:C24($_d_DateFrom)
		$_l_YearOf:=Year of:C25($_d_DateFrom)
		$_d_Date:=$_d_DateFrom-365
		If (Day of:C23($_d_Date)#$_l_Dayof)
			If (Day of:C23($_d_Date)<$_l_Dayof)
				$_l_DifferenceDays:=$_l_Dayof-Day of:C23($_d_Date)
				$_d_Date:=$_d_Date-$_l_DifferenceDays
			Else 
				$_l_DifferenceDays:=Day of:C23($_d_Date)-$_l_Dayof
				$_d_Date:=$_d_Date+$_l_DifferenceDays
			End if 
		End if 
		SP_al_SPeriodFromID2{$_l_Index}:=0
		SP_ad_SPDateFrom2{$_l_Index}:=$_d_Date
		$_d_Date:=$_d_DateTo-366
		If (Day of:C23($_d_Date)#$_l_Dayof)
			If (Day of:C23($_d_Date)<$_l_Dayof)
				$_l_DifferenceDays:=$_l_Dayof-Day of:C23($_d_Date)
				$_d_Date:=$_d_Date-$_l_DifferenceDays
			Else 
				$_l_DifferenceDays:=Day of:C23($_d_Date)-$_l_Dayof
				$_d_Date:=$_d_Date+$_l_DifferenceDays
			End if 
		End if 
		SP_ad_SPDateTo2{$_l_Index}:=$_d_DateTo
		QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
		QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionFromDate:22=SP_ad_SPDateFrom2{$_l_Index}; *)
		QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectiontoDate:23=SP_ad_SPDateTo2{$_l_Index})
		If ($1>[SALES_PROJECTION:113]PersonnelOwnerID:4)
			QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelOwnerID:4=$1)
		End if 
		If ($2>0)
			QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]PersonnelGroupID:5=$2)
		End if 
		If ($3#"")
			QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectionAdHocOwner:26=$3)
		End if 
		If ($4>0)
			QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Class_ID:2=$4)
		End if 
		If (Records in selection:C76([SALES_PROJECTION:113])>0)
			SP_ar_SPTargetAmount2{$_l_Index}:=[SALES_PROJECTION:113]GrossValue:13
			SP_ar_SPTargetResult2{$_l_Index}:=[SALES_PROJECTION:113]ConvertedSaleValue:19
			
		End if 
		
		
	End for 
	
	
End if 

//this will use a Powerview area but at the moment it is an area list one
If (SP_l_SPeriodFromID>0)
	LB_SetupListbox(->SP_lb_Listbox2; "oSP"; "SP_L"; 1; ->SP_ad_SPDateFrom2; ->SP_ad_SPDateTo2; ->SP_at_aSPPeriodCode2; ->SP_ar_SPTargetAmount2; ->SP_ar_SPTargetResult2)
	LB_StyleSettings(->SP_lb_Listbox2; "Blue"; 9; "SP"; ->[SALES_PROJECTION:113])
	LB_SetColumnHeaders(->SP_lb_Listbox2; "SP_L"; 1; "From Date"; "To Date"; "Period Code"; "Target"; "Result")
	
	LB_SetColumnWidths(->SP_lb_Listbox2; "oSP"; 1; 60; 60; 70; 50; 50)  // dont need to worry about the invisible ones
	LB_SetScroll(->SP_lb_Listbox; -2; -3)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateFrom2; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateTo2; False:C215)
	OBJECT SET ENTERABLE:C238(SP_at_aSPPeriodCode2; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ar_SPTargetAmount2; False:C215)
	OBJECT SET FORMAT:C236(SP_ar_SPTargetAmount2; "######0")
	OBJECT SET FORMAT:C236(SP_ar_SPTargetResult2; "######0")
Else 
	LB_SetupListbox(->SP_lb_Listbox2; "oSP"; "SP_L"; 1; ->SP_ad_SPDateFrom2; ->SP_ad_SPDateTo2; ->SP_at_aSPPeriodCode2; ->SP_ar_SPTargetResult2)
	LB_StyleSettings(->SP_lb_Listbox2; "Blue"; 9; "SP"; ->[SALES_PROJECTION:113])
	LB_SetColumnHeaders(->SP_lb_Listbox2; "SP_L"; 1; "From Date"; "To Date"; "Target"; "Result")
	LB_SetColumnWidths(->SP_lb_Listbox2; "oSP"; 1; 60; 60; 50; 50)  // dont need to worry about the invisible ones
	LB_SetScroll(->SP_lb_Listbox; -2; -3)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateFrom2; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ad_SPDateTo2; False:C215)
	OBJECT SET ENTERABLE:C238(SP_at_aSPPeriodCode2; False:C215)
	OBJECT SET ENTERABLE:C238(SP_ar_SPTargetResult2; False:C215)
	OBJECT SET FORMAT:C236(SP_at_aSPPeriodCode2; "######0")
	OBJECT SET FORMAT:C236(SP_at_aSPPeriodCode2; "######0")
	
End if 
If (Not:C34(DB_bo_FontsInited))
	DB_SetDefaultFonts
End if 
LB_SETFONT(->SP_lb_Listbox; "SP"; 1; <>SYS_t_DefaultFontPlain; 0; 0; <>SYS_l_DefaultPlainFontSize)
ERR_MethodTrackerReturn("SP_GetPreviousYears"; $_t_oldMethodName)