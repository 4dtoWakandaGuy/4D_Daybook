If (False:C215)
	//object Name: [ORDERS]Orders_In.OListBoxMode
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2010 11:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_modeOrders;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY LONGINT(ORD_al_ViewTableToTable;0)
	//ARRAY LONGINT(ORD_al_ViewTabsSettings;0)
	//ARRAY LONGINT(ORD_l_ViewTabsSettings;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	//ARRAY TEXT(ORD_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Switch)
	C_LONGINT:C283($_l_ModSelected; $_l_TableRow; SD_l_CurrentTable)
	C_PICTURE:C286(OrdModePict)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Orders_In.OListBoxMode"; Form event code:C388)
$_l_ModSelected:=ORD_al_modeOrders{ORD_at_ModeOrders}
$_bo_Switch:=True:C214
If (ORD_al_modeOrders{ORD_at_ModeOrders}=-1)  //setting is no edit and would change to edit- so if current view is no edit don't switch
	Case of 
		: (ORD_al_ViewTabsSettings{ORD_at_ViewTabsLabels}=3)
			$_bo_Switch:=False:C215
		Else 
			$_bo_Switch:=True:C214
	End case 
End if 
SD_l_CurrentTable:=Table:C252(->[ORDERS:24])
$_l_TableRow:=Find in array:C230(ORD_al_SubAreaTables; ORD_al_ViewTableToTable{ORD_at_ViewTabsLabels})
If ($_l_TableRow>0)
	$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_TableRow}
	
	LBi_EditListLay($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; ->OrdModePict; ->ORD_al_modeOrders; $_bo_Switch)
	If ($_l_ModSelected=3)
		If (OK=1)
			//Orders_InLPOI   `re-find all of the Items
			//remember to issue a save before a search if not this proc
			ORD_at_ModeOrders:=0
			LBi_RemoveAll($_ptr_ListBoxSetup)  // I have modified this to reload the arrays because its easier
			
			Orders_InLPß("P1")
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Orders_In,ORD_at_ModeOrders"; $_t_oldMethodName)
