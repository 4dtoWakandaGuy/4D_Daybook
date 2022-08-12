//%attributes = {}

If (False:C215)
	//Database Method Name:      SD3_GetThreadtoObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_DateDoFrom; 0)
	ARRAY DATE:C224($_ad_DateDoTo; 0)
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	ARRAY LONGINT:C221($_al_PersonorGroup; 0)
	ARRAY LONGINT:C221($_al_SortSequence; 0)
	//ARRAY LONGINT(SD_al_DiaryGroupIDS;0)
	ARRAY TEXT:C222($_at_ActionCode; 0)
	ARRAY TEXT:C222($_at_ActionCodes; 0)
	ARRAY TEXT:C222($_at_ActionDetails; 0)
	ARRAY TEXT:C222($_at_ActionName; 0)
	ARRAY TEXT:C222($_at_ActionNames; 0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_Person; 0)
	ARRAY TEXT:C222($_at_PersonNames; 0)
	ARRAY TEXT:C222($_at_ResultCode; 0)
	ARRAY TEXT:C222($_at_ResultCodes; 0)
	ARRAY TEXT:C222($_at_ResultName; 0)
	ARRAY TEXT:C222($_at_ResultNames; 0)
	//ARRAY TEXT(SD_at_DiaryGroupNames;0)
	ARRAY TIME:C1223($_ati_TimeDoFrom; 0)
	ARRAY TIME:C1223($_ati_TimeDoTo; 0)
	C_LONGINT:C283($_l_CallBack; $_l_Index; $_l_Ref; $_l_ThreadID; $1; $2)
	C_OBJECT:C1216($_obj_DiaryThread; SD3_obj_ThreadItems)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD3_GetThreadtoObject")
If (Count parameters:C259>=1)
	$_l_ThreadID:=$1
	$_l_CallBack:=$2  //we always set the same object name here
	QUERY:C277([DIARY:12]; [DIARY:12]ThreadID:64=$_l_ThreadID)
	ARRAY TEXT:C222($_at_Person; 0)
	ARRAY LONGINT:C221($_al_SortSequence; 0)
	ARRAY TEXT:C222($_at_ActionName; 0)
	ALL RECORDS:C47([PERSONNEL:11])
	SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; $_al_PersonIDS; [PERSONNEL:11]Name:2; $_at_PersonNames)
	SD_groupPrefs
	ALL RECORDS:C47([ACTIONS:13])
	SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_ActionCodes; [ACTIONS:13]Action_Name:2; $_at_ActionNames)
	ALL RECORDS:C47([RESULTS:14])
	SELECTION TO ARRAY:C260([RESULTS:14]Result_Code:1; $_at_ResultCodes; [RESULTS:14]Result_Name:2; $_at_ResultNames)
	SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_DiaryCodes; [DIARY:12]Action_Code:9; $_at_ActionCode; [DIARY:12]Action_Details:10; $_at_ActionDetails; [DIARY:12]Display_Date_From:51; $_ad_DateDoFrom; [DIARY:12]Display_Date_To:52; $_ad_DateDoTo; [DIARY:12]Display_Time_From:53; $_ati_TimeDoFrom; [DIARY:12]Display_Time_To:54; $_ati_TimeDoTo; [DIARY:12]PersonID:56; $_al_PersonorGroup; [DIARY:12]Result_Code:11; $_at_ResultCode)
	ARRAY TEXT:C222($_at_Person; Size of array:C274($_at_DiaryCodes))
	ARRAY TEXT:C222($_at_ActionName; Size of array:C274($_at_DiaryCodes))
	ARRAY TEXT:C222($_at_ResultName; Size of array:C274($_at_DiaryCodes))
	ARRAY LONGINT:C221($_al_SortSequence; Size of array:C274($_at_DiaryCodes))
	
	For ($_l_Index; 1; Size of array:C274($_at_Person))
		If ($_al_PersonorGroup{$_l_Index}>0)
			$_l_Ref:=Find in array:C230($_al_PersonIDS; $_al_PersonorGroup{$_l_Index})
			If ($_l_Ref>0)
				$_at_Person{$_l_Index}:=$_at_PersonNames{$_l_Ref}
			Else 
				$_at_Person{$_l_Index}:="Unknown"
			End if 
		Else 
			$_l_Ref:=Find in array:C230($_at_ResultCodes; Abs:C99($_al_PersonorGroup{$_l_Index}))
			If ($_l_Ref>0)
				$_at_Person{$_l_Index}:=SD_at_DiaryGroupNames{$_l_Index}
				
				
			Else 
				$_at_Person{$_l_Index}:="Unknown Group"
			End if 
		End if 
		$_l_Ref:=Find in array:C230($_at_ActionCodes; $_at_ActionCode{$_l_Index})
		If ($_l_Ref>0)
			$_at_ActionName{$_l_Index}:=$_at_ActionNames{$_l_Ref}
			
		Else 
			$_at_ActionName{$_l_Index}:="Unknown Action"
		End if 
		$_l_Ref:=Find in array:C230(SD_al_DiaryGroupIDS; ($_at_ResultCode{$_l_Index}))
		If ($_l_Ref>0)
			$_at_ResultName{$_l_Index}:=$_at_ResultNames{$_l_Ref}
			
		Else 
			$_at_ResultName{$_l_Index}:="Unknown Outcome"
		End if 
		$_al_SortSequence{$_l_Index}:=GEN_TimeDateStamp($_ad_DateDoFrom{$_l_Index}; $_ati_TimeDoFrom{$_l_Index})
		
		
	End for 
	
	
	OB SET ARRAY:C1227($_obj_DiaryThread; "Diary Codes"; $_at_DiaryCodes)
	OB SET ARRAY:C1227($_obj_DiaryThread; "Details"; $_at_ActionDetails)
	OB SET ARRAY:C1227($_obj_DiaryThread; "DatesFrom"; $_ad_DateDoFrom)
	OB SET ARRAY:C1227($_obj_DiaryThread; "DatesTo"; $_ad_DateDoTo)
	OB SET ARRAY:C1227($_obj_DiaryThread; "TimesFrom"; $_ati_TimeDoFrom)
	OB SET ARRAY:C1227($_obj_DiaryThread; "TimesTo"; $_ati_TimeDoTo)
	OB SET ARRAY:C1227($_obj_DiaryThread; "PersonID"; $_al_PersonorGroup)
	OB SET ARRAY:C1227($_obj_DiaryThread; "DiaryName"; $_at_Person)
	OB SET ARRAY:C1227($_obj_DiaryThread; "ActionCode"; $_at_ActionCode)
	OB SET ARRAY:C1227($_obj_DiaryThread; "ActionName"; $_at_ActionName)
	OB SET ARRAY:C1227($_obj_DiaryThread; "Outcome"; $_at_ResultCode)
	OB SET ARRAY:C1227($_obj_DiaryThread; "OutcomeName"; $_at_ResultName)
	OB SET ARRAY:C1227($_obj_DiaryThread; "Sequence"; $_al_SortSequence)
	SET PROCESS VARIABLE:C370($_l_CallBack; SD3_obj_ThreadItems; $_obj_DiaryThread)
End if 
ERR_MethodTrackerReturn("SD3_GetThreadtoObject"; $_t_oldMethodName)