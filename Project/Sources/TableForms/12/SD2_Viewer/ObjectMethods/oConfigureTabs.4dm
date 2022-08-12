If (False:C215)
	//object Method Name: Object Name:      [DIARY].SD2_Viewer.oConfigureTabs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(LB_al_ConfigureSD2;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	//ARRAY TEXT(LB_at_ConfigureSD2;0)
	C_BOOLEAN:C305($_bo_Reset)
	C_LONGINT:C283(SD_l_CurrentTable; vCT)
	C_PICTURE:C286(SD2_Pi_Configure)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].SD2_Viewer.oConfigureTabs"; Form event code:C388)
If (vCT=0)
	$_bo_Reset:=(LB_at_ConfigureSD2=3)
	SD_l_CurrentTable:=Table:C252(->[DIARY:12])
	LBi_EditListLay(->SD2_aptr_ListControl; ->LB_at_ConfigureSD2; ->SD2_Pi_Configure; ->LB_al_ConfigureSD2)
	
	If (OK=1) & ($_bo_Reset)
		LBi_EditListUpd(->SD2_aptr_ListControl)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:SD2_Viewer,LB_a33ConfigureSD2"; $_t_oldMethodName)
