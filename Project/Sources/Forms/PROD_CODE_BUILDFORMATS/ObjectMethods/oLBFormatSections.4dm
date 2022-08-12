If (False:C215)
	//object Name: Object Name:      PROD_CODE_BUILDFORMATS.oLBFormatSections
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
	C_BOOLEAN:C305(PC_bo_AnyEdits; PC_bo_SectionModified)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_Row; PC_l_CurrentLoadedFormat; PC_l_CurrentLoadedSection; PC_l_SectionInfo; PC_l_totalFormatLength)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROD_CODE_BUILDFORMATS.oLBFormatSections"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	: ($_l_event=On Clicked:K2:4)
		LISTBOX GET CELL POSITION:C971(PC_l_SectionInfo; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			If (PC_l_CurrentLoadedSection>0)
				If (PC_bo_SectionModified)
					DB_SaveRecord(->[BUILT_CODE_FORMAT_SECTION:188])
				End if 
			End if 
			GOTO SELECTED RECORD:C245([BUILT_CODE_FORMAT_SECTION:188]; $_l_Row)
			
			PC_l_CurrentLoadedSection:=[BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1
			PC_bo_SectionModified:=False:C215
		End if 
	: ($_l_event=On Data Change:K2:15)
		If (PC_l_CurrentLoadedFormat#0)
			PC_bo_SectionModified:=True:C214
			PC_bo_AnyEdits:=True:C214
		End if 
		PC_l_totalFormatLength:=Sum:C1([BUILT_CODE_FORMAT_SECTION:188]SECTION_LENGTH:5)
	: ($_l_event=On After Edit:K2:43)
		If (PC_l_CurrentLoadedFormat#0)
			PC_bo_SectionModified:=True:C214
			PC_bo_AnyEdits:=True:C214
		End if 
		PC_l_totalFormatLength:=Sum:C1([BUILT_CODE_FORMAT_SECTION:188]SECTION_LENGTH:5)
End case 
ERR_MethodTrackerReturn("OBJ PROD_CODE_BUILDFORMATS.oLBFormatSections"; $_t_oldMethodName)
