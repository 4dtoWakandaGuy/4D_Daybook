If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.OListBoxMode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_modeRelated;0)
	//ARRAY LONGINT(PRD_al_ViewTabsSettings;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_Moderelated;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Switch)
	C_LONGINT:C283($_l_ModSelected; SD_l_CurrentTable)
	C_PICTURE:C286(PRDModePict)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.OListBoxMode"; Form event code:C388)
$_l_ModSelected:=PRD_al_modeRelated{PRD_at_Moderelated}
$_bo_Switch:=True:C214
If (PRD_al_modeRelated{PRD_at_Moderelated}=-1)  //setting is no edit and would change to edit- so if current view is no edit don't switch
	Case of 
		: (PRD_al_ViewTabsSettings{PRD_at_ViewTabsLabels}=3)
			$_bo_Switch:=False:C215
		Else 
			$_bo_Switch:=True:C214
	End case 
End if 
SD_l_CurrentTable:=Table:C252(->[PRODUCTS:9])
LBi_EditListLay(->PRD_aPtr_RelatedConfiguration; ->PRD_at_Moderelated; ->PRDModePict; ->PRD_al_modeRelated; $_bo_Switch)
If ($_l_ModSelected=3)
	If (OK=1)
		//pro InLPOI   `re-find all of the Items
		//remember to issue a save before a search if not this proc
		PRD_at_Moderelated:=0
		LBi_RemoveAll(->PRD_aPtr_RelatedConfiguration)  // I have modified this to reload the arrays because its easier
		ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
		Products_InLPß("P1")
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.OListBoxMode"; $_t_oldMethodName)
