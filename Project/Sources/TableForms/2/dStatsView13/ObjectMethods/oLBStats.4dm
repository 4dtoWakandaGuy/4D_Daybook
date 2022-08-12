If (False:C215)
	//object Name: [COMPANIES]dStatsView13.oLBStats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dStatsView13.oLBStats"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_Column:=LB_GetColumn(Self:C308; $_t_VariableName)
		If ($_l_Row>0) & ($_l_Column>0)
			aSV1:=$_l_Row
			Case of 
				: ($_l_Column=1)
					
					StatsView_View
				: ($_l_Column=2) | ($_l_Column=3) | ($_l_Column=4)
					If (DB_at_TableName>1)
						StatsView_ViewR
					Else 
						StatsView_View
					End if 
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].dStatsView13.oLBStats"; $_t_oldMethodName)
