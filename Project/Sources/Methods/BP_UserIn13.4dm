//%attributes = {}
If (False:C215)
	//Project Method Name:      BP_UserIn13
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(BP_at_Frequency;0)
	//ARRAY TEXT(BP_at_NumOfFile;0)
	C_BOOLEAN:C305($_bo_CanChangeSettings)
	C_DATE:C307(BP_d_BackupDate; BP_d_FormBackupDate)
	C_LONGINT:C283($_l_EndHour; $_l_FileRow; $_l_Index; $_l_ItemReference; $_l_ListReference; $_l_SelectedListItem; $_l_StartHour; $_l_Time; $_l_Time2; BP_but_EnableBackupSync; BP_HL_l_Hours)
	C_LONGINT:C283(BP_HL_l_Hours2; BP_HL_l_Mins; BP_HL_l_tens; BP_l_NumOfFile; BP_l_TimeSpace)
	C_TEXT:C284($_t_HourString; $_t_ItemText; $_t_oldMethodName; BP_t_BackupAdminEmail; BP_t_BackupFrequency; BP_t_LocalBackupPath; BP_t_RemoteBackupPath)
	C_TIME:C306(BP_ti_BackupTime; BP_ti_SettingsTimeEnd; BP_ti_SettingsTimeStart)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("BP_UserIn13")

//```````````
If (BP_d_BackupDate=!00-00-00!)  //First time setting up propably
	BP_d_BackupDate:=Current date:C33
End if 

BP_d_FormBackupDate:=BP_d_BackupDate

BP_l_TimeSpace:=10


BP_HL_l_Mins:=New list:C375
APPEND TO LIST:C376(BP_HL_l_Mins; "1"; 1; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "2"; 2; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "3"; 3; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "4"; 4; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "5"; 5; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "6"; 6; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "7"; 7; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "8"; 8; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "9"; 9; 0; True:C214)
APPEND TO LIST:C376(BP_HL_l_Mins; "10"; 10; 0; True:C214)

BP_HL_l_tens:=New list:C375

For ($_l_FileRow; 0; 59; BP_l_TimeSpace)
	If ($_l_FileRow=0)
		APPEND TO LIST:C376(BP_HL_l_tens; "0"; 60; 0; True:C214)
	Else 
		APPEND TO LIST:C376(BP_HL_l_tens; String:C10($_l_FileRow); $_l_FileRow; 0; True:C214)
	End if 
End for 

BP_ti_SettingsTimeStart:=?00:00:00?
BP_ti_SettingsTimeEnd:=?22:00:00?

$_l_StartHour:=BP_ti_SettingsTimeStart*1  //Time_In seconds since midnight

$_l_StartHour:=Int:C8($_l_StartHour/3600)
$_l_EndHour:=BP_ti_SettingsTimeEnd*1  //Time_In seconds since midnight

$_l_EndHour:=(Int:C8($_l_EndHour/3600))+1
BP_HL_l_Hours:=New list:C375

For ($_l_Index; $_l_StartHour; $_l_EndHour)
	$_l_Time:=$_l_Index*3600
	$_t_HourString:=Time string:C180($_l_Time)
	$_t_HourString:=Substring:C12($_t_HourString; 1; Length:C16($_t_HourString)-3)
	$_l_ListReference:=Copy list:C626(BP_HL_l_tens)
	For ($_l_SelectedListItem; 1; Count list items:C380($_l_ListReference))
		GET LIST ITEM:C378($_l_ListReference; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText)
		If ($_l_ItemReference<60)
			SET LIST ITEM:C385($_l_ListReference; $_l_ItemReference; $_t_ItemText; ($_l_ItemReference*60)+$_l_Time)
		Else 
			$_l_Time2:=($_l_Index-1)*3600
			SET LIST ITEM:C385($_l_ListReference; $_l_ItemReference; $_t_ItemText; ($_l_ItemReference*60)+$_l_Time2)
		End if 
		
	End for 
	APPEND TO LIST:C376(BP_HL_l_Hours; $_t_HourString; $_l_Time; $_l_ListReference; True:C214)
