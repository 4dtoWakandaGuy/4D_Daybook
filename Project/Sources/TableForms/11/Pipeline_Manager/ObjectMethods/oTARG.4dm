If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.oTARG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SP_lb_Target;0)
	//ARRAY DATE(SP_ad_PeriodFromDate;0)
	//ARRAY DATE(SP_ad_PeriodToDate;0)
	//ARRAY DATE(SP_ad_TargetFromDate;0)
	//ARRAY DATE(SP_ad_TargettoDate;0)
	//ARRAY LONGINT(SP_al_atCurrencyID;0)
	//ARRAY LONGINT(SP_al_PeriodIDs;0)
	//ARRAY LONGINT(SP_al_PipelineStatus;0)
	//ARRAY LONGINT(SP_al_RecordModified;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_TargetPeriod;0)
	//ARRAY LONGINT(SP_al_TargetPipelineStatus;0)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY LONGINT(SP_al_POPCurrencyIDs;0)
	//ARRAY REAL(SP_ar_atSalesValue;0)
	//ARRAY REAL(SP_ar_PipelineResult;0)
	//ARRAY REAL(SP_ar_TargetProjection;0)
	//ARRAY TEXT(SP_at_atCurrencyCode;0)
	//ARRAY TEXT(SP_at_atSalesTitle;0)
	//ARRAY TEXT(SP_at_PeriodCodes;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_PopCurrencyCodes;0)
	//ARRAY TEXT(SP_at_PVPeriodCode;0)
	//ARRAY TEXT(SP_at_TargetPeriod;0)
	//ARRAY TEXT(SP_at_TargetPipelineStatus;0)
	//ARRAY TEXT(SP_at_TargetType;0)
	//ARRAY TEXT(SP_at_tTargetType;0)
	C_BOOLEAN:C305(QV_bo_Drop)
	C_LONGINT:C283($_l_CurrencyCodeRow; $_l_event; $_l_FieldNumber; $_l_PreviousPeriodRow; $_l_Row; $_l_SalesProjectionStateID; $_l_SelectedRow; $_l_StatusRow; $_l_SublistID; $_l_TableNumber; $_l_targetTypeRow)
	C_LONGINT:C283(LB_l_ColumnNumber; LB_l_RowNumber; QV_l_SourceElement; QV_l_SourceProcess; SP_l_ExitCalled; SP_l_tSalesProjectionStateID)
	C_POINTER:C301(QV_Ptr_SourceObject)
	C_TEXT:C284($_t_Column2; $_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.oTARG"; Form event code:C388)
$_l_event:=Form event code:C388
RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)

