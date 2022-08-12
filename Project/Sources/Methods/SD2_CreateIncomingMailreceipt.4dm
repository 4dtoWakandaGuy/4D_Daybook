//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_CreateIncomingMailreceipt
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
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataLong;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldDataTXT;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	C_DATE:C307($3)
	C_LONGINT:C283($_l_ActionRow; $_l_FormRow)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $2; $5)
	C_TIME:C306($4)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_CreateIncomingMailreceipt")

QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1="IMR")
SD2_ActionAttributesToArrays
If (Count parameters:C259>=5)
	
	If (Size of array:C274($1->)>0)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1->{1})
		CREATE RECORD:C68([DIARY:12])
		
		[DIARY:12]Action_Code:9:="IMR"
		[DIARY:12]Subject:63:=$2
		[DIARY:12]Date_Do_From:4:=$3
		[DIARY:12]Date_Do_To:33:=$3
		[DIARY:12]Date_Done_From:5:=!00-00-00!
		[DIARY:12]Date_Done_To:34:=!00-00-00!
		DiarySetCode
		[DIARY:12]Document_Heading:32:=$2
		[DIARY:12]Document_Code:15:=$5
		[DIARY:12]Done:14:=False:C215
		[DIARY:12]Originator:23:=[PERSONNEL:11]Initials:1
		[DIARY:12]Person:8:=[PERSONNEL:11]Initials:1
		[DIARY:12]PersonID:56:=[PERSONNEL:11]Personnel_ID:48
		
		
		[DIARY:12]Time_Do_From:6:=$4
		[DIARY:12]Time_Do_To:35:=$4
		[DIARY:12]Time_Done_From:7:=?00:00:00?
		[DIARY:12]Time_Done_To:36:=?00:00:00?
		$_l_ActionRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Post Time processing Action")
		If ($_l_ActionRow>0)
			[DIARY:12]x_Close_Options:71:=SD2_al_ActionVirtFieldDataLong{$_l_ActionRow}
		End if 
		//Set the form to use
		$_l_FormRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Data Entry Form")
		If ($_l_FormRow>0)
			[DIARY:12]xDiaryForm:66:=SD2_at_ActionVirtFieldDataTXT{$_l_FormRow}
		End if 
		
		//[DIARY]xDiaryClass
		
		[DIARY:12]Alarm_Timeframe:48:=1
		//Set the other personnel(if any)
		//set the reminder
		
		[DIARY:12]x_ID:50:=AA_GetNextID(->[DIARY:12]x_ID:50)
		
		DB_SaveRecord(->[DIARY:12])
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_CreateIncomingMailreceipt"; $_t_oldMethodName)
