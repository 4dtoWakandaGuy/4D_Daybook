If (False:C215)
	//object Name: [ORDER_ITEMS]BUILD_PRODUCT.oLookup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_EditedText; $_t_oldMethodName; SRCH_t_SearchValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oLookup"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On After Keystroke:K2:26)
		SET TIMER:C645(10)
		$_t_EditedText:=Get edited text:C655
		SRCH_t_SearchValue:=$_t_EditedText
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].BUILD_PRODUCT.oLookup"; $_t_oldMethodName)
