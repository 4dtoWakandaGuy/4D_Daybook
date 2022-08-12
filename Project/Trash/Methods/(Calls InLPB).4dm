//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Calls_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ProblemTypeIDS; 0)
	//ARRAY LONGINT(SC_al_ProblemTypeIdsTemp;0)
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY LONGINT(SVS_al_IntServiceLocations;0)
	//ARRAY LONGINT(SVS_al_InvDeliveryIDS;0)
	//ARRAY LONGINT(SVS_al_PriorityNumbers;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	//ARRAY TEXT(<>SYS_at_RecStateNames;0)
	//ARRAY TEXT(SC_at_ProblemTypes;0)
	//ARRAY TEXT(SC_at_ProbtypesNames;0)
	//ARRAY TEXT(SC_at_TimeFrame;0)
	//ARRAY TEXT(SD_at_StatusCodes;0)
	//ARRAY TEXT(SD_at_StatusNM;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	//ARRAY TEXT(SVS_at_IncDeliveryNames;0)
	//ARRAY TEXT(SVS_at_priorityNames;0)
	//ARRAY TEXT(SVS_at_ResponseTypes;0)
	//ARRAY TEXT(SVS_at_StateCodes;0)
	//ARRAY TEXT(SVS_at_StatesNames;0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_Callpriorityposition; $_l_DayCount; $_l_HourCount; $_l_Hours; $_l_Index; $_l_Index2; $_l_ListID; $_l_MinuteCount; $_l_NextItemID; $_l_OneDayinSeconds; $_l_OneHourinSeconds)
	C_LONGINT:C283($_l_OneMinuteinSeconds; $_l_ServiceTable; $_l_StatusRow; $_l_SublistID; $_l_TimeInSeconds; SC_l_ProblemTypes; SVS_at_ServiceLocations; SVS_l_ChargableCall; SVS_l_DefaultResponseTiming; SVS_l_DefaultResponseType; SVS_l_MaxResponseTime)
	C_LONGINT:C283(vSC; xApply)
	C_REAL:C285(SVS_l_DeliveryListID; SVS_l_MaxResonseTime; SVS_l_TimeTakenDays; SVS_l_TimeTakenHours; SVS_l_TimeTakenMinutes; vTot)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $_t_ResponseType; DB_t_CallOnCloseorSave; SVS_t_CallPriority; SVS_t_Elapsedtimelabel; SVS_t_StateName; vButtDisSC; vJobCode; vStage)
	C_TIME:C306(<>SYS_ti_DefaultSVSResponse)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InLPB")
//Calls_InLPB
//SC_at_TimeFrame
ARRAY TEXT:C222(SVS_at_ResponseTypes; 3)
SVS_at_ResponseTypes{1}:="Minutes"
SVS_at_ResponseTypes{2}:="Hours"
SVS_at_ResponseTypes{3}:="Days"
ARRAY TEXT:C222(SC_at_TimeFrame; 0)
COPY ARRAY:C226(SVS_at_ResponseTypes; SC_at_TimeFrame)

ARRAY TEXT:C222(SD_at_StatusNM; 0)
ARRAY TEXT:C222(SD_at_StatusCodes; 0)
If ([SERVICE_CALLS:20]Call_Code:4="")
	Calls_Code
End if 
//SVS_at_ServiceTab:=1
//GOTO PAGE(1)
SVS_LoadPreferences
SVS_LoadServiceLocations

SVS_t_StateName:=SVS_GetStateName(->[SERVICE_CALLS:20]Table_State:29; [SERVICE_CALLS:20]Resolved:9)


