If (False:C215)
	//object Name: [COMPANIES]Company_In.oCOntactsP1Tabs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2013 18:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CON_al_ViewTabsSettings;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(CON_at_editMode;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	C_LONGINT:C283($_l_event; CON_l_CurrentSubArea; CON_l_ParentProcess)
	C_PICTURE:C286(CON_Pi_EditMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.oCOntactsP1Tabs"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//TRACE
		CON_l_CurrentSubArea:=2
		SET PROCESS VARIABLE:C370(CON_l_ParentProcess; CON_l_CurrentSubArea; CON_l_CurrentSubArea)
		
		LBi_RemoveAll(->CON_aptr_LBSetup)
		ARRAY POINTER:C280(CON_aptr_LBSetup; 0)
		CON_SubLPB
		Case of 
			: (CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}=3)  //no edit
				If (CON_al_EditMode{1}=-1)  //already no edit
					CON_at_editMode:=1
					LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode)
				Else 
					LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode; True:C214)
				End if 
			Else   // it is editable
				If (CON_al_EditMode{1}=2)  // already edit
					//set the highlight here
					LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode)
				Else 
					LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode; True:C214)
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ:CON_SubDataArea,CON_at_ViewTabsLabels"; $_t_oldMethodName)
