If (False:C215)
	//object Name: [PERSONNEL]Diary_View.oResultsDropDown
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 10:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ResultCodes;0)
	//ARRAY TEXT(SD_at_ResultNames;0)
	C_LONGINT:C283($_l_event)
	C_POINTER:C301(SD_ptr_Date1)
	C_TEXT:C284($_t_oldMethodName; dl_ResultT)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.oResultsDropDown"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Clicked:K2:4)
		If (Read only state:C362([DIARY:12])=False:C215)
			If ([DIARY:12]Diary_Code:3#"")
				If (Not:C34(Is nil pointer:C315(SD_ptr_Date1)))
					If (SD_at_ResultNames>0)
						[DIARY:12]Result_Code:11:=SD_at_ResultCodes{SD_at_ResultNames}
						dl_ResultT:=SD_at_ResultNames{SD_at_ResultNames}
						Diary_InD
						SD_at_ResultNames:=0
						
					End if 
				End if 
			End if 
			
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.oResultsDropDown"; $_t_oldMethodName)
