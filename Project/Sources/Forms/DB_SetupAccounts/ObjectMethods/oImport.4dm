If (False:C215)
	//object Method Name: Object Name:      DB_SetupAccounts.oImport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2013 13:19
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(ACC_CB_ImportTab; ACC_CB_ImportXLS)
	C_LONGINT:C283($_l_Count)
	C_TEXT:C284($_t_oldMethodName; $_t_workbook; $_t_Worksheet; DB_t_ImportAccounts; DB_T_ImportHeadings)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_SetupAccounts.oImport"; Form event code:C388)

//here ask whether importing from
//1) excel spreadsheet

//2) Tab Delimited Document
//Default Daybook XML documents
//Prepared XML Document-this should be two documents complying to the DTD one for account headings and one for Accounts.
//note that this only imports to this screen-records are only created on save.
//That mean that this screen can be used by developement within an existing database to setup chart of account templates
DB_t_ImportAccounts:=""
DB_T_ImportHeadings:=""
ACC_CB_ImportXLS:=False:C215
ACC_CB_ImportTAB:=False:C215
DIALOG:C40("ACC_SetupImportoptions")

Case of 
	: (DB_t_ImportAccounts#"") & (DB_T_ImportHeadings#"")
		
	: (ACC_CB_ImportXLS)
		Gen_Alert("Reminder: The document you select must have the headings set as per the template"; "OK")
		$_ti_DocumentRef:=Open document:C264(""; "XLS")
		If ($_ti_DocumentRef#?00:00:00?)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			
			$_t_workbook:=SCPT_XL_workbook_open(Document)
			$_l_Count:=SCPT_XL_sheet_count($_t_workbook)
			If ($_l_Count=1)
				$_t_Worksheet:=SCPT_XL_sheet_get_name($_t_workbook; 1)
			Else 
				Gen_Alert("This workbook has multiple sheets")
			End if 
			SCPT_XL_APPLICATION("show")
			
			Gen_Alert("Complete Test")
			SCPT_XL_workbook_close($_t_workbook)
			//SCPT_XL_workbook_close_all
			
			
			
		End if 
	: (ACC_CB_ImportTAB)
		
End case 
ERR_MethodTrackerReturn("OBJ DB_SetupAccounts.oImport"; $_t_oldMethodName)
