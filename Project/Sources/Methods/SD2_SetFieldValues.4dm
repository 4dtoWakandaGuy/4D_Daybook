//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_SetFieldValues
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_AutoAddFields; 0)
	ARRAY LONGINT:C221($_al_AutoAddTables; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	//ARRAY LONGINT(SD2_al_InviteeClass;0)
	//ARRAY LONGINT(SD2_al_InviteeStatus;0)
	//ARRAY LONGINT(SD2_al_InviteStati;0)
	//ARRAY LONGINT(SD2_al_RecordID;0)
	//ARRAY LONGINT(SD3_al_AutoAddCodes;0)
	ARRAY TEXT:C222($_at_AutoAddCodes; 0)
	ARRAY TEXT:C222($_at_PersonCodes; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	//ARRAY TEXT(SD_at_inputRelateCode;0)
	//ARRAY TEXT(SD2_aS10_TabactionCodes;0)
	//ARRAY TEXT(SD2_at_ActionCodes;0)
	//ARRAY TEXT(SD2_at_AdditionalPersons;0)
	//ARRAY TEXT(SD2_at_inviteeClass;0)
	//ARRAY TEXT(SD2_at_InviteeEmailAddress;0)
	//ARRAY TEXT(SD2_at_Invitees;0)
	//ARRAY TEXT(SD2_at_InviteeStatus;0)
	//ARRAY TEXT(SD2_at_InviteStati;0)
	//ARRAY TEXT(SD2_at_ResultCodes;0)
	C_BOOLEAN:C305(SD2_bo_CreateThread)
	C_DATE:C307(SD2_D_InputDate; SD2_D_InputDateTo)
	C_LONGINT:C283($_l_ActionPosition; $_l_ConPosition; $_l_CoPosition; $_l_CreateRelations; $_l_DoallDayPosition; $_l_DocHeadPosition; $_l_DocPosition; $_l_DoFromDatePosition; $_l_DoFromTimePosition; $_l_DonePosition; $_l_DoToDatePosition)
	C_LONGINT:C283($_l_DoToTimePosition; $_l_EmailContentPosition; $_l_EmailFromPosition; $_l_EmailIDPosition; $_l_EmailPerPosition; $_l_EmailSubPosition; $_l_IdFieldNumber; $_l_index; $_l_jobPosition; $_l_LinkCodeField; $_l_ParentPosition)
	C_LONGINT:C283($_l_PerPosition; $_l_ProdPosition; $_l_RatePosition; $_l_RelateCodePosition; $_l_RelateFieldPosition; $_l_RelateTablePosition; $_l_ResultPosition; $_l_ResultsPosition; $_l_StatusRow; $_l_SubjectPosition; $_l_UnitPosition)
	C_LONGINT:C283($_l_ValuePosition; SD_l_InputRelatetable; SD2_l_InputAddtotrhead; SD2_l_InputRelateField; SD2_l_LinkToParent; write)
	C_OBJECT:C1216(SD2_obj_DiaryInputData)
	C_POINTER:C301($_ptr_LinkCodeField; $_Ptr_LinkIDField; $_ptr_table)
	C_REAL:C285(SD2_R_inputUnitRate; SD2_R_InputUnits)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; SD_t_inputRelateCode; SD2_t_InputActionCode; SD2_T_InputActionDesc; SD2_t_InputDocumentCode; SD2_t_InputPersonCode; SD2_t_InputResultCode; SD2_T_InputResultDesc; SD2_t_InputSubject)
	C_TIME:C306(SD2_ti_InputTime; SD2_ti_InputTimeTo)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD2_SetFieldValues")
//This method will set field values. When createing a new diary record. This allows the form to be called from any place and set the required data-thuse causing the form to display any page
OB GET PROPERTY NAMES:C1232(SD2_obj_DiaryInputData; $_at_Properties; $_al_PropertyTypes)
If (Size of array:C274($_at_Properties)>0)
	//by using an object this makes it much easier to open up passing data IN to a diary record.
	//note that i have now implemeted below such that it can be called on a not new record so it can be used to update the record
	
	If ([DIARY:12]Action_Code:9="")
		$_l_ActionPosition:=Find in array:C230($_at_Properties; "Action")
		If ($_l_ActionPosition>0)
			[DIARY:12]Action_Code:9:=OB Get:C1224(SD2_obj_DiaryInputData; "Action")
			OB SET:C1220(SD2_obj_DiaryInputData; "Action"; "")
		End if 
		If ([DIARY:12]Action_Code:9="")  //we may have been passed a range of action codes to show in the pop-up.
			$_l_ActionPosition:=Find in array:C230($_at_Properties; "ActionCodes")
			If ($_l_ActionPosition>0)
				OB GET ARRAY:C1229(SD2_obj_DiaryInputData; "ActionCodes"; SD2_at_ActionCodes)
			End if 
		End if 
	End if 
	If ([DIARY:12]Action_Details:10="")
		$_l_ActionPosition:=Find in array:C230($_at_Properties; "ActionDetails")
		If ($_l_ActionPosition>0)
			[DIARY:12]Action_Details:10:=OB Get:C1224(SD2_obj_DiaryInputData; "ActionDetails")
			OB SET:C1220(SD2_obj_DiaryInputData; "ActionDetails"; "")
		End if 
	End if 
	If ([DIARY:12]Result_Code:11="")
		$_l_ResultPosition:=Find in array:C230($_at_Properties; "Result")
		If ($_l_ResultPosition>0)
			[DIARY:12]Result_Code:11:=OB Get:C1224(SD2_obj_DiaryInputData; "Result")
			OB SET:C1220(SD2_obj_DiaryInputData; "Result"; "")
		End if 
		If ([DIARY:12]Result_Code:11="")
			$_l_ResultsPosition:=Find in array:C230($_at_Properties; "ResultCodes")
			If ($_l_ResultsPosition>0)
				OB GET ARRAY:C1229(SD2_obj_DiaryInputData; "ResultCodes"; SD2_at_ResultCodes)
				ARRAY TEXT:C222($_at_ResultCodes; 0)
				OB SET ARRAY:C1227(SD2_obj_DiaryInputData; "ResultCodes"; $_at_ResultCodes)
			End if 
		End if 
	End if 
	If ([DIARY:12]Result_Description:12="")
		$_l_ResultPosition:=Find in array:C230($_at_Properties; "ResultDescription")
		If ($_l_ResultPosition>0)
			[DIARY:12]Result_Description:12:=OB Get:C1224(SD2_obj_DiaryInputData; "ResultDescription")
			OB SET:C1220(SD2_obj_DiaryInputData; "ResultDescription"; "")
		End if 
	End if 
	If ([DIARY:12]Document_Heading:32="")
		$_l_DocHeadPosition:=Find in array:C230($_at_Properties; "DocTitle")
		If ($_l_DocHeadPosition>0)
			[DIARY:12]Document_Heading:32:=OB Get:C1224(SD2_obj_DiaryInputData; "DocTitle")
			OB SET:C1220(SD2_obj_DiaryInputData; "DocTitle"; "")
		End if 
	End if 
	If ([DIARY:12]Document_Code:15="")
		$_l_DocPosition:=Find in array:C230($_at_Properties; "DocumentCode")
		If ($_l_DocPosition>0)
			[DIARY:12]Document_Code:15:=OB Get:C1224(SD2_obj_DiaryInputData; "DocumentCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "DocumentCode"; "")
		End if 
	End if 
	//Booking code
	
	
	
	
	
	
	
	If ([DIARY:12]Company_Code:1="")
		$_l_CoPosition:=Find in array:C230($_at_Properties; "CompanyCode")
		If ($_l_CoPosition>0)
			[DIARY:12]Company_Code:1:=OB Get:C1224(SD2_obj_DiaryInputData; "CompanyCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "CompanyCode"; "")
		End if 
	End if 
	If ([DIARY:12]Contact_Code:2="")
		$_l_ConPosition:=Find in array:C230($_at_Properties; "ContactCode")
		If ($_l_ConPosition>0)
			[DIARY:12]Contact_Code:2:=OB Get:C1224(SD2_obj_DiaryInputData; "ContactCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "ContactCode"; "")
		End if 
	End if 
	If ([DIARY:12]Product_Code:13="")
		$_l_ProdPosition:=Find in array:C230($_at_Properties; "ProductCode")
		If ($_l_ProdPosition>0)
			[DIARY:12]Product_Code:13:=OB Get:C1224(SD2_obj_DiaryInputData; "ProductCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "ProductCode"; "")
		End if 
	End if 
	If ([DIARY:12]Order_Code:26="")
		$_l_jobPosition:=Find in array:C230($_at_Properties; "OrderCode")
		If ($_l_jobPosition>0)
			[DIARY:12]Stage_Code:21:=OB Get:C1224(SD2_obj_DiaryInputData; "OrderCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "OrderCode"; "")
		End if 
	End if 
	If ([DIARY:12]Event_Code:18="")
		$_l_ConPosition:=Find in array:C230($_at_Properties; "EventCode")
		If ($_l_ConPosition>0)
			[DIARY:12]Event_Code:18:=OB Get:C1224(SD2_obj_DiaryInputData; "EventCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "EventCode"; "")
		End if 
	End if 
	If ([DIARY:12]Job_Code:19="")
		$_l_jobPosition:=Find in array:C230($_at_Properties; "JobCode")
		If ($_l_jobPosition>0)
			[DIARY:12]Job_Code:19:=OB Get:C1224(SD2_obj_DiaryInputData; "JobCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "JobCode"; "")
		End if 
	End if 
	If ([DIARY:12]Stage_Code:21="")
		$_l_jobPosition:=Find in array:C230($_at_Properties; "JobStageCode")
		If ($_l_jobPosition>0)
			[DIARY:12]Stage_Code:21:=OB Get:C1224(SD2_obj_DiaryInputData; "JobStageCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "JobStageCode"; "")
		End if 
	End if 
	If ([DIARY:12]Call_Code:25="")
		$_l_DocPosition:=Find in array:C230($_at_Properties; "ServiceCallCode")
		If ($_l_DocPosition>0)
			[DIARY:12]Call_Code:25:=OB Get:C1224(SD2_obj_DiaryInputData; "ServiceCallCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "ServiceCallCode"; "")
		End if 
	End if 
	//if we are relating to any of the virtual relations they must come in the array.
	
	
	
	
	$_l_RelateTablePosition:=Find in array:C230($_at_Properties; "Related Table")
	$_l_RelateFieldPosition:=Find in array:C230($_at_Properties; "Related Field")
	$_l_RelateCodePosition:=Find in array:C230($_at_Properties; "Related Code")
	If ($_l_RelateTablePosition>0) & ($_l_RelateFieldPosition>0) & ($_l_RelateCodePosition>0)
		OB GET ARRAY:C1229(SD2_obj_DiaryInputData; "Related Table"; $_al_AutoAddTables)
		OB GET ARRAY:C1229(SD2_obj_DiaryInputData; "Related Field"; $_al_AutoAddFields)
		OB GET ARRAY:C1229(SD2_obj_DiaryInputData; "Related Code"; $_at_AutoAddCodes)
		If ([DIARY:12]x_ID:50>0)
			For ($_l_CreateRelations; 1; Size of array:C274($_al_AutoAddTables))
				QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xDiaryID:1=[DIARY:12]x_ID:50; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xTableNUM:3=$_al_AutoAddTables{$_l_CreateRelations}; *)
				QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]XRecord_Code:5=$_at_AutoAddCodes{$_l_CreateRelations})
				If (Records in selection:C76([xDiaryRelations:137])=0)
					CREATE RECORD:C68([xDiaryRelations:137])
					[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
					[xDiaryRelations:137]xTableNUM:3:=$_al_AutoAddTables{$_l_CreateRelations}
					$_ptr_LinkCodeField:=Field:C253([xDiaryRelations:137]xTableNUM:3; $_al_AutoAddFields{$_l_CreateRelations})
					If ($_ptr_LinkCodeField->#$_at_AutoAddCodes{$_l_CreateRelations})  //Note the $2  must always be pointer at the code field  not the ID field
						$_ptr_table:=Table:C252([xDiaryRelations:137]xTableNUM:3)
						
						QUERY:C277($_ptr_table->; $_ptr_LinkCodeField->=$_at_AutoAddCodes{$_l_CreateRelations})
					End if 
					$_l_IdFieldNumber:=AA_GetIDFieldNum([xDiaryRelations:137]xTableNUM:3)
					If ($_l_IdFieldNumber>0)
						$_Ptr_LinkIDField:=Field:C253([xDiaryRelations:137]xTableNUM:3; $_l_IdFieldNumber)
						[xDiaryRelations:137]xRecordID:4:=$_Ptr_LinkIDField->
					End if 
					DB_SaveRecord(->[xDiaryRelations:137])
				End if 
				
			End for 
			//Clear the arrays
			ARRAY LONGINT:C221($_al_AutoAddTables; 0)
			ARRAY LONGINT:C221($_al_AutoAddFields; 0)
			ARRAY TEXT:C222($_at_AutoAddCodes; 0)
			//update the object
			OB SET ARRAY:C1227(SD2_obj_DiaryInputData; "Related Table"; $_al_AutoAddTables)
			OB SET ARRAY:C1227(SD2_obj_DiaryInputData; "Related Field"; $_al_AutoAddFields)
			OB SET ARRAY:C1227(SD2_obj_DiaryInputData; "Related Code"; $_at_AutoAddCodes)
			
		End if 
	End if 
	
	If ([DIARY:12]Date_Do_From:4=!00-00-00!)
		$_l_DoFromDatePosition:=Find in array:C230($_at_Properties; "DoFromDate")
		If ($_l_DoFromDatePosition>0)
			[DIARY:12]Date_Do_From:4:=OB Get:C1224(SD2_obj_DiaryInputData; "DoFromDate")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoFromDate"; !00-00-00!)
		End if 
	End if 
	If ([DIARY:12]Date_Do_To:33=!00-00-00!)
		$_l_DoToDatePosition:=Find in array:C230($_at_Properties; "DoToDate")
		If ($_l_DoToDatePosition>0)
			[DIARY:12]Date_Do_To:33:=OB Get:C1224(SD2_obj_DiaryInputData; "DoToDate")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoToDate"; !00-00-00!)
		End if 
	End if 
	If ([DIARY:12]Time_Do_From:6=?00:00:00?)
		$_l_DoFromTimePosition:=Find in array:C230($_at_Properties; "DoFromTime")
		If ($_l_DoFromTimePosition>0)
			[DIARY:12]Time_Do_From:6:=OB Get:C1224(SD2_obj_DiaryInputData; "DoFromTime")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoFromTime"; ?00:00:00?)
			
			
		End if 
	End if 
	If ([DIARY:12]Time_Do_To:35=?00:00:00?)
		$_l_DoToTimePosition:=Find in array:C230($_at_Properties; "DoToTime")
		If ($_l_DoToTimePosition>0)
			[DIARY:12]Time_Do_To:35:=OB Get:C1224(SD2_obj_DiaryInputData; "DoToTime")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoToTime"; ?00:00:00?)
		End if 
	End if 
	If (Not:C34([DIARY:12]DoAllDay:83))
		$_l_DoallDayPosition:=Find in array:C230($_at_Properties; "DoAllDay")
		If ($_l_DoallDayPosition>0)
			[DIARY:12]DoAllDay:83:=OB Get:C1224(SD2_obj_DiaryInputData; "DoAllDay")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoAllDay"; False:C215)
		End if 
	End if 
	If (Not:C34([DIARY:12]Done:14))
		$_l_DonePosition:=Find in array:C230($_at_Properties; "Done")
		If ($_l_DonePosition>0)
			[DIARY:12]Done:14:=OB Get:C1224(SD2_obj_DiaryInputData; "Done")
			OB SET:C1220(SD2_obj_DiaryInputData; "Done"; False:C215)
		End if 
	End if 
	If ([DIARY:12]Date_Done_From:5=!00-00-00!)
		$_l_DoFromDatePosition:=Find in array:C230($_at_Properties; "DoneFromDate")
		If ($_l_DoFromDatePosition>0)
			[DIARY:12]Date_Done_From:5:=OB Get:C1224(SD2_obj_DiaryInputData; "DoneFromDate")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoneFromDate"; !00-00-00!)
		End if 
	End if 
	If ([DIARY:12]Date_Done_To:34=!00-00-00!)
		$_l_DoToDatePosition:=Find in array:C230($_at_Properties; "DoneToDate")
		If ($_l_DoToDatePosition>0)
			[DIARY:12]Date_Done_To:34:=OB Get:C1224(SD2_obj_DiaryInputData; "DoneToDate")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoToDate"; !00-00-00!)
		End if 
	End if 
	If ([DIARY:12]Time_Done_From:7=?00:00:00?)
		$_l_DoFromTimePosition:=Find in array:C230($_at_Properties; "DoneFromTime")
		If ($_l_DoFromTimePosition>0)
			[DIARY:12]Time_Done_From:7:=OB Get:C1224(SD2_obj_DiaryInputData; "DoneFromTime")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoneFromTime"; ?00:00:00?)
			
		End if 
	End if 
	If ([DIARY:12]Time_Done_To:36=?00:00:00?)
		$_l_DoToTimePosition:=Find in array:C230($_at_Properties; "DoneToTime")
		If ($_l_DoToTimePosition>0)
			[DIARY:12]Time_Done_To:36:=OB Get:C1224(SD2_obj_DiaryInputData; "DoneToTime")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoneToTime"; ?00:00:00?)
		End if 
	End if 
	
	If (Not:C34([DIARY:12]DoneAllDay:84))
		$_l_DoallDayPosition:=Find in array:C230($_at_Properties; "DoneAllDay")
		If ($_l_DoallDayPosition>0)
			[DIARY:12]DoneAllDay:84:=OB Get:C1224(SD2_obj_DiaryInputData; "DoneAllDay")
			OB SET:C1220(SD2_obj_DiaryInputData; "DoneAllDay"; False:C215)
		End if 
	End if 
	
	
	If ([DIARY:12]Person:8="")
		$_l_PerPosition:=Find in array:C230($_at_Properties; "PersonCode")
		If ($_l_PerPosition>0)
			[DIARY:12]Person:8:=OB Get:C1224(SD2_obj_DiaryInputData; "PersonCode")
			OB SET:C1220(SD2_obj_DiaryInputData; "PersonCode"; "")
		End if 
	End if 
	If ([DIARY:12]Person:8="")  //might be multiple people
		$_l_PerPosition:=Find in array:C230($_at_Properties; "PersonCodes")
		If ($_l_PerPosition>0)
			OB GET ARRAY:C1229(SD2_obj_DiaryInputData; "PersonCodes"; $_at_PersonCodes)
			If (Size of array:C274($_at_PersonCodes)>0)
				For ($_l_index; 1; Size of array:C274($_at_PersonCodes))
					If ($_l_index=1)
						[DIARY:12]Person:8:=$_at_PersonCodes{1}
					Else 
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_at_PersonCodes{$_l_index})
						//Being a new record these will be stored in the array-
						APPEND TO ARRAY:C911(SD2_at_Invitees; [PERSONNEL:11]Name:2)
						APPEND TO ARRAY:C911(SD2_al_InviteeClass; 0)
						APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Internal")
						APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; [PERSONNEL:11]Email_Address:36)
						APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
						$_l_StatusRow:=Find in array:C230(SD2_al_InviteStati; SD2_al_InviteeStatus{Size of array:C274(SD2_al_InviteeStatus)})
						APPEND TO ARRAY:C911(SD2_at_InviteeStatus; SD2_at_InviteStati{$_l_StatusRow})
						APPEND TO ARRAY:C911(SD2_al_RecordID; 0)
					End if 
				End for 
				ARRAY TEXT:C222($_at_PersonCodes; 0)
				OB SET ARRAY:C1227(SD2_obj_DiaryInputData; "PersonCodes"; $_at_PersonCodes)
			End if 
			
		End if 
	End if 
	If ([DIARY:12]Budget_Units:70=0)
		$_l_UnitPosition:=Find in array:C230($_at_Properties; "BudgetUnits")
		If ($_l_UnitPosition>0)
			[DIARY:12]Budget_Units:70:=OB Get:C1224(SD2_obj_DiaryInputData; "BudgetUnits")
			OB SET:C1220(SD2_obj_DiaryInputData; "BudgetUnits"; 0)
			
		End if 
	End if 
	If ([DIARY:12]Units:20=0)
		$_l_UnitPosition:=Find in array:C230($_at_Properties; "Units")
		If ($_l_UnitPosition>0)
			[DIARY:12]Units:20:=OB Get:C1224(SD2_obj_DiaryInputData; "Units")
			OB SET:C1220(SD2_obj_DiaryInputData; "Units"; 0)
			
		End if 
	End if 
	If ([DIARY:12]Charge_Rate:22=0)
		$_l_RatePosition:=Find in array:C230($_at_Properties; "ChargeRate")
		If ($_l_RatePosition>0)
			[DIARY:12]Charge_Rate:22:=OB Get:C1224(SD2_obj_DiaryInputData; "ChargeRate")
			OB SET:C1220(SD2_obj_DiaryInputData; "ChargeRate"; 0)
			
		End if 
	End if 
	If ([DIARY:12]Cost_Rate:74=0)
		$_l_UnitPosition:=Find in array:C230($_at_Properties; "CostRate")
		If ($_l_PerPosition>0)
			[DIARY:12]Cost_Rate:74:=OB Get:C1224(SD2_obj_DiaryInputData; "CostRate")
			OB SET:C1220(SD2_obj_DiaryInputData; "CostRate"; 0)
			
		End if 
	End if 
	If ([DIARY:12]Cost_Value:75=0)
		$_l_ValuePosition:=Find in array:C230($_at_Properties; "CostValue")
		If ($_l_ValuePosition>0)
			[DIARY:12]Cost_Value:75:=OB Get:C1224(SD2_obj_DiaryInputData; "CostValue")
			OB SET:C1220(SD2_obj_DiaryInputData; "CostValue"; 0)
		End if 
	End if 
	
	
	
	If ([DIARY:12]Subject:63="")
		$_l_SubjectPosition:=Find in array:C230($_at_Properties; "Subject")
		If ($_l_SubjectPosition>0)
			[DIARY:12]Subject:63:=OB Get:C1224(SD2_obj_DiaryInputData; "Subject")
			OB SET:C1220(SD2_obj_DiaryInputData; "Subject"; "")
		End if 
	End if 
	If ([DIARY:12]ThreadID:64=0)
		$_l_SubjectPosition:=Find in array:C230($_at_Properties; "ThreadID")
		If ($_l_SubjectPosition>0)
			[DIARY:12]ThreadID:64:=OB Get:C1224(SD2_obj_DiaryInputData; "ThreadID")
			OB SET:C1220(SD2_obj_DiaryInputData; "ThreadID"; 0)
		End if 
	End if 
	If (Not:C34([DIARY:12]x_Is_Thread:68))
		$_l_SubjectPosition:=Find in array:C230($_at_Properties; "IsThread")
		If ($_l_SubjectPosition>0)
			[DIARY:12]ThreadID:64:=OB Get:C1224(SD2_obj_DiaryInputData; "IsThread")
			OB SET:C1220(SD2_obj_DiaryInputData; "IsThread"; False:C215)
		End if 
	End if 
	If ([DIARY:12]Data_Source_Table:49=0)
		$_l_ParentPosition:=Find in array:C230($_at_Properties; "KeyParent")
		If ($_l_SubjectPosition>0)
			[DIARY:12]Data_Source_Table:49:=OB Get:C1224(SD2_obj_DiaryInputData; "KeyParent")
			OB SET:C1220(SD2_obj_DiaryInputData; "KeyParent"; 0)
		End if 
	End if 
	If (UTIL_isUUIDNil([DIARY:12]CampaignUUID:80))
		
		$_l_ParentPosition:=Find in array:C230($_at_Properties; "Campaign")
		If ($_l_SubjectPosition>0)
			[DIARY:12]CampaignUUID:80:=OB Get:C1224(SD2_obj_DiaryInputData; "Campaign")
			OB SET:C1220(SD2_obj_DiaryInputData; "Campaign"; ("0"*32))
		End if 
	End if 
	///
	If ([DIARY:12]Email_From:38="")
		$_l_EmailFromPosition:=Find in array:C230($_at_Properties; "EmailFrom")
		If ($_l_EmailFromPosition>0)
			[DIARY:12]Email_From:38:=OB Get:C1224(SD2_obj_DiaryInputData; "EmailFrom")
			OB SET:C1220(SD2_obj_DiaryInputData; "EmailFrom"; "")
		End if 
	End if 
	If ([DIARY:12]Email_ID:41=0)
		$_l_EmailIDPosition:=Find in array:C230($_at_Properties; "EmailID")
		If ($_l_EmailIDPosition>0)
			[DIARY:12]Email_ID:41:=OB Get:C1224(SD2_obj_DiaryInputData; "EmailID")
			OB SET:C1220(SD2_obj_DiaryInputData; "EmailID"; 0)
		End if 
	End if 
	If ([DIARY:12]Email_Person:39="")
		$_l_EmailPerPosition:=Find in array:C230($_at_Properties; "EmailPerson")
		If ($_l_EmailPerPosition>0)
			[DIARY:12]Email_Person:39:=OB Get:C1224(SD2_obj_DiaryInputData; "EmailPerson")
			OB SET:C1220(SD2_obj_DiaryInputData; "EmailPerson"; "")
		End if 
	End if 
	If ([DIARY:12]Email_Subject:40="")
		$_l_EmailSubPosition:=Find in array:C230($_at_Properties; "EmailSubject")
		If ($_l_EmailSubPosition>0)
			[DIARY:12]Email_Subject:40:=OB Get:C1224(SD2_obj_DiaryInputData; "EmailSubject")
			OB SET:C1220(SD2_obj_DiaryInputData; "EmailSubject"; "")
		End if 
	End if 
	If ([DIARY:12]Email_Text:42="")
		$_l_EmailContentPosition:=Find in array:C230($_at_Properties; "EmailContent")
		If ($_l_EmailContentPosition>0)
			[DIARY:12]Email_Text:42:=OB Get:C1224(SD2_obj_DiaryInputData; "EmailContent")
			OB SET:C1220(SD2_obj_DiaryInputData; "EmailContent"; "")
		End if 
	End if 
	
	
	
	
	//originator
	//personal priority
	//priority
	
	//scriptcode<--this is for when the diary is supposed to run a macro
	//sequenceactioned
	
	//status
	///timechecked
	///wpdataentry
	//write(wpData)
	//x_Close_opeitons
	//x_open_Parent
	//x_PlaceofAction
	//x_Reoccusange
	//x_diaryClass
	//x_DiaryForm
	//x_DiaryLocations
	//x_ShowRelatedTable
	
	
	
	
Else 
	
	If (SD2_t_InputActionCode#"")
		[DIARY:12]Action_Code:9:=SD2_t_InputActionCode
		SD2_t_InputActionCode:=""
	Else 
		If (Not:C34(Undefined:C82(SD2_at_ActionCodes)))
			If (Size of array:C274(SD2_at_ActionCodes)>0)
				COPY ARRAY:C226(SD2_at_ActionCodes; SD2_aS10_TabactionCodes)
			End if 
		End if 
	End if 
	If (SD2_T_InputActionDesc#"")
		[DIARY:12]Action_Details:10:=SD2_T_InputActionDesc
		SD2_T_InputActionDesc:=""
	End if 
	If (SD2_t_InputResultCode#"")
		[DIARY:12]Result_Code:11:=SD2_t_InputResultCode
		SD2_t_InputResultCode:=""
	End if 
	If (SD2_T_InputResultDesc#"")
		[DIARY:12]Result_Description:12:=SD2_T_InputResultDesc
		SD2_T_InputResultDesc:=""
	End if 
	//Not Note we also need here a way to relate a group of records-the following lines only allow for  ONE
	//If (Not(Undefined(SD_at_inputRelateCode)))
	//If (Size of array(SD_at_inputRelateCode)>0)
	
	//End if 
	
	//End if 
	If (SD_l_InputRelatetable>0)
		If (SD2_l_InputRelateField>0)
			If (SD_t_inputRelateCode#"")
			End if 
		End if 
	End if 
	If (SD2_D_InputDate#!00-00-00!)
		[DIARY:12]Date_Do_From:4:=SD2_D_InputDate
		SD2_D_InputDate:=!00-00-00!
	End if   // not that the form method will put this in date to to and if a done item will put it in done
	If (SD2_D_InputDateto#!00-00-00!)
		[DIARY:12]Date_Do_To:33:=SD2_D_InputDateto
		SD2_D_InputDateto:=!00-00-00!
	End if 
	If (SD2_ti_InputTime#?00:00:00?)
		[DIARY:12]Time_Do_From:6:=SD2_ti_InputTime
		SD2_ti_InputTime:=?00:00:00?
	End if   // not that the form method will put this in tim to to and if a done item will put it in done
	If (SD2_ti_InputTimeTo#?00:00:00?)
		[DIARY:12]Time_Do_To:35:=SD2_ti_InputTimeTo
		SD2_ti_InputTimeTo:=?00:00:00?
	End if 
	If (SD2_t_InputDocumentCode#"")
		//Here make sure the document code is not a template-if it is duplicate and make a document
		[DIARY:12]Document_Code:15:=SD2_t_InputDocumentCode
		SD2_t_InputDocumentCode:=""
	End if 
	
	If (SD2_t_InputPersonCode#"")  //note only set this with a person if you want it added to only to that person
		//if you want it going into the person who added it(using the action code rules then use SD2_t_WhoseDiary and it will get added to that person if it should be
		[DIARY:12]Person:8:=SD2_t_InputPersonCode
		SD2_t_InputPersonCode:=""
	Else 
		//what about multiple people!
		If (Size of array:C274(SD2_at_AdditionalPersons)>0)  //Make sure this form is only called through processes that set this
			For ($_l_index; 1; Size of array:C274(SD2_at_AdditionalPersons))
				If ($_l_index=1)
					[DIARY:12]Person:8:=SD2_at_AdditionalPersons{1}
				Else 
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD2_at_AdditionalPersons{$_l_index})
					//Being a new record these will be stored in the array-
					APPEND TO ARRAY:C911(SD2_at_Invitees; [PERSONNEL:11]Name:2)
					APPEND TO ARRAY:C911(SD2_al_InviteeClass; 0)
					APPEND TO ARRAY:C911(SD2_at_inviteeClass; "Internal")
					APPEND TO ARRAY:C911(SD2_at_InviteeEmailAddress; [PERSONNEL:11]Email_Address:36)
					APPEND TO ARRAY:C911(SD2_al_InviteeStatus; 0)
					$_l_StatusRow:=Find in array:C230(SD2_al_InviteStati; SD2_al_InviteeStatus{Size of array:C274(SD2_al_InviteeStatus)})
					APPEND TO ARRAY:C911(SD2_at_InviteeStatus; SD2_at_InviteStati{$_l_StatusRow})
					APPEND TO ARRAY:C911(SD2_al_RecordID; 0)
				End if 
			End for 
			
		Else 
			[DIARY:12]Person:8:=<>PER_t_CurrentUserInitials
		End if 
	End if 
	If (SD2_R_InputUnits#0)
		[DIARY:12]Units:20:=SD2_R_InputUnits
		SD2_R_InputUnits:=0
		
	End if 
	If (SD2_R_inputUnitRate#0)
		[DIARY:12]Charge_Rate:22:=SD2_R_inputUnitRate
		SD2_R_inputUnitRate:=0
	End if 
	If (SD2_t_InputSubject#"")
		[DIARY:12]Subject:63:=SD2_t_InputSubject
	End if 
	
	If (SD2_l_InputAddtotrhead>0)
		[DIARY:12]ThreadID:64:=SD2_l_InputAddtotrhead
		SD2_l_InputAddtotrhead:=0
	End if 
	If (SD2_bo_CreateThread)
		[DIARY:12]x_Is_Thread:68:=True:C214
		SD2_bo_CreateThread:=False:C215
	End if 
	If (SD2_l_LinkToParent>0)  //The Key related table number
		[DIARY:12]Data_Source_Table:49:=SD2_l_LinkToParent
		//Note this is a badly named field-it only contains the TABLE number
		SD2_l_LinkToParent:=0
		//this is needed if the action code is going to tell it to open the parent record but may also be filled in anyway(like a key relation)
	End if 
End if 
ERR_MethodTrackerReturn("SD2_SetFieldValues"; $_t_oldMethodName)
