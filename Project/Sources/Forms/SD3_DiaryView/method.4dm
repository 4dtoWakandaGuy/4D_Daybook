
If (False:C215)
	//Database Method Name:      SD3_DiaryView
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_FormEvent; $_l_NextObject; $_l_Nul; SD_l_CountTimes; SD_l_CurrentTab)
	C_POINTER:C301(SD2_ptr_LastObject)
	C_TEXT:C284($_t_oldMethodName; SD2_t_CreateActionCode)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/SD3_DiaryView/{formMethod}"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		DB_SetnewToolBar
		$_l_Nul:=0
		SD2_ptr_LastObject:=->$_l_Nul
		OpenHelp(0; "SD3_Input")
		//This form is ONE of a series of forms for entering diary items..
		SD_l_CountTimes:=0
		SD_l_CurrentTab:=0
		//SD_bo_NewRecord:=False
		If ([DIARY:12]Action_Code:9="")
			//SD_bo_NewRecord:=True
			If (SD2_t_CreateActionCode#"")  //This is so a predined code can be got from parent method is required
				[DIARY:12]Action_Code:9:=SD2_t_CreateActionCode
			End if 
		End if 
		//Here we need to put any passed data. this could be a related record etc
		
		SD2_LoadDiary("SD3_Input")  // ([DIARY]Action Code)  `This same method is called from all diary loading forms.
		
		///$_l_NextObject:=
End case 
ERR_MethodTrackerReturn("FM [projectForm]/SD3_DiaryView/{formMethod}"; $_t_oldMethodName)
