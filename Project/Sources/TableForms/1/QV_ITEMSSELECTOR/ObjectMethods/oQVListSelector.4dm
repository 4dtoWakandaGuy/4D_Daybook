If (False:C215)
	//object Name: [CONTACTS]QV_ITEMSSELECTOR.oQVListSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_lb_SelectItems;0)
	//ARRAY INTEGER(QV_ai_Tick;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].QV_ITEMSSELECTOR.oQVListSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->QV_lb_SelectItems; $_t_VariableName)
		QV_ai_Tick{$_l_Row}:=Abs:C99(QV_ai_Tick{$_l_Row}-1)
End case 
ERR_MethodTrackerReturn("OBJ [CONTACTS].QV_ITEMSSELECTOR.oQVListSelector"; $_t_oldMethodName)
