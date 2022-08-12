If (False:C215)
	//object Method Name: Object Name:      [DOCUMENTS].dMerge.Variable12
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
	//ARRAY TEXT(LB_at_01_1;0)
	//ARRAY TEXT(LB_at_01_2;0)
	//ARRAY TEXT(LB_at_01_3;0)
	//ARRAY TEXT(LB_at_01_4;0)
	//ARRAY TEXT(LB_at_02_1;0)
	//ARRAY TEXT(LB_at_02_2;0)
	//ARRAY TEXT(LB_at_02_3;0)
	//ARRAY TEXT(LB_at_02_4;0)
	C_LONGINT:C283($_l_Index; $_l_MergeRow; $_l_SIzeOfArray; xOK)
	C_TEXT:C284($_t_oldMethodName; vTitle2)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dMerge.Variable12"; Form event code:C388)

ARRAY LONGINT:C221($_al_Lines; 0)
//$_l_SIzeOfArray:=AL_GetSelect (eALContI;$_al_Lines)
LB_GetSelect(->DOC_lb_MergeFrom; ->$_al_Lines)

$_l_SIzeOfArray:=Size of array:C274($_al_Lines)
If ($_l_SIzeOfArray>0)
	For ($_l_Index; 1; $_l_SIzeOfArray)
		$_l_MergeRow:=Find in array:C230(LB_at_02_3; LB_at_01_3{$_al_Lines{$_l_Index}})
		If ($_l_MergeRow<1)
			$_l_MergeRow:=Size of array:C274(LB_at_02_1)+1
			INSERT IN ARRAY:C227(LB_at_02_1; $_l_MergeRow; 1)
			INSERT IN ARRAY:C227(LB_at_02_2; $_l_MergeRow; 1)
			INSERT IN ARRAY:C227(LB_at_02_3; $_l_MergeRow; 1)
			INSERT IN ARRAY:C227(LB_at_02_4; $_l_MergeRow; 1)
			LB_at_02_1{$_l_MergeRow}:=LB_at_01_1{$_al_Lines{$_l_Index}}
			LB_at_02_2{$_l_MergeRow}:=LB_at_01_2{$_al_Lines{$_l_Index}}
			LB_at_02_3{$_l_MergeRow}:=LB_at_01_3{$_al_Lines{$_l_Index}}
			LB_at_02_4{$_l_MergeRow}:=LB_at_01_4{$_al_Lines{$_l_Index}}
		End if 
	End for 
	
	$_l_SIzeOfArray:=Size of array:C274(LB_at_02_1)
	vTitle2:=String:C10($_l_SIzeOfArray)+" Contact"+("s"*(Num:C11($_l_SIzeOfArray#1)))+" to Merge ..."
	If ($_l_SIzeOfArray>0)
		OBJECT SET ENABLED:C1123(xOK; True:C214)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [DOCUMENTS].dMerge.Variable12"; $_t_oldMethodName)
