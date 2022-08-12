//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_InB2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/11/2009 10:26:04If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD2_al_DiaryFieldNumber;0)
	//ARRAY LONGINT(SD2_al_RelationshipFields;0)
	//ARRAY LONGINT(SD2_al_RelationshipTables;0)
	//ARRAY TEXT(SD2_at_CurrentDiaryInitials;0)
	//ARRAY TEXT(SD2_at_RelationshipCodes;0)
	//ARRAY TEXT(SD2_at_RelationShipSelector;0)
	C_BOOLEAN:C305(<>SYS_bo_DefaultEntry; SD2_bo_LoadRelationsFromArray; vDontAutoCalcTimeUnits)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283(<>SD3_l_DiaryVersion; <>WT_CP; <>WT_CT; $_l_Index; $_l_RelationshipRow; vCP; vCT)
	C_POINTER:C301($_ptr_Field)
	C_TEXT:C284(<>AutoFile; <>CallCode; <>CompCode; <>ContCode; <>JobCode; <>OrderCode; <>PER_t_CurrentUserInitials; <>SYS_t_MessageAction; $_t_oldMethodName; $_t_RelationshipName; DB_t_CurrentFormUsage)
	C_TEXT:C284(DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DIA_t_actionName; DOC_t_ActionName; SD_t_CallingCompanyCode; SD_t_CallingContactCode; SD_t_DiaryActionCode; SD_t_DiaryPersonInitials; SYS_t_AccessType; vCompCode; vContCode)
	C_TEXT:C284(vProduct; vResult)
	C_TIME:C306(<>SYS_ti_DefaultTimeUnits; vHours)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_InB2")

