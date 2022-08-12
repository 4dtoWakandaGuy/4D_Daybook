//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_MenuGetSRreports
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/01/2012 18:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ReportAccess; 0)
	//ARRAY LONGINT(DB_al_MenuShortCutModifier;0)
	//ARRAY LONGINT(DOC_al_GroupAccessLevel;0)
	//ARRAY LONGINT(DOC_Al_GroupsAccess;0)
	//ARRAY LONGINT(DOC_al_PersonAccessLevel;0)
	ARRAY TEXT:C222($_at_IncludeReports; 0)
	ARRAY TEXT:C222($_at_SRDocumentCode; 0)
	ARRAY TEXT:C222($_at_SRDocumentName; 0)
	//ARRAY TEXT(DB_at_menuitem;0)
	//ARRAY TEXT(DB_at_MenuItem4DFunction;0)
	//ARRAY TEXT(DB_at_MenuItemParameter;0)
	//ARRAY TEXT(DB_at_MenuShortCut;0)
	C_BOOLEAN:C305($_bo_RetainSelection; $3; $6; $7)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_AccessLevel; $_l_AccessLevel2; $_l_DocumentIndex; $_l_GroupAccessRow; $_l_GroupID; $_l_PersonAccessRow; $_l_SelectedRecord; $1)
	C_TEXT:C284(<>PER_t_UserGroup; $_t_MenuReference; $_t_MenuType; $_t_oldMethodName; $4; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_MenuGetSRreports")
If (Count parameters:C259>=5)
	$_t_MenuReference:=$5
Else 
	$_t_MenuReference:=""
End if 
If (Count parameters:C259>=4)
	$_t_MenuType:=$4
Else 
	$_t_MenuType:=""
End if 
$_bo_RetainSelection:=False:C215
If (Records in selection:C76([DOCUMENTS:7])>0)
	$_bo_RetainSelection:=True:C214
	COPY NAMED SELECTION:C331([DOCUMENTS:7]; "$Temp")
	$_l_SelectedRecord:=Selected record number:C246([DOCUMENTS:7])
End if 


QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
QUERY:C277([DOCUMENTS:7];  | ; [DOCUMENTS:7]Document_Code:1="QR@")
QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]Table_Number:11=$1)
If (Not:C34($3))
	QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]AddtoDataEntryReportMenu:29=True:C214)
Else 
	QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]AddtoListingReportMenu:28=True:C214)
	
End if 

Sel_FindMy(->[DOCUMENTS:7]; ->[DOCUMENTS:7]Person:10)

If (Records in selection:C76([DOCUMENTS:7])>0)
	//```
	ARRAY TEXT:C222($_at_IncludeReports; 0)
	ARRAY LONGINT:C221($_al_ReportAccess; 0)
	//TRACE
	
	For ($_l_DocumentIndex; 1; Records in selection:C76([DOCUMENTS:7]))
		DOC_LoadAccess([DOCUMENTS:7]Document_Code:1)
		QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
		$_l_GroupID:=[PERSONNEL_GROUPS:92]x_ID:12
		$_l_GroupAccessRow:=Find in array:C230(DOC_Al_GroupsAccess; $_l_GroupID)
		$_l_AccessLevel:=0
		$_l_AccessLevel2:=0
		If ($_l_GroupAccessRow>0)
			$_l_AccessLevel:=DOC_al_GroupAccessLevel{$_l_GroupAccessRow}
		End if 
		$_l_PersonAccessRow:=Find in array:C230(DOC_al_PersonAccess; <>PER_l_CurrentUserID)
		If ($_l_PersonAccessRow>0)
			$_l_AccessLevel2:=DOC_al_PersonAccessLevel{$_l_PersonAccessRow}
		End if 
		If ($_l_AccessLevel2>0)
			If ($_l_AccessLevel2#$_l_AccessLevel)
				$_l_AccessLevel:=$_l_AccessLevel2
			End if 
		End if 
		If ($_l_AccessLevel>1)
			APPEND TO ARRAY:C911($_at_IncludeReports; [DOCUMENTS:7]Document_Code:1)
			APPEND TO ARRAY:C911($_al_ReportAccess; $_l_AccessLevel2)
		Else 
			If ($_l_AccessLevel=0)
				APPEND TO ARRAY:C911($_at_IncludeReports; [DOCUMENTS:7]Document_Code:1)
				APPEND TO ARRAY:C911($_al_ReportAccess; $_l_AccessLevel2)
			End if 
		End if 
		NEXT RECORD:C51([DOCUMENTS:7])
		
	End for 
	QUERY WITH ARRAY:C644([DOCUMENTS:7]Document_Code:1; $_at_IncludeReports)
	
	
	//```
	SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; $_at_SRDocumentCode; [DOCUMENTS:7]Heading:2; $_at_SRDocumentName)
	SORT ARRAY:C229($_at_SRDocumentCode; $_at_SRDocumentName)
	
	If (Count parameters:C259>=6)  //put a break before the reports
		
		If ($6)
			If (Size of array:C274($_at_SRDocumentCode)>0)
				Case of 
					: ($_t_MenuType="4D menu")
						
						
						INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
					: ($_t_MenuType="menu string")
						APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
						APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
						APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
						APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
						APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
				End case 
			End if 
		End if 
	End if 
	//build the reports menu items
	For ($_l_DocumentIndex; 1; Size of array:C274($_at_SRDocumentCode))
		Case of 
			: ($_t_MenuType="4D menu")
				INSERT MENU ITEM:C412($_t_MenuReference; -1; Uppers2($_at_SRDocumentName{$_l_DocumentIndex}))
				SET MENU ITEM METHOD:C982($_t_MenuReference; -1; "DB_RunSRReport")
				SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; $_at_SRDocumentCode{$_l_DocumentIndex})
			: ($_t_MenuType="menu string")
				APPEND TO ARRAY:C911(DB_at_menuitem; Uppers2($_at_SRDocumentName{$_l_DocumentIndex}))
				APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
				APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
				APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "DB_RunSRReport")
				APPEND TO ARRAY:C911(DB_at_MenuItemParameter; $_at_SRDocumentCode{$_l_DocumentIndex})
		End case 
	End for 
	If (Count parameters:C259>=7)
		If ($7) & (False:C215)  //put a break after-more items going on the menu
			
			Case of 
				: ($_t_MenuType="4D menu")
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				: ($_t_MenuType="menu string")
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			End case 
			
		End if 
		
		
	End if 
Else 
	If (Count parameters:C259>=7) & (False:C215)
		If ($6) & ($7)
			
			Case of 
				: ($_t_MenuType="4D menu")
					INSERT MENU ITEM:C412($_t_MenuReference; -1; "(-")
				: ($_t_MenuType="menu string")
					APPEND TO ARRAY:C911(DB_at_menuitem; "(-")
					APPEND TO ARRAY:C911(DB_at_MenuShortCut; "")
					APPEND TO ARRAY:C911(DB_al_MenuShortCutModifier; 0)
					APPEND TO ARRAY:C911(DB_at_MenuItem4DFunction; "")
					APPEND TO ARRAY:C911(DB_at_MenuItemParameter; "")
			End case 
		End if 
	End if 
	
End if 
If ($_bo_RetainSelection)
	USE NAMED SELECTION:C332("$Temp")
	GOTO SELECTED RECORD:C245([DOCUMENTS:7]; $_l_SelectedRecord)
	
End if 
ERR_MethodTrackerReturn("DB_MenuGetSRreports"; $_t_oldMethodName)