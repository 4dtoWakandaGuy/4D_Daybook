//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ContactTab
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/03/2011 16:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CON_al_ContactTabPage;0)
	//ARRAY TEXT(CON_at_ContactTab;0)
	C_LONGINT:C283($_l_Number; $_l_SelectedElement)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ContactTab")

$_t_MenuItemParameter:=Get selected menu item parameter:C1005
If ($_t_MenuItemParameter#"")
	$_l_Number:=Num:C11($_t_MenuItemParameter)
	If ($_l_Number>0)
		CON_at_ContactTab:=$_l_Number
	End if 
End if 
$_l_SelectedElement:=CON_al_ContactTabPage{CON_at_ContactTab}
Case of 
	: ($_l_SelectedElement=2)
		FORM GOTO PAGE:C247(2)
	: ($_l_SelectedElement=1)
		FORM GOTO PAGE:C247(1)
End case 
ERR_MethodTrackerReturn("DB_ContactTab"; $_t_oldMethodName)