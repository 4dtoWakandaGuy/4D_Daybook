If (False:C215)
	//Table Form Method Name: [USER]SP_ChooseAutoFiLL
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
	//ARRAY TEXT(SP_at_PlusorMinus;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; SP_l_CHOICE0; SP_rb_Choice1; SP_rb_Choice2; SP_rb_Choice3; SP_l_BasedOnResults; SP_l_BasedOnTarget; SP_l_FindByClassID; SP_l_FindByGroupID; SP_l_FindByPersonID)
	C_REAL:C285(SP_R_AFTargetAmount; SP_R_AFTargetAmount2; SP_R_AFTargetAmount3)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; SP_t_AdHocOwner; SP_t_FCurrencyCode; SP_t_FCurrencyCode2; SP_t_FPlusMinus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SP_ChooseAutoFiLL"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SP_ChooseAutoFiLL")
		SET WINDOW TITLE:C213("Autofill properiies")
		WS_AutoscreenSize(3; 129; 500)
		
		ARRAY TEXT:C222(SP_at_PlusorMinus; 2)
		
		SP_at_PlusorMinus{1}:="Plus"
		SP_at_PlusorMinus{2}:="Minus"
		SP_t_FPlusMinus:="+"
		
		
		SP_R_AFTargetAmount:=0
		SP_R_AFTargetAmount2:=0
		SP_R_AFTargetAmount3:=0
		SP_l_BasedOnTarget:=0
		SP_l_BasedOnResults:=0
		
		
		
		SP_l_CHOICE0:=1
		SP_rb_Choice1:=0
		SP_rb_Choice2:=0
		SP_rb_Choice3:=0
		SP_t_FCurrencyCode:=<>SYS_t_BaseCurrency
		SP_t_FCurrencyCode2:=SP_t_FCurrencyCode
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [USER].SP_ChooseAutoFiLL"; $_t_oldMethodName)
