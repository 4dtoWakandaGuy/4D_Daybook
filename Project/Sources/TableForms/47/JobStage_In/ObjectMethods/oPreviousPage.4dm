If (False:C215)
	//object Name: [JOB_STAGES]JobStage_in.Variable1
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
	//ARRAY BOOLEAN(JST_LB_ChargeItems;0)
	//ARRAY LONGINT(AL_al_ModOrder;0)
	//ARRAY POINTER(JST_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(JST_at_JobStageTab;0)
	//ARRAY TEXT(JST_at_ModeOrderI;0)
	C_LONGINT:C283($_l_Index)
	C_PICTURE:C286(ALModePictureOrders)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOB_STAGES].JobStage_in.Variable1"; Form event code:C388)
If (JST_at_JobStageTab<Size of array:C274(JST_at_JobStageTab))
	JST_at_JobStageTab:=JST_at_JobStageTab+1
End if 
If (JST_at_JobStageTab#FORM Get current page:C276)
	Case of 
		: (JST_at_JobStageTab=3)
			If (FORM Get current page:C276#1)
				JS_SetOrderItemSort
			End if 
			JobStages_InLOI("A")
			FORM GOTO PAGE:C247(3)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; True:C214)
			
			
			JST_at_ModeOrderI:=1
			LBi_EditListLay(->JST_aPtr_OrderItemsSetup; ->JST_at_ModeOrderI; ->ALModePictureOrders; ->AL_al_ModOrder)
			
			
		: (JST_at_JobStageTab=2)
			If (FORM Get current page:C276#1)
				JS_SetOrderItemSort
			End if 
			JobStages_InLOI("B")
			FORM GOTO PAGE:C247(2)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; True:C214)
			
			
			JST_at_ModeOrderI:=1
			LBi_EditListLay(->JST_aPtr_OrderItemsSetup; ->JST_at_ModeOrderI; ->ALModePictureOrders; ->AL_al_ModOrder)
			
			
			
		: (JST_at_JobStageTab=1)
			JobStages_InLEn
			FORM GOTO PAGE:C247(1)
			OBJECT SET VISIBLE:C603(JST_LB_ChargeItems; True:C214)
			OBJECT SET VISIBLE:C603(*; "oOrderPop@"; False:C215)
			
	End case 
	
End if 
ERR_MethodTrackerReturn("OBJ [JOB_STAGES].JobStage_in.Variable1"; $_t_oldMethodName)
