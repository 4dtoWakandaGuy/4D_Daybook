If (False:C215)
	//object Name: [DIARY]Diary_InNEW.oAddRelation
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_RelationTypes;0)
	C_TEXT:C284($_t_oldMethodName; SD_t_RelationAdd; SD_t_RelationCode)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_InNEW.oAddRelation"; Form event code:C388)
If (Read only state:C362([DIARY:12])=False:C215) & ([DIARY:12]Diary_Code:3#"")
	OBJECT SET VISIBLE:C603(SD_t_RelationAdd; True:C214)
	OBJECT SET VISIBLE:C603(*; "Pic_Relation"; True:C214)
	OBJECT SET VISIBLE:C603(SD_t_RelationCode; True:C214)
	OBJECT SET VISIBLE:C603(SD_at_RelationTypes; True:C214)
End if 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_InNEW.oAddRelation"; $_t_oldMethodName)
