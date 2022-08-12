//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetCachedData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/11/2012 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>DB_AL_UserProcessID;0)
	//ARRAY TEXT(DB_at_Formvalues;0)
	//ARRAY TEXT(DB_at_Formvariables;0)
	C_LONGINT:C283($_l_NumberofRows; $_l_Page; $_l_PersonRow; $_l_VariableRow)
	C_TEXT:C284($_l_SortCell; $_l_SortOrder; $_t_HtmlText; $_t_oldMethodName; $1; DBWS_t_XMLData)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetCachedData")
$_l_VariableRow:=Find in array:C230(DB_at_Formvariables; "rows")
If ($_l_VariableRow>0)
	$_l_NumberofRows:=Num:C11(DB_at_Formvalues{$_l_VariableRow})
	$_l_VariableRow:=Find in array:C230(DB_at_Formvariables; "page")
	$_l_Page:=Num:C11(DB_at_Formvalues{$_l_VariableRow})
	If ($_l_NumberofRows=0)
		$_l_NumberofRows:=1
	End if 
	$_l_VariableRow:=Find in array:C230(DB_at_Formvariables; "sidx")
	$_l_SortCell:=(DB_at_Formvalues{$_l_VariableRow})
	$_l_VariableRow:=Find in array:C230(DB_at_Formvariables; "sord")
	$_l_SortOrder:=(DB_at_Formvalues{$_l_VariableRow})
	QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=$1)
	If (Records in selection:C76([WEB_ACCESS:130])=1)
		$_l_PersonRow:=DBWS_GetCurrentUserProcess([WEB_ACCESS:130]Personnel_ID:12; [WEB_ACCESS:130]Person:10)
		If ($_l_PersonRow>0)
			While (Process state:C330(<>DB_AL_UserProcessID{$_l_PersonRow})#Paused:K13:6)
				DelayTicks(2)
			End while 
			While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_PersonRow})))
				DelayTicks(2)
			End while 
			While (Semaphore:C143("usercontrol"+[WEB_ACCESS:130]Person:10))
				DelayTicks(2)
			End while 
			SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_l_CallAction; 5)
			SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_l_TableNumber; 0)  //Pass 0 here to get the 'current'
			//note that in a form(such as order entry where this is order items then the table number must be passed-we need the grid to have something here
			SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_l_NumberofRows; $_l_NumberofRows)
			SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_l_PageNumber; $_l_Page)
			SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_t_SortCell; $_l_SortCell)
			SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_t_SortDirection; $_l_SortOrder)
			SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_PersonRow}; DBWS_l_CallBack; Current process:C322)
			RESUME PROCESS:C320(<>DB_AL_UserProcessID{$_l_PersonRow})
			CLEAR SEMAPHORE:C144("usercontrol"+[WEB_ACCESS:130]Person:10)
			While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_PersonRow}))) | (DBWS_t_XMLData="")
				DelayTicks(2)
			End while 
			WEB SEND TEXT:C677(DBWS_t_XMLData)
			
		End if 
	End if 
End if 
If (False:C215)
	$_t_HtmlText:="<?xml version="+Char:C90(Quote:K15:44)+"1.0"+Char:C90(Quote:K15:44)+" encoding="+Char:C90(Quote:K15:44)+"utf-8"+Char:C90(Quote:K15:44)+"?>"
	$_t_HtmlText:=$_t_HtmlText+"<rows>"
	
	$_t_HtmlText:=$_t_HtmlText+"<page>"+String:C10(1)+"</page>"
	$_t_HtmlText:=$_t_HtmlText+"<total>"+String:C10(1)+"</total>"
	$_t_HtmlText:=$_t_HtmlText+"<records>"+String:C10(1)+"</records>"
	
	// be sure to put text data in CDATA
	$_t_HtmlText:=$_t_HtmlText+"<row id="+Char:C90(Quote:K15:44)+"1"+Char:C90(Quote:K15:44)+">"
	
	$_t_HtmlText:=$_t_HtmlText+"<cell>"+"12345"+"</cell>"
	$_t_HtmlText:=$_t_HtmlText+"<cell>"+"01/01/2012"+"</cell>"
	$_t_HtmlText:=$_t_HtmlText+"<cell>"+"10.49"+"</cell>"
	$_t_HtmlText:=$_t_HtmlText+"<cell>"+"1.75"+"</cell>"
	$_t_HtmlText:=$_t_HtmlText+"<cell>"+"12.24"+"</cell>"
	$_t_HtmlText:=$_t_HtmlText+"<cell><![CDATA["+Char:C90(Quote:K15:44)+"SOMEDATA"+Char:C90(Quote:K15:44)+"]]></cell>"
	$_t_HtmlText:=$_t_HtmlText+"</row>"
	$_t_HtmlText:=$_t_HtmlText+"</rows>"
	WEB SEND TEXT:C677($_t_HtmlText)
	$_ti_DocumentRef:=Create document:C266(""; "TEXT")
	SEND PACKET:C103($_ti_DocumentRef; $_t_HtmlText)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	
	SET TEXT TO PASTEBOARD:C523($_t_HtmlText)
End if 
ERR_MethodTrackerReturn("DBWS_GetCachedData"; $_t_oldMethodName)