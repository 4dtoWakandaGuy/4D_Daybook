//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetCalenderEvents
	//------------------ Method Notes ------------------
	//This method will get diary events for a given set of parameters.
	//to optimize the speed of operation the  criteria of the query is built to an array. This array is passed to the Query mechanism as a blob. If that query is already known then
	//the identifier is returned. The identifier links records in the SF_DIARYVIEW table together. Note that the same Diary record(SF_Diary) can exist multiple times in SD_DIARYVIEW.
	
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 19:15`Method: SD2_GetCalenderEvents
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetCalenderEvents")
//C_DATE($DiaryDate;$1)
//C_TEXT($DiaryOwner;$3)
//C_LONGINT($DiaryOwnerID;$4)
//ARRAY TEXT($DiaryOnwerNames;0)
//ARRAY LONGINT($DiaryOwnerIDS;0)
//C_POINTER($5;$6)
//C_TEXT($_t_ActionCode;$7)
//ARRAY TEXT($_at_ActionCodes;0)
ERR_MethodTrackerReturn("SD2_GetCalenderEvents"; $_t_oldMethodName)