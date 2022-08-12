If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oPublicationInstances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/03/2013 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_NewProcess; $_l_Process; $_l_RecordNumber; $_l_Row; $_l_TableNumber)
	C_REAL:C285(PRD_lb_PublicationDates)
	C_TEXT:C284($_t_DiaryRecordCode; $_t_FormName; $_t_oldMethodName; $_t_ParentRecordCode)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oPublicationInstances"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Double Clicked:K2:5)
		
		LISTBOX GET CELL POSITION:C971(PRD_lb_PublicationDates; $_l_Column; $_l_Row)
		If ($_l_Row>0)
			COPY NAMED SELECTION:C331([DIARY:12]; "CURRENTSELECTION")
			LISTBOX SELECT ROW:C912(PRD_lb_PublicationDates; $_l_Row)
			
			USE SET:C118("ListboxSetDiary")
			
			//TRACE
			$_t_DiaryRecordCode:=[DIARY:12]Diary_Code:3
			$_l_TableNumber:=Table:C252(->[DIARY:12])
			$_l_FieldNumber:=Field:C253(->[DIARY:12]Diary_Code:3)
			$_t_FormName:="Diary_PDTEditor"
			$_l_RecordNumber:=Record number:C243([DIARY:12])
			$_l_Process:=Current process:C322
			$_t_ParentRecordCode:=[PRODUCTS:9]Product_Code:1
			$_l_NewProcess:=New process:C317("LBi_InclEdit_InProcess"; 64000; "Edit "+"DIARY"+" "+$_t_DiaryRecordCode; $_l_TableNumber; $_l_FieldNumber; $_t_FormName; $_l_RecordNumber; $_l_Process; $_t_ParentRecordCode; *)
			USE NAMED SELECTION:C332("CURRENTSELECTION")
			
			//ORDER BY([DIARY];[DIARY]Date Do From;>)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oPublicationInstances"; $_t_oldMethodName)
