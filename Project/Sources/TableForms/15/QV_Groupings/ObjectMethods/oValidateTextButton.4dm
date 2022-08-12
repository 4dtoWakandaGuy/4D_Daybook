If (False:C215)
	//object Name: [USER]QV_Groupings.Variable4
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
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_LabelOrder;0)
	//ARRAY TEXT(QV_at_DisplayNames;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LabelNames;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	C_BOOLEAN:C305(QV_bo_ExactQualityMatchOnly)
	C_LONGINT:C283($_l_Index; $_l_InsertFrom; $_l_LastSort; $_l_NumbertoAdd; QV_l_insertExistingGroupPos)
	C_TEXT:C284($_t_LastLabelName; $_t_oldMethodName; QV_T_QualitiesAsText; QV_T_QualitiesDropText)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_Groupings.Variable4"; Form event code:C388)

QV_bo_ExactQualityMatchOnly:=True:C214  //added 25/08/06 - kmw
QV_ParseText(QV_T_QualitiesDropText; False:C215)
QV_bo_ExactQualityMatchOnly:=False:C215  //added 25/08/06 - kmw

//NG here we need to resize the additional arrays..and populate them.
//QV_at_DisplayNames;-QV_at_LabelNames. They will default to using the Values of ,QV_at_QualityNames,QV_at_GroupNames.
If (QV_l_insertExistingGroupPos=-1)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	ARRAY TEXT:C222(QV_at_DisplayNames; Size of array:C274(QV_at_QualityNames))
	ARRAY TEXT:C222(QV_at_LabelNames; Size of array:C274(QV_at_GroupNames))
	ARRAY LONGINT:C221(QV_al_LabelOrder; Size of array:C274(QV_at_GroupNames))
Else   //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	$_l_NumbertoAdd:=Size of array:C274(QV_at_QualityNames)-Size of array:C274(QV_at_DisplayNames)  //kmw 18/09/06
	$_l_InsertFrom:=QV_l_insertExistingGroupPos-($_l_NumbertoAdd-1)  //kmw 20/09/06 - if more than one added then QV_l_insertExistingGroupPos will actually be one after the final element added so need to allow for this
	INSERT IN ARRAY:C227(QV_at_DisplayNames; $_l_InsertFrom; $_l_NumbertoAdd)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	INSERT IN ARRAY:C227(QV_at_LabelNames; $_l_InsertFrom; $_l_NumbertoAdd)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
	INSERT IN ARRAY:C227(QV_al_LabelOrder; $_l_InsertFrom; $_l_NumbertoAdd)  //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)
End if   //kmw 18/09/06 (something similar originally added to QV_l_Powerview 25/08)



$_t_LastLabelName:=""
For ($_l_Index; 1; Size of array:C274(QV_at_DisplayNames))
	If (QV_at_DisplayNames{$_l_Index}="")
		If (QV_at_GroupNames{$_l_Index}="")
			//This is an item
			QV_at_DisplayNames{$_l_Index}:=QV_at_QualityNames{$_l_Index}
			QV_at_LabelNames{$_l_Index}:=$_t_LastLabelName
		Else 
			//This is a group
			If (QV_at_LabelNames{$_l_Index}="")
				QV_at_LabelNames{$_l_Index}:=QV_at_GroupNames{$_l_Index}
			End if 
			$_t_LastLabelName:=QV_at_LabelNames{$_l_Index}
		End if 
	Else 
		If (QV_at_LabelNames{$_l_Index}="")
			QV_at_LabelNames{$_l_Index}:=$_t_LastLabelName
		End if 
	End if 
End for 
$_l_LastSort:=0
For ($_l_Index; 1; Size of array:C274(QV_at_DisplayNames))
	If (QV_al_GroupIDs{$_l_Index}#0)
		If (QV_al_LabelOrder{$_l_Index}>$_l_LastSort)
			$_l_LastSort:=QV_al_LabelOrder{$_l_Index}
			
		End if 
	End if 
End for 
For ($_l_Index; 1; Size of array:C274(QV_at_DisplayNames))
	If (QV_al_GroupIDs{$_l_Index}#0)
		If (QV_al_LabelOrder{$_l_Index}=0)
			QV_al_LabelOrder{$_l_Index}:=$_l_LastSort+1
			$_l_LastSort:=$_l_LastSort+1
		End if 
	End if 
End for 
//AL_UpdateArrays (QV_l_Powerview;-2)

QV_T_QualitiesAsText:=""
ERR_MethodTrackerReturn("OBJ [USER].QV_Groupings.Variable4"; $_t_oldMethodName)
