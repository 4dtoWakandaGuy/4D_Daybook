//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiarySetInitialize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2009 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(<>SD_ad_SetDateFrom;0)
	//ARRAY DATE(<>SD_ad_SetDateTo;0)
	//ARRAY LONGINT(<>SD_al_IncludeDocs;0)
	//ARRAY LONGINT(<>SD_al_OtherSearchFields;0;0)
	//ARRAY LONGINT(<>SD_al_PersonOptions;0)
	//ARRAY LONGINT(<>SD_al_SearchrelatedTables;0;0)
	//ARRAY LONGINT(<>SD_al_SetDoneStamp;0)
	//ARRAY LONGINT(<>SD_al_SetIDs;0)
	//ARRAY LONGINT(<>SD_al_SetPersonIDs;0;0)
	//ARRAY LONGINT(<>SD_al_SetPriorityValue;0)
	//ARRAY LONGINT(<>SD_al_TimeFrom;0)
	//ARRAY LONGINT(<>SD_al_TimeTo;0)
	ARRAY LONGINT:C221($_al_PersonIDS; 0)
	//ARRAY TEXT(<>SD_at_othersearchConj;0;0)
	//ARRAY TEXT(<>SD_at_otherSearchValues;0;0)
	//ARRAY TEXT(<>SD_at_PreferenceactionCodes;0;0)
	//ARRAY TEXT(<>SD_at_PreferenceResultCodes;0;0)
	//ARRAY TEXT(<>SD_at_PreferenceStatusCodes;0;0)
	C_LONGINT:C283($_l_ArrayRow; $_l_Index; $_l_PersonID; $_l_SetID; $1)
	C_TEXT:C284($_t_ArrayRow; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiarySetInitialize")
//This method executes a query based on the values in the following arrays
If (False:C215)
	ARRAY LONGINT:C221(<>SD_al_SetIDs; 0)
	ARRAY LONGINT:C221(<>SD_al_IncludeDocs; 0)
	ARRAY LONGINT:C221(<>SD_al_SetPersonIDs; 0; 0)
	ARRAY LONGINT:C221(<>SD_al_PersonOptions; 0)
	ARRAY DATE:C224(<>SD_ad_SetDateFrom; 0)
	ARRAY DATE:C224(<>SD_ad_SetDateTo; 0)
	ARRAY LONGINT:C221(<>SD_al_SetDoneStamp; 0)
	ARRAY LONGINT:C221(<>SD_al_SetPriorityValue; 0)
	ARRAY LONGINT:C221(<>SD_al_TimeFrom; 0)
	ARRAY LONGINT:C221(<>SD_al_TimeTo; 0)
	ARRAY TEXT:C222(<>SD_at_PreferenceactionCodes; 0; 0)
	ARRAY TEXT:C222(<>SD_at_PreferenceResultCodes; 0; 0)  //Note searching by result is pointless unless we are including done items!
	ARRAY TEXT:C222(<>SD_at_PreferenceStatusCodes; 0; 0)
	ARRAY LONGINT:C221(<>SD_al_SearchrelatedTables; 0; 0)  //Search xdiary relations or actions
	ARRAY LONGINT:C221(<>SD_al_OtherSearchFields; 0; 0)  // field number to search-Note with actions this can be used to find actions with a property
	ARRAY TEXT:C222(<>SD_at_otherSearchValues; 0; 0)
	ARRAY TEXT:C222(<>SD_at_othersearchConj; 0; 0)
End if 
If (Count parameters:C259>=1)
	$_l_ArrayRow:=$1
	If ($_l_ArrayRow>0)
		If ($_l_ArrayRow<Size of array:C274(<>SD_al_SetIDs))  //just to be safe
			$_l_SetID:=<>SD_al_SetIDs{$_l_ArrayRow}
			ARRAY LONGINT:C221($_al_PersonIDS; 0)
			For ($_l_Index; 1; Size of array:C274(<>SD_al_SetPersonIDs{$_l_ArrayRow}))
				$_l_PersonID:=<>SD_al_SetPersonIDs{$_l_ArrayRow}{$_l_Index}
				APPEND TO ARRAY:C911($_al_PersonIDS; $_l_PersonID)
			End for 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD2_DiarySetInitialize"; $_t_oldMethodName)