ARRAY TEXT:C222(SVS_at_StateCodes; 0)
ARRAY TEXT:C222(SVS_at_StatesNames; 0)
If (Size of array:C274(<>SYS_at_RecStateCodes)>Table:C252(->[SERVICE_CALLS:20]))
	//It should be
	$_l_ServiceTable:=Table:C252(->[SERVICE_CALLS:20])
	
	For ($_l_Index; 1; Size of array:C274(<>SYS_at_RecStateCodes{$_l_ServiceTable}))
		APPEND TO ARRAY:C911(SVS_at_StatesNames; Substring:C12(<>SYS_at_RecStateNames{$_l_ServiceTable}{$_l_Index}; 1; 51))
		APPEND TO ARRAY:C911(SVS_at_StateCodes; (String:C10($_l_ServiceTable; "000"))+<>SYS_at_RecStateCodes{$_l_ServiceTable}{$_l_Index})
		
	End for 
	$_l_StatusRow:=Find in array:C230(SVS_at_StateCodes; [SERVICE_CALLS:20]Table_State:29)
	If ($_l_StatusRow>0)
		SVS_at_StatesNames:=$_l_StatusRow
	Else 
		SVS_at_StatesNames:=0
	End if 
End if 

Calls_InLPB2
SVS_l_ChargableCall:=0
If ([SERVICE_CALLS:20]Charge:8="Y")
	SVS_l_ChargableCall:=1
End if 
If (([SERVICE_CALLS:20]Your_Order_Number:25#"") & ([SERVICE_CALLS:20]Your_Order_Number:25#"CHARGE") & ([SERVICE_CALLS:20]Your_Order_Number:25#"CONTRACT"))
	//DISABLE BUTTON(SVS_l_ChargableCall)
End if 

QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[SERVICE_CALLS:20]Call_Code:4)
SC_LoadDiary
If ([SERVICE_CALLS:20]Problem_Code:14="")
	If (Is a list:C621(SC_l_ProblemTypes))
		CLEAR LIST:C377(SC_l_ProblemTypes; *)
	End if 
	SC_l_ProblemTypes:=New list:C375
	ARRAY TEXT:C222(SC_at_ProbtypesNames; 0)
	ARRAY TEXT:C222(SC_at_ProblemTypes; 0)
	ARRAY LONGINT:C221(SC_al_ProblemTypeIdsTemp; 0)
	QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]ProblemTypeID:3>0)
	DISTINCT VALUES:C339([PROBLEMS:22]ProblemTypeID:3; $_al_ProblemTypeIDS)
	SVS_LoadproblemTypes
	$_l_NextItemID:=0
	For ($_l_Index; 1; Size of array:C274(SD2_al_ProblemTypeIDs))
		$_l_StatusRow:=Find in array:C230($_al_ProblemTypeIDS; SD2_al_ProblemTypeIDs{$_l_Index})
		If ($_l_StatusRow>0)
			QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]ProblemTypeID:3=SD2_al_ProblemTypeIDs{$_l_Index})
			$_l_SublistID:=New list:C375
			$_l_NextItemID:=$_l_NextItemID+1
			For ($_l_Index2; 1; Records in selection:C76([PROBLEMS:22]))
				APPEND TO LIST:C376($_l_SublistID; [PROBLEMS:22]Problem_Name:2; -($_l_NextItemID))
				APPEND TO ARRAY:C911(SC_at_ProbtypesNames; [PROBLEMS:22]Problem_Name:2)
				APPEND TO ARRAY:C911(SC_at_ProblemTypes; [PROBLEMS:22]Problem_Code:1)
				APPEND TO ARRAY:C911(SC_al_ProblemTypeIdsTemp; $_l_NextItemID)
				NEXT RECORD:C51([PROBLEMS:22])
				
			End for 
			APPEND TO LIST:C376(SC_l_ProblemTypes; SD2_at_ProblemTypeNames{$_l_Index}; SD2_al_ProblemTypeIDs{$_l_Index}; $_l_SublistID; True:C214)
		End if 
	End for 
	QUERY:C277([PROBLEMS:22]; [PROBLEMS:22]ProblemTypeID:3=0)
	$_l_SublistID:=New list:C375
	$_l_NextItemID:=$_l_NextItemID+1
	For ($_l_Index2; 1; Records in selection:C76([PROBLEMS:22]))
		APPEND TO LIST:C376($_l_SublistID; [PROBLEMS:22]Problem_Name:2; -($_l_NextItemID))
		APPEND TO ARRAY:C911(SC_at_ProbtypesNames; [PROBLEMS:22]Problem_Name:2)
		APPEND TO ARRAY:C911(SC_at_ProblemTypes; [PROBLEMS:22]Problem_Code:1)
		APPEND TO ARRAY:C911(SC_al_ProblemTypeIdsTemp; $_l_NextItemID)
		
		NEXT RECORD:C51([PROBLEMS:22])
		
	End for 
	$_l_NextItemID:=$_l_NextItemID+1
	APPEND TO LIST:C376(SC_at_ProblemTypes; "Others"; -($_l_NextItemID); $_l_SublistID; True:C214)
	
