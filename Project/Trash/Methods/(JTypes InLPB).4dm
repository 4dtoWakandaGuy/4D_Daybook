//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JTypes_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(CU_ai_CodeUsed;0)
	//ARRAY INTEGER(JOB_ai_AutoAdd;0)
	//ARRAY INTEGER(JOB_ai_Include;0)
	//ARRAY INTEGER(JOB_ai_JobClassINC;0)
	ARRAY LONGINT:C221($_al_CodeNumbers; 0)
	//ARRAY LONGINT(JOB_al_AgencyDivisions;0)
	//ARRAY LONGINT(JOB_al_JobClassINT;0)
	//ARRAY LONGINT(JOB_al_RelateAutoAdd;0)
	//ARRAY LONGINT(JT_al_JTYPEPropertiesNUM;0;0)
	//ARRAY LONGINT(JT_al_LinkedTable;0)
	//ARRAY LONGINT(JT_al_RestrictionID;0)
	//ARRAY LONGINT(JT_al_SaleType;0)
	//ARRAY LONGINT(JT_al_SaleTypeID;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY TEXT(CU_at_CodeUse;0)
	//ARRAY TEXT(JOB_at_AgencyDivisions;0)
	//ARRAY TEXT(JOB_at_JobClass;0)
	//ARRAY TEXT(JOB_at_JobClassName;0)
	//ARRAY TEXT(JOB_at_JobCodes;0)
	//ARRAY TEXT(JOB_at_RelatedStageCodes;0)
	//ARRAY TEXT(JOB_at_StageCodes;0)
	//ARRAY TEXT(JOB_at_StageNames;0)
	//ARRAY TEXT(JOB_at_StageTexts;0)
	//ARRAY TEXT(JT_at_JTYPEProperties;0;0)
	//ARRAY TEXT(JT_at_JTYPEPropertiesNAM;0;0)
	//ARRAY TEXT(JT_at_SalesProjectionPROPS;0)
	//ARRAY TEXT(JT_at_SaleType;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_BOOLEAN:C305($_bo_IsInJobs; $_bo_Set)
	C_LONGINT:C283($_l_ArraySIze; $_l_DivisionRow; $_l_FieldNumber; $_l_Index; $_l_JobRow; $_l_JobTypeRow; $_l_ListID; $_l_ProjectRow; $_l_RestrictionRow; $_l_SaleTypeRow; $_l_StageRow)
	C_LONGINT:C283($_l_TableNumber; JOB_l_AgencyListID; JT_l_ResListID; JT_l_TableRestrictionID; RBPerm; RBTemp)
	C_TEXT:C284($_t_oldMethodName; JT_t_SaleType; vButtDisJtypes)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JTypes_InLPB")
