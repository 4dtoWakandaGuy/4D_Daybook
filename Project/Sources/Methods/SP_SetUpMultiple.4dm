//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_SetUpMultiple
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SP_ad_PeriodFromDate;0)
	//ARRAY DATE(SP_ad_PeriodToDate;0)
	//ARRAY DATE(SP_ad_SPDateFrom;0)
	//ARRAY DATE(SP_ad_SPDateTo;0)
	ARRAY LONGINT:C221($_al_SalesProjSubID; 0)
	//ARRAY LONGINT(SP_al_PeriodIDs;0)
	//ARRAY LONGINT(SP_al_SPExistingID;0)
	//ARRAY LONGINT(SP_al_SPPeriodIDs;0)
	//ARRAY REAL(SP_ar_SPCurrentProjection;0)
	//ARRAY REAL(SP_ar_SPTargetAmount;0)
	//ARRAY REAL(SP_ar_SPTargetResult;0)
	//ARRAY TEXT(SP_at_PeriodCodes;0)
	//ARRAY TEXT(SP_at_SPPeriodCode;0)
	C_BOOLEAN:C305($0)
	C_DATE:C307($_d_DateTo; $_d_LastDateTo; $_d_ProjectionDateFrom; $3; $4; $SP_D_SDateFrom; SP_D_BaseFromDate; SP_D_BaseToDate; SP_D_SDateFrom; SP_D_SDateTo; SP_D_SPDateFrom)
	C_DATE:C307(SP_D_SPDateTo)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_DaysCount; $_l_DaysPerPeriod; $_l_Element; $_l_Index; $_l_PeriodRow; $_l_SubIdIndex; $1; $2; SP_CB_SplitMonthly; SP_l_BasePeriod)
	C_LONGINT:C283(SP_l_Continue; SP_l_FindByClassID; SP_l_FindByGroupID; SP_l_FindByPersonID; SP_l_MultiType; SP_l_SPeriodFromID; SP_l_SPeriodToID; SP_l_SPExistingID; SP_l_SPperiodID; SP_l_STargetCount; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_REAL:C285(SP_R_SPCurrentProjection; SP_R_SPTargetAmount; SP_R_SPTargetResult)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocOwner; SP_t_SPPeriodCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_SetUpMultiple")


If (Count parameters:C259>=5)
	$0:=True:C214
End if 

SP_l_BasePeriod:=$2
SP_D_BaseFromDate:=$3
SP_D_BaseToDate:=$4
SP_l_MultiType:=$1
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
DIALOG:C40([USER:15]; "SP_TargetSetup")

CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (SP_l_Continue>0)
	If ([SALES_PROJECTION:113]Class_ID:2>0)
		SP_l_FindByClassID:=[SALES_PROJECTION:113]Class_ID:2
	Else 
		SP_l_FindByClassID:=0
	End if 
	Case of 
		: (SP_l_SPeriodFromID>0)
			//Get the range of period IDs
			$_l_PeriodRow:=Find in array:C230(SP_al_PeriodIDs; SP_l_SPeriodFromID)
			CREATE EMPTY SET:C140([SALES_PROJECTION:113]; "MatchedSelection")
			SP_l_FindByPersonID:=[SALES_PROJECTION:113]PersonnelOwnerID:4
			SP_l_FindByGroupID:=[SALES_PROJECTION:113]PersonnelGroupID:5
			SP_t_AdHocOwner:=[SALES_PROJECTION:113]ProjectionAdHocOwner:26
			For ($_l_Index; $_l_PeriodRow; Size of array:C274(SP_al_PeriodIDs))
				If (SP_al_PeriodIDs{$_l_Index}#SP_l_SPeriodToID)
					Case of 
						: (SP_l_FindByPersonID>0)
							QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
							QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]PersonnelOwnerID:4=SP_l_FindByPersonID; *)
							QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionPeriodID:25=SP_al_PeriodIDs{$_l_Index})
							
						: (SP_l_FindByGroupID>0)
							QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
							QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]PersonnelGroupID:5=SP_l_FindByGroupID; *)
							QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionPeriodID:25=SP_al_PeriodIDs{$_l_Index})
						: (SP_t_AdHocOwner#"")
							QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
							QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionAdHocOwner:26=SP_t_AdHocOwner; *)
							QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionPeriodID:25=SP_al_PeriodIDs{$_l_Index})
					End case 
					If (SP_l_FindByClassID>0)
						QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Class_ID:2=SP_l_FindByClassID)
					End if 
					CREATE SET:C116([SALES_PROJECTION:113]; "ThisSelection")
					UNION:C120("MatchedSelection"; "ThisSelection"; "MatchedSelection")
					CLEAR SET:C117("ThisSelection")
				Else 
					$_l_Index:=9999999
				End if 
			End for 
			USE SET:C118("MatchedSelection")
			
		: (SP_D_SDateFrom>!00-00-00!)
			SP_l_FindByPersonID:=[SALES_PROJECTION:113]PersonnelOwnerID:4
			SP_l_FindByGroupID:=[SALES_PROJECTION:113]PersonnelGroupID:5
			SP_t_AdHocOwner:=[SALES_PROJECTION:113]ProjectionAdHocOwner:26
			Case of 
				: (SP_l_FindByPersonID>0)
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]PersonnelOwnerID:4=SP_l_FindByPersonID; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionFromDate:22>=SP_D_SDateFrom; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectiontoDate:23<=SP_D_SDateTo)
					
				: (SP_l_FindByGroupID>0)
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]PersonnelGroupID:5=SP_l_FindByGroupID; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionFromDate:22>=SP_D_SDateFrom; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectiontoDate:23<=SP_D_SDateTo)
				: (SP_t_AdHocOwner#"")
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Forcast_LevelID:3=2; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionAdHocOwner:26=SP_t_AdHocOwner; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectionFromDate:22>=SP_D_SDateFrom; *)
					QUERY:C277([SALES_PROJECTION:113];  & ; [SALES_PROJECTION:113]ProjectiontoDate:23<=SP_D_SDateTo)
			End case 
			If (SP_l_FindByClassID>0)
				QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Class_ID:2=SP_l_FindByClassID)
			End if 
			CREATE SET:C116([SALES_PROJECTION:113]; "MatchedSelection")
			USE SET:C118("MatchedSelection")
	End case 
	//we now have any existing targets for this selection
	ARRAY LONGINT:C221(SP_al_SPPeriodIDs; 0)
	ARRAY LONGINT:C221(SP_al_SPExistingID; 0)
	ARRAY DATE:C224(SP_ad_SPDateFrom; 0)
	ARRAY DATE:C224(SP_ad_SPDateTo; 0)
	ARRAY TEXT:C222(SP_at_SPPeriodCode; 0)
	ARRAY REAL:C219(SP_ar_SPTargetAmount; 0)
	ARRAY REAL:C219(SP_ar_SPTargetResult; 0)
	ARRAY REAL:C219(SP_ar_SPCurrentProjection; 0)
	//``
	SP_l_SPperiodID:=0
	SP_l_SPExistingID:=0
	SP_D_SPDateFrom:=!00-00-00!
	SP_D_SPDateTo:=!00-00-00!
	SP_t_SPPeriodCode:=""
	SP_R_SPTargetAmount:=0
	SP_ar_SPTargetResult:=0
	SP_R_SPCurrentProjection:=0
	Case of 
		: (SP_l_SPeriodFromID>0)
			//set up the periods we want
			ARRAY LONGINT:C221(SP_al_SPPeriodIDs; 99)
			$_l_PeriodRow:=Find in array:C230(SP_al_PeriodIDs; SP_l_SPeriodFromID)
			$_l_Element:=0
			For ($_l_Index; $_l_PeriodRow; Size of array:C274(SP_al_PeriodIDs))
				If (SP_al_PeriodIDs{$_l_Index}#SP_l_SPeriodToID)
					$_l_Element:=$_l_Element+1
					If ($_l_Element>Size of array:C274(SP_al_SPPeriodIDs))
						INSERT IN ARRAY:C227(SP_al_SPPeriodIDs; Size of array:C274(SP_al_SPPeriodIDs)+1; 99)
					End if 
					SP_al_SPPeriodIDs{$_l_Element}:=SP_al_PeriodIDs{$_l_Index}
				Else 
					$_l_Index:=Size of array:C274(SP_al_PeriodIDs)
				End if 
			End for 
			ARRAY LONGINT:C221(SP_al_SPPeriodIDs; $_l_Element)
			ARRAY LONGINT:C221(SP_al_SPExistingID; $_l_Element)
			ARRAY DATE:C224(SP_ad_SPDateFrom; $_l_Element)
			ARRAY DATE:C224(SP_ad_SPDateTo; $_l_Element)
			ARRAY TEXT:C222(SP_at_SPPeriodCode; $_l_Element)
			ARRAY REAL:C219(SP_ar_SPTargetAmount; $_l_Element)
			ARRAY REAL:C219(SP_ar_SPTargetResult; $_l_Element)
			ARRAY REAL:C219(SP_ar_SPCurrentProjection; $_l_Element)
			For ($_l_Index; 1; Size of array:C274(SP_al_SPPeriodIDs))
				$_l_PeriodRow:=Find in array:C230(SP_al_PeriodIDs; SP_al_SPPeriodIDs{$_l_Index})
				SP_ad_SPDateFrom{$_l_Index}:=SP_ad_PeriodFromDate{$_l_PeriodRow}
				SP_ad_SPDateTo{$_l_Index}:=SP_ad_PeriodToDate{$_l_PeriodRow}
				SP_at_SPPeriodCode{$_l_Index}:=SP_at_PeriodCodes{$_l_PeriodRow}
				USE SET:C118("MatchedSelection")
				QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectionPeriodID:25=SP_al_SPPeriodIDs{$_l_Index})
				If (Records in selection:C76([SALES_PROJECTION:113])>0)
					//there is already a projection for that period
					SP_al_SPExistingID{$_l_Index}:=[SALES_PROJECTION:113]x_ID:1
					SP_ar_SPTargetAmount{$_l_Index}:=[SALES_PROJECTION:113]GrossValue:13
					SP_ar_SPTargetResult{$_l_Index}:=[SALES_PROJECTION:113]ConvertedSaleValue:19
					QUERY:C277([SALES_ProjectionLinks:114]; [SALES_ProjectionLinks:114]SalesProjectionParentID:3=SP_al_SPExistingID{$_l_Index})
					SELECTION TO ARRAY:C260([SALES_ProjectionLinks:114]SalesProjectionSubID:4; $_al_SalesProjSubID)
					If (Size of array:C274($_al_SalesProjSubID)>0)
						CREATE EMPTY SET:C140([SALES_PROJECTION:113]; "TempSet")
						For ($_l_SubIdIndex; 1; Size of array:C274($_al_SalesProjSubID))
							QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=$_al_SalesProjSubID{$_l_SubIdIndex})
							ADD TO SET:C119([SALES_PROJECTION:113]; "TempSet")
						End for 
						USE SET:C118("TempSet")
						CLEAR SET:C117("TempSet")
						ORDER BY:C49([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Date_Entered:10; <)
						FIRST RECORD:C50([SALES_PROJECTION:113])
						SP_ar_SPCurrentProjection{$_l_Index}:=[SALES_PROJECTION:113]GrossValue:13
						UNLOAD RECORD:C212([SALES_PROJECTION:113])
					End if 
				End if 
			End for 
		: (SP_D_SDateFrom>!00-00-00!)
			$_l_DaysCount:=SP_D_SDateTo-SP_D_SDateFrom
			If (SP_CB_SplitMonthly=0)
				$_l_DaysPerPeriod:=Int:C8($_l_DaysCount/SP_l_STargetCount)
			Else 
				$_l_DaysPerPeriod:=32
			End if 
			//there may not be the same number of days for each target(the end one
			//could be short or long
			//First we will use the existing entries
			USE SET:C118("MatchedSelection")
			ORDER BY:C49([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectionFromDate:22; >)
			FIRST RECORD:C50([SALES_PROJECTION:113])
			$_d_LastDateTo:=!00-00-00!
			ARRAY DATE:C224(SP_ad_SPDateFrom; 99)
			ARRAY DATE:C224(SP_ad_SPDateTo; 99)
			ARRAY LONGINT:C221(SP_al_SPExistingID; 99)
			$_l_Element:=0
			For ($_l_Index; 1; Records in selection:C76([SALES_PROJECTION:113]))
				$_d_ProjectionDateFrom:=[SALES_PROJECTION:113]ProjectionFromDate:22
				$_d_DateTo:=[SALES_PROJECTION:113]ProjectiontoDate:23
				If ($_d_LastDateTo>!00-00-00!)
					//check there is not a gap!
					If (($_d_LastDateTo+1)<[SALES_PROJECTION:113]ProjectionFromDate:22)
						$SP_D_SDateFrom:=$_d_LastDateTo+1
						Repeat 
							IDLE:C311
							$_l_Element:=$_l_Element+1
							If ($_l_Element>Size of array:C274(SP_ad_SPDateFrom))
								INSERT IN ARRAY:C227(SP_ad_SPDateFrom; Size of array:C274(SP_ad_SPDateFrom)+1; 99)
								INSERT IN ARRAY:C227(SP_ad_SPDateTo; Size of array:C274(SP_ad_SPDateTo)+1; 99)
								INSERT IN ARRAY:C227(SP_al_SPExistingID; Size of array:C274(SP_al_SPExistingID)+1; 99)
							End if 
							SP_ad_SPDateFrom{$_l_Element}:=$SP_D_SDateFrom
							If ($SP_D_SDateFrom+($_l_DaysPerPeriod-1)<[SALES_PROJECTION:113]ProjectionFromDate:22)
								SP_ad_SPDateTo{$_l_Element}:=$SP_D_SDateFrom+($_l_DaysPerPeriod-1)
								If (SP_CB_SplitMonthly>0)
									Repeat 
										If (Month of:C24(SP_ad_SPDateTo{$_l_Element})#Month of:C24(SP_ad_SPDateFrom{$_l_Element}))
											SP_ad_SPDateTo{$_l_Element}:=SP_ad_SPDateTo{$_l_Element}-1
										End if 
									Until (Month of:C24(SP_ad_SPDateTo{$_l_Element})=Month of:C24(SP_ad_SPDateFrom{$_l_Element}))
								End if 
								$SP_D_SDateFrom:=SP_ad_SPDateTo{$_l_Element}+1
							Else 
								SP_ad_SPDateTo{$_l_Element}:=[SALES_PROJECTION:113]ProjectionFromDate:22-1
								$SP_D_SDateFrom:=SP_ad_SPDateTo{$_l_Element}+1
							End if 
							DelayTicks(10)
						Until ($SP_D_SDateFrom>=([SALES_PROJECTION:113]ProjectionFromDate:22-1))
						
					Else 
						//what if there is an overlap!
						If (SP_ad_SPDateTo{$_l_Element}>=[SALES_PROJECTION:113]ProjectionFromDate:22)
							SP_ad_SPDateTo{$_l_Element}:=[SALES_PROJECTION:113]ProjectionFromDate:22-1
						End if 
						$_l_Element:=$_l_Element+1
						If ($_l_Element>Size of array:C274(SP_ad_SPDateFrom))
							INSERT IN ARRAY:C227(SP_ad_SPDateFrom; Size of array:C274(SP_ad_SPDateFrom)+1; 99)
							INSERT IN ARRAY:C227(SP_ad_SPDateTo; Size of array:C274(SP_ad_SPDateTo)+1; 99)
							INSERT IN ARRAY:C227(SP_al_SPExistingID; Size of array:C274(SP_al_SPExistingID)+1; 99)
						End if 
						SP_ad_SPDateFrom{$_l_Element}:=[SALES_PROJECTION:113]ProjectionFromDate:22
						SP_ad_SPDateTo{$_l_Element}:=[SALES_PROJECTION:113]ProjectiontoDate:23
					End if 
					
					
					
				Else 
					
					If (SP_D_SDateFrom<[SALES_PROJECTION:113]ProjectionFromDate:22)
						$SP_D_SDateFrom:=SP_D_SDateFrom
						Repeat 
							IDLE:C311
							$_l_Element:=$_l_Element+1
							If ($_l_Element>Size of array:C274(SP_ad_SPDateFrom))
								INSERT IN ARRAY:C227(SP_ad_SPDateFrom; Size of array:C274(SP_ad_SPDateFrom)+1; 99)
								INSERT IN ARRAY:C227(SP_ad_SPDateTo; Size of array:C274(SP_ad_SPDateTo)+1; 99)
								INSERT IN ARRAY:C227(SP_al_SPExistingID; Size of array:C274(SP_al_SPExistingID)+1; 99)
							End if 
							SP_ad_SPDateFrom{$_l_Element}:=$SP_D_SDateFrom
							If ($SP_D_SDateFrom+($_l_DaysPerPeriod-1)<[SALES_PROJECTION:113]ProjectionFromDate:22)
								SP_ad_SPDateTo{$_l_Element}:=$SP_D_SDateFrom+($_l_DaysPerPeriod-1)
								If (SP_CB_SplitMonthly>0)
									Repeat 
										IDLE:C311
										If (Month of:C24(SP_ad_SPDateTo{$_l_Element})#Month of:C24(SP_ad_SPDateFrom{$_l_Element}))
											SP_ad_SPDateTo{$_l_Element}:=SP_ad_SPDateTo{$_l_Element}-1
										End if 
									Until (Month of:C24(SP_ad_SPDateTo{$_l_Element})=Month of:C24(SP_ad_SPDateFrom{$_l_Element}))
								End if 
								$SP_D_SDateFrom:=SP_ad_SPDateTo{$_l_Element}+1
							Else 
								SP_ad_SPDateTo{$_l_Element}:=[SALES_PROJECTION:113]ProjectionFromDate:22-1
								$SP_D_SDateFrom:=SP_ad_SPDateTo{$_l_Element}+1
							End if 
						Until ($SP_D_SDateFrom>=([SALES_PROJECTION:113]ProjectionFromDate:22-1))
					End if 
					$_l_Element:=$_l_Element+1
					If ($_l_Element>Size of array:C274(SP_ad_SPDateFrom))
						INSERT IN ARRAY:C227(SP_ad_SPDateFrom; Size of array:C274(SP_ad_SPDateFrom)+1; 99)
						INSERT IN ARRAY:C227(SP_ad_SPDateTo; Size of array:C274(SP_ad_SPDateTo)+1; 99)
						INSERT IN ARRAY:C227(SP_al_SPExistingID; Size of array:C274(SP_al_SPExistingID)+1; 99)
					End if 
					SP_ad_SPDateFrom{$_l_Element}:=[SALES_PROJECTION:113]ProjectionFromDate:22
					SP_ad_SPDateTo{$_l_Element}:=[SALES_PROJECTION:113]ProjectiontoDate:23
				End if 
				$_d_LastDateTo:=SP_ad_SPDateTo{$_l_Element}
				NEXT RECORD:C51([SALES_PROJECTION:113])
			End for 
			If ($_d_LastDateTo<SP_D_SDateTo)
				If ($_d_LastDateTo>!00-00-00!)
					$SP_D_SDateFrom:=$_d_LastDateTo+1
				Else 
					$SP_D_SDateFrom:=SP_D_SDateFrom
				End if 
				
				Repeat 
					IDLE:C311
					$_l_Element:=$_l_Element+1
					If ($_l_Element>Size of array:C274(SP_ad_SPDateFrom))
						INSERT IN ARRAY:C227(SP_ad_SPDateFrom; Size of array:C274(SP_ad_SPDateFrom)+1; 99)
						INSERT IN ARRAY:C227(SP_ad_SPDateTo; Size of array:C274(SP_ad_SPDateTo)+1; 99)
						INSERT IN ARRAY:C227(SP_al_SPExistingID; Size of array:C274(SP_al_SPExistingID)+1; 99)
					End if 
					SP_ad_SPDateFrom{$_l_Element}:=$SP_D_SDateFrom
					If ($SP_D_SDateFrom+($_l_DaysPerPeriod-1)<=SP_D_SDateTo)
						SP_ad_SPDateTo{$_l_Element}:=$SP_D_SDateFrom+($_l_DaysPerPeriod-1)
						If (SP_CB_SplitMonthly>0)
							Repeat 
								IDLE:C311
								If (Month of:C24(SP_ad_SPDateTo{$_l_Element})#Month of:C24(SP_ad_SPDateFrom{$_l_Element}))
									SP_ad_SPDateTo{$_l_Element}:=SP_ad_SPDateTo{$_l_Element}-1
								End if 
							Until (Month of:C24(SP_ad_SPDateTo{$_l_Element})=Month of:C24(SP_ad_SPDateFrom{$_l_Element}))
						End if 
						$SP_D_SDateFrom:=SP_ad_SPDateTo{$_l_Element}+1
						
					Else 
						SP_ad_SPDateTo{$_l_Element}:=SP_D_SDateTo
						$SP_D_SDateFrom:=SP_ad_SPDateTo{$_l_Element}+1
					End if 
				Until ($SP_D_SDateFrom>=SP_D_SDateTo)
				
			End if 
			ARRAY LONGINT:C221(SP_al_SPPeriodIDs; $_l_Element)
			ARRAY LONGINT:C221(SP_al_SPExistingID; $_l_Element)
			ARRAY DATE:C224(SP_ad_SPDateFrom; $_l_Element)
			ARRAY DATE:C224(SP_ad_SPDateTo; $_l_Element)
			ARRAY TEXT:C222(SP_at_SPPeriodCode; $_l_Element)
			ARRAY REAL:C219(SP_ar_SPTargetAmount; $_l_Element)
			ARRAY REAL:C219(SP_ar_SPTargetResult; $_l_Element)
			ARRAY REAL:C219(SP_ar_SPCurrentProjection; $_l_Element)
			For ($_l_Index; 1; Size of array:C274(SP_al_SPPeriodIDs))
				If (SP_al_SPExistingID{$_l_Index}>0)
					USE SET:C118("MatchedSelection")
					QUERY SELECTION:C341([SALES_PROJECTION:113]; [SALES_PROJECTION:113]ProjectionPeriodID:25=SP_al_SPExistingID{$_l_Index})
					If (Records in selection:C76([SALES_PROJECTION:113])>0)
						SP_ar_SPTargetAmount{$_l_Index}:=[SALES_PROJECTION:113]GrossValue:13
						SP_ar_SPTargetResult{$_l_Index}:=[SALES_PROJECTION:113]ConvertedSaleValue:19
						QUERY:C277([SALES_ProjectionLinks:114]; [SALES_ProjectionLinks:114]SalesProjectionParentID:3=SP_al_SPExistingID{$_l_Index})
						SELECTION TO ARRAY:C260([SALES_ProjectionLinks:114]SalesProjectionSubID:4; $_al_SalesProjSubID)
						If (Size of array:C274($_al_SalesProjSubID)>0)
							CREATE EMPTY SET:C140([SALES_PROJECTION:113]; "TempSet")
							For ($_l_SubIdIndex; 1; Size of array:C274($_al_SalesProjSubID))
								QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=$_al_SalesProjSubID{$_l_SubIdIndex})
								ADD TO SET:C119([SALES_PROJECTION:113]; "TempSet")
							End for 
							USE SET:C118("TempSet")
							CLEAR SET:C117("TempSet")
							ORDER BY:C49([SALES_PROJECTION:113]; [SALES_PROJECTION:113]Date_Entered:10; <)
							FIRST RECORD:C50([SALES_PROJECTION:113])
							SP_ar_SPCurrentProjection{$_l_Index}:=[SALES_PROJECTION:113]GrossValue:13
							UNLOAD RECORD:C212([SALES_PROJECTION:113])
						End if 
					End if 
				End if 
			End for 
			
			
			
			
			
			
			
	End case 
	
	CLEAR SET:C117("MatchedSelection")
	
	UNLOAD RECORD:C212([SALES_PROJECTION:113])
	FORM GOTO PAGE:C247(2)
	
Else 
	If (Count parameters:C259>=5)
		$0:=False:C215
	End if 
	
End if 
ERR_MethodTrackerReturn("SP_SetUpMultiple"; $_t_oldMethodName)