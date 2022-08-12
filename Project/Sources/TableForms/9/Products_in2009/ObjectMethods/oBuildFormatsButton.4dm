If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oBuildFormatsButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PRD_al_CodeFormatIDs;0)
	//ARRAY LONGINT(PRD_al_CodeFormatsSections;0)
	//ARRAY TEXT(PRD_at_CodeFormats;0)
	C_LONGINT:C283($_l_FormatIDRow; $_l_LoadedFormatID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oBuildFormatsButton"; Form event code:C388)
If (PRD_at_CodeFormats>0)
	If (PRD_al_CodeFormatIDs{PRD_at_CodeFormats}>0)
		$_l_LoadedFormatID:=PRD_EditCodeFormats(PRD_al_CodeFormatIDs{PRD_at_CodeFormats})
		If ($_l_LoadedFormatID>0)
			ALL RECORDS:C47([PRODUCT_BUILT_CODE_FORMAT:189])
			ARRAY LONGINT:C221(PRD_al_CodeFormatsSections; 0)
			ARRAY LONGINT:C221(PRD_al_CodeFormatIDs; 0)
			ARRAY TEXT:C222(PRD_at_CodeFormats; 0)
			SELECTION TO ARRAY:C260([PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_NAME:2; PRD_at_CodeFormats; [PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1; PRD_al_CodeFormatIDs; [PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3; PRD_al_CodeFormatsSections)
			SORT ARRAY:C229(PRD_at_CodeFormats; PRD_al_CodeFormatIDs; PRD_al_CodeFormatsSections)
			$_l_FormatIDRow:=Find in array:C230(PRD_al_CodeFormatIDs; [PRODUCTS:9]Product_Build_Format_ID:57)
			APPEND TO ARRAY:C911(PRD_at_CodeFormats; "-")
			APPEND TO ARRAY:C911(PRD_al_CodeFormatIDs; 0)
			APPEND TO ARRAY:C911(PRD_al_CodeFormatsSections; 0)
			APPEND TO ARRAY:C911(PRD_at_CodeFormats; "Create New Format")
			APPEND TO ARRAY:C911(PRD_al_CodeFormatIDs; -1)
			APPEND TO ARRAY:C911(PRD_al_CodeFormatsSections; 0)
			If ($_l_FormatIDRow>0)
				PRD_at_CodeFormats:=$_l_FormatIDRow
			Else 
				PRD_at_CodeFormats:=0
			End if 
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oBuildFormatsButton"; $_t_oldMethodName)
