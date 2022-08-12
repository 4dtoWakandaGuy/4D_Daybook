If (False:C215)
	//object Name: Object Name:      DB_QR_EDITOR.oSelectionsAdd2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2011 17:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_lb_AvailableFunctions;0)
	//ARRAY LONGINT(DB_al_REPTableNum;0)
	//ARRAY LONGINT(DBQR_al_FunctionType;0)
	//ARRAY TEXT(BD_at_FldsFunctions;0)
	//ARRAY TEXT(DBQR_at_FunctionCode;0)
	//ARRAY TEXT(DBQR_at_FunctionNames;0)
	C_BOOLEAN:C305(DB_bo_ShowSorts)
	C_LONGINT:C283($_l_event; $_l_NumberofColumns; DB_l_ReportType; DBQR_l_EDITORAREA)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_QR_EDITOR.oSelectionsAdd2"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
				
			: (DB_l_ReportType=SuperWrite Report Template)
				//make sure we save first!!
				Gen_Confirm("Add formula cell to report or create a new re-usable formula?"; "Reusable"; "Cell")
				If (OK=0)
					//add a new cell to the Window
					$_l_NumberofColumns:=QR Count columns:C764(DBQR_l_EDITORAREA)
					//QR INSERT COLUMN(DBQR_l_EDITORAREA;$_l_NumberofColumns+1)
					QR EXECUTE COMMAND:C791(DBQR_l_EDITORAREA; qr cmd add column:K14900:45)
					If (DB_bo_ShowSorts)  //Sort columns are display-note the following uses the same code as the button to turn it on
						DBQR_ShowSortColumns
					End if 
					
				Else 
					Gen_Alert("The Function you create must set one of the following VmResult, VmResultTEXT, vmResultDATE,  vmResultTIME, vmResultPICTURE, vmResultBOOLEAN,vmResultREAl, vmResultLONGINT")
					
					
					$_t_ScriptCode:=Gen_EnterRestrictedMacro(DB_al_REPTableNum; 10; WF Macros)
					If ($_t_ScriptCode#"")
						QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptCode)
						If (Records in selection:C76([SCRIPTS:80])>0)
							
							APPEND TO ARRAY:C911(DBQR_at_FunctionNames; [SCRIPTS:80]Script_Name:2)
							APPEND TO ARRAY:C911(DBQR_al_FunctionType; 2)
							APPEND TO ARRAY:C911(DBQR_at_FunctionCode; [SCRIPTS:80]Script_Code:1)
							OBJECT SET VISIBLE:C603(DB_lb_AvailableFunctions; True:C214)
							If (Size of array:C274(DBQR_at_FunctionCode)>0)
								OBJECT SET VISIBLE:C603(BD_at_FldsFunctions; True:C214)
							End if 
							BD_at_FldsFunctions:=2
						End if 
					End if 
				End if 
				OK:=1
				
			Else 
		End case 
End case 
ERR_MethodTrackerReturn("OBJ DB_QR_EDITOR.oSelectionsAdd2"; $_t_oldMethodName)
