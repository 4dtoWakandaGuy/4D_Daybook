If (False:C215)
	//object Name: [USER]QV_Groupings.oSortButton
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
	//ARRAY INTEGER(QV_ai_Exclude;0)
	//ARRAY INTEGER(QV_ai_include;0)
	ARRAY LONGINT:C221($_al_SortDirectionArray; 0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_LabelOrder;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	ARRAY POINTER:C280($_aPtr_ArraysToSort; 0)
	//ARRAY REAL(QV_ar_CurrentOrder;0)
	//ARRAY TEXT(QV_at_DisplayNames;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LabelNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_YearOptions;0)
	C_LONGINT:C283($_l_Index; $_l_LastGroupOrder; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.oSortButton"; Form event code:C388)
$_l_SizeofArray:=Size of array:C274(QV_al_LabelOrder)
//
ARRAY REAL:C219(QV_ar_CurrentOrder; $_l_SizeofArray)
//
$_l_LastGroupOrder:=0
//
For ($_l_Index; 1; $_l_SizeofArray)
	If (QV_al_LabelOrder{$_l_Index}#0)
		QV_ar_CurrentOrder{$_l_Index}:=QV_al_LabelOrder{$_l_Index}
		$_l_LastGroupOrder:=QV_al_LabelOrder{$_l_Index}  //remember the last group order number so that items belonging to it are greater than it but less than next group order number
	Else 
		QV_ar_CurrentOrder{$_l_Index}:=$_l_LastGroupOrder+0.5  //ie to preserve order lines that are actually items are each exactly .5 greater than the group they belong to and .5 smaller than the next group (items within group have rthe same numebr because they will be secondarily ordered by their lable name)
	End if 
End for 
//
//
ARRAY POINTER:C280($_aPtr_ArraysToSort; 14)
ARRAY LONGINT:C221($_al_SortDirectionArray; 14)
//
//
$_aPtr_ArraysToSort{1}:=->QV_ar_CurrentOrder
//
$_aPtr_ArraysToSort{2}:=->QV_at_DisplayNames
$_aPtr_ArraysToSort{3}:=->QV_at_LabelNames
$_aPtr_ArraysToSort{4}:=->QV_al_LabelOrder
//
$_aPtr_ArraysToSort{5}:=->QV_at_GroupNames
$_aPtr_ArraysToSort{6}:=->QV_at_QualityNames
$_aPtr_ArraysToSort{7}:=->QV_al_GroupIDs
$_aPtr_ArraysToSort{8}:=->QV_al_QualityIDs
$_aPtr_ArraysToSort{9}:=->QV_al_QualityLevelLevels
$_aPtr_ArraysToSort{10}:=->QV_al_QualityQualityYears
$_aPtr_ArraysToSort{11}:=->QV_ai_include
$_aPtr_ArraysToSort{12}:=->QV_ai_Exclude
$_aPtr_ArraysToSort{13}:=->QV_at_LevelOptions
$_aPtr_ArraysToSort{14}:=->QV_at_YearOptions
//
//
$_al_SortDirectionArray{1}:=1
//
$_al_SortDirectionArray{2}:=1
$_al_SortDirectionArray{3}:=0
$_al_SortDirectionArray{4}:=0
//
$_al_SortDirectionArray{5}:=0
$_al_SortDirectionArray{6}:=0
$_al_SortDirectionArray{7}:=0
$_al_SortDirectionArray{8}:=0
$_al_SortDirectionArray{9}:=0
$_al_SortDirectionArray{10}:=0
$_al_SortDirectionArray{11}:=0
$_al_SortDirectionArray{12}:=0
$_al_SortDirectionArray{13}:=0
$_al_SortDirectionArray{14}:=0
//
MULTI SORT ARRAY:C718($_aPtr_ArraysToSort; $_al_SortDirectionArray)
//
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.oSortButton"; $_t_oldMethodName)