Else 
	OBJECT SET VISIBLE:C603(SC_l_ProblemTypes; False:C215)
End if 


SC_LoadCharges
SC_LoadProducts
QUERY:C277([SERVICE_CALLS_PRODUCTS:152]; [SERVICE_CALLS_PRODUCTS:152]Service_Call_Code:8=[SERVICE_CALLS:20]Call_Code:4)
vJobCode:=[SERVICE_CALLS:20]Company_Code:1
If ([SERVICE_CALLS:20]Call_Date:5=!00-00-00!)
	[SERVICE_CALLS:20]Call_Date:5:=<>DB_d_CurrentDate
	[SERVICE_CALLS:20]Call_Time:6:=Current time:C178
	[SERVICE_CALLS:20]Person:11:=<>PER_t_CurrentUserInitials
	[SERVICE_CALLS:20]Priority:10:="3"
	RELATE ONE:C42([SERVICE_CALLS:20]Person:11)
	[SERVICE_CALLS:20]Supervisor:13:=[PERSONNEL:11]Supervisor:4
	If ([SERVICE_CALLS:20]Response_Time:21=?00:00:00?)
		If (SVS_l_DefaultResponseTiming>0)
			Case of 
				: (SVS_l_DefaultResponseType=1)  // minutes
					[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_DefaultResponseTiming*60)
					
				: (SVS_l_DefaultResponseType=2)  // Hours
					[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_DefaultResponseTiming*60*60)
					
					
				: (SVS_l_DefaultResponseType=3)  // Days
					[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+((SVS_l_DefaultResponseTiming*60*60)*24)
			End case 
		End if 
	End if 
	
Else 
	If ([SERVICE_CALLS:20]Response_Time:21=?00:00:00?)
		QUERY:C277([DIARY:12]; [DIARY:12]Call_Code:25=[SERVICE_CALLS:20]Call_Code:4)
		If (Records in selection:C76([DIARY:12])>1)
			QUERY SELECTION BY FORMULA:C207([DIARY:12]; [DIARY:12]Done:14=True:C214)
		End if 
		If ([DIARY:12]Time_Done_From:7>?00:00:00?)
			[SERVICE_CALLS:20]Response_Time:21:=(([DIARY:12]Date_Done_From:5-[SERVICE_CALLS:20]Call_Date:5)*<>SYS_ti_DefaultSVSResponse)-[SERVICE_CALLS:20]Call_Time:6+[DIARY:12]Time_Done_From:7
		End if 
		If ([SERVICE_CALLS:20]Response_Time:21=?00:00:00?)
			If (SVS_l_DefaultResponseTiming>0)
				Case of 
					: (SVS_l_DefaultResponseType=1)  // minutes
						[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_DefaultResponseTiming*60)
						
					: (SVS_l_DefaultResponseType=1)  // Hours
						[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+(SVS_l_DefaultResponseTiming*60*60)
						
						
					: (SVS_l_DefaultResponseType=1)  // Days
						[SERVICE_CALLS:20]Response_Time:21:=?00:00:00?+((SVS_l_DefaultResponseTiming*60*60)*24)
				End case 
			End if 
		End if 
	End if 
End if 
$_l_Callpriorityposition:=Find in array:C230(SVS_al_PriorityNumbers; Num:C11([SERVICE_CALLS:20]Priority:10))
If ($_l_Callpriorityposition>0)
	SVS_t_CallPriority:=SVS_at_priorityNames{$_l_Callpriorityposition}
Else 
	SVS_t_CallPriority:=[SERVICE_CALLS:20]Priority:10
End if 
//Because a time field is being misused to represent an amount of time...
Case of 
	: ([SERVICE_CALLS:20]Response_Time:21>?24:00:00?)
		SVS_at_ResponseTypes:=3
		$_l_TimeInSeconds:=[SERVICE_CALLS:20]Response_Time:21*1
		$_l_OneDayinSeconds:=?24:00:00?*1
		$_l_DayCount:=0
		Repeat 
			If (($_l_TimeInSeconds-$_l_OneDayinSeconds)>=0)
				$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneDayinSeconds
				$_l_DayCount:=$_l_DayCount+1
			End if 
		Until (($_l_TimeInSeconds-$_l_OneDayinSeconds)<0)
		$_l_Hours:=$_l_DayCount*24
		SVS_l_MaxResponseTime:=$_l_DayCount
		If ($_l_TimeInSeconds>0)
			SVS_at_ResponseTypes:=2
			//Time has to be represented as hours
			$_l_OneHourinSeconds:=?01:00:00?*1
			$_l_HourCount:=$_l_Hours
			Repeat 
				If (($_l_TimeInSeconds-$_l_OneHourinSeconds)>=0)
					$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneHourinSeconds
					$_l_HourCount:=$_l_HourCount+1
				End if 
			Until (($_l_TimeInSeconds-$_l_OneHourinSeconds)<0)
			SVS_l_MaxResponseTime:=$_l_HourCount
			If ($_l_TimeInSeconds>0)
				SVS_at_ResponseTypes:=1
				$_l_OneMinuteinSeconds:=60
				$_l_MinuteCount:=$_l_HourCount*60
				Repeat 
					If (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)>=0)
						$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneMinuteinSeconds
						$_l_MinuteCount:=$_l_MinuteCount+1
					End if 
				Until (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)<0)
				//Time hasa to be displayed  in minutes
				SVS_l_MaxResonseTime:=$_l_MinuteCount
			End if 
		End if 
	: ([SERVICE_CALLS:20]Response_Time:21>?01:00:00?)
		$_l_TimeInSeconds:=[SERVICE_CALLS:20]Response_Time:21*1
		$_l_HourCount:=0
		$_l_OneHourinSeconds:=?01:00:00?*1
		SVS_at_ResponseTypes:=2
		Repeat 
			If (($_l_TimeInSeconds-$_l_OneHourinSeconds)>=0)
				$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneHourinSeconds
				$_l_HourCount:=$_l_HourCount+1
			End if 
		Until (($_l_TimeInSeconds-$_l_OneHourinSeconds)<0)
		SVS_l_MaxResonseTime:=$_l_HourCount
		If ($_l_TimeInSeconds>0)
			SVS_at_ResponseTypes:=1
			$_l_OneMinuteinSeconds:=60
			$_l_MinuteCount:=$_l_HourCount*60
			Repeat 
				If (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)>=0)
					$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneMinuteinSeconds
					$_l_MinuteCount:=$_l_MinuteCount+1
				End if 
			Until (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)<0)
			//Time hasa to be displayed  in minutes
			SVS_l_MaxResonseTime:=$_l_MinuteCount
		End if 
		
	: ([SERVICE_CALLS:20]Response_Time:21>?00:00:00?)
		$_l_TimeInSeconds:=[SERVICE_CALLS:20]Response_Time:21*1
		If ($_l_TimeInSeconds>0)
			SVS_at_ResponseTypes:=1
			$_l_OneMinuteinSeconds:=60
			$_l_MinuteCount:=0
			Repeat 
				If (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)>=0)
					$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneMinuteinSeconds
					$_l_MinuteCount:=$_l_MinuteCount+1
				End if 
			Until (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)<0)
			//Time hasa to be displayed  in minutes
			SVS_l_MaxResonseTime:=$_l_MinuteCount
		End if 
