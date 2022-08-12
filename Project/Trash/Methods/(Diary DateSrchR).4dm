//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_DateSrchR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  12/06/2010 23:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_DiaryRecordNumbers; 0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_DATE:C307(vDate)
	C_LONGINT:C283($_l_CurrentRow; $_l_MaxActionDescriptionLength; $_l_MaxCoNameLength; $1; vNo)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SYS_t_FormSizeName; $_t_oldMethodName; vLongDate; vUser2)
	C_TIME:C306($_ti_CurrentTime; $_ti_CurrentTime2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_DateSrchR")
//Diary_DateSrchR - Real

If ($1=0)
	Long_Date2
	vLongDate:=vLongDate+"  "+Lowercase:C14(String:C10(Current time:C178; 5))
End if 
MESSAGES OFF:C175
QUERY:C277([DIARY:12]; [DIARY:12]Date_Do_From:4=vDate; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=False:C215; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=vUser2)
CREATE SET:C116([DIARY:12]; "DMaster")
QUERY:C277([DIARY:12]; [DIARY:12]Date_Done_From:5=vDate; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Done:14=True:C214; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Person:8=vUser2)
MESSAGES ON:C181
CREATE SET:C116([DIARY:12]; "Extra")
UNION:C120("DMaster"; "Extra"; "DMaster")
USE SET:C118("DMaster")
If (<>PER_t_CurrentUserInitials#vUser2)
	Diary_SelCheck
	CREATE SET:C116([DIARY:12]; "DMaster")
End if 
vNo:=Records in selection:C76([DIARY:12])

QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Time_Do_From:6>?00:00:00?)

ORDER BY:C49([DIARY:12]; [DIARY:12]Time_Do_From:6; >)
FIRST RECORD:C50([DIARY:12])
If (<>SYS_t_FormSizeName="13")
	$_l_MaxActionDescriptionLength:=45
	$_l_MaxCoNameLength:=31
Else 
	$_l_MaxActionDescriptionLength:=30
	$_l_MaxCoNameLength:=18
End if 
Array_LCx(60)
ARRAY LONGINT:C221($_al_DiaryRecordNumbers; 60)

$_ti_CurrentTime:=?07:00:00?
$_l_CurrentRow:=1
While ($_l_CurrentRow<61)
	IDLE:C311  // 03/04/03 pb
	If ($_ti_CurrentTime>?20:00:00?)
		GEN_at_RecordCode{$_l_CurrentRow}:=""
		$_al_DiaryRecordNumbers{$_l_CurrentRow}:=0
		GEN_at_Identity{$_l_CurrentRow}:=""
		GEN_at_Name{$_l_CurrentRow}:=""
	Else 
		GEN_at_RecordCode{$_l_CurrentRow}:=Substring:C12(String:C10($_ti_CurrentTime); 1; 5)
		If ([DIARY:12]Date_Do_From:4>!00-00-00!)
			$_ti_CurrentTime2:=$_ti_CurrentTime+?00:30:00?
			If ([DIARY:12]Time_Do_From:6<$_ti_CurrentTime2)
				If ([DIARY:12]Time_Do_From:6#$_ti_CurrentTime)
					$_al_DiaryRecordNumbers{$_l_CurrentRow}:=0
					GEN_at_Identity{$_l_CurrentRow}:=""
					GEN_at_Name{$_l_CurrentRow}:=""
					$_l_CurrentRow:=$_l_CurrentRow+1
					GEN_at_RecordCode{$_l_CurrentRow}:=Substring:C12(String:C10([DIARY:12]Time_Do_From:6); 1; 5)
				End if 
				$_al_DiaryRecordNumbers{$_l_CurrentRow}:=Record number:C243([DIARY:12])
				RELATE ONE:C42([DIARY:12]Company_Code:1)
				RELATE ONE:C42([DIARY:12]Contact_Code:2)
				RELATE ONE:C42([DIARY:12]Action_Code:9)
				GEN_at_Identity{$_l_CurrentRow}:=Substring:C12([COMPANIES:2]Company_Name:2; 1; $_l_MaxCoNameLength)
				If ([DIARY:12]Done:14=False:C215)
					GEN_at_Name{$_l_CurrentRow}:=Substring:C12("• "+[ACTIONS:13]Action_Name:2; 1; $_l_MaxActionDescriptionLength)
				Else 
					GEN_at_Name{$_l_CurrentRow}:=Substring:C12([ACTIONS:13]Action_Name:2; 1; $_l_MaxActionDescriptionLength)
				End if 
				$_l_CurrentRow:=$_l_CurrentRow+1
				$_al_DiaryRecordNumbers{$_l_CurrentRow}:=Record number:C243([DIARY:12])
				GEN_at_RecordCode{$_l_CurrentRow}:=""
				GEN_at_Identity{$_l_CurrentRow}:=Substring:C12("  "+[CONTACTS:1]Forename:4+" "+[CONTACTS:1]Surname:5; 1; $_l_MaxCoNameLength)
				GEN_at_Name{$_l_CurrentRow}:=Substring:C12([DIARY:12]Action_Details:10; 1; $_l_MaxActionDescriptionLength)
				If ([DIARY:12]Time_Do_To:35>?00:00:00?)
					While (([DIARY:12]Time_Do_To:35>=$_ti_CurrentTime2) & ($_ti_CurrentTime2<=?20:00:00?))
						$_l_CurrentRow:=$_l_CurrentRow+1
						$_al_DiaryRecordNumbers{$_l_CurrentRow}:=Record number:C243([DIARY:12])
						GEN_at_RecordCode{$_l_CurrentRow}:=Substring:C12(String:C10($_ti_CurrentTime2); 1; 5)
						GEN_at_Identity{$_l_CurrentRow}:=Char:C90(34)
						GEN_at_Name{$_l_CurrentRow}:=Char:C90(34)
						$_ti_CurrentTime2:=$_ti_CurrentTime2+?00:30:00?
					End while 
					$_ti_CurrentTime:=$_ti_CurrentTime2-?00:30:00?
				End if 
				NEXT RECORD:C51([DIARY:12])
				
			Else 
				$_al_DiaryRecordNumbers{$_l_CurrentRow}:=0
				GEN_at_Identity{$_l_CurrentRow}:=""
				GEN_at_Name{$_l_CurrentRow}:=""
			End if 
		Else 
			$_al_DiaryRecordNumbers{$_l_CurrentRow}:=0
			GEN_at_Identity{$_l_CurrentRow}:=""
			GEN_at_Name{$_l_CurrentRow}:=""
		End if 
	End if 
	$_ti_CurrentTime:=$_ti_CurrentTime+?00:30:00?
	$_l_CurrentRow:=$_l_CurrentRow+1
End while 
ERR_MethodTrackerReturn("Diary_DateSrchR"; $_t_oldMethodName)