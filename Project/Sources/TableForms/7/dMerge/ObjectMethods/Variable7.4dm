If (False:C215)
	//object Method Name: Object Name:      [DOCUMENTS].dMerge.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_lb_MergeFrom;0)
	ARRAY LONGINT:C221($_al_Lines; 0)
	//ARRAY TEXT(LB_at_02_1;0)
	//ARRAY TEXT(LB_at_02_2;0)
	//ARRAY TEXT(LB_at_02_3;0)
	//ARRAY TEXT(LB_at_02_4;0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; xOK)
	C_TEXT:C284($_t_oldMethodName; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dMerge.Variable7"; Form event code:C388)

ARRAY LONGINT:C221($_al_Lines; 0)
//$_l_SizeofArray:=AL_GetSelect (eALOrdII;$_al_Lines)
LB_GetSelect(->DOC_lb_MergeFrom; ->$_al_Lines)

$_l_SizeofArray:=Size of array:C274($_al_Lines)
If ($_l_SizeofArray>0)
	For ($_l_Index; $_l_SizeofArray; 1; -1)
		DELETE FROM ARRAY:C228(LB_at_02_1; $_al_Lines{$_l_Index}; 1)
		DELETE FROM ARRAY:C228(LB_at_02_2; $_al_Lines{$_l_Index}; 1)
		DELETE FROM ARRAY:C228(LB_at_02_3; $_al_Lines{$_l_Index}; 1)
		DELETE FROM ARRAY:C228(LB_at_02_4; $_al_Lines{$_l_Index}; 1)
	End for 
	
	$_l_SizeofArray:=Size of array:C274(LB_at_02_1)
	vTitle2:=String:C10($_l_SizeofArray)+" Contact"+("s"*(Num:C11($_l_SizeofArray#1)))+" to Merge ..."
	If ($_l_SizeofArray=0)
		OBJECT SET ENABLED:C1123(xOK; False:C215)
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dMerge.Variable7"; $_t_oldMethodName)
