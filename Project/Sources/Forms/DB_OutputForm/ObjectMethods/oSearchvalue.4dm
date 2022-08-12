
If (False:C215)
	//Database Method Name:      SD2_t_SearchValue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/08/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Customise; DB_bo_inSearchPicker)
	C_LONGINT:C283($_l_FormEvent)
	C_REAL:C285(SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284($_t_CurrentText; $_t_ObjectName; $_t_oldMethodName; SD2_t_SearchCriteria; SD2_t_SearchValue; SRCH_t_SearchValue; vSearch)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_OutputForm/oSearchvalue"; Form event code:C388)
//Searchpicker sample code
$_l_FormEvent:=Form event code:C388
Case of 
		
	: ($_l_FormEvent=On Load:K2:1)
	Else 
		//TRACE
End case 
Case of 
		
	: ($_l_FormEvent=On Load:K2:1)
		
		// Init the var itself
		// this can be done anywhere else in your code
		
		// the let's customise the SearchPicker (if needed)
		
		$_bo_Customise:=True:C214
		
		$_t_ObjectName:=OBJECT Get name:C1087(Object current:K67:2)
		
		// The exemple below shows how to set a label (ex : "name") inside the search zone
		
		If ($_bo_Customise)
			
			SearchPicker SET HELP TEXT("oSearchvalue"; SD2_t_SearchCriteria)
			
		End if 
	: ($_l_FormEvent=On Getting Focus:K2:7)
		DB_bo_inSearchPicker:=True:C214
		
		
	: ($_l_FormEvent=On Losing Focus:K2:8)
		DB_bo_inSearchPicker:=False:C215
		
		$_t_CurrentText:=SD2_t_SearchValue  //Get edited text
		If ($_t_CurrentText#"")
			OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; False:C215)
			//OBJECT SET VISIBLE(*;$SearchClose;True)
		Else 
			OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; True:C214)
			//OBJECT SET VISIBLE(*;$SearchClose;False)
		End if 
		
		
	: ($_l_FormEvent=On After Keystroke:K2:26) | ($_l_FormEvent=On Data Change:K2:15)
		SET TIMER:C645(30)
		//TRACE
		
		
		$_t_CurrentText:=SD2_t_SearchValue  //Get edited text
		
		
		If ($_t_CurrentText#"")
			OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; False:C215)
			//OBJECT SET VISIBLE(*;$SearchClose;True)
		Else 
			OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; True:C214)
			//OBJECT SET VISIBLE(*;$SearchClose;False)
		End if 
		SRCH_t_SearchValue:=$_t_CurrentText
		
		
	: ($_l_FormEvent=On After Edit:K2:43)
		SET TIMER:C645(30)
		$_t_CurrentText:=SD2_t_SearchValue  //Get edited text
		
		
		If ($_t_CurrentText#"")
			OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; False:C215)
			//OBJECT SET VISIBLE(*;$SearchClose;True)
		Else 
			OBJECT SET VISIBLE:C603(*; "oSearchCriteriaButton"; True:C214)
			//OBJECT SET VISIBLE(*;$SearchClose;False)
		End if 
		SRCH_t_SearchValue:=$_t_CurrentText
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_OutputForm/oSearchvalue"; $_t_oldMethodName)
