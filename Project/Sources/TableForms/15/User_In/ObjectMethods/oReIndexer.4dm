If (False:C215)
	//object Method Name: Object Name:      [USER].User_In.oReIndexer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(USR_lb_TabletoReindex;0)
	//ARRAY INTEGER(DB_aI_TableIndexer;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oReIndexer"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->USR_lb_TabletoReindex; $_t_ColumnName)
			Case of 
				: ($_l_Column=1)
					DB_aI_TableIndexer{$_l_Row}:=Abs:C99((DB_aI_TableIndexer{$_l_Row})-1)
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oReIndexer"; $_t_oldMethodName)
