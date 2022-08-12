//%attributes = {}
If (False:C215)
	//Project Method Name:      FurthFld_Print
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CUS_at_DisplayedData;0)
	//ARRAY TEXT(FUR_at_CustomFieldNames;0)
	//ARRAY TEXT(FUR_at_CustomFieldTypes;0)
	C_LONGINT:C283($_l_Index; $_l_OK; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName; vTitle1; vTitle2; vTitle3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FurthFld_Print")
//FurthFld_Print
$_l_OK:=PRINT_SetSIZE("A4"; "P"; "FurtherFields")
//PAGE SETUP([FURTHER FIELDS];"CustomFIeld_Header")
//PRINT SETTINGS
If ($_l_OK>=0)
	Print form:C5([CUSTOM_FIELDS:98]; "CustomFIeld_Header")
	$_l_SizeofArray:=Size of array:C274(FUR_at_CustomFieldNames)
	For ($_l_Index; 1; $_l_SizeofArray)
		vTitle1:=FUR_at_CustomFieldNames{$_l_Index}
		vTitle2:=CUS_at_DisplayedData{$_l_Index}
		vTitle3:=FUR_at_CustomFieldTypes{$_l_Index}
		Print form:C5([CUSTOM_FIELDS:98]; "CustomField_Detail")
	End for 
	PAGE BREAK:C6
	PRT_SetPrinterPaperOptions("FurtherFields")  //NG June 2005
	
End if 
ERR_MethodTrackerReturn("FurthFld_Print"; $_t_oldMethodName)