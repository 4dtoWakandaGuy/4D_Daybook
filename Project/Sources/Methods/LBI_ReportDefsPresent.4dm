//%attributes = {}
If (False:C215)
	//Project Method Name:      LBI_ReportDefsPresent
	//------------------ Method Notes ------------------
	//creates a report of existing definitions
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2012 06:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_LayoutDefinition; 0)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_DocumentPath; $_t_oldMethodName; $_t_StructurePath)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBI_ReportDefsPresent")


ARRAY TEXT:C222($_at_LayoutDefinition; 0)
LBI_initLayoutNames(->$_at_LayoutDefinition)

$_ti_DocumentRef:=Create document:C266(""; "TEXT")
$_t_StructurePath:=Get 4D folder:C485(Database folder:K5:14)
If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")=Is a folder:K24:2))
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources")
	End if 
	If (Not:C34(Test path name:C476($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")=Is a folder:K24:2))
		CREATE FOLDER:C475($_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS")
	End if 
End if 

For ($_l_Index; 1; Size of array:C274($_at_LayoutDefinition))
	If (False:C215)
		QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]Layout_Reference:1=$_at_LayoutDefinition{$_l_Index})
		If (Records in selection:C76([LIST_LAYOUTS:96])=0)
			SEND PACKET:C103($_ti_DocumentRef; $_at_LayoutDefinition{$_l_Index}+Char:C90(13))
		End if 
	End if 
	$_t_DocumentPath:=$_t_StructurePath+"Resources"+Folder separator:K24:12+"LAYOUTCONFIGS"+Folder separator:K24:12+$_at_LayoutDefinition{$_l_Index}+".txt"
	
	If (Test path name:C476($_t_DocumentPath)=Is a document:K24:1)
	Else 
		SEND PACKET:C103($_ti_DocumentRef; $_at_LayoutDefinition{$_l_Index}+Char:C90(13))
	End if 
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ERR_MethodTrackerReturn("LBI_ReportDefsPresent"; $_t_oldMethodName)