//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_UpdateTargetFromPV
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
	//ARRAY DATE(<>SP_ad_TargetProjectionDate;0)
	//ARRAY DATE(SP_ad_TargetFromDate;0)
	//ARRAY DATE(SP_ad_TargettoDate;0)
	//ARRAY LONGINT(<>SP_al_TargetProjectionID;0)
	//ARRAY LONGINT(<>SP_al_TargetProjectionsLinkID;0)
	//ARRAY LONGINT(SP_al_atCompanyID;0)
	//ARRAY LONGINT(SP_al_atCurrencyID;0)
	//ARRAY LONGINT(SP_al_PipelineStatus;0)
	//ARRAY LONGINT(SP_al_RecordModified;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_TargetOGroupID;0)
	//ARRAY LONGINT(SP_al_TargetOPersonID;0)
	//ARRAY LONGINT(SP_al_TargetPeriod;0)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY REAL(<>SP_ar_TargetProjectionAmount;0)
	//ARRAY REAL(SP_ar_atSalesValue;0)
	//ARRAY REAL(SP_ar_PipelineResult;0)
	//ARRAY REAL(SP_ar_TargetProjection;0)
	//ARRAY TEXT(SP_at_AdHocOwner;0)
	//ARRAY TEXT(SP_at_atCurrencyCode;0)
	//ARRAY TEXT(SP_at_atSalesCustomerName;0)
	//ARRAY TEXT(SP_at_atSalesTitle;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_TargetOGroupID;0)
	//ARRAY TEXT(SP_at_TargetOPersonID;0)
	//ARRAY TEXT(SP_at_TargetOwner;0)
	//ARRAY TEXT(SP_at_TargetPeriod;0)
	//ARRAY TEXT(SP_at_TargetType;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_LONGINT:C283(SP_l_tGroupID; SP_l_tPersonelID)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_UpdateTargetFromPV")
READ WRITE:C146([SALES_PROJECTION:113])
If (SP_al_SalesProjectionID{$1}<0)
	CREATE RECORD:C68([SALES_PROJECTION:113])
	//create the record first
	If (SP_l_tPersonelID>0)
		[SALES_PROJECTION:113]PersonnelOwnerID:4:=SP_l_tPersonelID
		[SALES_PROJECTION:113]PersonnelGroupID:5:=SP_l_tGroupID
	Else 
		If (SP_l_tGroupID>0)
			[SALES_PROJECTION:113]PersonnelGroupID:5:=SP_l_tGroupID
		Else 
			[SALES_PROJECTION:113]ProjectionAdHocOwner:26:=SP_t_AdHocName
		End if 
	End if 
	If ([SALES_PROJECTION:113]x_ID:1=0)
		[SALES_PROJECTION:113]x_ID:1:=AA_GetNextIDinMethod(->[SALES_PROJECTION:113]x_ID:1)
	End if 
	
	[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
	[SALES_PROJECTION:113]Forcast_LevelID:3:=2
Else 
	QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=SP_al_SalesProjectionID{$1})
End if 
[SALES_PROJECTION:113]Title:21:=SP_at_atSalesTitle{$1}
[SALES_PROJECTION:113]Class_ID:2:=SP_al_TargetType{$1}
[SALES_PROJECTION:113]CurrencyID:12:=SP_al_atCurrencyID{$1}
[SALES_PROJECTION:113]GrossValue:13:=SP_ar_atSalesValue{$1}
[SALES_PROJECTION:113]ConvertedSaleValue:19:=SP_ar_PipelineResult{$1}
[SALES_PROJECTION:113]Status:20:=SP_al_PipelineStatus{$1}
[SALES_PROJECTION:113]ProjectionFromDate:22:=SP_ad_TargetFromDate{$1}
[SALES_PROJECTION:113]ProjectiontoDate:23:=SP_ad_TargettoDate{$1}
[SALES_PROJECTION:113]ProjectionPeriodID:25:=SP_al_TargetPeriod{$1}


