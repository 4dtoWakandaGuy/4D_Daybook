If (False:C215)
	//Table Form Method Name: [USER]CO_EditTokenField
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
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; CO_al_EditTokenFlag)
	C_TEXT:C284($_t_oldMethodName; CO_t_TokenOption)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].CO_EditTokenField"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (CO_al_EditTokenFlag=0)
			OBJECT SET ENTERABLE:C238(CO_t_TokenOption; False:C215)
			
		End if 
End case 
ERR_MethodTrackerReturn("FM [USER].CO_EditTokenField"; $_t_oldMethodName)
