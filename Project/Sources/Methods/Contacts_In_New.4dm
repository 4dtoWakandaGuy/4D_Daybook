//%attributes = {}
If (False:C215)
	//Project Method Name:      Contacts_In_New
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     22/05/2010 15:53
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Address_Status)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_ContactCodes; 0)
	C_BOOLEAN:C305(<>ContDedupCo; <>StatesLoaded; $_bo_OpenWindow; $_bo_ProcessStart; $_bo_WindowOpen; $1; $2; vFromIn; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_AddMode; $_l_WindowReferenceRow; DB_l_ButtonPrefsSet; R2; Vadd; vNo; vO; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>CompCode; $_t_CompanyCode; $_t_ForeName; $_t_oldMethodName; $_t_WindowReference; $_t_WindowTitle; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; SD_t_AttachContactCode; VCompCode; vCompName)
	C_TEXT:C284(vForename; vPostcode; vSurname; vTitle; vTitle1; vTown; WIN_t_CurrentInputForm; WIN_t_CurrentOutputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contacts_In_New")
If (Count parameters:C259>=1)
	$_bo_ProcessStart:=$1
Else 
	$_bo_ProcessStart:=True:C214
End if 
If (Count parameters:C259>=2)
	$_bo_OpenWindow:=$2
Else 
	$_bo_OpenWindow:=True:C214
End if 

If (Not:C34(<>StatesLoaded))
	States_Load
End if 
If ($_bo_ProcessStart)
	Start_Process
End if 
Contacts_File
$_l_AddMode:=Vadd
vAdd:=1
DB_t_CallOnCloseorSave:=""
If (In_Allowed($_t_WindowTitle; ->[CONTACTS:1]))
	vAdd:=1
	OK:=1
	While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
		IDLE:C311  // 03/04/03 pb
		
		vFromIn:=False:C215
		vTitle1:="Contact_Details for duplicate check:"
		vCompName:=""
		vTown:=""
		vTitle:=""
		vPostcode:=""
		vForename:=""
		vSurname:=""
		// Open_AnyTypeWindow (151;362;5;$_t_WindowTitle)
		
		Open_AnyTypeWindow(233; 362; 5; $_t_WindowTitle; ""; ->[CONTACTS:1]; "dAsk_NewCont")  //NG may 2004 added form
		DIALOG:C40([CONTACTS:1]; "dAsk_NewCont")
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If (OK=1)
			If (SD_t_AttachContactCode="")
				
				CREATE SET:C116([CONTACTS:1]; "OMaster")
				REDUCE SELECTION:C351([CONTACTS:1]; 0)
				//Open_Pro_Window ($_t_WindowTitle) NG may 2004 moved to within case statements
				$_bo_WindowOpen:=False:C215
				$_t_WindowReference:=Table name:C256(->[CONTACTS:1])+"_"+WIN_t_CurrentInputForm
				If ((vForename="") & (vSurname="") & (vCompName="") & (vPostcode="") & (vTown=""))
					If ($_bo_OpenWindow)
						If (Not:C34($_bo_WindowOpen))
							Open_Pro_Window($_t_WindowTitle; 0; 2; ->[CONTACTS:1]; WIN_t_CurrentInputForm)  //NG may 2004
							$_bo_WindowOpen:=True:C214
						End if 
						//Moved from above and added form name
					End if 
					DB_t_CurrentFormUsage:=""
					
					ADD RECORD:C56([CONTACTS:1]; *)
					ADD TO SET:C119([CONTACTS:1]; "OMaster")
					
				Else 
					
					//Company name entered
					$_t_CompanyCode:=VCompCode
					vCompCode:=""
					If ((<>ContDedupCo) & ((vCompName#"") | (vTown#"") | (vPostcode#"")))
						Companies_InSrc
						vCompCode:=[COMPANIES:2]Company_Code:1
						Project_SelFast(->[COMPANIES:2]; ->[COMPANIES:2]Company_Code:1; ->[CONTACTS:1]; ->[CONTACTS:1]Company_Code:1)
					Else 
						//NG not relevant as contact dedup already done
						REDUCE SELECTION:C351([CONTACTS:1]; 0)
						//ALL RECORDS([CONTACTS])
					End if 
					If ((vForename#"") | (vSurname#""))
						$_t_ForeName:=Substring:C12(vForename; 1; 1)+"@"
						QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Surname:5=vSurname; *)
						QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Forename:4=$_t_ForeName; *)
						QUERY SELECTION:C341([CONTACTS:1];  & ; [CONTACTS:1]Deleted:32=0)  //Modified NG 2004
					End if 
					If (Records in selection:C76([CONTACTS:1])>0)  //NG Modification March 2004
						If ($_t_CompanyCode#"") & ((R2=1) | (VcompName#""))
							SELECTION TO ARRAY:C260([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
							QUERY SELECTION:C341([CONTACTS:1]; [CONTACTS:1]Company_Code:1=$_t_CompanyCode)
							CREATE SET:C116([CONTACTS:1]; "Set1")
							
							QUERY WITH ARRAY:C644([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
							QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Company_Code:1=$_t_CompanyCode)
							QUERY SELECTION:C341([CONTACTS_COMPANIES:145]; [CONTACTS_COMPANIES:145]Address_Status:5>=0)
							
							SELECTION TO ARRAY:C260([CONTACTS_COMPANIES:145]Contact_Code:4; $_at_ContactCodes)
							QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; $_at_ContactCodes)
							CREATE SET:C116([CONTACTS:1]; "Set2")
							UNION:C120("$Set1"; "$Set2"; "$Set1")
							USE SET:C118("$Set1")
						Else 
							VCompCode:=""
						End if 
					End if 
					
					
					If (Records in selection:C76([CONTACTS:1])=0)
						If ($_bo_OpenWindow)
							If (Not:C34($_bo_WindowOpen))
								Open_Pro_Window($_t_WindowTitle; 0; 2; ->[CONTACTS:1]; WIN_t_CurrentInputForm)  //NG may 2004
								$_bo_WindowOpen:=True:C214
							End if 
						End if 
						//Moved from above and added form name
						DB_t_CurrentFormUsage:="In"
						If (R2=1)
							vCompCode:=$_t_CompanyCode
						Else 
							VCompCode:=""
							<>CompCode:=""
						End if 
						ADD RECORD:C56([CONTACTS:1]; *)
						ADD TO SET:C119([CONTACTS:1]; "OMaster")
						vCompCode:=""
					Else 
						If ($_bo_OpenWindow)
							If (Not:C34($_bo_WindowOpen))
								Open_Pro_Window($_t_WindowTitle; 0; 1; ->[CONTACTS:1]; WIN_t_CurrentOutputForm)  //NG may 2004
								$_t_WindowReference:=""
								$_bo_WindowOpen:=True:C214
							End if 
						End if 
						
						//Moved from above and added form name
						DB_t_CurrentFormUsage:="Check"
						If (R2=1)
							vCompCode:=$_t_CompanyCode
						Else 
							VCompCode:=""
							<>CompCode:=""
						End if 
						vNo:=Records in selection:C76([CONTACTS:1])
						ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Forename:4; >; [CONTACTS:1]Title:3; >)
						DB_l_ButtonPrefsSet:=1
						FS_SetFormSort(WIN_t_CurrentOutputform; Table:C252(->[CONTACTS:1]))
						WIn_SetFormSize(1; ->[CONTACTS:1]; "Contacts_Out")
						MODIFY SELECTION:C204([CONTACTS:1]; *)
						DB_l_ButtonPrefsSet:=0
						vCompCode:=""
					End if 
				End if 
				If ($_bo_OpenWindow)
					Close_ProWin($_t_WindowReference)
				End if 
			Else 
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD_t_AttachContactCode)
				SD_t_AttachContactCode:=""
				
				Gen_ModMid("View Contacts"; "OMaster"; ->[CONTACTS:1]; ->vO; "Contacts"; "")
				
			End if 
		Else 
			If (SD_t_AttachContactCode#"")
				QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=SD_t_AttachContactCode)
				SD_t_AttachContactCode:=""
				
				Gen_ModMid("View Contacts"; "OMaster"; ->[CONTACTS:1]; ->vO; "Contacts"; "")
			End if 
			
		End if 
		
		Gen_InOne
		
	End while 
End if 
If ($_bo_ProcessStart)
	Process_End
End if 
ERR_MethodTrackerReturn("Contacts_In_New"; $_t_oldMethodName)
