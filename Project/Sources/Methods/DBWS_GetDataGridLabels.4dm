//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_GetDataGridLabels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/11/2012 19:02
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
	C_LONGINT:C283($_l_FormVarRow; $_l_FormVarRow2; $_l_UserProcess)
	C_TEXT:C284($_t_oldMethodName; $_t_String; $_t_WebGetTableContext; $_t_WebGetTableCurrentForm; $_t_WebGetTableSetup; $1; DBWS_t_DataGridJSON; DBWS_t_JsonCurrentModule)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_GetDataGridLabels")
If (True:C214)
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
				$_t_WebGetTableCurrentForm:=DB_at_Formvalues{$_l_FormVarRow}
			End if 
			$_t_WebGetTableSetup:=DB_at_Formvalues{$_l_FormVarRow}
			QUERY:C277([WEB_ACCESS:130]; [WEB_ACCESS:130]Web_Ref:1=$1)
			If (Records in selection:C76([WEB_ACCESS:130])=1)
				$_l_UserProcess:=DBWS_GetCurrentUserProcess([WEB_ACCESS:130]Personnel_ID:12; [WEB_ACCESS:130]Person:10)
				
				If ($_l_UserProcess>0)
					While (Process state:C330(<>DB_AL_UserProcessID{$_l_UserProcess})#Paused:K13:6)
						DelayTicks(2)
					End while 
					While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_UserProcess})))
						DelayTicks(2)
					End while 
					While (Semaphore:C143("usercontrol"+[WEB_ACCESS:130]Person:10))
						DelayTicks(2)
					End while 
					//````````
					DBWS_t_DataGridJSON:=""
					SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_UserProcess}; DBWS_l_CallAction; 4)
					SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_UserProcess}; DBWS_T_TableName; $_t_WebGetTableSetup)
					SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_UserProcess}; DBWS_T_TableContext; $_t_WebGetTableContext)
					SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_UserProcess}; DBWS_T_TableForm; $_t_WebGetTableCurrentForm)
					SET PROCESS VARIABLE:C370(<>DB_AL_UserProcessID{$_l_UserProcess}; DBWS_l_CallBack; Current process:C322)
					RESUME PROCESS:C320(<>DB_AL_UserProcessID{$_l_UserProcess})
					CLEAR SEMAPHORE:C144("usercontrol"+[WEB_ACCESS:130]Person:10)
					While (Test semaphore:C652("WebHandler_"+String:C10(<>DB_AL_UserProcessID{$_l_UserProcess}))) | (DBWS_t_DataGridJSON="")
						DelayTicks(2)
					End while 
					
					WEB SEND TEXT:C677(DBWS_t_DataGridJSON)
					//this call back ONLY Gives the Data for the Javascript to create the definition of the grid on the page
					
					//Note that the webside will then call for the Data
					//Note that the webside will then call for the new menu
					//My grids will be created without a header 'caption' and the navigation area will be seperate or not exist as we will use daybook buttons for this
					
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("DBWS_GetDataGridLabels"; $_t_oldMethodName)