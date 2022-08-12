If (False:C215)
	//object Name: Object Name:      PROD_CODE_BUILDFORMATS.oAddSection
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
	C_LONGINT:C283($_l_NumberofSections; $_l_RecordNumber; PC_l_CurrentLoadedFormat; PC_l_CurrentLoadedSection)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROD_CODE_BUILDFORMATS.oAddSection"; Form event code:C388)
If (PC_l_CurrentLoadedFormat>0)
	
	If (PC_l_CurrentLoadedSection>0)
		If (PC_bo_SectionModified)
			DB_SaveRecord(->[BUILT_CODE_FORMAT_SECTION:188])
		End if 
	End if 
	
	
	$_l_NumberofSections:=Records in selection:C76([BUILT_CODE_FORMAT_SECTION:188])
	CREATE RECORD:C68([BUILT_CODE_FORMAT_SECTION:188])
	[BUILT_CODE_FORMAT_SECTION:188]FORMAT_ID:2:=PC_l_CurrentLoadedFormat
	[BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1:=AA_GetNextID(->[BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1)
	[BUILT_CODE_FORMAT_SECTION:188]SECTION_NAME:4:="New Section"
	[BUILT_CODE_FORMAT_SECTION:188]SECTION_NUMBER:3:=$_l_NumberofSections+1
	[BUILT_CODE_FORMAT_SECTION:188]SECTION_FILL_STYLE:7:="Right"
	DB_SaveRecord(->[BUILT_CODE_FORMAT_SECTION:188])
	
	
	PC_bo_AnyEdits:=True:C214
	PC_l_CurrentLoadedSection:=[BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1
	PC_bo_SectionModified:=False:C215
	$_l_RecordNumber:=Record number:C243([BUILT_CODE_FORMAT_SECTION:188])
	QUERY:C277([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]FORMAT_ID:2=PC_l_CurrentLoadedFormat)
	ORDER BY:C49([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]SECTION_NUMBER:3)
	If ([PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3#Records in selection:C76([BUILT_CODE_FORMAT_SECTION:188]))
		[PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3:=Records in selection:C76([BUILT_CODE_FORMAT_SECTION:188])
		PC_bo_FormatModified:=True:C214
		PC_bo_AnyEdits:=True:C214
	End if 
	EDIT ITEM:C870(*; "oSectionName"; Records in selection:C76([BUILT_CODE_FORMAT_SECTION:188]))
	
Else 
	Gen_Alert("Sorry must select a format first to add a section to!")
End if 
ERR_MethodTrackerReturn("OBJ PROD_CODE_BUILDFORMATS.oAddSection"; $_t_oldMethodName)