DB_SaveRecord(->[SALES_PROJECTION:113])
AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
If (SP_ar_TargetProjection{$1}>0)
	SP_al_SalesProjectionID{$1}:=[SALES_PROJECTION:113]x_ID:1
	If (SP_al_SalesProjectionID{$1}>0)
		//this was a saved target
		SP_LoadTargetProjections(SP_al_SalesProjectionID{$1})
		SORT ARRAY:C229(<>SP_ad_TargetProjectionDate; <>SP_ar_TargetProjectionAmount; <>SP_al_TargetProjectionID; <>SP_al_TargetProjectionsLinkID; <)
		If (Size of array:C274(<>SP_ad_TargetProjectionDate)>0)
			If (<>SP_ad_TargetProjectionDate{1}=Current date:C33(*))
				//can modify the projection
				QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=<>SP_al_TargetProjectionsLinkID{1})
				[SALES_PROJECTION:113]GrossValue:13:=SP_ar_TargetProjection{$1}
				DB_SaveRecord(->[SALES_PROJECTION:113])
				AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
			Else 
				QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=<>SP_al_TargetProjectionsLinkID{1})
				If (SP_ar_TargetProjection{$1}#[SALES_PROJECTION:113]GrossValue:13)
					CREATE RECORD:C68([SALES_PROJECTION:113])
					[SALES_PROJECTION:113]Forcast_LevelID:3:=3
					[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
					[SALES_PROJECTION:113]GrossValue:13:=SP_ar_TargetProjection{$1}
					[SALES_PROJECTION:113]x_ID:1:=AA_GetNextIDinMethod(->[SALES_PROJECTION:113]x_ID:1)
					DB_SaveRecord(->[SALES_PROJECTION:113])
					AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
					CREATE RECORD:C68([SALES_ProjectionLinks:114])
					[SALES_ProjectionLinks:114]SalesProjectionSubID:4:=[SALES_PROJECTION:113]x_ID:1
					[SALES_ProjectionLinks:114]SalesProjectionParentID:3:=SP_al_SalesProjectionID{$1}
					[SALES_ProjectionLinks:114]x_ID:1:=AA_GetNextIDinMethod(->[SALES_ProjectionLinks:114]x_ID:1)
					DB_SaveRecord(->[SALES_ProjectionLinks:114])
					
					UNLOAD RECORD:C212([SALES_ProjectionLinks:114])
				End if 
				
			End if 
		Else 
			SP_al_SalesProjectionID{$1}:=[SALES_PROJECTION:113]x_ID:1
			//it was not
			CREATE RECORD:C68([SALES_PROJECTION:113])
			[SALES_PROJECTION:113]Forcast_LevelID:3:=3
			[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
			[SALES_PROJECTION:113]GrossValue:13:=SP_ar_TargetProjection{$1}
			DB_SaveRecord(->[SALES_PROJECTION:113])
			AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
			CREATE RECORD:C68([SALES_ProjectionLinks:114])
			[SALES_ProjectionLinks:114]SalesProjectionSubID:4:=[SALES_PROJECTION:113]x_ID:1
			[SALES_ProjectionLinks:114]SalesProjectionParentID:3:=SP_al_SalesProjectionID{$1}
			[SALES_ProjectionLinks:114]x_ID:1:=AA_GetNextIDinMethod(->[SALES_ProjectionLinks:114]x_ID:1)
			DB_SaveRecord(->[SALES_ProjectionLinks:114])
			UNLOAD RECORD:C212([SALES_ProjectionLinks:114])
			
		End if 
	End if 
End if 



UNLOAD RECORD:C212([SALES_PROJECTION:113])
READ ONLY:C145([SALES_PROJECTION:113])
READ ONLY:C145([SALES_ProjectionLinks:114])



If ($1=Size of array:C274(SP_al_PipelineStatus))
	ARRAY LONGINT:C221(SP_al_SalesProjectionID; 0)
	ARRAY TEXT:C222(SP_at_atSalesTitle; 0)
	ARRAY LONGINT:C221(SP_al_RecordModified; 0)
	ARRAY LONGINT:C221(SP_al_atCurrencyID; 0)
	ARRAY TEXT:C222(SP_at_atCurrencyCode; 0)
	ARRAY REAL:C219(SP_ar_atSalesValue; 0)
	ARRAY LONGINT:C221(SP_al_PipelineStatus; 0)
	ARRAY TEXT:C222(SP_at_PipelineStatus; 0)
	ARRAY REAL:C219(SP_ar_PipelineResult; 0)
	ARRAY DATE:C224(SP_ad_TargetFromDate; 0)
	ARRAY DATE:C224(SP_ad_TargettoDate; 0)
	ARRAY LONGINT:C221(SP_al_atCompanyID; 0)
	ARRAY TEXT:C222(SP_at_atSalesCustomerName; 0)
	ARRAY LONGINT:C221(SP_al_atCurrencyID; 0)
	ARRAY TEXT:C222(SP_at_atCurrencyCode; 0)
	ARRAY LONGINT:C221(SP_al_TargetPeriod; 0)
	ARRAY TEXT:C222(SP_at_TargetPeriod; 0)
	ARRAY TEXT:C222(SP_at_AdHocOwner; 0)
	ARRAY LONGINT:C221(SP_al_TargetOPersonID; 0)
	ARRAY LONGINT:C221(SP_al_TargetOGroupID; 0)
	ARRAY TEXT:C222(SP_at_TargetOPersonID; 0)
	ARRAY TEXT:C222(SP_at_TargetOGroupID; 0)
	ARRAY TEXT:C222(SP_at_TargetOwner; 0)
	ARRAY LONGINT:C221(SP_al_TargetType; 0)
	ARRAY TEXT:C222(SP_at_TargetType; 0)
	ARRAY REAL:C219(SP_ar_TargetProjection; 0)
	<>NoUpdate:=False:C215
End if 
ERR_MethodTrackerReturn("SP_UpdateTargetFromPV"; $_t_oldMethodName)