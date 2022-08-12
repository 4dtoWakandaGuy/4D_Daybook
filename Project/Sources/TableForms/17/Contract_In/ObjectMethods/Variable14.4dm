If (False:C215)
	//object Name: [CONTRACTS]Contract_in.Variable14
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
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY POINTER(SVS_aptr_ListboxSetup;0)
	//ARRAY TEXT(CON_at_EditMode;0)
	C_LONGINT:C283($_l_OrdersMode)
	C_PICTURE:C286(CON_pic_ModePict)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.Variable14"; Form event code:C388)

If ([ORDER_ITEMS:25]Contract_Code:29#"")
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
End if 


$_l_OrdersMode:=CON_al_EditMode{CON_at_EditMode}
LBi_EditListLay(->SVS_aptr_ListboxSetup; ->CON_at_EditMode; ->CON_pic_ModePict; ->CON_al_EditMode; True:C214)
If ($_l_OrdersMode=3)
	If (OK=1)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.Variable14"; $_t_oldMethodName)
