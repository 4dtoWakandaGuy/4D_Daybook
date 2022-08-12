//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryVIewManageView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	C_BOOLEAN:C305($_bo_ApplyFIlters; $_bo_Search; $3)
	C_LONGINT:C283($_l_ReturnPagePref; $1; FS_l_SortDirection; vNo)
	C_TEXT:C284($_t_oldMethodName; $2; SD2_t_SearchCriteria; SD2_T_SearchValue; SRCH_t_SearchValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryVIewManageView")
//this method will load the current selection to the screens
//Pass this method 1 in  ` $1 to do a search(based on $2)
//Note this method only works with the form [USER];"SD2_diaryViewer"

$_bo_ApplyFIlters:=True:C214  //default to always apply filters (which always applies to most recent search)


$_l_ReturnPagePref:=1

If (Count parameters:C259>=1)
	
	If (Count parameters:C259>=2)
		SRCH_t_SearchValue:=$2
		If (Count parameters:C259>=3)  //added 03/07/08 -kmw
			$_bo_ApplyFIlters:=$3  //added 03/07/08 -kmw
		End if   //added 03/07/08 -kmw
	End if 
	$_bo_Search:=($1=1) & (SRCH_t_SearchValue#"")
	
Else 
	$_bo_Search:=False:C215
End if 
If ($_bo_Search)
	SRCH_StandardSearch(Table:C252(->[DIARY:12]); SRCH_t_SearchValue)
End if 

//******************** Moved to up here from AFTER "number of records >1000" reduction functionality. -kmw, 18/06/08 **************
CREATE SET:C116([DIARY:12]; "TempSet")
QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Display_Date_From:51=!00-00-00!; *)
QUERY SELECTION:C341([DIARY:12];  | ; [DIARY:12]Date_Time_Stamp:45=0)
If (Records in selection:C76([DIARY:12])>0)
	READ WRITE:C146([DIARY:12])
	LOAD RECORD:C52([DIARY:12])
	DB_lockFile(->[DIARY:12])
	APPLY TO SELECTION:C70([DIARY:12]; Trigger_setDiaryTimeStamp)
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
	UNLOAD RECORD:C212([DIARY:12])
	READ ONLY:C145([DIARY:12])
End if 
USE SET:C118("TempSet")
If ($_bo_ApplyFIlters)  //added 03/07/08 -kmw
	SD2_ApplySearchFilters
End if   //added 03/07/08 -kmw
//***********************************************************************************************************************


//******************** Moved from here to BEFORE "number of records >1000" reduction functionality. -kmw, 18/06/08 **************
//***********************************************************************************************************************************


//********** kmw, 20/06/08 - Removed any chance of the current selection of diary records reverting to more than one tab's worth to AFTER we use the current selection of diary records to set the the tabs (OTHERWISE ALL DIARY RECORDS IN SELECTION GET PUT IN CURRENT TAB REGARDLESS OF TAB SIZE LIMIT!!!!!)
//If (Count parameters>=1)
//USE SET("TempSet")
//vNo:=Records in selection([DIARY])
//If ($1#-1)
//CLEAR SET("TempSet")
//End if
//
//Else
//CLEAR SET("TempSet")
//End if
//*************************************************************************************************************************************************************************************************************************************************************************************************

LBi_LoadSetup(->SD2_aptr_ListControl; "P")
//SD2_HistorySetInfo (->SD2_aptr_ListControl;->SD_lb_Workflow)
OBJECT SET VISIBLE:C603(SD2_t_SearchCriteria; False:C215)
OBJECT SET VISIBLE:C603(SD2_T_SearchValue; True:C214)

//********** kmw, 20/06/08 - Removed any chance of the current selection of diary records reverting to more than one tab's worth to AFTER we use the current selection of diary records to set the the tabs (OTHERWISE ALL DIARY RECORDS IN SELECTION GET PUT IN CURRENT TAB REGARDLESS OF TAB SIZE LIMIT!!!!!)
If (Count parameters:C259>=1)
	USE SET:C118("TempSet")
	vNo:=Records in selection:C76([DIARY:12])
	If ($1#-1)
		CLEAR SET:C117("TempSet")
	End if 
	
Else 
	CLEAR SET:C117("TempSet")
End if 
//*************************************************************************************************************************************************************************************************************************************************************************************************
ERR_MethodTrackerReturn("SD2_DiaryVIewManageView"; $_t_oldMethodName)