If (SD2_bo_LoadRelationsFromArray)
	//Related records are in an array-this will only be on adding a new record
	For ($_l_Index; 1; Size of array:C274(SD2_al_RelationshipFields))
		If (SD2_al_RelationshipFields{$_l_Index}>0)
			$_t_RelationshipName:=SD2_GetRelationshipname(SD2_al_RelationshipTables{$_l_Index}; SD2_al_RelationshipFields{$_l_Index})
			If ($_t_RelationshipName#"")
				$_l_RelationshipRow:=Find in array:C230(SD2_at_RelationShipSelector; $_t_RelationshipName)
				If ($_l_RelationshipRow>0)
					If (SD2_al_DiaryFieldNumber{$_l_RelationshipRow}#0)
						$_ptr_Field:=Field:C253(Table:C252(->[DIARY:12]); SD2_al_DiaryFieldNumber{$_l_RelationshipRow})
						$_ptr_Field->:=SD2_at_RelationshipCodes{$_l_Index}
					Else 
						//not a field in the diary
						
					End if 
				End if 
			End if 
		End if 
	End for 
	
End if 
SD2_bo_LoadRelationsFromArray:=False:C215

//******************************** added 22/05/07 -kmw ********************************

If (([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Action_Code:9=""))
	vDontAutoCalcTimeUnits:=False:C215  //ie DO auto-calc Time Units without asking user
Else   //not a brand new time record
	//Time Units get auto-calculated from date/time done fields (without asking user) until such time as user explicity edits (from then on user will be asked if they want changes to date/time done fields to effect Time Units).
	vDontAutoCalcTimeUnits:=True:C214  //ie DON'T auto-calc Time Units without asking user
End if 

//********************************************************************************

If ([DIARY:12]Diary_Code:3="")
	DiarySetCode
End if 
If (([DIARY:12]Date_Do_From:4=!00-00-00!) & ([DIARY:12]Action_Code:9=""))
	[DIARY:12]Date_Do_From:4:=<>DB_d_CurrentDate
	[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
	If (SD_t_DiaryPersonInitials#"")
		If (SD_t_DiaryPersonInitials#"MULTI")
			[DIARY:12]Person:8:=SD_t_DiaryPersonInitials
		Else 
			SD_t_DiaryPersonInitials:=""
			If (Size of array:C274(SD2_at_CurrentDiaryInitials)>0)
				[DIARY:12]Person:8:=SD2_at_CurrentDiaryInitials{1}
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD2_at_CurrentDiaryInitials{1})
				READ WRITE:C146([DIARY_ITEMOWNERS:106])
				CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
				[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=[DIARY:12]Diary_Code:3
				[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=[PERSONNEL:11]Personnel_ID:48
				[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=1
				[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item owner"
				DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
				UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
				READ ONLY:C145([DIARY_ITEMOWNERS:106])
				
				//add the others here
				For ($_l_Index; 2; Size of array:C274(SD2_at_CurrentDiaryInitials))
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD2_at_CurrentDiaryInitials{$_l_Index})
					READ WRITE:C146([DIARY_ITEMOWNERS:106])
					CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
					[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=[DIARY:12]Diary_Code:3
					[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=[PERSONNEL:11]Personnel_ID:48
					[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=2
					[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Person"
					DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
					UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
					READ ONLY:C145([DIARY_ITEMOWNERS:106])
				End for 
				
			End if 
		End if 
	End if 
	If (SD_t_DiaryActionCode#"")
		[DIARY:12]Action_Code:9:=SD_t_DiaryActionCode
		SD_t_DiaryActionCode:=""
		RELATE ONE:C42([DIARY:12]Action_Code:9)
		DIA_t_actionName:=[ACTIONS:13]Action_Name:2
		DOC_t_ActionName:=[ACTIONS:13]Action_Name:2
	End if 
	
	SD_t_DiaryPersonInitials:=""
	Case of 
		: (DB_t_CurrentFormUsage="Tech")
			Diary_InBTech
		: (DB_t_CurrentFormUsage="CallBack")
			Diary_InBCB
		: (DB_t_CurrentFormUsage="Time")
			Diary_InBTime
		: (DB_t_CurrentFormUsage="Add@")
			Diary_InBAdd
		: (DB_t_CurrentFormUsage="Cal")
			[DIARY:12]Date_Do_From:4:=vDate
	End case 
	If (DB_t_CurrentFormUsage#"Add@")
		Case of 
			: (vCP=1)
				[DIARY:12]Company_Code:1:=vCompCode
				vCompCode:=""
			: (<>WT_CP=1)
				[DIARY:12]Company_Code:1:=vCompCode
				vCompCode:=""
		End case 
		Case of 
			: (vCT=1)
				[DIARY:12]Company_Code:1:=vCompCode
				[DIARY:12]Contact_Code:2:=vContCode
				vContCode:=""
				vCompCode:=""
			: (<>WT_CT=1)
				[DIARY:12]Company_Code:1:=vCompCode
				[DIARY:12]Contact_Code:2:=vContCode
				vContCode:=""
				vCompCode:=""
		End case 
	End if 
	DIA_t_actionName:=""
	vResult:=""
	vProduct:=""
	vHours:=?00:00:00?
	If (SD_t_CallingCompanyCode#"") & ([DIARY:12]Company_Code:1="")
		[DIARY:12]Company_Code:1:=SD_t_CallingCompanyCode
		SD_t_CallingCompanyCode:=""
	End if 
	If ([DIARY:12]Contact_Code:2="") & (SD_t_CallingContactCode#"")
		[DIARY:12]Contact_Code:2:=SD_t_CallingContactCode
		SD_t_CallingContactCode:=""
	End if 
	If ((<>SYS_bo_DefaultEntry) & (DB_t_CurrentFormUsage#"Add@") & (DB_t_CurrentFormUsage#"Time"))
		If ((<>CompCode#"") & ([DIARY:12]Company_Code:1=""))
			[DIARY:12]Company_Code:1:=<>CompCode
			RELATE ONE:C42([DIARY:12]Company_Code:1)
			If (<>ContCode="")
				Check_ContDef(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2)
			End if 
			[DIARY:12]Status:30:=[COMPANIES:2]Status:12
		End if 
		If ((<>ContCode#"") & ([DIARY:12]Contact_Code:2=""))
			[DIARY:12]Contact_Code:2:=<>ContCode
			RELATE ONE:C42([DIARY:12]Contact_Code:2)
			If ((<>CompCode="") & (Not:C34(Check_ContCorr(->[DIARY:12]Company_Code:1; ->[DIARY:12]Contact_Code:2))))
				[DIARY:12]Company_Code:1:=[CONTACTS:1]Company_Code:1
			End if 
		End if 
		If ((<>OrderCode#"") & ([DIARY:12]Order_Code:26="") & (<>AutoFile="Orders"))
			[DIARY:12]Order_Code:26:=<>OrderCode
		End if 
		If ((<>JobCode#"") & ([DIARY:12]Job_Code:19="") & ((<>AutoFile="Jobs")))
			[DIARY:12]Job_Code:19:=<>JobCode
		End if 
		If ((<>CallCode#"") & ([DIARY:12]Call_Code:25="") & (<>AutoFile="Calls"))
			[DIARY:12]Call_Code:25:=<>CallCode
		End if 
		
	End if 
Else 
	If ([DIARY:12]Action_Code:9=<>SYS_t_MessageAction)
		If ([DIARY:12]Result_Code:11="*INF")
			[DIARY:12]Result_Code:11:="OK"
			[DIARY:12]Done:14:=True:C214
			[DIARY:12]Date_Done_From:5:=<>DB_d_CurrentDate
			[DIARY:12]Date_Done_To:34:=<>DB_d_CurrentDate
			//If (◊WT_SuperDiary=1)
			//[DIARY]Time Done From:=vWT_TimeDoFrom
			//Else
			[DIARY:12]Time_Done_From:7:=Current time:C178
			//End if
			[DIARY:12]Time_Done_To:36:=[DIARY:12]Time_Done_From:7
		End if 
	End if 
	If (SYS_t_AccessType#"Q") | (True:C214)
		RELATE ONE:C42([DIARY:12]Action_Code:9)
		DIA_t_actionName:=[ACTIONS:13]Action_Name:2
		DOC_t_ActionName:=[ACTIONS:13]Action_Name:2
		If ([DIARY:12]Result_Code:11#"")
			RELATE ONE:C42([DIARY:12]Result_Code:11)
			vResult:=[RESULTS:14]Result_Name:2
		Else 
			vResult:=""
		End if 
		If ([DIARY:12]Product_Code:13#"")
			RELATE ONE:C42([DIARY:12]Product_Code:13)
			vProduct:=[PRODUCTS:9]Product_Name:2
		Else 
			vProduct:=""
		End if 
		vHours:=Time:C179(Time string:C180([DIARY:12]Units:20*<>SYS_ti_DefaultTimeUnits))
	End if 
End if 

If ([DIARY:12]Date_Do_To:33=!00-00-00!)
	[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
	Case of 
		: (([DIARY:12]Time_Do_To:35=?00:00:00?) & ([DIARY:12]Time_Do_From:6#?00:00:00?))
			[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
			//: (◊WT_SuperDiary=1)
			//[DIARY]Time Done From:=◊WT_TimeDoFrom
	End case 
End if 
ERR_MethodTrackerReturn("Diary_InB2"; $_t_oldMethodName)
