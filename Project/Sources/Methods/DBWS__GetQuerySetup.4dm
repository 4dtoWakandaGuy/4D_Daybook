//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS__GetQuerySetup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/11/2012 18:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DB_at_Formvalues;0)
	//ARRAY TEXT(DB_at_Formvariables;0)
	C_LONGINT:C283($_l_FormVarRow; $_l_FormVarRow2; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_String; $_t_WebGetTableContext; $_t_WebGetTableCurrentForm; $_t_WebGetTableSetup; $1; DBWS_t_JsonCurrentModule)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS__GetQuerySetup")

//This method returns the query settings for a data listing form..
//the picture for the search box pop-up is 22519-the view is controlled by CSS
// the clear button is 18950
//the graphic fo the search lozenge is 5007 focus is handled automatically
//SRCH_at_SearchOptions is set up the same as in the form window
$_t_String:=""

If ($1#"")
	$_l_FormVarRow:=Find in array:C230(DB_at_Formvariables; "Table")
	If ($_l_FormVarRow>0)
		$_l_FormVarRow2:=Find in array:C230(DB_at_Formvariables; "Context")
		$_t_WebGetTableContext:=""
		$_t_WebGetTableCurrentForm:=""
		If ($_l_FormVarRow2>0)
			$_t_WebGetTableContext:=DB_at_Formvalues{$_l_FormVarRow}
		End if 
		$_l_FormVarRow2:=Find in array:C230(DB_at_Formvariables; "Form")
		If ($_l_FormVarRow2>0)
			$_t_WebGetTableCurrentForm:=DB_at_Formvalues{$_l_FormVarRow2}
		End if 
		$_t_WebGetTableSetup:=DB_at_Formvalues{$_l_FormVarRow}
		QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=$1)
		If (Records in selection:C76([WEB_ACCESS:130])=1)
			$_l_TableNumber:=DBWS_GetTableWebCall
			
		End if 
	End if 
End if 
SRCH_SetSearchParameters
ERR_MethodTrackerReturn("DBWS__GetQuerySetup"; $_t_oldMethodName)