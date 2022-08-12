//%attributes = {}
If (False:C215)
	//Project Method Name:      Letters_SWNew2
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
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionCode;0)
	//ARRAY TEXT(<>WP_at_DocumentDiaryActionName;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	C_BOOLEAN:C305(<>StartProc; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_OK; $_l_WindowReferenceRow; vAdd; WIN_l_CurrentWinRef; xNext)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters_SWNew2")

//Letters_SWNew2
CREATE SET:C116([DOCUMENTS:7]; "Master")
<>StartProc:=False:C215
Open_Any_Window(228; 448)
DIALOG:C40([DOCUMENTS:7]; "dNew")
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
	vType:=<>WP_at_DocumentDiaryActionCode{<>WP_at_DocumentDiaryActionName}
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=GEN_at_Identity{GEN_at_Identity})
	vAdd:=1
	READ WRITE:C146([DOCUMENTS:7])
	If (xNext=1)
		Open_Pro_Window("Untitled "+<>WP_at_DocumentDiaryActionName{<>WP_at_DocumentDiaryActionName}+" Template")
		If (Records in selection:C76([DOCUMENTS:7])=0)
			CREATE RECORD:C68([DOCUMENTS:7])
			DB_t_CurrentFormUsage3:="Blank"
		Else 
			DUPLICATE RECORD:C225([DOCUMENTS:7])
			
			DB_t_CurrentFormUsage3:=""
		End if 
		[DOCUMENTS:7]Standard:9:=True:C214
	Else 
		Open_Pro_Window("Untitled "+<>WP_at_DocumentDiaryActionName{<>WP_at_DocumentDiaryActionName})
		If (Records in selection:C76([DOCUMENTS:7])=0)
			CREATE RECORD:C68([DOCUMENTS:7])
			DB_t_CurrentFormUsage3:="Blank"
		Else 
			DUPLICATE RECORD:C225([DOCUMENTS:7])
			DB_t_CurrentFormUsage3:=""
		End if 
		[DOCUMENTS:7]Standard:9:=False:C215
	End if 
	[DOCUMENTS:7]Document_Code:1:="*TMP"+String:C10(AA_GetNextIDinMethod(->[DOCUMENTS:7]Document_Code:1))
	[DOCUMENTS:7]Heading:2:=""
	DB_SaveRecord(->[DOCUMENTS:7])
	MODIFY RECORD:C57([DOCUMENTS:7]; *)
	If ([DOCUMENTS:7]Document_Code:1="*TMP@")
		DB_DeletionControl(->[DOCUMENTS:7])
		
		DELETE RECORD:C58([DOCUMENTS:7])
	End if 
	Close_ProWin
End if 
ERR_MethodTrackerReturn("Letters_SWNew2"; $_t_oldMethodName)