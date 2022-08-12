//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_EnterNewRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   09/08/2010 19:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_OutputArrays;0)
	//ARRAY LONGINT(<>DB_al_TableNums;0)
	//ARRAY TEXT(DB_at_PopUpSelector;0)
	//ARRAY TEXT(DB_at_TabNavigation;0)
	C_BOOLEAN:C305(CON_bo_NoCancel; DB_bo_BatchedRecordEntry; DB_bo_RecordsinNewProcess)
	C_COLLECTION:C1488($_Col_ObjectPositions)
	C_LONGINT:C283($_l_AreaWidth; $_l_CallBackProcess; $_l_CancelLeft; $_l_CBBottom; $_l_CBLeft; $_l_CBRight; $_l_CBTop; $_l_CurrentDisplayedForm; $_l_DDObject1Bottom; $_l_DDObject1Left; $_l_DDObject1RIght)
	C_LONGINT:C283($_l_DDObject1Top; $_l_DDObjectLabel1Bottom; $_l_DDObjectLabel1Left; $_l_DDObjectLabel1Right; $_l_DDObjectLabel1Top; $_l_DDWidth; $_l_DropDownLeft; $_l_Functionobject1Bottom; $_l_Functionobject1Left; $_l_Functionobject1Right; $_l_Functionobject1Top)
	C_LONGINT:C283($_l_FunctionObject2Bottom; $_l_Functionobject2Left; $_l_Functionobject2Right; $_l_Functionobject2Top; $_l_FunctionObject3Bottom; $_l_Functionobject3Left; $_l_Functionobject3Right; $_l_Functionobject3Top; $_l_FunctionObject4Bottom; $_l_Functionobject4Left; $_l_Functionobject4Right)
	C_LONGINT:C283($_l_Functionobject4Top; $_l_GridObject2Bottom; $_l_GridObject2Left; $_l_GridObject2Right; $_l_GridObject2Top; $_l_GridObjectBottom; $_l_GridObjectLeft; $_l_GridObjectRight; $_l_GridObjectTop; $_l_NavObjectBottom; $_l_NavObjectLeft)
	C_LONGINT:C283($_l_NavObjectRight; $_l_NavObjectTop; $_l_NewRecordProcess; $_l_Object11Bottom; $_l_object11Left; $_l_Object11Right; $_l_Object11Top; $_l_Object13Bottom; $_l_object13Left; $_l_Object13Right; $_l_Object13Top)
	C_LONGINT:C283($_l_Object14Bottom; $_l_object14Left; $_l_Object14Right; $_l_Object14Top; $_l_Object15Bottom; $_l_object15Left; $_l_Object15Right; $_l_Object15Top; $_l_Object18Bottom; $_l_object18Left; $_l_Object18Right)
	C_LONGINT:C283($_l_Object18Top; $_l_Object1Bottom; $_l_object1Left; $_l_Object1Right; $_l_Object1Top; $_l_Object2Bottom; $_l_object2Left; $_l_Object2Right; $_l_object2Top; $_l_Object3Bottom; $_l_object3Left)
	C_LONGINT:C283($_l_Object3Right; $_l_Object3Top; $_l_Object4Bottom; $_l_object4Left; $_l_Object4Right; $_l_Object4Top; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_RecordsClash)
	C_LONGINT:C283($_l_SearchBottom; $_l_SearchLeft; $_l_SearchRIght; $_l_SearchTop; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; $_l_WindowWidth; DB_but_CBFunction1; DB_but_Function1)
	C_LONGINT:C283(DB_but_Function2; DB_l_ButtonPrefsSet; DB_l_CurrentDisplayedForm; DB_l_LBOutputForm; DB_l_Navigatetoselected; PAL_BUTTON_1; PAL_BUTTON_11; PAL_BUTTON_13; PAL_BUTTON_14; PAL_BUTTON_15; PAL_BUTTON_18)
	C_LONGINT:C283(PAL_BUTTON_2; PAL_BUTTON_3; PAL_BUTTON_4; PAL_BUTTON_45)
	C_TEXT:C284($_t_EnterNewText; $_t_FieldDefCode; $_t_oldMethodName; $_t_TableName; DB_t_CurrentContext; DB_t_CUrrentMenuReference)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_EnterNewRecord")
