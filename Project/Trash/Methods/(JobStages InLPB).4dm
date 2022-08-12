//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JobStages_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AL_al_ModPers;0)
	//ARRAY POINTER(JST_aptr_LBSettings;0)
	//ARRAY TEXT(JST_at_ModePersonnel;0)
	C_BOOLEAN:C305($_bo_ReadOnlyState; vFromIn)
	C_PICTURE:C286(ALModePicturePersons)
	C_TEXT:C284($_t_oldMethodName; DB_t_CallOnCloseorSave; vButtDisSC)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_InLPB")
If ((DB_GetModuleSettingByNUM(1))=5)
	If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
		DB_MenuAction("Functions"; "Duplicate an Item"; 3; "")
		DB_MenuAction("Functions"; "Copy or Move Items"; 3; "")
		
	End if 
Else 
	If ((DB_GetModuleSettingByNUM(Module_Assemblies))<2)
		DB_MenuAction("Functions"; "Trial Assembly - Display"; 3; "")
		DB_MenuAction("Functions"; "  Show Top Level Items"; 3; "")
		DB_MenuAction("Functions"; "  Show Next Level Items"; 3; "")
		
	End if 
	If ((DB_GetModuleSettingByNUM(Module_StockControl))<2)
		DB_MenuAction("Functions"; "Allocate Stock"; 3; "")
		DB_MenuAction("Functions"; "View Stock Levels"; 3; "")
		
	End if 
End if 
vButtDisSC:="IS   O  FSS R ADT"
If (FORM Get current page:C276=1)
	Input_Buttons(->[JOB_STAGES:47]; ->vButtDisSC; "Job Stage"; "Job Personnel")
Else 
	Input_Buttons(->[JOB_STAGES:47]; ->vButtDisSC; "Job Stage"; "Cost Item")
End if 
DB_t_CallOnCloseorSave:="JobStages_INLPA"
vFromIn:=False:C215
//new lines added NG april 2004
If ([JOB_STAGES:47]Job_Stage_code:52="")  //this now gives this stage a single identifier
	[JOB_STAGES:47]Job_Stage_code:52:=String:C10(Gen_Code((Table:C252(->[JOB_STAGES:47]))+255; ->[JOB_STAGES:47]Job_Stage_code:52))
	
End if 
//this is the old way
//
//
JC_JSTotalArraysInit  //added 15/03/07 -kmw
JC_JSTotalArraysLoadValues  //added 15/03/07 -kmw
JC_JSTotalListBoxSetup  //added 15/03/07 -kmw
//

QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_stage_Code:17=[JOB_STAGES:47]Job_Stage_code:52)
If (Records in selection:C76([JOB PERSONNEL:48])=0)
	$_bo_ReadOnlyState:=Read only state:C362([JOB PERSONNEL:48])
	If ($_bo_ReadOnlyState)
		READ WRITE:C146([JOB PERSONNEL:48])
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Job_Code:1=[JOB_STAGES:47]Job_Code:1; *)
		QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=[JOB_STAGES:47]Stage_Code:2)
		//New lines here to update
		If (Records in selection:C76([JOB PERSONNEL:48])>0)
			APPLY TO SELECTION:C70([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Stage_Code:2:=[JOB_STAGES:47]Job_Stage_code:52)
		End if 
		If ($_bo_ReadOnlyState)
			READ ONLY:C145([JOB PERSONNEL:48])
		End if 
		
	End if 
End if 

JST_LoadPersons([JOB_STAGES:47]Job_Stage_code:52)
JST_at_ModePersonnel:=1
AL_al_ModPers:=1
LBi_EditListLay(->JST_aptr_LBSettings; ->JST_at_ModePersonnel; ->ALModePicturePersons; ->AL_al_ModPers)


JobStages_InOI2

JC_JSSetTimePostEnterability  //added 15/03/07 -kmw

Macro_AccType("Load "+String:C10(Table:C252(->[JOB_STAGES:47])))
ERR_MethodTrackerReturn("JobStages_InLPB"; $_t_oldMethodName)