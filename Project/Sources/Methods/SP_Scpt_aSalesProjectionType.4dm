//%attributes = {}
If (False:C215)
	//Project Method Name:      SP_Scpt_aSalesProjectionType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_LinkedTable;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_LONGINT:C283($_l_RestrictionListID; $_l_TableRestrictionRow; SP_l_ProjectionClassID; SP_l_RelatedRecordID; SP_l_relatedTableNUM)
	C_TEXT:C284($_t_oldMethodName; SP_t_SalesOrderNUM; SP_t_SalesOrderTitle; SP_t_SalesProjectionType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SP_Scpt_aSalesProjectionType")
SP_l_relatedTableNUM:=SP_al_LinkedTable{SP_at_SalesProjectionTYPE}
SP_l_ProjectionClassID:=SP_al_SalesProjectionTYPEID{SP_at_SalesProjectionTYPE}
// SET VISIBLE(SP_S55_aSalesProject;False)
OBJECT SET VISIBLE:C603(SP_al_SalesProjectionTYPEID; False:C215)
OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; False:C215)
OBJECT SET VISIBLE:C603(*; "SP_PIC_ProjectionType"; False:C215)
OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; True:C214)
OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; False:C215)
OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; True:C214)
OBJECT SET ENTERABLE:C238(SP_t_SalesOrderNUM; True:C214)
//````
If (SP_l_relatedTableNUM>0)
	$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
	ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
	ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
	AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
	$_l_TableRestrictionRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
	SP_t_SalesOrderTitle:="Related "+Substring:C12(QV_at_TableRestrictionNMs{$_l_TableRestrictionRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_TableRestrictionRow})-1)[[1]]+Lowercase:C14(Substring:C12(Substring:C12(QV_at_TableRestrictionNMs{$_l_TableRestrictionRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_TableRestrictionRow})-1); 2; Length:C16(Substring:C12(QV_at_TableRestrictionNMs{$_l_TableRestrictionRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_TableRestrictionRow})-1))))
	If (SP_l_RelatedRecordID>0)
		SP_LoadRelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_t_SalesOrderNUM)
	Else 
		//do something here???
		//make the fields visible etc
	End if 
End if 
ERR_MethodTrackerReturn("SP_Scpt_aSalesProjectionType"; $_t_oldMethodName)