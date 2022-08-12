//%attributes = {}
If (False:C215)
	//Project Method Name:      JobStages_InOI2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JST_LB_ChargeItems;0)
	//ARRAY LONGINT(AL_al_ModOrder;0)
	//ARRAY POINTER(JST_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(JST_at_JobStageTab;0)
	//ARRAY TEXT(JST_at_ModeOrderI;0)
	C_PICTURE:C286(ALModePictureOrders)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JobStages_InOI2")
If (FORM Get current page:C276=2)
	If ((DB_GetModuleSettingByNUM(1))=5)  //in Silver, Page_2 is Actual
		JobStages_InLOI("A")
	Else 
		JobStages_InLOI("B")
	End if 
Else 
	// If (Layout page=3)
	Case of 
		: (JST_at_JobStageTab=3)
			JobStages_InLOI("A")
			FORM GOTO PAGE:C247(3)
			//SET VISIBLE(eALOrdII;True)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; True:C214)
			
			JST_at_ModeOrderI:=1
			LBi_EditListLay(->JST_aPtr_OrderItemsSetup; ->JST_at_ModeOrderI; ->ALModePictureOrders; ->AL_al_ModOrder)
			
			
			
		: (JST_at_JobStageTab=2)
			JobStages_InLOI("B")
			FORM GOTO PAGE:C247(2)
			//SET VISIBLE(eALOrdII;True)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; True:C214)
			If (JST_at_ModeOrderI=0)
				JST_at_ModeOrderI:=1
				LBi_EditListLay(->JST_aPtr_OrderItemsSetup; ->JST_at_ModeOrderI; ->ALModePictureOrders; ->AL_al_ModOrder)
				
			End if 
		: (JST_at_JobStageTab=1)
			JobStages_InLEn
			FORM GOTO PAGE:C247(1)
			//SET VISIBLE(eALOrdII;False)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; False:C215)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; False:C215)
	End case 
	
	//  End if
End if 
ERR_MethodTrackerReturn("JobStages_InOI2"; $_t_oldMethodName)