If (False:C215)
	//Table Form Method Name: [USER]SP_TargetSetup
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
	C_DATE:C307(SP_D_SDateFrom; SP_D_SDateTo)
	C_LONGINT:C283($_l_event; SP_l_CHOICE0; SP_rb_Choice1; SP_rb_Choice2; SP_CB_SplitMonthly; SP_l_Continue; SP_l_MultiType; SP_l_SPeriodFromID; SP_l_SPeriodtoID; SP_l_STargetCount; SP_LBasePeriod)
	C_TEXT:C284($_t_oldMethodName; SP_t_SPeriodFrom; SP_t_SPeriodTo)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SP_TargetSetup"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SP_TargetSetup")
		SET WINDOW TITLE:C213("Target Type Selection")
		
		SP_CB_SplitMonthly:=0
		
		SP_t_SPeriodTo:=""
		SP_t_SPeriodFrom:=""
		SP_l_SPeriodFromID:=0
		SP_l_SPeriodToID:=0
		SP_l_Continue:=0
		SP_l_STargetCount:=0
		SP_D_SDateFrom:=!00-00-00!
		SP_D_SDateto:=!00-00-00!
		
		WS_AutoscreenSize(3; 92; 459)
		Case of 
			: (SP_l_MultiType=1)
				SP_rb_Choice1:=1
				FORM GOTO PAGE:C247(2)
			: (SP_l_MultiType=2)
				SP_rb_Choice2:=1
				FORM GOTO PAGE:C247(3)
			Else 
				
				SP_l_CHOICE0:=1
				FORM GOTO PAGE:C247(1)
		End case 
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].SP_TargetSetup"; $_t_oldMethodName)