End case 
SVS_t_Elapsedtimelabel:="Total time Open"
ARRAY TEXT:C222(SVS_at_IncDeliveryNames; 0)
ARRAY LONGINT:C221(SVS_al_InvDeliveryIDS; 0)
$_l_ListID:=AA_LoadListByName("Incoming Delivery Methods"; ->SVS_at_IncDeliveryNames; ->SVS_al_InvDeliveryIDS)
If (Size of array:C274(SVS_at_IncDeliveryNames)=0)
	$_l_ListID:=AA_ListAddItembyID($_l_ListID; "Customer to Delivery"; "To be collected")
	$_l_ListID:=AA_LoadListByName("Incoming Delivery Methods"; ->SVS_at_IncDeliveryNames; ->SVS_al_InvDeliveryIDS)
End if 
SVS_l_DeliveryListID:=$_l_ListID
APPEND TO ARRAY:C911(SVS_at_IncDeliveryNames; "-")
APPEND TO ARRAY:C911(SVS_at_IncDeliveryNames; "Edit Delivery Methods")
APPEND TO ARRAY:C911(SVS_al_InvDeliveryIDS; 0)
APPEND TO ARRAY:C911(SVS_al_InvDeliveryIDS; -1)
OBJECT SET VISIBLE:C603(*; "oIncomingDel@"; False:C215)
If ([SERVICE_CALLS:20]xServiceLocation:32>0)
	$_l_StatusRow:=Find in array:C230(SVS_al_IntServiceLocations; [SERVICE_CALLS:20]xServiceLocation:32)
	If ($_l_StatusRow>0)
		OBJECT SET VISIBLE:C603(*; "oIncomingDel@"; True:C214)
	End if 
