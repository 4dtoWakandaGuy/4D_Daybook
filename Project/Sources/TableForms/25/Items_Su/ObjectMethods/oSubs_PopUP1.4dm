If (False:C215)
	//object Name: [ORDER_ITEMS]Items_Su.oSubs_PopUP1
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
	//ARRAY LONGINT(AL_l_ModeSubs;0)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	//ARRAY TEXT(SUB_at_Modes;0)
	C_PICTURE:C286(PRD_pic_ModeSubs)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_Su.oSubs_PopUP1"; Form event code:C388)

If ([SUBSCRIPTIONS:93]Order_Item_Number:4#0)
	DB_SaveRecord(->[SUBSCRIPTIONS:93])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[SUBSCRIPTIONS:93]))
End if 

LBi_EditListLay(->SUBS_aPtr_LBSettings; ->SUB_at_Modes; ->PRD_pic_ModeSubs; ->AL_l_ModeSubs; True:C214)

If (OK=1)
	
End if 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_Su.oSubs_PopUP1"; $_t_oldMethodName)