End for 
BP_HL_l_Hours2:=Copy list:C626(BP_HL_l_Hours)
SELECT LIST ITEMS BY POSITION:C381(BP_HL_l_Hours2; 0)
SELECT LIST ITEMS BY POSITION:C381(BP_HL_l_Hours; 0)

//````````````Build Time popup menu

ARRAY TEXT:C222(BP_at_Frequency; 3)
BP_at_Frequency{1}:="Every Day"
BP_at_Frequency{2}:="Every Week"
BP_at_Frequency{3}:="Every Month"

ARRAY TEXT:C222(BP_at_NumOfFile; 10)

For ($_l_Index; 1; Size of array:C274(BP_at_NumOfFile))
	BP_at_NumOfFile{$_l_Index}:=String:C10($_l_Index)
End for 
ARRAY TEXT:C222(BP_at_NumOfFile; 11)
BP_at_NumOfFile{11}:="All"
BP_LoadPrefs

$_l_FileRow:=Find in array:C230(BP_at_NumOfFile; String:C10(BP_l_NumOfFile))
If (BP_l_NumOfFile#999)
	If ($_l_FileRow<0)
		$_l_FileRow:=1
	End if 
Else 
	$_l_FileRow:=11
End if 

BP_at_NumOfFile:=$_l_FileRow


$_l_FileRow:=Find in array:C230(BP_at_Frequency; BP_t_BackupFrequency)

If ($_l_FileRow<0)
	$_l_FileRow:=1
End if 

BP_at_Frequency:=$_l_FileRow

$_bo_CanChangeSettings:=BP_IsUserAuthorized

If ($_bo_CanChangeSettings)
	OBJECT SET ENABLED:C1123(BP_but_EnableBackupSync; True:C214)
	OBJECT SET ENABLED:C1123(BP_at_Frequency; True:C214)
	OBJECT SET ENABLED:C1123(BP_at_NumOfFile; True:C214)
	OBJECT SET VISIBLE:C603(BP_HL_l_Hours2; True:C214)
	
	//ENABLE BUTTON(BP_HL_l_Hours2)
Else 
	OBJECT SET ENABLED:C1123(BP_but_EnableBackupSync; False:C215)
	OBJECT SET ENABLED:C1123(BP_at_Frequency; False:C215)
	OBJECT SET ENABLED:C1123(BP_at_NumOfFile; False:C215)
	OBJECT SET VISIBLE:C603(BP_HL_l_Hours2; False:C215)
	//DISABLE BUTTON(BP_HL_l_Hours2)
End if 

OBJECT SET ENTERABLE:C238(BP_t_BackupAdminEmail; $_bo_CanChangeSettings)
OBJECT SET ENTERABLE:C238(BP_t_LocalBackupPath; $_bo_CanChangeSettings)
OBJECT SET ENTERABLE:C238(BP_t_RemoteBackupPath; $_bo_CanChangeSettings)
OBJECT SET ENTERABLE:C238(BP_ti_BackupTime; $_bo_CanChangeSettings)
OBJECT SET VISIBLE:C603(*; "oPopupPicture"; $_bo_CanChangeSettings)

If (User in group:C338(Current user:C182; "Designer")) | (User in group:C338(Current user:C182; "Administrator"))
	
	OBJECT SET VISIBLE:C603(*; "obSelectLocalPath"; True:C214)
	OBJECT SET VISIBLE:C603(*; "obSelectRemotePath"; True:C214)
Else 
	OBJECT SET VISIBLE:C603(*; "obSelectLocalPath"; False:C215)
	OBJECT SET VISIBLE:C603(*; "obSelectRemotePath"; False:C215)
End if 
ERR_MethodTrackerReturn("BP_UserIn13"; $_t_oldMethodName)
