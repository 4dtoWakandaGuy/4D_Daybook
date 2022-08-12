//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters SWMerge
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
	//ARRAY TEXT(LB_at_02_3;0)
	C_BOOLEAN:C305(DB_bo_RecordModified; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283($_l_OK; $_l_SizeofArray; $_l_WindowReferenceRow; $_l_WindowRow; bd2; cExport; rCont; rDiary; WIN_l_CurrentWinRef)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SYS_t_4DWriteType; $_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters SWMerge")
//Letters SWMerge
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
OK:=1
If ((DB_bo_RecordModified) | ([DOCUMENTS:7]Document_Code:1="*TMP@"))
	Letters_SWSave
End if 
If (OK=1)
	If (rDiary=1)
		If ([DIARY:12]Date_Done_From:5=!00-00-00!)
			vDate:=<>DB_d_CurrentDate
		Else 
			vDate:=[DIARY:12]Date_Done_From:5
		End if 
	Else 
		vDate:=<>DB_d_CurrentDate
	End if 
	Open_Any_Window(354; 543)
	DIALOG:C40([DOCUMENTS:7]; "dMerge")
	CLOSE WINDOW:C154
	$_l_OK:=1
	OK:=1
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	If ($_l_OK=1)
		$_l_SizeofArray:=Size of array:C274(LB_at_02_3)
		If ($_l_SizeofArray>0)
			rCont:=1
			Letter_Date
			If ([DOCUMENTS:7]Person:10="")
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
			Else 
				RELATE ONE:C42([DOCUMENTS:7]Person:10)
			End if 
			vFrom:=[PERSONNEL:11]Name:2
			
			If (<>SYS_t_4DWriteType="WS")  // 4DWrite "Silver"
				
				
				QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; LB_at_02_3)
				
				ORDER BY:C49([CONTACTS:1]; [CONTACTS:1]Surname:5; >; [CONTACTS:1]Forename:4; >)
				DB_t_CurrentFormUsage:="SWMerge"
				Letter_Merge(->[CONTACTS:1])
				DB_t_CurrentFormUsage:=""
			Else   // must be SuperWrite -- OUT 24/04/02 pb
				Gen_Alert("SuperWrite error no. SW1250. Please inform the programmer!")
			End if 
			
			If (bd2=1)
				
				
				QUERY WITH ARRAY:C644([CONTACTS:1]Contact_Code:2; LB_at_02_3)
				ORDER BY:C49([CONTACTS:1]Surname:5; >; [CONTACTS:1]Forename:4; >)
				cExport:=0
				
				MailP_Exp(->[CONTACTS:1])
				
			End if 
			
		End if 
	End if 
End if 
DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
ERR_MethodTrackerReturn("Letters SWMerge"; $_t_oldMethodName)