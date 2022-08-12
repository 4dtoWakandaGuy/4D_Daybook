//%attributes = {}
If (False:C215)
	//Project Method Name:      QR_GETINFORMATIONSTRING
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2014 15:21
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(QV_ad_QualityDate;0)
	ARRAY LONGINT:C221($_al_QualityParentID; 0)
	//ARRAY LONGINT(AA_al_SubListItemsIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityID;0)
	//ARRAY LONGINT(QV_al_QualityParentID;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY LONGINT(QV_al_RelatedRecordNum;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	ARRAY TEXT:C222($_at_QualityParentGroups; 0)
	ARRAY TEXT:C222($_at_ItemStrings; 0)
	//ARRAY TEXT(AA_at_SubSublistItemNMs;0)
	//ARRAY TEXT(QV_at_QualityCode;0)
	//ARRAY TEXT(QV_at_QualityDetail;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0)
	C_LONGINT:C283($_l_GroupRow; $_l_Index; $_l_Index2; $_l_ListID; $_l_PropertyColumn; $_l_SubListNum; $_l_SublistRow)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; REP_T_String)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QR_GETINFORMATIONSTRING")
//QUERY([COMPANIES];[COMPANIES]Company_Code="34235891")

QUERY:C277([INFORMATION:55]; [INFORMATION:55]RelatedTableNumber:11=Table:C252(->[COMPANIES:2]); *)
QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelateTableRecordNumber:13=[COMPANIES:2]x_ID:63; *)
QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]RelatedTableFieldNum:12=63)

SELECTION TO ARRAY:C260([INFORMATION:55]Description:3; QV_at_QualityDetail; [INFORMATION:55]Information_Level:4; QV_ar_QualityLevel; [INFORMATION:55]Year:5; QV_al_QualityYear; [INFORMATION:55]Information_Date:8; QV_ad_QualityDate; [INFORMATION:55]Information_Code:9; QV_at_QualityCode; [INFORMATION:55]RelateTableRecordNumber:13; QV_al_RelatedRecordNum; [INFORMATION:55]QualityID:14; QV_al_QualityID; [INFORMATION:55]QualityGroupID:15; QV_al_QualityParentID; [INFORMATION:55]QualityRecordID:16; QV_al_QualityRecordID)
$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
SORT ARRAY:C229(QV_at_QualityGroupsNM; QV_al_QualityGroupsIDs; QV_at_QualityGroups; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)

DISTINCT VALUES:C339([INFORMATION:55]QualityGroupID:15; $_al_QualityParentID)
ARRAY TEXT:C222($_at_QualityParentGroups; Size of array:C274($_al_QualityParentID))

For ($_l_Index; 1; Size of array:C274($_al_QualityParentID))
	$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_al_QualityParentID{$_l_Index})
	If ($_l_GroupRow>0)
		$_at_QualityParentGroups{$_l_Index}:=QV_at_QualityGroupsNM{$_l_GroupRow}
	End if 
End for 
SORT ARRAY:C229($_at_QualityParentGroups; $_al_QualityParentID)

$_t_Text:=""
For ($_l_Index; 1; Size of array:C274($_al_QualityParentID))
	
	$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; $_al_QualityParentID{$_l_Index})
	$_t_Text:=$_t_Text+"("+QV_at_QualityGroupsNM{$_l_GroupRow}+") "
	$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
	If ($_l_PropertyColumn>0)
		$_l_SubListNum:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_l_PropertyColumn}
		//it should be
		ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
		ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
		
		If ($_l_SubListNum>0)
			AA_LoadListbyID($_l_SubListNum; ->AA_at_SubSublistItemNMs; ->AA_al_SubListItemsIDs; False:C215)
		End if 
		ARRAY TEXT:C222($_at_ItemStrings; 0)
		
		For ($_l_Index2; 1; Size of array:C274(QV_al_QualityID))
			$_l_SublistRow:=Find in array:C230(AA_al_SubListItemsIDs; QV_al_QualityID{$_l_Index2})
			If ($_l_SublistRow>0)
				APPEND TO ARRAY:C911($_at_ItemStrings; AA_at_SubSublistItemNMs{$_l_SublistRow})
			End if 
		End for 
		SORT ARRAY:C229($_at_ItemStrings)
		For ($_l_Index2; 1; Size of array:C274($_at_ItemStrings))
			If ($_l_Index2<Size of array:C274($_at_ItemStrings))
				$_t_Text:=$_t_Text+$_at_ItemStrings{$_l_Index2}+" "
			Else 
				$_t_Text:=$_t_Text+$_at_ItemStrings{$_l_Index2}
			End if 
			
		End for 
	End if 
End for 

REP_T_String:=$_t_Text
ERR_MethodTrackerReturn("QR_GETINFORMATIONSTRING"; $_t_oldMethodName)
