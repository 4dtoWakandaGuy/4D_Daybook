If (False:C215)
	//object Name: [JOB_STAGES]JobStage_in.oOrderPopup1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AL_al_ModOrder;0)
	//ARRAY POINTER(JST_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(JST_at_ModeOrderI;0)
	C_BOOLEAN:C305($_bo_Switch)
	C_PICTURE:C286(ALModePictureOrders)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStage_in.oOrderPopup1"; Form event code:C388)
If ([JOB PERSONNEL:48]Job_stage_Code:17#"")
	DB_SaveRecord(->[JOB PERSONNEL:48])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB PERSONNEL:48]))
End if 
$_bo_Switch:=True:C214
If ([ORDER_ITEMS:25]Job_Code:34#"")
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
End if 


LBi_EditListLay(->JST_aPtr_OrderItemsSetup; ->JST_at_ModeOrderI; ->ALModePictureOrders; ->AL_al_ModOrder; $_bo_Switch)

If (OK=1)
	
End if 
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStage_in.oOrderPopup1"; $_t_oldMethodName)
