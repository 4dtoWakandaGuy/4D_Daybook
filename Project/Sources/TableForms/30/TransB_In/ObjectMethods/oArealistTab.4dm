If (False:C215)
	//object Name: [TRANSACTION_BATCHES]TransB_in.oArealistTab
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
	//ARRAY BOOLEAN(ACC_LB_SubItems;0)
	//ARRAY BOOLEAN(ACC_LB_TransItems;0)
	//ARRAY TEXT(ACC_at_AccBatchTab;0)
	//ARRAY TEXT(ACC_at_ModeTransIn;0)
	C_BOOLEAN:C305(BAT_bo_UseAreaList)
	C_LONGINT:C283(ACC_l_ConsilidatedView)
	C_PICTURE:C286(<>LB_pic_ModePicture)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTION_BATCHES].TransB_in.oArealistTab"; Form event code:C388)
Case of 
	: (ACC_at_AccBatchTab=1)
		If (Screen width:C187>800)
			FORM GOTO PAGE:C247(2)
			OBJECT SET VISIBLE:C603(*; "oSubForm@"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oListbox@"; True:C214)
			OBJECT SET VISIBLE:C603(ACC_l_ConsilidatedView; True:C214)
			BAT_bo_UseAreaList:=True:C214
			If ([TRANSACTION_BATCHES:30]Posted_Date:16#!00-00-00!)
				
				//AL_SetEnterable (ACC_l_TransItems;0;0)
				OBJECT SET VISIBLE:C603(<>LB_pic_ModePicture; False:C215)
				OBJECT SET VISIBLE:C603(ACC_at_ModeTransIn; False:C215)
			End if 
			
		Else 
			FORM GOTO PAGE:C247(1)
			OBJECT SET VISIBLE:C603(*; "oSubForm@"; True:C214)
			OBJECT SET VISIBLE:C603(*; "oListbox@"; False:C215)
			
			//screen too narrow use the subform
			BAT_bo_UseAreaList:=False:C215
		End if 
		
	: (ACC_at_AccBatchTab=2)
		//SET VISIBLE(ACC_l_ConsilidatedView;False)
		OBJECT SET VISIBLE:C603(*; "oListbox@"; False:C215)
		OBJECT SET VISIBLE:C603(ACC_LB_TransItems; True:C214)
		OBJECT SET VISIBLE:C603(<>LB_pic_ModePicture; False:C215)
		//SET VISIBLE(ACC_l_SubItems;False)
		OBJECT SET VISIBLE:C603(ACC_LB_SubItems; False:C215)
		
		OBJECT SET VISIBLE:C603(ACC_at_ModeTransIn; False:C215)
		FORM GOTO PAGE:C247(3)
End case 
ERR_MethodTrackerReturn("OBJ [TRANSACTION_BATCHES].TransB_in.oArealistTab"; $_t_oldMethodName)
