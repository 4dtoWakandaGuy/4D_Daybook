If (False:C215)
	//object Name: [ORDERS]Jobs_TCIn.Variable10
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array LONGINT(ORD_al_ModeDiary;0)
	//Array POINTER(ORD_aPtr_LbDISetup;0)
	//Array TEXT(ORD_at_ModeDiary;0)
	C_PICTURE:C286(ORD_Pi_ModeDiary)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Jobs_TCIn.Variable10"; Form event code:C388)
If ([ORDER_ITEMS:25]Order_Code:1#"")
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
End if 
If ([DIARY:12]Diary_Code:3#"")
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[DIARY:12]))
	
End if 

LBi_EditListLay(->ORD_aPtr_LbDISetup; ->ORD_at_ModeDiary; ->ORD_Pi_ModeDiary; ->ORD_al_ModeDiary; True:C214)
ERR_MethodTrackerReturn("OBJ [ORDERS].Jobs_TCIn.Variable10"; $_t_oldMethodName)