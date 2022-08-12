If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_ViewAG.Check Box4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_DoneStatus;0)
	//ARRAY DATE(SD_ad_SortDate;0)
	//ARRAY LONGINT(SD_al_AppointmentRecordIDs;0)
	//ARRAY LONGINT(SD_al_RecordNumbers;0)
	//ARRAY TEXT(SD_at_ActionDetails;0)
	//ARRAY TEXT(SD_at_ActionDetails2;0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_ContactCodes;0)
	//ARRAY TEXT(SD_at_ItemActionCode;0)
	//ARRAY TEXT(SD_at_ItemPerson;0)
	//ARRAY TEXT(SD_at_Query;0)
	C_LONGINT:C283($_l_event; $_l_QueryIndex; $_l_QueryRow; $_l_RecordRow; SD_l_IncQueryCo)
	C_TEXT:C284($_t_CompanyName; $_t_oldMethodName; $_t_PersonText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Check Box4"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		
		$_l_QueryRow:=SD_at_Query
		If (SD_at_Query>0)  //only if something is loaded
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
		End if 
		For ($_l_QueryIndex; 1; Size of array:C274(SD_at_Query))
			$_l_RecordRow:=Find in array:C230(SD_al_RecordNumbers; SD_al_AppointmentRecordIDs{$_l_QueryIndex})
			If (Length:C16(SD_at_ItemPerson{$_l_RecordRow})<3)
				$_t_PersonText:=(SD_at_ItemPerson{$_l_RecordRow})+(" "*(3-(Length:C16(SD_at_ItemPerson{$_l_RecordRow}))))+" "
			Else 
				$_t_PersonText:=SD_at_ItemPerson{$_l_RecordRow}
			End if 
			If ($_l_RecordRow>0)
				If (SD_l_IncQueryCo>0)
					$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_RecordRow}; SD_at_ContactCodes{$_l_RecordRow})
				Else 
					$_t_CompanyName:=""
				End if 
				
				If ((SD_abo_DoneStatus{$_l_RecordRow}) & (SD_at_ActionDetails2{$_l_RecordRow}#"")) | (SD_at_ActionDetails{$_l_RecordRow}="")
					SD_at_Query{$_l_QueryIndex}:=String:C10(SD_ad_SortDate{$_l_RecordRow}; 4)+": "+$_t_CompanyName+" "+$_t_PersonText+": "+SD_at_ItemActionCode{$_l_RecordRow}+": "+SD_at_ActionDetails2{$_l_RecordRow}  //create: diary item time and description
				Else 
					SD_at_Query{$_l_QueryIndex}:=String:C10(SD_ad_SortDate{$_l_RecordRow}; 4)+": "+$_t_CompanyName+" "+$_t_PersonText+": "+SD_at_ItemActionCode{$_l_RecordRow}+": "+SD_at_ActionDetails{$_l_RecordRow}  //create: diary item time and description
				End if 
				
			End if 
			
		End for 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Check Box4"; $_t_oldMethodName)