//add a line
// add another

$_t_EnterNewText:=Get localized string:C991("MenuItem_EnterNew")
$_t_TableName:=Table name:C256(Table:C252(DB_l_CurrentDisplayedForm))
$_l_CallBackProcess:=Current process:C322
TRACE:C157

$_Col_ObjectPositions:=New collection:C1472

OBJECT GET COORDINATES:C663(PAL_BUTTON_2; $_l_object2Left; $_l_object2Top; $_l_Object2Right; $_l_Object2Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_1; $_l_object1Left; $_l_Object1Top; $_l_Object1Right; $_l_Object1Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_4; $_l_object4Left; $_l_Object4Top; $_l_Object4Right; $_l_Object4Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_3; $_l_object3Left; $_l_Object3Top; $_l_Object3Right; $_l_Object3Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_13; $_l_object13Left; $_l_Object13Top; $_l_Object13Right; $_l_Object13Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_11; $_l_object11Left; $_l_Object11Top; $_l_Object11Right; $_l_Object11Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_15; $_l_object15Left; $_l_Object15Top; $_l_Object15Right; $_l_Object15Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_14; $_l_object14Left; $_l_Object14Top; $_l_Object14Right; $_l_Object14Bottom)

OBJECT GET COORDINATES:C663(PAL_BUTTON_18; $_l_object18Left; $_l_Object18Top; $_l_Object18Right; $_l_Object18Bottom)

OBJECT GET COORDINATES:C663(DB_but_Function1; $_l_Functionobject1Left; $_l_Functionobject1Top; $_l_Functionobject1Right; $_l_Functionobject1Bottom)
OBJECT GET COORDINATES:C663(DB_but_Function2; $_l_Functionobject2Left; $_l_Functionobject2Top; $_l_Functionobject2Right; $_l_FunctionObject2Bottom)
OBJECT GET COORDINATES:C663(DB_but_CBFunction1; $_l_Functionobject3Left; $_l_Functionobject3Top; $_l_Functionobject3Right; $_l_FunctionObject3Bottom)
OBJECT GET COORDINATES:C663(PAL_BUTTON_45; $_l_Functionobject4Left; $_l_Functionobject4Top; $_l_Functionobject4Right; $_l_FunctionObject4Bottom)
OBJECT GET COORDINATES:C663(*; "oNavigator"; $_l_NavObjectLeft; $_l_NavObjectTop; $_l_NavObjectRight; $_l_NavObjectBottom)
OBJECT GET COORDINATES:C663(DB_l_LBOutputForm; $_l_GridObjectLeft; $_l_GridObjectTop; $_l_GridObjectRight; $_l_GridObjectBottom)
OBJECT GET COORDINATES:C663(DB_lb_OutputArrays; $_l_GridObject2Left; $_l_GridObject2Top; $_l_GridObject2Right; $_l_GridObject2Bottom)
//adding a comment
//and another
OBJECT GET COORDINATES:C663(*; "oDropDownQueryLabel"; $_l_DDObjectLabel1Left; $_l_DDObjectLabel1Top; $_l_DDObjectLabel1Right; $_l_DDObjectLabel1Bottom)
OBJECT GET COORDINATES:C663(*; "oDropDownQuery"; $_l_DDObject1Left; $_l_DDObject1Top; $_l_DDObject1RIght; $_l_DDObject1Bottom)



If (Count parameters:C259>=1)
	//Pass the table name to add to
Else 
	$_l_CurrentDisplayedForm:=DB_l_CurrentDisplayedForm
