If (False:C215)
	//object Name: [USER]BK_DataModel.Pop-up%2FDrop-down List3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(BK_at_BKContext;0)
	//ARRAY TEXT(BK_at_BKTABLE;0)
	//ARRAY TEXT(BK_at_CustDataModelName;0)
	//ARRAY TEXT(BK_at_ItemDataModelName;0)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_TEXT:C284($_t_oldMethodName; BK_t_BKCONTEXT; BK_t_CustDataModelName; BK_t_ItemDataModelName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Pop-up/Drop-down List3"; Form event code:C388)
If (BK_at_BKContext>0)
	BK_t_BKCONTEXT:=BK_at_BKContext{BK_at_BKContext}
	BK_t_BKCONTEXT:=BK_at_BKTABLE{BK_at_BKContext}
	DM_Bo_BKedit:=True:C214
	If (BK_t_BKCONTEXT="ODR")
		//this will need an associated model for importing Customers
		//and an associated model for product(items)
		OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop2"; True:C214)
		OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop"; True:C214)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel"; True:C214)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; True:C214)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; True:C214)
		OBJECT SET VISIBLE:C603(BK_t_CustDataModelName; True:C214)
		OBJECT SET VISIBLE:C603(BK_at_CustDataModelName; True:C214)
		OBJECT SET VISIBLE:C603(BK_t_ItemDataModelName; True:C214)
		OBJECT SET VISIBLE:C603(BK_at_ItemDataModelName; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_pi_oassModelPop"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; False:C215)
		OBJECT SET VISIBLE:C603(*; "DM_t_oassModelLabel2"; False:C215)
		OBJECT SET VISIBLE:C603(BK_t_CustDataModelName; False:C215)
		OBJECT SET VISIBLE:C603(BK_at_CustDataModelName; False:C215)
		OBJECT SET VISIBLE:C603(BK_t_ItemDataModelName; False:C215)
		OBJECT SET VISIBLE:C603(BK_at_ItemDataModelName; False:C215)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Pop-up/Drop-down List3"; $_t_oldMethodName)
