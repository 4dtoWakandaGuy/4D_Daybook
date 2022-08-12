If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oBuildFormats
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
	C_LONGINT:C283($_l_event; $_l_FormatIDRow; $_l_LoadedFormatID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oBuildFormats"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (PRD_al_CodeFormatIDs{PRD_at_CodeFormats}>0)
				If ([PRODUCTS:9]Product_Build_Format_ID:57>0)
					If (Records in selection:C76([COMPONENTS:86])>0)
						Gen_Confirm("Are you sure you want to change the code format for this template? This could seriously affect the integrity of the component structure"; "NO"; "YES")
						If (OK=0)
							[PRODUCTS:9]Product_Build_Format_ID:57:=PRD_al_CodeFormatIDs{PRD_at_CodeFormats}
						Else 
							$_l_FormatIDRow:=Find in array:C230(PRD_al_CodeFormatIDs; [PRODUCTS:9]Product_Build_Format_ID:57)
							If ($_l_FormatIDRow>0)
								PRD_at_CodeFormats:=$_l_FormatIDRow
							Else 
								PRD_at_CodeFormats:=0
							End if 
							
						End if 
						OK:=1
					Else 
						[PRODUCTS:9]Product_Build_Format_ID:57:=PRD_al_CodeFormatIDs{PRD_at_CodeFormats}
					End if 
				Else 
					[PRODUCTS:9]Product_Build_Format_ID:57:=PRD_al_CodeFormatIDs{PRD_at_CodeFormats}
				End if 
				
			: (PRD_al_CodeFormatIDs{PRD_at_CodeFormats}<0)
				$_l_LoadedFormatID:=PRD_EditCodeFormats(0)
				If ($_l_LoadedFormatID>0)
					[PRODUCTS:9]Product_Build_Format_ID:57:=$_l_LoadedFormatID
				End if 
				
				
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
				$_l_FormatIDRow:=Find in array:C230(PRD_al_CodeFormatIDs; [PRODUCTS:9]Product_Build_Format_ID:57)
				If ($_l_FormatIDRow>0)
					PRD_at_CodeFormats:=$_l_FormatIDRow
				Else 
					PRD_at_CodeFormats:=0
				End if 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oBuildFormats"; $_t_oldMethodName)