$_l_Row:=Self:C308->
SP_lb_Target:=$_l_Row
Case of 
	: ($_l_event=On Drag Over:K2:13)
		QV_bo_Drop:=False:C215
		_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
		RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		
	: ($_l_event=On Drop:K2:12)
		If (QV_bo_Drop)
			_O_DRAG AND DROP PROPERTIES:C607(QV_Ptr_SourceObject; QV_l_SourceElement; QV_l_SourceProcess)
			RESOLVE POINTER:C394(QV_Ptr_SourceObject; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
			
		End if 
		//: ($_l_event=On Plug in Area )
		//Case of
		//: (ALProEvt=-1)  `did user sort button
		//SP_PVTargetSetSort
		//AL_UpdateArrays (SP_PowerviewTarget;-2)
		//: (ALProEvt=2)  `double-click
	: (Form event code:C388=On Double Clicked:K2:5)
		//edit the pipeline
		//$_l_SelectedRow:=AL_GetLine (SP_PowerviewTarget)
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedRow>0)
			If (SP_al_SalesProjectionID{$_l_SelectedRow}>0)
				$_l_SalesProjectionStateID:=SP_l_tSalesProjectionStateID
				
				SP_ModifyTarget(SP_al_SalesProjectionID{$_l_SelectedRow})
				SP_l_tSalesProjectionStateID:=$_l_SalesProjectionStateID
				
				
			Else 
				//not saved yet so save it
				//then open it
				SP_UpdateTargetFromPV($_l_SelectedRow)
				$_l_SalesProjectionStateID:=SP_l_tSalesProjectionStateID
				SP_ModifyTarget(SP_al_SalesProjectionID{$_l_SelectedRow})
				SP_l_tSalesProjectionStateID:=$_l_SalesProjectionStateID
			End if 
		End if 
		
	: (Form event code:C388=On Data Change:K2:15)  // used to be in callback method
		$_l_SelectedRow:=Self:C308->
		RESOLVE POINTER:C394(Self:C308; $_t_Column2; $_l_TableNumber; $_l_FieldNumber)
		
		//this is the cell we are leaving
		//If ($_t_Column2>0) & ($_l_SelectedRow>0)
		Case of 
			: ($_t_Column2="SP_at_TargetOwner")  //Owner Not enterable
				//capitalize
				If (SP_at_atSalesTitle{$_l_SelectedRow}#SP_at_atSalesTitle{0})
					SP_al_RecordModified{$_l_SelectedRow}:=1
				End if 
				
			: ($_t_Column2="SP_at_atSalesTitle")  //Title
				
				If (SP_at_atSalesTitle{$_l_SelectedRow}#SP_at_atSalesTitle{0})
					If (SP_ar_PipelineResult{0}=0) & ((SP_ad_TargettoDate{$_l_SelectedRow}>!00-00-00!) & ((SP_ad_TargettoDate{$_l_SelectedRow}>Current date:C33(*)))) | (SP_ad_TargettoDate{$_l_SelectedRow}=!00-00-00!)
						SP_al_RecordModified{$_l_SelectedRow}:=1
					Else 
						SP_at_atSalesTitle{$_l_SelectedRow}:=SP_at_atSalesTitle{0}
						//AL_UpdateArrays (SP_Powerviewtarget;-2)
					End if 
					
				End if 
				
			: ($_t_Column2="SP_at_TargetType")  //(pop-up) Type
				If (SP_al_SalesProjectionID{$_l_SelectedRow}<0) | (SP_at_TargetType{0}="")
					If (SP_at_TargetType{$_l_SelectedRow}#"")
						$_l_targetTypeRow:=Find in array:C230(SP_at_tTargetType; SP_at_TargetType{$_l_SelectedRow})
						SP_al_TargetType{$_l_SelectedRow}:=SP_al_TargetType{$_l_targetTypeRow}
						SP_al_RecordModified{$_l_SelectedRow}:=1
					End if 
				Else 
					SP_at_TargetType{$_l_SelectedRow}:=SP_at_TargetType{0}
					//AL_UpdateArrays (SP_Powerviewtarget;-2)
				End if 
				
			: ($_t_Column2="SP_at_TargetPeriod")  //Period
				//sort out prob with pop-up first!!
				If (SP_at_TargetPeriod{$_l_SelectedRow}#SP_at_TargetPeriod{0})
					If (SP_at_TargetPeriod{0}="") | (SP_al_SalesProjectionID{$_l_SelectedRow}<0)
						If (SP_ar_PipelineResult{0}=0) & (SP_at_TargetPeriod{$_l_SelectedRow}#"")
							$_l_PreviousPeriodRow:=Find in array:C230(SP_at_PVPeriodCode; SP_at_TargetPeriod{$_l_SelectedRow})
							SP_at_TargetPeriod{$_l_SelectedRow}:=SP_at_PeriodCodes{$_l_PreviousPeriodRow}
							SP_al_TargetPeriod{$_l_SelectedRow}:=SP_al_PeriodIDs{$_l_PreviousPeriodRow}
							SP_ad_TargetFromDate{$_l_SelectedRow}:=SP_ad_PeriodFromDate{$_l_PreviousPeriodRow}
							SP_ad_TargettoDate{$_l_SelectedRow}:=SP_ad_PeriodToDate{$_l_PreviousPeriodRow}
							SP_al_RecordModified{$_l_SelectedRow}:=1
						Else 
							//cant be changed
							SP_at_TargetPeriod{$_l_SelectedRow}:=SP_at_TargetPeriod{0}
							//AL_UpdateArrays (SP_Powerviewtarget;-2)
							
						End if 
						
					Else 
						//cant be changed
						SP_at_TargetPeriod{$_l_SelectedRow}:=SP_at_TargetPeriod{0}
						//AL_UpdateArrays (SP_Powerviewtarget;-2)
						
					End if 
				End if 
			: ($_t_Column2="SP_ad_TargetFromDate")  //Date From
				If (SP_al_TargetPeriod{$_l_SelectedRow}=0)
					If (SP_ar_PipelineResult{0}=0) & (SP_ad_TargetFromDate{$_l_SelectedRow}#!00-00-00!)
						SP_al_RecordModified{$_l_SelectedRow}:=1
						If (SP_ad_TargettoDate{$_l_SelectedRow}=!00-00-00!)
							SP_ad_TargettoDate{$_l_SelectedRow}:=SP_ad_TargetFromDate{$_l_SelectedRow}
							
						End if 
						If (SP_ad_TargetFromDate{$_l_SelectedRow}>SP_ad_TargettoDate{$_l_SelectedRow})
							SP_ad_TargettoDate{$_l_SelectedRow}:=SP_ad_TargetFromDate{$_l_SelectedRow}
							//    ALERT("Note: The to date has been changed")
							Gen_Alert("Note: The to date has been changed")
						End if 
					Else 
						//cant be changed
						SP_ad_TargetFromDate{$_l_SelectedRow}:=SP_ad_TargetFromDate{0}
					End if 
					
				Else 
					//cant be changed
					SP_ad_TargetFromDate{$_l_SelectedRow}:=SP_ad_TargetFromDate{0}
					
				End if 
				//AL_UpdateArrays (SP_Powerviewtarget;-2)
				
			: ($_t_Column2="SP_ad_TargettoDate")  //Date to
				If (SP_al_TargetPeriod{$_l_SelectedRow}=0)
					If (SP_ar_PipelineResult{$_l_SelectedRow}=0) & (SP_ad_TargettoDate{$_l_SelectedRow}#!00-00-00!)
						SP_al_RecordModified{$_l_SelectedRow}:=1
						If (SP_ad_TargetFromDate{$_l_SelectedRow}=!00-00-00!)
							SP_ad_TargetFromDate{$_l_SelectedRow}:=SP_ad_TargettoDate{$_l_SelectedRow}
						End if 
						If (SP_ad_TargetFromDate{$_l_SelectedRow}>SP_ad_TargettoDate{$_l_SelectedRow})
							SP_ad_TargetFromDate{$_l_SelectedRow}:=SP_ad_TargettoDate{$_l_SelectedRow}
							//   ALERT("Note: The from date has been changed")
							Gen_Alert("Note: The from date has been changed")
						End if 
					Else 
						//cant be changed
						SP_ad_TargettoDate{$_l_SelectedRow}:=SP_ad_TargettoDate{0}
					End if 
					
				Else 
					//cant be changed
					SP_ad_TargettoDate{$_l_SelectedRow}:=SP_ad_TargettoDate{0}
					
				End if 
				//AL_UpdateArrays (SP_Powerviewtarget;-2)
				
			: ($_t_Column2="SP_at_atCurrencyCode")  //Currency
				If (SP_ar_PipelineResult{$_l_SelectedRow}>0)
					//AL_ExitCell ($1)
					SP_at_atCurrencyCode{$_l_SelectedRow}:=SP_at_atCurrencyCode{0}
					//AL_UpdateArrays (SP_PowerviewTarget;-2)
				Else 
					$_l_CurrencyCodeRow:=Find in array:C230(SP_at_PopCurrencyCodes; SP_at_atCurrencyCode{$_l_SelectedRow})
					SP_al_atCurrencyID{$_l_SelectedRow}:=SP_al_POPCurrencyIDs{$_l_CurrencyCodeRow}
				End if 
				If (SP_at_atCurrencyCode{$_l_SelectedRow}#SP_at_atCurrencyCode{0})
					SP_al_RecordModified{$_l_SelectedRow}:=1
				End if 
				
			: ($_t_Column2="SP_ar_atSalesValue")  //TARGET AMOUNT
				If (SP_ad_TargetFromDate{$_l_SelectedRow}<Current date:C33(*))
					SP_ar_atSalesValue{$_l_SelectedRow}:=SP_ar_atSalesValue{0}
				Else 
					If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Manager"))
					Else 
						SP_ar_atSalesValue{$_l_SelectedRow}:=SP_ar_atSalesValue{0}
					End if 
				End if 
				If (SP_ar_atSalesValue{$_l_SelectedRow}#SP_ar_atSalesValue{0})
					SP_al_RecordModified{$_l_SelectedRow}:=1
				End if 
				//AL_UpdateArrays (SP_PowerviewTarget;-2)
				
			: ($_t_Column2="SP_ar_TargetProjection")  //Current projection
				If (SP_ad_TargettoDate{$_l_SelectedRow}<Current date:C33(*))
					SP_ar_TargetProjection{$_l_SelectedRow}:=SP_ar_TargetProjection{0}
				End if 
				If (SP_ar_TargetProjection{$_l_SelectedRow}#SP_ar_TargetProjection{0})
					SP_al_RecordModified{$_l_SelectedRow}:=1
				End if 
				
				//AL_UpdateArrays (SP_PowerviewTarget;-2)
				
			: ($_t_Column2="SP_ar_PipelineResult")  //Result
				If (SP_ad_TargettoDate{$_l_SelectedRow}>Current date:C33(*))
					SP_ar_PipelineResult{$_l_SelectedRow}:=SP_ar_PipelineResult{0}
				Else 
					If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Manager"))
					Else 
						SP_ar_PipelineResult{$_l_SelectedRow}:=SP_ar_PipelineResult{0}
					End if 
				End if 
				//AL_UpdateArrays (SP_PowerviewTarget;-2)
				If (SP_ar_PipelineResult{$_l_SelectedRow}#SP_ar_PipelineResult{0})
					SP_al_RecordModified{$_l_SelectedRow}:=1
				End if 
				
			: ($_t_Column2="SP_at_PipelineStatus")  //Status
				If (SP_at_PipelineStatus{$_l_SelectedRow}#SP_at_PipelineStatus{0}) & (SP_at_PipelineStatus{$_l_SelectedRow}#"")
					If (SP_ar_PipelineResult{$_l_SelectedRow}>0)
						If (SP_al_SalesProjectionID{$_l_SelectedRow}>0)
							QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=SP_al_SalesProjectionID{$_l_SelectedRow})
							If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
								//AL_ExitCell ($1) ` todo: what?
								SP_at_PipelineStatus{$_l_SelectedRow}:=SP_at_PipelineStatus{0}
								//AL_UpdateArrays (SP_PowerviewTarget;-2)
							Else 
								If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Manager"))
									$_l_StatusRow:=Find in array:C230(SP_at_TargetPipelineStatus; SP_at_PipelineStatus{$_l_SelectedRow})
									SP_al_PipelineStatus{$_l_SelectedRow}:=SP_al_TargetPipelineStatus{$_l_StatusRow}
								Else 
									SP_al_PipelineStatus{$_l_SelectedRow}:=SP_al_TargetPipelineStatus{0}
								End if 
							End if 
							UNLOAD RECORD:C212([SALES_PROJECTION:113])
						Else 
							//AL_ExitCell ($1)` todo: what?
							SP_at_PipelineStatus{$_l_SelectedRow}:=SP_at_PipelineStatus{0}
							//AL_UpdateArrays (SP_PowerviewTarget;-2)
						End if 
						
					Else 
						//the result is not set so its ok
						If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Manager"))
							$_l_StatusRow:=Find in array:C230(SP_at_TargetPipelineStatus; SP_at_PipelineStatus{$_l_SelectedRow})
							SP_at_PipelineStatus{$_l_SelectedRow}:=SP_at_PipelineStatus{$_l_StatusRow}
							//AL_UpdateArrays (SP_PowerviewTarget;-2)
						Else 
							SP_at_PipelineStatus{$_l_SelectedRow}:=SP_at_PipelineStatus{0}
							//AL_UpdateArrays (SP_PowerviewTarget;-2)
						End if 
					End if 
				End if 
				
				
		End case 
		//End if
		
		//End case
		
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.oTARG"; $_t_oldMethodName)