//JType InLPB
If ([JOB_TYPES:65]Type_Code:1#"")
	[JOB_TYPES:65]Type_Code:1:=Uppercase:C13([JOB_TYPES:65]Type_Code:1)
	GOTO OBJECT:C206([JOB_TYPES:65]Type_Name:2)
End if 
//TRACE
ARRAY LONGINT:C221($_al_CodeNumbers; 3)
$_al_CodeNumbers{1}:=1
$_al_CodeNumbers{2}:=2
$_al_CodeNumbers{3}:=3
Gen_CULPB(->[JOB_TYPES:65]Type_Code:1; 4; ->$_al_CodeNumbers; "Orders"; "Projects"; "Jobs")
vButtDisJtypes:="I  PMO  FSSSRCADT"


INT_SetLongintCheckFormat(->CU_ai_CodeUsed)


ARRAY TEXT:C222(JT_at_SaleType; 0)
ARRAY LONGINT:C221(JT_al_SaleType; 0)
JT_l_ResListID:=AA_GetListbyName("Table Restriction"; True:C214)
ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
AA_LoadListbyID(JT_l_ResListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
ARRAY LONGINT:C221(JT_al_RestrictionID; 4)
Macro_AccType("Load "+String:C10(Table:C252(->[JOB_TYPES:65])))




//```````

ARRAY TEXT:C222(JT_at_SaleType; 0)
ARRAY LONGINT:C221(JT_al_SaleTypeID; 0)
$_l_RestrictionRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(->[JOBS:26])))
If ($_l_RestrictionRow<0)
	JT_l_TableRestrictionID:=AA_ListAddItembyID(JT_l_ResListID; Table name:C256(Table:C252(->[JOBS:26])))
	AA_LoadListbyID(JT_l_ResListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
Else 
	JT_l_TableRestrictionID:=QV_al_TableRestrictionIDs{$_l_RestrictionRow}
End if 
//JT_l_TableRestrictionID defines which table these belong to!
$_l_TableNumber:=Table:C252(->[SALES_PROJECTION:113])
$_l_FieldNumber:=Field:C253(->[SALES_PROJECTION:113]Class_ID:2)
$_l_ListID:=AA_GetListID($_l_TableNumber; $_l_FieldNumber; "Sales Projection Types")
ARRAY TEXT:C222(JT_at_SalesProjectionPROPS; 0)
ARRAY TEXT:C222(JT_at_JTYPEProperties; 0; 0)
ARRAY LONGINT:C221(JT_al_JTYPEPropertiesNUM; 0; 0)
ARRAY TEXT:C222(JT_at_JTYPEPropertiesNAM; 0; 0)

AA_LoadListbyID($_l_ListID; ->JT_at_SaleType; ->JT_al_SaleTypeID; True:C214; ->JT_at_SalesProjectionPROPS; ->JT_at_JTYPEProperties; ->JT_al_JTYPEPropertiesNUM; ->JT_at_JTYPEPropertiesNAM)
ARRAY LONGINT:C221(JT_al_LinkedTable; Size of array:C274(JT_at_SaleType))
For ($_l_Index; 1; Size of array:C274(JT_at_SaleType))
	$_l_RestrictionRow:=Find in array:C230(JT_at_JTYPEProperties{$_l_Index}; "TABLE RESTRICTION")
	If ($_l_RestrictionRow>0)
		JT_al_LinkedTable{$_l_Index}:=JT_al_JTYPEPropertiesNUM{$_l_Index}{$_l_RestrictionRow}
	End if 
End for 
//only show ones related to JOBS


For ($_l_Index; Size of array:C274(JT_al_LinkedTable)-2; 1; -1)
	If (JT_al_LinkedTable{$_l_Index}#Table:C252(->[JOBS:26])) & (JT_al_LinkedTable{$_l_Index}#Table:C252(->[ORDERS:24]))
		DELETE FROM ARRAY:C228(JT_at_SaleType; $_l_Index; 1)
		DELETE FROM ARRAY:C228(JT_al_SaleTypeID; $_l_Index; 1)
		DELETE FROM ARRAY:C228(JT_at_SalesProjectionPROPS; $_l_Index; 1)
		DELETE FROM ARRAY:C228(JT_al_LinkedTable; $_l_Index; 1)
	End if 
	
End for 
//now we only have items linked to JOBS/ORDERS

//make sure if you create any that you store this in the properties
If ([JOB_TYPES:65]ProjectedSaleTypeID:11>0)
	$_l_SaleTypeRow:=Find in array:C230(JT_al_SaleTypeID; [JOB_TYPES:65]ProjectedSaleTypeID:11)
	If ($_l_SaleTypeRow<0)
		[JOB_TYPES:65]ProjectedSaleTypeID:11:=0
		JT_t_SaleType:=""
	Else 
		JT_t_SaleType:=JT_at_SaleType{$_l_SaleTypeRow}
	End if 
Else 
	JT_t_SaleType:=""
End if 
$_l_ProjectRow:=Find in array:C230(CU_at_CodeUse; "Projects")
$_bo_IsInJobs:=False:C215
If ($_l_ProjectRow>0)
	$_bo_IsInJobs:=CU_ai_CodeUsed{$_l_ProjectRow}=1
End if 

$_l_JobRow:=Find in array:C230(CU_at_CodeUse; "Jobs")

If ($_l_JobRow>0)
	$_bo_IsInJobs:=CU_ai_CodeUsed{$_l_JobRow}=1
End if 
If (Not:C34($_bo_IsInJobs))
	OBJECT SET VISIBLE:C603(*; "oclass@"; False:C215)
End if 

ARRAY INTEGER:C220(JOB_ai_JobClassINC; 0)
JOB_loadJobTypeClasses
$_l_ArraySIze:=Size of array:C274(JOB_at_JobClass)
ARRAY INTEGER:C220(JOB_ai_JobClassINC; $_l_ArraySIze)

INT_SetLongintCheckFormat(->JOB_ai_JobClassINC)

OBJECT SET VISIBLE:C603(RBTemp; False:C215)
OBJECT SET VISIBLE:C603(RBPerm; False:C215)
ARRAY TEXT:C222(JOB_at_AgencyDivisions; 0)
ARRAY LONGINT:C221(JOB_al_AgencyDivisions; 0)
JOB_l_AgencyListID:=AA_LoadListByName("Agency Divisions"; ->JOB_at_AgencyDivisions; ->JOB_al_AgencyDivisions; True:C214)
OBJECT SET VISIBLE:C603(JOB_at_AgencyDivisions; False:C215)
OBJECT SET VISIBLE:C603(*; "oJOBDivisionLabel"; False:C215)
JOB_at_AgencyDivisions:=0
For ($_l_Index; 1; Size of array:C274(JOB_al_JobClassINT))
	$_bo_Set:=[JOB_TYPES:65]TypeClass:12 ?? $_l_Index
	If (JOB_at_JobClassName{$_l_Index}="Agency Manager")
		If ($_bo_Set)
			RBTemp:=1
			OBJECT SET VISIBLE:C603(RBTemp; True:C214)
			OBJECT SET VISIBLE:C603(RBPerm; True:C214)
			OBJECT SET VISIBLE:C603(JOB_at_AgencyDivisions; True:C214)
			OBJECT SET VISIBLE:C603(*; "oJOBDivisionLabel"; True:C214)
			If ([JOB_TYPES:65]xAgencyDivision:13>0)
				$_l_DivisionRow:=Find in array:C230(JOB_al_AgencyDivisions; [JOB_TYPES:65]xAgencyDivision:13)
				JOB_at_AgencyDivisions:=$_l_DivisionRow
			End if 
		End if 
	End if 
	
	If ($_l_Index>Size of array:C274(JOB_at_JobClass))
		//this is a class not displayed
		
		If ($_bo_Set)
			RBPerm:=1
			RBTemp:=0
			OBJECT SET VISIBLE:C603(RBTemp; True:C214)
			OBJECT SET VISIBLE:C603(RBPerm; True:C214)
			JOB_al_JobClassINT{Size of array:C274(JOB_al_JobClassINT)}:=1
		Else 
		End if 
	Else 
		JOB_ai_JobClassINC{$_l_Index}:=Num:C11($_bo_Set)
		
	End if 
	
	
	
End for 
ARRAY TEXT:C222(JOB_at_StageTexts; 3)
JOB_at_StageTexts{1}:="Default Client Notes"
JOB_at_StageTexts{2}:="Invoice Base Text"
JOB_at_StageTexts{3}:="Invoice Comments Text"

ALL RECORDS:C47([STAGES:45])
ARRAY TEXT:C222(JOB_at_StageCodes; 0)
ARRAY TEXT:C222(JOB_at_StageNames; 0)
ARRAY INTEGER:C220(JOB_ai_Include; 0)
ARRAY INTEGER:C220(JOB_ai_AutoAdd; 0)
SELECTION TO ARRAY:C260([STAGES:45]Stage_Code:1; JOB_at_StageCodes; [STAGES:45]Stage_Name:2; JOB_at_StageNames)
ARRAY INTEGER:C220(JOB_ai_Include; Size of array:C274(JOB_at_StageCodes))
ARRAY INTEGER:C220(JOB_ai_AutoAdd; Size of array:C274(JOB_at_StageCodes))
INT_SetLongintCheckFormat(->JOB_ai_AutoAdd)
INT_SetLongintCheckFormat(->JOB_ai_Include)

JOB_LoadStageTypeLinks
If ([JOB_TYPES:65]Type_Code:1#"")
	$_l_JobTypeRow:=Find in array:C230(JOB_at_JobCodes; [JOB_TYPES:65]Type_Code:1)
	If ($_l_JobTypeRow>0)
		For ($_l_Index; 1; Size of array:C274(JOB_at_RelatedStageCodes{$_l_JobTypeRow}))
			$_l_StageRow:=Find in array:C230(JOB_at_StageCodes; JOB_at_RelatedStageCodes{$_l_JobTypeRow}{$_l_Index})
			If ($_l_StageRow>0)
				JOB_ai_Include{$_l_StageRow}:=1
				JOB_ai_AutoAdd{$_l_StageRow}:=JOB_al_RelateAutoAdd{$_l_JobTypeRow}{$_l_Index}
			End if 
		End for 
	Else 
		APPEND TO ARRAY:C911(JOB_at_JobCodes; [JOB_TYPES:65]Type_Code:1)
		INSERT IN ARRAY:C227(JOB_at_RelatedStageCodes; Size of array:C274(JOB_at_RelatedStageCodes)+1; 1)
		
	End if 
End if 
Input_Buttons(->[JOB_TYPES:65]; ->vButtDisJtypes)
ERR_MethodTrackerReturn("JTypes_InLPB"; $_t_oldMethodName)