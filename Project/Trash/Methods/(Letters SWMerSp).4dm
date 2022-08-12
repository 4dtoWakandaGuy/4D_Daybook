//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters SWMerSp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>NoStart; $_l_OK; $_l_WindowReferenceRow; r0; r1; rComp; rCont; rContr; rDiary; rOrd; rState)
	C_LONGINT:C283(WIN_l_CurrentWinRef)
	C_TEXT:C284(<>KEYS; <>PER_t_CurrentUserInitials; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFrom; vLetterCode; vSelPrev)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters SWMerSp")
//Letters SWMerSP - merge special
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
DB_t_CurrentFormUsage2:=""
If ((DB_GetModuleSettingByNUM(1))#5)
	DB_SetMenuBar(""; 9)
	Start_ProcMail
	OK:=1
	If ((DB_bo_RecordModified) | ([DOCUMENTS:7]Document_Code:1="*TMP@"))
		Letters_SWSave
	End if 
	If (OK=1)
		Open_Any_Window(236; 294)
		DIALOG:C40([DOCUMENTS:7]; "dMergeSpecial")
		CLOSE WINDOW:C154
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If ($_l_OK=1)
			<>Keys:=""
			vLetterCode:=[DOCUMENTS:7]Document_Code:1
			If ([DOCUMENTS:7]Person:10="")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
			Else 
				RELATE ONE:C42([DOCUMENTS:7]Person:10)
			End if 
			vFrom:=[PERSONNEL:11]Name:2
			vDate:=<>DB_d_CurrentDate
			Letter_Date
			<>NoStart:=1
			DB_t_CurrentFormUsage2:="MergeSp"
			vSelPrev:=""
			Case of 
				: (rComp=1)
					DBI_MenuDisplayRecords("CompaniesMailing")
					
				: (rCont=1)
					DBI_MenuDisplayRecords("ContactsMailing")
					//Mail_Cont
				: (rDiary=1)
					DBI_MenuDisplayRecords("DiaryMailing")
				: (rOrd=1)
					Mail_Ord
				: (r0=1)
					r0:=0
					//Mail_InvA
					DBI_MenuDisplayRecords("InvoicesChasing")
					
					
				: (rState=1)
					Mail_State
				: (rContr=1)
					DBI_MenuDisplayRecords("ContractsMailing")
					
				: (r1=1)
					r1:=1
					Mail_Subs
			End case 
		End if 
	End if 
	DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
	SET_MENU BAR(92)
Else 
	Gen_Alert("This feature is not available in Daybook Silver"; "Cancel")
End if 
ERR_MethodTrackerReturn("Letters SWMerSp"; $_t_oldMethodName)