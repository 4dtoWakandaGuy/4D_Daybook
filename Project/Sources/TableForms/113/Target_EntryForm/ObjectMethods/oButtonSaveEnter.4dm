If (False:C215)
	//object Name: [SALES_PROJECTION]Target_EntryForm.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2009 21:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SP_ad_SPDateFrom;0)
	//ARRAY DATE(SP_ad_SPDateTo;0)
	ARRAY LONGINT:C221($_al_SubIDS; 0)
	//ARRAY LONGINT(SP_al_SPPeriodIDs;0)
	//ARRAY LONGINT(SP_al_SPExistingID;0)
	//ARRAY REAL(SP_ar_SPCurrentProjection;0)
	//ARRAY REAL(SP_ar_SPTargetAmount;0)
	//ARRAY REAL(SP_ar_SPTargetResult;0)
	C_LONGINT:C283($_l_ParentID; $_l_ProjectionIndex; $_l_SubIDIndex; SP_l_CurrencyID; SP_l_FindByClassID; SP_l_FindByGroupID; SP_l_FindByPersonID; SP_l_ProjectionStatus; SP_l_Save)
	C_REAL:C285($_r_Amount)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocOwner; SP_T_SalesProjDescription; SP_t_SalesProjectionTitle)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SALES_PROJECTION].Target_EntryForm.Variable10"; Form event code:C388)
If (SP_t_SalesProjectionTitle#"")
	SP_l_Save:=1
	READ WRITE:C146([SALES_PROJECTION:113])
	
	For ($_l_ProjectionIndex; 1; Size of array:C274(SP_al_SPExistingID))
		If (SP_al_SPExistingID{$_l_ProjectionIndex}>0)
			QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=SP_al_SPExistingID{$_l_ProjectionIndex})
		Else 
			CREATE RECORD:C68([SALES_PROJECTION:113])
			[SALES_PROJECTION:113]Forcast_LevelID:3:=2
			[SALES_PROJECTION:113]PersonnelOwnerID:4:=SP_l_FindByPersonID
			[SALES_PROJECTION:113]PersonnelGroupID:5:=SP_l_FindByGroupID
			[SALES_PROJECTION:113]ProjectionAdHocOwner:26:=SP_t_AdHocOwner
			[SALES_PROJECTION:113]Class_ID:2:=SP_l_FindByClassID
			[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
		End if 
		[SALES_PROJECTION:113]Description:11:=SP_T_SalesProjDescription
		[SALES_PROJECTION:113]CurrencyID:12:=SP_l_CurrencyID
		[SALES_PROJECTION:113]GrossValue:13:=SP_ar_SPTargetAmount{$_l_ProjectionIndex}
		[SALES_PROJECTION:113]ConvertedSaleValue:19:=SP_ar_SPTargetResult{$_l_ProjectionIndex}
		[SALES_PROJECTION:113]Status:20:=SP_l_ProjectionStatus
		[SALES_PROJECTION:113]Title:21:=SP_t_SalesProjectionTitle
		[SALES_PROJECTION:113]ProjectionFromDate:22:=SP_ad_SPDateFrom{$_l_ProjectionIndex}
		[SALES_PROJECTION:113]ProjectiontoDate:23:=SP_ad_SPDateTo{$_l_ProjectionIndex}
		[SALES_PROJECTION:113]ProjectionPeriodID:25:=SP_al_SPPeriodIDs{$_l_ProjectionIndex}
		DB_SaveRecord(->[SALES_PROJECTION:113])
		AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
		If (SP_ar_SPCurrentProjection{$_l_ProjectionIndex}>0)
			$_l_ParentID:=[SALES_PROJECTION:113]x_ID:1
			QUERY:C277([SALES_ProjectionLinks:114]; [SALES_ProjectionLinks:114]SalesProjectionParentID:3=$_l_ParentID)
			ARRAY LONGINT:C221($_al_SubIDS; 0)
			SELECTION TO ARRAY:C260([SALES_ProjectionLinks:114]SalesProjectionSubID:4; $_al_SubIDS)
			CREATE EMPTY SET:C140([SALES_PROJECTION:113]; "CurrentProjections")
			For ($_l_SubIDIndex; 1; Size of array:C274($_al_SubIDS))
				QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=$_al_SubIDS{$_l_SubIDIndex})
				ADD TO SET:C119([SALES_PROJECTION:113]; "CurrentProjections")
			End for 
			USE SET:C118("CurrentProjections")
			ORDER BY:C49([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Date_Entered:10; <)
			FIRST RECORD:C50([SALES_PROJECTION:113])
			$_r_Amount:=[SALES_PROJECTION:113]GrossValue:13
			If ($_r_Amount#SP_ar_SPCurrentProjection{$_l_ProjectionIndex})
				CREATE RECORD:C68([SALES_PROJECTION:113])
				[SALES_PROJECTION:113]Forcast_LevelID:3:=3
				[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
				[SALES_PROJECTION:113]GrossValue:13:=SP_ar_SPCurrentProjection{$_l_ProjectionIndex}
				DB_SaveRecord(->[SALES_PROJECTION:113])
				AA_CheckFileUnlocked(->[SALES_PROJECTION:113]x_ID:1)
				CREATE RECORD:C68([SALES_ProjectionLinks:114])
				[SALES_ProjectionLinks:114]SalesProjectionParentID:3:=$_l_ParentID
				[SALES_ProjectionLinks:114]SalesProjectionSubID:4:=[SALES_PROJECTION:113]x_ID:1
				DB_SaveRecord(->[SALES_ProjectionLinks:114])
				AA_CheckFileUnlocked(->[SALES_ProjectionLinks:114]x_ID:1)
			End if 
			
		End if 
		
		
	End for 
	CANCEL:C270
	
Else 
	//  ALERT("You must enter a Title for this Pipeline Order")
	Gen_Alert("You must enter a Title for this Pipeline Order")
End if 
ERR_MethodTrackerReturn("OBJ [SALES_PROJECTION].Target_EntryForm.Variable10"; $_t_oldMethodName)
