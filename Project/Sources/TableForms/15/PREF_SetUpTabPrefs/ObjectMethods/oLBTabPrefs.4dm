If (False:C215)
	//object Name: [USER]PREF_SetUpTabPrefs.oLBTabPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRF_LB_Tabs;0)
	//ARRAY LONGINT(PREF_al_TabObjectsDefault;0)
	//ARRAY LONGINT(PREF_al_TabObjectsIncludes;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_DefaultRow; $_l_event; $_l_FieldNumber; $_l_Index; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PREF_SetUpTabPrefs.oLBTabPrefs"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->PRF_LB_Tabs; $_t_VariableName)
		If ($_l_Row>0)
			Case of 
				: ($_l_ColumnNumber=1)
					PREF_al_TabObjectsIncludes{$_l_Row}:=Abs:C99(PREF_al_TabObjectsIncludes{$_l_Row}-1)
				: ($_l_ColumnNumber=2)
					
					If (PREF_al_TabObjectsDefault{$_l_Row}=0)
						PREF_al_TabObjectsDefault{$_l_Row}:=1
						$_l_DefaultRow:=PREF_al_TabObjectsDefault
						For ($_l_Index; 1; Size of array:C274(PREF_al_TabObjectsDefault))
							If ($_l_DefaultRow#$_l_Index)
								PREF_al_TabObjectsDefault{$_l_Index}:=0
							End if 
						End for 
					End if 
					
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].PREF_SetUpTabPrefs.oLBTabPrefs"; $_t_oldMethodName)
