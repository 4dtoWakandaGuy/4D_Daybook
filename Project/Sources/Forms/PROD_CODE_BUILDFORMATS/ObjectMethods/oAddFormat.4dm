If (False:C215)
	//object Name: Object Name:      PROD_CODE_BUILDFORMATS.oAddFormat
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2011 09:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PC_bo_AnyEdits; PC_bo_FormatModified; PC_bo_SectionModified)
	C_LONGINT:C283($_l_RecordNumber; PC_l_CurrentLoadedFormat; PC_l_CurrentLoadedSection; PC_l_totalFormatLength)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROD_CODE_BUILDFORMATS.oAddFormat"; Form event code:C388)
If (PC_l_CurrentLoadedSection>0)
	If (PC_bo_SectionModified)
		DB_SaveRecord(->[BUILT_CODE_FORMAT_SECTION:188])
	End if 
End if 

If (PC_l_CurrentLoadedFormat#0)
	//Save the format
	If (PC_bo_FormatModified)
		DB_SaveRecord(->[PRODUCT_BUILT_CODE_FORMAT:189])
		
	End if 
End if 
PC_l_CurrentLoadedSection:=0
PC_bo_SectionModified:=False:C215
PC_bo_FormatModified:=False:C215
PC_bo_AnyEdits:=True:C214
CREATE RECORD:C68([PRODUCT_BUILT_CODE_FORMAT:189])

[PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1:=AA_GetNextID(->[PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1)
[PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_NAME:2:="New Format"

DB_SaveRecord(->[PRODUCT_BUILT_CODE_FORMAT:189])
$_l_RecordNumber:=Record number:C243([PRODUCT_BUILT_CODE_FORMAT:189])
ALL RECORDS:C47([PRODUCT_BUILT_CODE_FORMAT:189])
REDUCE SELECTION:C351([BUILT_CODE_FORMAT_SECTION:188]; 0)
PC_l_CurrentLoadedFormat:=[PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1
PC_l_totalFormatLength:=0
//GOTO RECORD([PRODUCT_BUILT_CODE_FORMAT];$_l_RecordNumber)
EDIT ITEM:C870(*; "oNameColumn"; Records in selection:C76([PRODUCT_BUILT_CODE_FORMAT:189]))
ERR_MethodTrackerReturn("OBJ PROD_CODE_BUILDFORMATS.oAddFormat"; $_t_oldMethodName)