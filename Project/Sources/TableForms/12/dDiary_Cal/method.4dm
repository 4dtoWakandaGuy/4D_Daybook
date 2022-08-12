If (False:C215)
	//Table Form Method Name: [DIARY]dDiary_Cal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(aD;0)
	//ARRAY INTEGER(SD_ai_Days;0)
	//ARRAY LONGINT(CAL_al_DiaryDays;0)
	C_BOOLEAN:C305(<>SaturdayoN; <>SundayoN; DB_bo_NoLoad)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_event; ch1; vCalActions)
	C_TEXT:C284($_t_oldMethodName; vCalPeriod)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].dDiary_Cal"; Form event code:C388)
//LP Diary_Cal
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "dDiary_Cal")
		If (vCalActions=0)
			vCalActions:=1
			ARRAY INTEGER:C220(SD_ai_Days; 37)
			ARRAY LONGINT:C221(CAL_al_DiaryDays; 37)
		End if 
		If (vCalPeriod="")
			Diary_CalPer(<>DB_d_CurrentDate)
		Else 
			Diary_CalPic
		End if 
		If (vCalActions>1)
			ch1:=1
			Diary_CalAct(0)
		End if 
		
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[DIARY:12])
		
End case 
ERR_MethodTrackerReturn("FM [DIARY].dDiary_Cal"; $_t_oldMethodName)
