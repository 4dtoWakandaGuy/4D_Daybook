If (False:C215)
	//Table Form Method Name: [USER]CON_JobRoleManagerW
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
	C_BOOLEAN:C305(CON_bo_ROLESMODIFIED; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; bCON_l_DelJR; bCON_l_ModJR)
	C_REAL:C285(CON_R_CurCostRate; CON_R_CurSalesRate)
	C_TEXT:C284($_t_oldMethodName; CON_t_CurJobRole)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CON_JobRoleManagerW"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "CON_JobRoleManagerW")
		CON_t_CurJobRole:=""
		CON_R_CurSalesRate:=0
		CON_R_CurCostRate:=0
		OBJECT SET VISIBLE:C603(CON_t_CurJobRole; False:C215)
		OBJECT SET VISIBLE:C603(CON_R_CurSalesRate; False:C215)
		OBJECT SET VISIBLE:C603(CON_R_CurCostRate; False:C215)
		OBJECT SET TITLE:C194(bCON_l_ModJR; "Add")
		OBJECT SET TITLE:C194(bCON_l_DelJR; "Delete")
		CON_bo_ROLESMODIFIED:=False:C215
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].CON_JobRoleManagerW"; $_t_oldMethodName)
