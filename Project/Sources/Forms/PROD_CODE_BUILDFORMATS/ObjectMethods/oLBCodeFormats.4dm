If (False:C215)
	//object Name: Object Name:      PROD_CODE_BUILDFORMATS.oLBCodeFormats
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 12:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PC_bo_AnyEdits; PC_bo_FormatModified; PC_bo_SectionModified)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; PC_l_CurrentLoadedFormat; PC_l_CurrentLoadedSection; PC_l_totalFormatLength; PRD_l_LBCodeFormats)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROD_CODE_BUILDFORMATS.oLBCodeFormats"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(PRD_l_LBCodeFormats; $_l_Column; $_l_Row)
		If ($_l_Row>0)
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
			GOTO SELECTED RECORD:C245([PRODUCT_BUILT_CODE_FORMAT:189]; $_l_Row)
			
			PC_l_CurrentLoadedFormat:=[PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1
			QUERY:C277([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]FORMAT_ID:2=PC_l_CurrentLoadedFormat)
			ORDER BY:C49([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]SECTION_NUMBER:3)
			
			PC_l_totalFormatLength:=Sum:C1([BUILT_CODE_FORMAT_SECTION:188]SECTION_LENGTH:5)
			If ([PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3#Records in selection:C76([BUILT_CODE_FORMAT_SECTION:188]))
				[PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3:=Records in selection:C76([BUILT_CODE_FORMAT_SECTION:188])
				PC_bo_FormatModified:=True:C214
				PC_bo_AnyEdits:=True:C214
			End if 
			
			
			Case of 
				: ($_l_Column=2)
				: ($_l_Column=3)
			End case 
		End if 
	: ($_l_event=On Data Change:K2:15)
		If (PC_l_CurrentLoadedFormat#0)
			PC_bo_FormatModified:=True:C214
			PC_bo_AnyEdits:=True:C214
		End if 
End case 
ERR_MethodTrackerReturn("OBJ PROD_CODE_BUILDFORMATS.oLBCodeFormats"; $_t_oldMethodName)
