If (False:C215)
	//object Name: [STOCK_MOVEMENTS]Movements_in.oModeStockMove
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
	//ARRAY LONGINT(AL_al_ModeStock;0)
	//ARRAY POINTER(STK_aptr_ItemPreferences;0)
	//ARRAY TEXT(SM_at_ModeStockMov;0)
	C_BOOLEAN:C305($_bo_Switch)
	C_LONGINT:C283($_l_ModeSelected)
	C_PICTURE:C286(STK_pic_ModeStock)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [STOCK_MOVEMENTS].Movements_in.oModeStockMove"; Form event code:C388)
$_bo_Switch:=True:C214
//
$_l_ModeSelected:=AL_al_ModeStock{SM_at_ModeStockMov}
LBi_EditListLay(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock; $_bo_Switch)

If ($_l_ModeSelected=3)
	If (OK=1)
		STOCK_LoadItems([STOCK_MOVEMENTS:40]Movement_Code:1)  //New Call NG May 2004
		LBi_EditListLay(->STK_aptr_ItemPreferences; ->SM_at_ModeStockMov; ->STK_pic_ModeStock; ->AL_al_ModeStock)
		
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [STOCK_MOVEMENTS].Movements_in.oModeStockMove"; $_t_oldMethodName)
