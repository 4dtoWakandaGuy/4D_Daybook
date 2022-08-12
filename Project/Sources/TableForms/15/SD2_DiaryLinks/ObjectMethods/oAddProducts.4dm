If (False:C215)
	//object Name: [USER]SD2_DiaryLinks.oAddProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_DiaryRelations;0)
	//ARRAY LONGINT(SD2_al_RelationshipFields;0)
	//ARRAY LONGINT(SD2_al_RelationshipIDS;0)
	//ARRAY LONGINT(SD2_al_RelationshipTables;0)
	//ARRAY TEXT(SD2_at_RelationshipCodes;0)
	//ARRAY TEXT(SD2_at_RelationShipnames;0)
	//ARRAY TEXT(SD2_at_RelationShipnamesOLD;0)
	//ARRAY TEXT(SD2_at_RelatedRecordNames;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryLinks.oAddProducts"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the
If (Not:C34([DIARY:12]Done:14))
	
	If (SD2_at_RelationshipCodes{Size of array:C274(SD2_at_RelationshipCodes)}#"")
		APPEND TO ARRAY:C911(SD2_at_RelatedRecordNames; "")
		APPEND TO ARRAY:C911(SD2_at_RelationShipnames; "")
		APPEND TO ARRAY:C911(SD2_at_RelationShipnamesOLD; "")
		APPEND TO ARRAY:C911(SD2_at_RelationshipCodes; "")
		APPEND TO ARRAY:C911(SD2_al_RelationshipTables; 0)
		APPEND TO ARRAY:C911(SD2_al_RelationshipFields; 0)
		APPEND TO ARRAY:C911(SD2_al_RelationshipIDS; 0)
		LB_GoToCell(->SD2_lb_DiaryRelations; 1; Size of array:C274(SD2_at_RelatedRecordNames))
	Else 
		LB_GoToCell(->SD2_lb_DiaryRelations; 2; Size of array:C274(SD2_at_RelatedRecordNames))
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryLinks.oAddProducts"; $_t_oldMethodName)
