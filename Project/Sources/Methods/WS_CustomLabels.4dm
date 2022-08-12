//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_CustomLabels
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 15:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_RecordNumbers; 0)
	ARRAY TEXT:C222($_at_CustomStrings; 0)
	C_LONGINT:C283($_l_CurrentRow; $_l_MailSort; $_l_MailSortIndex; $_l_Result; ch5; rComp; rCont; rContr; rDiary; rOrd; rState)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_DirectorySymbol; $_t_DocumentName; $_t_oldMethodName; $_t_StructurePath; vT5Document)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_CustomLabels")
ARRAY TEXT:C222($_at_CustomStrings; 0)
STRING LIST TO ARRAY:C511(1301; $_at_CustomStrings)
$_at_CustomStrings{3}:="CUSLAB"+Char:C90(64)
$_at_CustomStrings{4}:="CUSLAB"+Char:C90(64)

//bsw 11/06/03 changes

//````bsw 11/06/03 changes ends


_O_ARRAY TO STRING LIST:C512($_at_CustomStrings; 1301; $_l_Result)
ARRAY LONGINT:C221($_al_RecordNumbers; 1000)
$_l_CurrentRow:=0
$_l_MailSort:=0
$_t_DocumentName:=Document
If (ch5=1)
	If ((DB_GetModuleSettingByNUM(31))>1)
		$_l_MailSort:=1
		FIRST RECORD:C50([MAILSORT_MAIL:83])
		For ($_l_MailSortIndex; 1; Records in selection:C76([MAILSORT_MAIL:83]))
			If (([MAILSORT_MAIL:83]Record_Number:1#999999) & (Not:C34(End selection:C36([MAILSORT_MAIL:83]))))
				Case of 
					: ((rComp=1) | (rState>0))
						GOTO RECORD:C242([COMPANIES:2]; [MAILSORT_MAIL:83]Record_Number:1)
						$_l_CurrentRow:=$_l_CurrentRow+1
						If ($_l_CurrentRow>Size of array:C274($_al_RecordNumbers))
							INSERT IN ARRAY:C227($_al_RecordNumbers; Size of array:C274($_al_RecordNumbers)+1; 1000)
						End if 
						$_al_RecordNumbers{$_l_CurrentRow}:=Record number:C243([COMPANIES:2])
						
					: (rCont=1)
						GOTO RECORD:C242([CONTACTS:1]; [MAILSORT_MAIL:83]Record_Number:1)
						$_l_CurrentRow:=$_l_CurrentRow+1
						If ($_l_CurrentRow>Size of array:C274($_al_RecordNumbers))
							INSERT IN ARRAY:C227($_al_RecordNumbers; Size of array:C274($_al_RecordNumbers)+1; 1000)
						End if 
						$_al_RecordNumbers{$_l_CurrentRow}:=Record number:C243([CONTACTS:1])
					: (rDiary=1)
						GOTO RECORD:C242([DIARY:12]; [MAILSORT_MAIL:83]Record_Number:1)
						$_l_CurrentRow:=$_l_CurrentRow+1
						If ($_l_CurrentRow>Size of array:C274($_al_RecordNumbers))
							INSERT IN ARRAY:C227($_al_RecordNumbers; Size of array:C274($_al_RecordNumbers)+1; 1000)
						End if 
						$_al_RecordNumbers{$_l_CurrentRow}:=Record number:C243([DIARY:12])
						
					: (rContr=1)
						GOTO RECORD:C242([CONTRACTS:17]; [MAILSORT_MAIL:83]Record_Number:1)
						$_l_CurrentRow:=$_l_CurrentRow+1
						If ($_l_CurrentRow>Size of array:C274($_al_RecordNumbers))
							INSERT IN ARRAY:C227($_al_RecordNumbers; Size of array:C274($_al_RecordNumbers)+1; 1000)
						End if 
						$_al_RecordNumbers{$_l_CurrentRow}:=Record number:C243([CONTRACTS:17])
					: (rOrd=1)
						GOTO RECORD:C242([ORDERS:24]; [MAILSORT_MAIL:83]Record_Number:1)
						$_l_CurrentRow:=$_l_CurrentRow+1
						If ($_l_CurrentRow>Size of array:C274($_al_RecordNumbers))
							INSERT IN ARRAY:C227($_al_RecordNumbers; Size of array:C274($_al_RecordNumbers)+1; 1000)
						End if 
						$_al_RecordNumbers{$_l_CurrentRow}:=Record number:C243([ORDERS:24])
				End case 
			Else 
				Case of 
					: ((rComp=1) | (rState>0))
						UNLOAD RECORD:C212([COMPANIES:2])
					: (rCont=1)
						UNLOAD RECORD:C212([CONTACTS:1])
					: (rDiary=1)
						UNLOAD RECORD:C212([DIARY:12])
						
					: (rContr=1)
						UNLOAD RECORD:C212([CONTRACTS:17])
					: (rOrd=1)
						UNLOAD RECORD:C212([ORDERS:24])
				End case 
			End if 
		End for 
		ARRAY LONGINT:C221($_al_RecordNumbers; $_l_CurrentRow)
	End if 
End if 
If ($_l_MailSort=0)
	Case of 
		: ((rComp=1) | (rState>0))
			LONGINT ARRAY FROM SELECTION:C647([COMPANIES:2]; $_al_RecordNumbers)
		: (rCont=1)
			LONGINT ARRAY FROM SELECTION:C647([CONTACTS:1]; $_al_RecordNumbers)
		: (rDiary=1)
			LONGINT ARRAY FROM SELECTION:C647([DIARY:12]; $_al_RecordNumbers)
		: (rContr=1)
			LONGINT ARRAY FROM SELECTION:C647([CONTRACTS:17]; $_al_RecordNumbers)
		: (rOrd=1)
			LONGINT ARRAY FROM SELECTION:C647([ORDERS:24]; $_al_RecordNumbers)
	End case 
	
End if 




Case of 
	: ((rComp=1) | (rState>0))
		CREATE SELECTION FROM ARRAY:C640([COMPANIES:2]; $_al_RecordNumbers; "LabelSelection")
		USE NAMED SELECTION:C332("LabelSelection")
		If (vT5Document#"")
			PRINT LABEL:C39([COMPANIES:2]; vT5Document)
		Else 
			PRINT LABEL:C39([COMPANIES:2]; " ")
		End if 
	: (rCont=1)
		
		
		CREATE SELECTION FROM ARRAY:C640([CONTACTS:1]; $_al_RecordNumbers; "LabelSelection")
		USE NAMED SELECTION:C332("LabelSelection")
		If (vT5Document#"")
			PRINT LABEL:C39([CONTACTS:1]; vT5Document)
		Else 
			PRINT LABEL:C39([CONTACTS:1]; Char:C90(1))
		End if 
	: (rDiary=1)
		GOTO RECORD:C242([DIARY:12]; [MAILSORT_MAIL:83]Record_Number:1)
		CREATE SELECTION FROM ARRAY:C640([DIARY:12]; $_al_RecordNumbers; "LabelSelection")
		USE NAMED SELECTION:C332("LabelSelection")
		If (vT5Document#"")
			PRINT LABEL:C39([DIARY:12]; vT5Document)
		Else 
			PRINT LABEL:C39([DIARY:12]; Char:C90(1))
		End if 
		
	: (rContr=1)
		GOTO RECORD:C242([CONTRACTS:17]; [MAILSORT_MAIL:83]Record_Number:1)
		CREATE SELECTION FROM ARRAY:C640([CONTRACTS:17]; $_al_RecordNumbers; "LabelSelection")
		USE NAMED SELECTION:C332("LabelSelection")
		If (vT5Document#"")
			PRINT LABEL:C39([CONTRACTS:17]; vT5Document)
		Else 
			PRINT LABEL:C39([CONTRACTS:17]; Char:C90(1))
		End if 
	: (rOrd=1)
		GOTO RECORD:C242([ORDERS:24]; [MAILSORT_MAIL:83]Record_Number:1)
		CREATE SELECTION FROM ARRAY:C640([ORDERS:24]; $_al_RecordNumbers; "LabelSelection")
		USE NAMED SELECTION:C332("LabelSelection")
		If (vT5Document#"")
			PRINT LABEL:C39([ORDERS:24]; vT5Document)
		Else 
			$_t_DocumentName:=Document
			PRINT LABEL:C39([ORDERS:24]; Char:C90(1))
			
			
		End if 
End case 


If (Document#$_t_DocumentName)
	WS_CustomLabelShare(Document; Table:C252($1))
End if 
ERR_MethodTrackerReturn("WS_CustomLabels"; $_t_oldMethodName)
