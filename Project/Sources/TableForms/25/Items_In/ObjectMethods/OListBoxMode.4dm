If (False:C215)
	//object Name: [ORDER_ITEMS]Items_in.OListBoxMode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORDI_al_modeOrders;0)
	//ARRAY LONGINT(ORDI_al_ViewTabsSettings;0)
	//ARRAY POINTER(ORDI_aptr_ListBoxPointers;0)
	//ARRAY TEXT(ORDI_at_ModeOrders;0)
	//ARRAY TEXT(ORDI_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Switch)
	C_LONGINT:C283($_l_ModeSelected; SD_l_CurrentTable)
	C_PICTURE:C286(OrdiModePict)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_in.OListBoxMode"; Form event code:C388)
$_l_ModeSelected:=ORDI_al_modeOrders{ORDI_at_ModeOrders}
$_bo_Switch:=True:C214
If (ORDI_al_modeOrders{ORDI_at_ModeOrders}=-1)  //setting is no edit and would change to edit- so if current view is no edit don't switch
	
	Case of 
		: (ORDI_al_ViewTabsSettings{ORDI_at_ViewTabsLabels}=3)
			$_bo_Switch:=False:C215
		Else 
			$_bo_Switch:=True:C214
	End case 
End if 
SD_l_CurrentTable:=Table:C252(->[ORDER_ITEMS:25])
LBi_EditListLay(->ORDI_aptr_ListBoxPointers; ->ORDI_at_ModeOrders; ->OrdiModePict; ->ORDi_al_modeOrders; $_bo_Switch)
If ($_l_ModeSelected=3)
	If (OK=1)
		ORDI_at_ModeOrders:=0
		LBi_RemoveAll(->ORDI_aptr_ListBoxPointers)  // I have modified this to reload the arrays because its easier
		
		ARRAY POINTER:C280(ORDI_aptr_ListBoxPointers; 0)
		//Orders_InLPß ("P1")
		//OrderI_SubLPB
		ORDI_LoadSubArea
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_in.OListBoxMode"; $_t_oldMethodName)
