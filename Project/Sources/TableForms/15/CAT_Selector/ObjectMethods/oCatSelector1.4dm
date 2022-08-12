If (False:C215)
	//object Name: [USER]CAT_Selector.oCatSelector1
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
	//ARRAY BOOLEAN(CAT_lb_Selector;0)
	//ARRAY LONGINT(CAT_al_CatalogueSelected;0)
	//ARRAY LONGINT(CAT_al_CatMod;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CAT_Selector.oCatSelector1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->CAT_lb_Selector; $_t_VariableName)
		CAT_al_CatalogueSelected{$_l_Row}:=Abs:C99(CAT_al_CatalogueSelected{$_l_Row}-1)
		CAT_al_CatMod{$_l_Row}:=1
End case 
ERR_MethodTrackerReturn("OBJ [USER].CAT_Selector.oCatSelector1"; $_t_oldMethodName)
