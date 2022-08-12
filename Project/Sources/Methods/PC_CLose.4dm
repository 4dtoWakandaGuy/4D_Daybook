//%attributes = {}
If (False:C215)
	//Project Method Name:      PC_CLose
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/06/2010 10:47
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PC_bo_AnyEdits; PC_bo_CancelEdits; PC_bo_FormatModified; PC_bo_SectionModified)
	C_LONGINT:C283(PC_l_CurrentLoadedFormat; PC_l_CurrentLoadedSection)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PC_CLose")
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
If (PC_bo_AnyEdits)
	Gen_Confirm("Save Modifications to Product Code Formats?")
	If (OK=1)
		PC_bo_CancelEdits:=False:C215
	Else 
		PC_bo_CancelEdits:=True:C214
	End if 
Else 
	PC_bo_CancelEdits:=False:C215
End if 
CANCEL:C270
ERR_MethodTrackerReturn("PC_CLose"; $_t_oldMethodName)