If (False:C215)
	//object Name: [JOBS]Job_In.oOrders_PopUP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AL_l_ModeOrders;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(JOB_at_Modeorders;0)
	C_PICTURE:C286(ALModePictOrders)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Job_In.oOrders_PopUP"; Form event code:C388)
If ([ORDER_ITEMS:25]Item_Number:27#0)
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
End if 
If ([JOB_STAGES:47]Job_Code:1#"")
	DB_SaveRecord(->[JOB_STAGES:47])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[JOB_STAGES:47]))
End if 

LBi_EditListLay(->JOB_aPtr_OrderItemsSetup; ->JOB_at_Modeorders; ->ALModePictOrders; ->AL_l_ModeOrders; True:C214)

If (OK=1)
	
End if 
ERR_MethodTrackerReturn("OBJ [JOBS].Job_In.oOrders_PopUP"; $_t_oldMethodName)
