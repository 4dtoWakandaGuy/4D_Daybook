//%attributes = {}

If (False:C215)
	//Database Method Name:      SD_CheckAvailable
	//------------------ Method Notes ------------------
	If (False:C215)  // ----------------------------------------------------
		//Creator: Nigel Greenlee
		//Date & time: 22/06/2009 10:45
		//Method Name: SD_CheckAvailable
		//Description
		
		//Parameters
		//Declarations
		// ----------------------------------------------------
		//Project method Amendments
		//End Project method Amendments
	End if 
	
	//------------------ Revision Control ----------------
	//Date Created:  06/10/2019
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK; $0)
	C_DATE:C307($_d_DateCheckFrom; $_d_DateCheckTo; $_d_DateDoFrom; $2; $3)
	C_LONGINT:C283($_l_Days; $_l_Index; $_l_PersonID; WS_TimeClash)
	C_REAL:C285($1)
	C_TEXT:C284($_t_DiaryRecordCode; $_t_DiaryType; $_t_oldMethodName; $_T_PersonInitials; $_t_PersonName; $6; $7; SD_t_DiaryPersonName)
	C_TIME:C306($_ti_TimeCheckFrom; $_ti_TimeCheckTo; $4; $5)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SD_CheckAvailable")
//this method will check if a user is available at a given time
If (Count parameters:C259>=6)
	$_l_PersonID:=$1
	
	$_d_DateCheckFrom:=$2  //added kmw 28/08/07
	$_d_DateCheckTo:=$3  //added kmw 28/08/07
	$_ti_TimeCheckFrom:=$4  //added kmw 28/08/07
	$_ti_TimeCheckTo:=$5  //added kmw 28/08/07
	$_t_DiaryType:=$6
	If (Count parameters:C259>=7)
		$_t_DiaryRecordCode:=$7
	End if 
	
	
	
	
	//If ($4#†00:00:00†) & ($5#†00:00:00†)
	
	//-kmw 28/08/07, changed to also check for blank dates (changed from above line) ...
	//...(without this check (especially if from date was the 0 date) then the for loop...
	//... would end up running through hundreds of thousands of days, doing a...
	//... query for each one - effectively freezing the process).
	//The justifictaion for getting around this problem by simply...
	//... allowing blank dates is that we are assuming this means something similar...
	//... to the user havign a blank time, ie that the "do period" is not actually one...
	//... where they will be DOING something throughout the ENTIRE period - ie person...
	//...is perhaps just booked up at SOME TIME DURING the period).
	
	If ($_d_DateCheckFrom#!00-00-00!) & ($_d_DateCheckTo#!00-00-00!) & ($_ti_TimeCheckFrom#?00:00:00?) & ($_ti_TimeCheckTo#?00:00:00?)  //changed kmw 28/08/07
		
		//***** added this section to avoid checking dates less than the current date on assumption that this method only used when checking for future availability not as any kind of data integrety tool. ********************
		//(should be reasonable assumption given that it is not currently used in any other way, that it has the name SD_CheckAVAILABLE and that all it messages to the user at the end imply this usage also
		If ($_d_DateCheckFrom<Current date:C33(*))  //added kmw 28/08/07
			$_d_DateCheckFrom:=Current date:C33(*)  //added kmw 28/08/07
		End if   //added kmw 28/08/07
		If ($_d_DateCheckTo<$_d_DateCheckFrom)  //added kmw 28/08/07
			$_d_DateCheckTo:=$_d_DateCheckFrom  //added kmw 28/08/07
		End if   //added kmw 28/08/07
		//********************************************************************************************************************************************************************************************************
		
		If ($_l_PersonID>0)
			READ ONLY:C145([PERSONNEL:11])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$_l_PersonID)
			$_T_PersonInitials:=[PERSONNEL:11]Initials:1
			$_t_PersonName:=[PERSONNEL:11]Name:2
		Else 
			//current diary owner
			$_T_PersonInitials:=[DIARY:12]Person:8
			$_t_PersonName:=SD_t_DiaryPersonName
		End if 
		
		UNLOAD RECORD:C212([PERSONNEL:11])
		
		SET QUERY DESTINATION:C396(3; WS_TimeClash)
		$_l_Days:=($_d_DateCheckTo-$_d_DateCheckFrom)+1  //changed from directly using passed parameter- kmw 28/08/07
		$_bo_OK:=True:C214
		For ($_l_Index; 1; $_l_Days)
			$_d_DateDoFrom:=($_d_DateCheckFrom+$_l_Index)-1  //changed from directly using passed parameter- kmw 28/08/07
			QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_T_PersonInitials; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_d_DateDoFrom; *)
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Time_Do_From:6<=$_ti_TimeCheckFrom; *)  //changed from directly using passed parameter- kmw 28/08/07
			QUERY:C277([DIARY:12];  & ; [DIARY:12]Time_Do_To:35>=$_ti_TimeCheckTo; *)  //changed from directly using passed parameter- kmw 28/08/07
			If ($_t_DiaryRecordCode#"")
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Diary_Code:3#$_t_DiaryRecordCode)
			Else 
				QUERY:C277([DIARY:12])
			End if 
			
			//starts before date and finishes after or during
			//starts before time
			If (WS_TimeClash=0)
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_T_PersonInitials; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_d_DateDoFrom; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Time_Do_From:6>=$_ti_TimeCheckFrom; *)  //changed from directly using passed parameter- kmw 28/08/07
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Time_Do_From:6<=$_ti_TimeCheckTo; *)  //changed from directly using passed parameter- kmw 28/08/07
				If ($_t_DiaryRecordCode#"")
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Diary_Code:3#$_t_DiaryRecordCode)
				Else 
					QUERY:C277([DIARY:12])
				End if 
			End if 
			If (WS_TimeClash=0)
				QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_T_PersonInitials; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_d_DateDoFrom; *)
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Time_Do_From:6>=$_ti_TimeCheckFrom; *)  //changed from directly using passed parameter- kmw 28/08/07
				QUERY:C277([DIARY:12];  & ; [DIARY:12]Time_Do_To:35<=$_ti_TimeCheckTo; *)  //changed from directly using passed parameter- kmw 28/08/07
				If ($_t_DiaryRecordCode#"")
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Diary_Code:3#$_t_DiaryRecordCode)
				Else 
					QUERY:C277([DIARY:12])
				End if 
			End if 
			If (WS_TimeClash>0)
				$_l_Index:=$_l_Days+1
			End if 
		End for 
		SET QUERY DESTINATION:C396(0)
		If (WS_TimeClash>0)
			$_bo_OK:=False:C215
			If ($_l_PersonID>0)
				Gen_Confirm($_t_DiaryType+" :"+$_t_PersonName+" is not available at that time"; "Book"; "Cancel")
			Else 
				Gen_Alert("There is already an appointment at that time"; "OK")
			End if 
			
			If (OK=1)
				$_bo_OK:=True:C214
			End if 
			
		End if 
	Else 
		$_bo_OK:=True:C214
	End if 
End if 
$0:=$_bo_OK
ERR_MethodTrackerReturn("SD_CheckAvailable"; $_t_oldMethodName)