End if 
Case of 
	: ($_l_CurrentDisplayedForm=Table:C252(->[COMPANIES:2]))
		
		If (DB_bo_RecordsinNewProcess)
			//Companies_In_NEW (False;True)
			
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
		Else 
			CREATE SET:C116([COMPANIES:2]; "CMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(26)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			USE SET:C118("Cmaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[CONTACTS:1]))
		
		
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
		Else 
			CREATE SET:C116([CONTACTS:1]; "CMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(27)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			
			//``
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			USE SET:C118("Cmaster")
		End if 
		
		SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[ACCOUNTS:32]))
		CREATE SET:C116([ACCOUNTS:32]; "CMaster")
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([ACCOUNTS:32]; "CMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			USE SET:C118("Cmaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[ACTIONS:13]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
		Else 
			CREATE SET:C116([COMPANIES:2]; "CMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			USE SET:C118("Cmaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
		
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[ADDRESS_FORMATS:74]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([ADDRESS_FORMATS:74]; "AFActionsMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			USE SET:C118("Cmaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
		USE SET:C118("AFActionsMaster")
	: ($_l_CurrentDisplayedForm=Table:C252(->[ANALYSES:36]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([ANALYSES:36]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
		
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[AREAS:3]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([AREAS:3]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([AREAS:3]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
		
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_BRANDS:8]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([PRODUCT_BRANDS:8]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			//SET MENU BAR(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PRODUCT_BRANDS:8]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CATALOGUE:108]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([CATALOGUE:108]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([CATALOGUE:108]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TIME_BILLING_CATEGORIES:46]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([TIME_BILLING_CATEGORIES:46]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([TIME_BILLING_CATEGORIES:46]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[COMPONENTS:86]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([COMPONENTS:86]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([COMPONENTS:86]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CONTRACT_TYPES:19]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([CONTRACT_TYPES:19]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([CONTRACT_TYPES:19]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CONTRACTS:17]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([CONTRACTS:17]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([CONTRACTS:17]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[COUNTRIES:73]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([COUNTRIES:73]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([COUNTRIES:73]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CREDIT_STAGES:54]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([CREDIT_STAGES:54]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([CREDIT_STAGES:54]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[CURRENCIES:71]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([CURRENCIES:71]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([CURRENCIES:71]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[DOCUMENTS:7]))
		
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([DOCUMENTS:7]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([DOCUMENTS:7]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[CUSTOM_FIELD_DEFINITiONS:99]))
		
		If (DB_at_PopUpSelector>0)
			If (False:C215)
				//TRACE
				CREATE SET:C116([CUSTOM_FIELD_DEFINITiONS:99]; "$Current")
				
				If ([CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1#"") & ([CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2#"")
					DB_SaveRecord(->[CUSTOM_FIELD_DEFINITiONS:99])
				End if 
				CREATE RECORD:C68([CUSTOM_FIELD_DEFINITiONS:99])
				
				[CUSTOM_FIELD_DEFINITiONS:99]Table_Number:3:=<>DB_al_TableNums{DB_at_PopUpSelector}
				
				Repeat 
					$_t_FieldDefCode:=String:C10(AA_GetNextIDinMethod(->[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1; Sequence number:C244([CUSTOM_FIELD_DEFINITiONS:99])-1))
					SET QUERY DESTINATION:C396(3; $_l_RecordsClash)
					QUERY:C277([CUSTOM_FIELD_DEFINITiONS:99]; [CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1=$_t_FieldDefCode)
					SET QUERY DESTINATION:C396(0)
				Until ($_l_RecordsClash=0)
				[CUSTOM_FIELD_DEFINITiONS:99]FD_Code:1:=$_t_FieldDefCode
				SAVE RECORD:C53([CUSTOM_FIELD_DEFINITiONS:99])
				ADD TO SET:C119("$Current")
				USE SET:C118("$Current")
			End if 
			
			If (DB_bo_RecordsinNewProcess)
				If (DB_t_CurrentContext#"")
					
					$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
				Else 
					$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
				End if 
				
				
				
			Else 
				CREATE SET:C116([CUSTOM_FIELD_DEFINITiONS:99]; "$FFMaster")
				GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				DB_l_ButtonPrefsSet:=1
				SET MENU BAR:C67(9)
				If (DB_t_CurrentContext#"")
					DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
				Else 
					DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
				End if 
				SET MENU BAR:C67(DB_t_CUrrentMenuReference)
				SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
				If (OK=1)
					
					ADD TO SET:C119([CUSTOM_FIELD_DEFINITiONS:99]; "$FFMaster")
				End if 
				USE SET:C118("$FFMaster")
				//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
				DB_SetFormMenuoptions
				DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
				SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
				
			End if 
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ADDITIONAL_RECORD_ANALYSIS:53]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([ADDITIONAL_RECORD_ANALYSIS:53]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([ADDITIONAL_RECORD_ANALYSIS:53]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRODUCT_GROUPS:10]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([PRODUCT_GROUPS:10]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PRODUCT_GROUPS:10]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[HEADINGS:84]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([HEADINGS:84]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([HEADINGS:84]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[INVOICES:39]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([INVOICES:39]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([INVOICES:39]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[JOB_TYPES:65]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([JOB_TYPES:65]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([JOB_TYPES:65]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//`DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[JOBS:26]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([JOBS:26]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([JOBS:26]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//`DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[LAYERS:76]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([LAYERS:76]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([LAYERS:76]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[LOCATIONS:61]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([LOCATIONS:61]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([LOCATIONS:61]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[SCRIPTS:80]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([SCRIPTS:80]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([SCRIPTS:80]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[MOVEMENT_TYPES:60]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			CREATE SET:C116([MOVEMENT_TYPES:60]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([MOVEMENT_TYPES:60]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ORDERS:24]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([ORDERS:24]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([ORDERS:24]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL_GROUPS:92]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PERSONNEL_GROUPS:92]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PERSONNEL_GROUPS:92]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
		
	: ($_l_CurrentDisplayedForm=Table:C252(->[PERSONNEL:11]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PERSONNEL:11]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PERSONNEL:11]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PICTURES:85]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PICTURES:85]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PICTURES:85]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[POSTAL_CODES:50]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([POSTAL_CODES:50]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([POSTAL_CODES:50]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRICE_GROUPS:18]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PRICE_GROUPS:18]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PRICE_GROUPS:18]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRICE_TABLE:28]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PRICE_TABLE:28]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PRICE_TABLE:28]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PROBLEMS:22]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			//modification
			
			CREATE SET:C116([PROBLEMS:22]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PROBLEMS:22]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PRODUCTS:9]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PRODUCTS:9]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PRODUCTS:9]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PROJECTS:89]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PROJECTS:89]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PROJECTS:89]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PUBLICATIONS:52]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PUBLICATIONS:52]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PUBLICATIONS:52]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_ORDERS:57]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PURCHASE_ORDERS:57]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PURCHASE_ORDERS:57]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[PURCHASE_INVOICES:37]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([PURCHASE_INVOICES:37]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([PURCHASE_INVOICES:37]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[RECURRING_JOURNALS:38]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([RECURRING_JOURNALS:38]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([RECURRING_JOURNALS:38]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[RESULTS:14]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([RESULTS:14]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([RESULTS:14]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[ROLES:87]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([ROLES:87]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([ROLES:87]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[SERVICE_CALLS:20]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([SERVICE_CALLS:20]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([SERVICE_CALLS:20]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[SOLUTIONS:23]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([SOLUTIONS:23]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([SOLUTIONS:23]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[SOURCES:6]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([SOURCES:6]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([SOURCES:6]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STAGES:45]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([STAGES:45]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([STAGES:45]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STATUS:4]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([STATUS:4]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([STATUS:4]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STOCK_LEVELS:58]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([STOCK_LEVELS:58]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([STOCK_LEVELS:58]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STOCK_MOVEMENTS:40]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([STOCK_MOVEMENTS:40]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([STOCK_MOVEMENTS:40]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[STOCK_TYPES:59]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([STOCK_TYPES:59]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([STOCK_TYPES:59]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TAX_CODES:35]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([TAX_CODES:35]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([TAX_CODES:35]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TERMINOLOGY:75]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([TERMINOLOGY:75]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([TERMINOLOGY:75]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_BATCHES:30]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([TRANSACTION_BATCHES:30]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([TRANSACTION_BATCHES:30]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TRANSACTION_TYPES:31]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([TRANSACTION_TYPES:31]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([TRANSACTION_TYPES:31]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[TYPES:5]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([TYPES:5]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([TYPES:5]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_CONTROL:51]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([WORKFLOW_CONTROL:51]; "ANMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([WORKFLOW_CONTROL:51]; "ANMaster")
			End if 
			USE SET:C118("ANMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
	: ($_l_CurrentDisplayedForm=Table:C252(->[WORKFLOW_Campaign:209]))
		If (DB_bo_RecordsinNewProcess)
			If (DB_t_CurrentContext#"")
				
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214; DB_t_CurrentContext)
			Else 
				$_l_NewRecordProcess:=New process:C317("DB_CreateNewRecord"; 256000; $_t_EnterNewText+$_t_TableName; $_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; True:C214)
			End if 
			
			
			
		Else 
			
			CREATE SET:C116([WORKFLOW_Campaign:209]; "WFCMaster")
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			DB_l_ButtonPrefsSet:=1
			SET MENU BAR:C67(9)
			If (DB_t_CurrentContext#"")
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215; DB_t_CurrentContext)
			Else 
				DB_CreateNewRecord($_l_CallBackProcess; DB_bo_BatchedRecordEntry; $_l_CurrentDisplayedForm; False:C215)
			End if 
			SET MENU BAR:C67(DB_t_CUrrentMenuReference)
			SET WINDOW RECT:C444($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			If (OK=1)
				ADD TO SET:C119([WORKFLOW_Campaign:209]; "WFCMaster")
			End if 
			USE SET:C118("WFCMaster")
			//DB_SetFormSize ($_l_CurrentDisplayedForm;->DB_l_LBOutputForm;90;60;DB_bo_DisplayFilters)
			DB_SetFormMenuoptions
			DB_SetFormSortOrder($_l_CurrentDisplayedForm; DB_t_CurrentContext)
			SEL_UpdateRecordCache($_l_CurrentDisplayedForm)
			
		End if 
End case 


OBJECT MOVE:C664(PAL_BUTTON_2; $_l_object2Left; $_l_object2Top; $_l_Object2Right; $_l_Object2Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_1; $_l_object1Left; $_l_Object1Top; $_l_Object1Right; $_l_Object1Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_4; $_l_object4Left; $_l_Object4Top; $_l_Object4Right; $_l_Object4Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_3; $_l_object3Left; $_l_Object3Top; $_l_Object3Right; $_l_Object3Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_13; $_l_object13Left; $_l_Object13Top; $_l_Object13Right; $_l_Object13Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_11; $_l_object11Left; $_l_Object11Top; $_l_Object11Right; $_l_Object11Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_15; $_l_object15Left; $_l_Object15Top; $_l_Object15Right; $_l_Object15Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_14; $_l_object14Left; $_l_Object14Top; $_l_Object14Right; $_l_Object14Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_18; $_l_object18Left; $_l_Object18Top; $_l_Object18Right; $_l_Object18Bottom; *)
OBJECT MOVE:C664(DB_but_Function1; $_l_Functionobject1Left; $_l_Functionobject1Top; $_l_Functionobject1Right; $_l_Functionobject1Bottom; *)
OBJECT MOVE:C664(DB_but_Function2; $_l_Functionobject2Left; $_l_Functionobject2Top; $_l_Functionobject2Right; $_l_FunctionObject2Bottom; *)
OBJECT MOVE:C664(DB_but_CBFunction1; $_l_Functionobject3Left; $_l_Functionobject3Top; $_l_Functionobject3Right; $_l_FunctionObject3Bottom; *)
OBJECT MOVE:C664(PAL_BUTTON_45; $_l_Functionobject4Left; $_l_Functionobject4Top; $_l_Functionobject4Right; $_l_FunctionObject4Bottom; *)
OBJECT SET COORDINATES:C1248(*; "oNavigator"; $_l_NavObjectLeft; $_l_NavObjectTop; $_l_NavObjectRight; $_l_NavObjectBottom)
OBJECT MOVE:C664(DB_l_LBOutputForm; $_l_GridObjectLeft; $_l_GridObjectTop; $_l_GridObjectRight; $_l_GridObjectBottom; *)
OBJECT MOVE:C664(DB_lb_OutputArrays; $_l_GridObject2Left; $_l_GridObject2Top; $_l_GridObject2Right; $_l_GridObject2Bottom; *)
GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
$_l_WindowWidth:=$_l_WindowRight-$_l_WindowLeft

OBJECT GET COORDINATES:C663(DB_l_Navigatetoselected; $_l_CBLeft; $_l_CBTop; $_l_CBRight; $_l_CBBottom)
OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
$_l_AreaWidth:=$_l_ObjectRight-$_l_ObjectLeft
OBJECT MOVE:C664(*; "oRoundArea1"; ($_l_WindowWidth-10)-$_l_AreaWidth; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
OBJECT MOVE:C664(*; "oFocusRing"; ($_l_WindowWidth-10)-$_l_AreaWidth; $_l_ObjectTop; $_l_WindowWidth-10; $_l_ObjectBottom; *)
//drop down 12 in and 23 wid
$_l_DropDownLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+12
$_l_SearchLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+38
$_l_CancelLeft:=(($_l_WindowWidth-10)-$_l_AreaWidth)+(462-269)
OBJECT MOVE:C664(*; "oSearchCriteriaButton"; $_l_DropDownLeft; $_l_ObjectTop+8; $_l_DropDownLeft+23; $_l_ObjectBottom-5; *)
OBJECT MOVE:C664(*; "oSearchvalue"; $_l_SearchLeft; $_l_ObjectTop+9; $_l_SearchLeft+150; $_l_ObjectBottom-9; *)
OBJECT MOVE:C664(*; "oSearchCriteria"; $_l_SearchLeft; $_l_ObjectTop+9; $_l_SearchLeft+150; $_l_ObjectBottom-9; *)
OBJECT MOVE:C664(*; "oSearchClearButton"; $_l_CancelLeft; $_l_ObjectTop+9; $_l_CancelLeft+15; $_l_ObjectBottom-9; *)

OBJECT GET COORDINATES:C663(*; "oRoundArea1"; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
OBJECT GET COORDINATES:C663(*; "oSRCH_t_Prompt"; $_l_SearchLeft; $_l_SearchTop; $_l_SearchRIght; $_l_SearchBottom)
OBJECT MOVE:C664(*; "oSRCH_t_Prompt"; $_l_CBRight+5; $_l_SearchTop; ($_l_ObjectLeft-10); $_l_SearchBottom; *)
OBJECT MOVE:C664(*; "oDropDownQueryLabel"; $_l_DDObjectLabel1Left; $_l_DDObjectLabel1Top; $_l_DDObjectLabel1Right; $_l_DDObjectLabel1Bottom; *)
$_l_DDWidth:=$_l_DDObject1RIght-$_l_DDObject1Left
OBJECT MOVE:C664(*; "oDropDownQuery"; $_l_DDObjectLabel1Right+5; $_l_DDObject1Top; ($_l_DDObjectLabel1Right+5+$_l_DDWidth); $_l_DDObject1Bottom; *)
DB_l_CurrentDisplayedForm:=$_l_CurrentDisplayedForm
ERR_MethodTrackerReturn("DB_EnterNewRecord"; $_t_oldMethodName)
