//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SelectOtherUser
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_PersonInitials; 0)
	//ARRAY TEXT(SD_at_SelectPersonInitials;0)
	//ARRAY TEXT(SD_at_SelectPersonNames;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_DiaryAccessIndex; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SelectOtherUser")
$0:=""
If (Count parameters:C259>=1)
	//the initials passed to this are of the current user
	//here we look for the persons diaries who this person can open
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
	ARRAY TEXT:C222($_at_PersonInitials; 0)
	ARRAY TEXT:C222(SD_at_SelectPersonInitials; 0)
	ARRAY TEXT:C222(SD_at_SelectPersonNames; 0)
	QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=[PERSONNEL:11]Initials:1)
	
	If (Records in selection:C76([PERSONNEL_DIARY_ACCESS:149])>0)
		ARRAY TEXT:C222($_at_PersonInitials; Records in selection:C76([PERSONNEL_DIARY_ACCESS:149]))
		
		FIRST RECORD:C50([PERSONNEL_DIARY_ACCESS:149])
		For ($_l_DiaryAccessIndex; 1; Records in selection:C76([PERSONNEL_DIARY_ACCESS:149]))  //then add the values for the diary access values
			$_at_PersonInitials{$_l_DiaryAccessIndex}:=[PERSONNEL_DIARY_ACCESS:149]Person:1
			NEXT RECORD:C51([PERSONNEL_DIARY_ACCESS:149])
			
		End for 
		CREATE EMPTY SET:C140([PERSONNEL:11]; "Temp")
		For ($_l_DiaryAccessIndex; 1; Size of array:C274($_at_PersonInitials))
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Initials:1=$_at_PersonInitials{$_l_DiaryAccessIndex})
			ADD TO SET:C119([PERSONNEL:11]; "Temp")
		End for 
		USE SET:C118("Temp")
		CLEAR SET:C117("Temp")
		
		
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
		
		QUERY SELECTION:C341([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
		QUERY SELECTION:C341([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; SD_at_SelectPersonInitials)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_SelectPersonNames)
		
	Else 
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1#$1; *)
		
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1; *)
		QUERY SELECTION:C341([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; SD_at_SelectPersonInitials)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_SelectPersonNames)
	End if 
	If (Size of array:C274(SD_at_SelectPersonNames)>0)
		SORT ARRAY:C229(SD_at_SelectPersonNames; SD_at_SelectPersonInitials)
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
		DIALOG:C40([CONTACTS:1]; "DIary_OwnerSelector")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (SD_at_SelectPersonNames>0)
			$0:=SD_at_SelectPersonInitials{SD_at_SelectPersonNames}
		Else 
			$0:=""
		End if 
	Else 
		Gen_Alert("You do not have access to anybody elses diary")
		$0:=""
	End if 
End if 
ERR_MethodTrackerReturn("SD_SelectOtherUser"; $_t_oldMethodName)