End if 
If ([SERVICE_CALLS:20]Resolved:9)
	OBJECT SET ENTERABLE:C238(SVS_l_MaxResonseTime; False:C215)
	$_t_ResponseType:=SVS_at_ResponseTypes{SVS_at_ResponseTypes}
	ARRAY TEXT:C222(SVS_at_ResponseTypes; 1)
	SVS_at_ResponseTypes{1}:=$_t_ResponseType
	OBJECT SET ENTERABLE:C238([SERVICE_CALLS:20]Elapsed_Time:19; False:C215)
	SVS_t_Elapsedtimelabel:="Time Taken To Resolve"
	OBJECT SET VISIBLE:C603(SVS_at_ServiceLocations; False:C215)
	OBJECT SET VISIBLE:C603(SC_at_ProblemTypes; False:C215)
	OBJECT SET VISIBLE:C603(SVS_at_priorityNames; False:C215)
	OBJECT SET VISIBLE:C603(SVS_at_IncDeliveryNames; False:C215)
End if 
SVS_l_TimeTakenDays:=0
SVS_l_TimeTakenHours:=0
SVS_l_TimeTakenMinutes:=0
Case of 
	: ([SERVICE_CALLS:20]Elapsed_Time:19>?24:00:00?)
		$_l_TimeInSeconds:=[SERVICE_CALLS:20]Elapsed_Time:19*1
		$_l_OneDayinSeconds:=?24:00:00?*1
		$_l_DayCount:=0
		Repeat 
			If (($_l_TimeInSeconds-$_l_OneDayinSeconds)>=0)
				$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneDayinSeconds
				$_l_DayCount:=$_l_DayCount+1
			End if 
		Until (($_l_TimeInSeconds-$_l_OneDayinSeconds)<0)
		SVS_l_TimeTakenDays:=$_l_DayCount
		If ($_l_TimeInSeconds>0)
			//Time has to be represented as hours
			$_l_OneHourinSeconds:=?01:00:00?*1
			$_l_HourCount:=0
			Repeat 
				If (($_l_TimeInSeconds-$_l_OneHourinSeconds)>=0)
					$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneHourinSeconds
					$_l_HourCount:=$_l_HourCount+1
				End if 
			Until (($_l_TimeInSeconds-$_l_OneHourinSeconds)<0)
			SVS_l_TimeTakenHours:=$_l_HourCount
			If ($_l_TimeInSeconds>0)
				
				$_l_OneMinuteinSeconds:=60
				$_l_MinuteCount:=0
				Repeat 
					If (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)>=0)
						$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneMinuteinSeconds
						$_l_MinuteCount:=$_l_MinuteCount+1
					End if 
				Until (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)<0)
				//Time hasa to be displayed  in minutes
				SVS_l_TimeTakenMinutes:=$_l_MinuteCount
			End if 
		End if 
		
	: ([SERVICE_CALLS:20]Elapsed_Time:19>?01:00:00?)
		$_l_TimeInSeconds:=[SERVICE_CALLS:20]Elapsed_Time:19*1
		If ($_l_TimeInSeconds>0)
			//Time has to be represented as hours
			$_l_OneHourinSeconds:=?01:00:00?*1
			$_l_HourCount:=0
			Repeat 
				If (($_l_TimeInSeconds-$_l_OneHourinSeconds)>=0)
					$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneHourinSeconds
					$_l_HourCount:=$_l_HourCount+1
				End if 
			Until (($_l_TimeInSeconds-$_l_OneHourinSeconds)<0)
			SVS_l_TimeTakenHours:=$_l_HourCount
			If ($_l_TimeInSeconds>0)
				
				$_l_OneMinuteinSeconds:=60
				$_l_MinuteCount:=0
				Repeat 
					If (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)>=0)
						$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneMinuteinSeconds
						$_l_MinuteCount:=$_l_MinuteCount+1
					End if 
				Until (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)<0)
				//Time hasa to be displayed  in minutes
				SVS_l_TimeTakenMinutes:=$_l_MinuteCount
			End if 
		End if 
		
	: ([SERVICE_CALLS:20]Elapsed_Time:19>?00:00:00?)
		$_l_TimeInSeconds:=[SERVICE_CALLS:20]Elapsed_Time:19*1
		If ($_l_TimeInSeconds>0)
			$_l_OneMinuteinSeconds:=60
			$_l_MinuteCount:=0
			Repeat 
				If (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)>=0)
					$_l_TimeInSeconds:=$_l_TimeInSeconds-$_l_OneMinuteinSeconds
					$_l_MinuteCount:=$_l_MinuteCount+1
				End if 
			Until (($_l_TimeInSeconds-$_l_OneMinuteinSeconds)<0)
			//Time hasa to be displayed  in minutes
			SVS_l_TimeTakenMinutes:=$_l_MinuteCount
		End if 
		
End case 
//Case of
RELATE ONE:C42([SERVICE_CALLS:20]Problem_Code:14)
RELATE ONE:C42([SERVICE_CALLS:20]Solution_Code:16)
If ([SERVICE_CALLS:20]Company_Code:1#"")
	RELATE ONE:C42([COMPANIES:2]Default_Credit_Stage:42)
	vStage:=[CREDIT_STAGES:54]Stage_Name:2
End if 
If (((DB_GetModuleSettingByNUM(Module_SalesOrders))<2) | ((DB_GetModuleSettingByNUM(Module_SalesOrders))=3))
	//_O_DISABLE BUTTON(xApply)
	OBJECT SET ENABLED:C1123(xApply; False:C215)
End if 
vSC:=1
vTot:=0
vButtDisSC:="I    O   SS R AD "
Input_Buttons(->[SERVICE_CALLS:20]; ->vButtDisSC)
DB_t_CallOnCloseorSave:="P:Calls_InLPA"
Macro_AccType("Load "+String:C10(Table:C252(->[SERVICE_CALLS:20])))
ERR_MethodTrackerReturn("Calls_InLPB"; $_t_oldMethodName)