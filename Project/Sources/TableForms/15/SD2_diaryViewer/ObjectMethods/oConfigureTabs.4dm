If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oConfigureTabs
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
	//ARRAY LONGINT(LB_al_ConfigureSD2;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	//ARRAY TEXT(SD2_at_ConfigureSD2;0)
	C_BOOLEAN:C305($_bo_Reset)
	C_LONGINT:C283(SD2_l_ConfigureLB; vCT)
	C_PICTURE:C286(SD2_Pi_Configure)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oConfigureTabs"; Form event code:C388)
If (vCT=0)
	$_bo_Reset:=(LB_al_ConfigureSD2{SD2_l_ConfigureLB}=3)
	LBi_EditListLay(->SD2_aptr_ListControl; ->SD2_at_ConfigureSD2; ->SD2_Pi_Configure; ->LB_al_ConfigureSD2; True:C214)
	If (OK=1) & ($_bo_Reset)
		LBi_EditListUpd(->SD2_aptr_ListControl)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.oConfigureTabs"; $_t_oldMethodName)
